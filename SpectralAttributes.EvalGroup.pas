unit SpectralAttributes.EvalGroup;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,
  SpectralAttributes.EvalTest;

type
  TEvalGroup = class(TObject)
  public
    GroupID: Integer; //database #
    GroupNum: Integer;  //in-process#id
    SetID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(SetID: Integer); overload;
    constructor Create(GroupID: Integer; SetID: Integer); overload;
    destructor destroy;
    procedure DeleteGroupTests;
    procedure DeleteGroup(GroupID: Integer);   //should call delete tests, might be a destructor
  end;

implementation

constructor TEvalGroup.Create(GroupID: Integer; SetID: Integer);
var
  Query: TADOQuery;
  TestID: Integer;
  EvalTest: TEvalTest;
begin
  TestList := TObjectList<TEvalTest>.Create;
  Self.GroupID := GroupID;
  Self.SetID := SetID;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select distinct TestID');
    SQL.Add('from EvalTests where GroupID = ' + GroupID.ToString);
//  Order by rank somehow...try sorting the tests in the group
    Open;
    while not eof do
    begin
      TestID := Query.FieldByName('TestID').Value;
      EvalTest := TEvalTest.Create(TestID);
      TestList.Add(EvalTest);
      Query.Next;
    end;
    Close;
    Free;
  end;
end;

constructor TEvalGroup.Create(SetID: Integer);
// Replace by genearting groupID from Set...perhaps??
// Add CreateDateTime to EvalGroups
var
  Query: TADOQuery;
  NextGroupID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select max(GroupID) last_id from EvalGroups');
    Open;
    // need Try/Except Blocks
    if (FieldByName('last_id').IsNull) then
      NextGroupID := 1
    else
      NextGroupID := FieldByName('last_id').Value + 1;
    Close;
    Free;
  end;

  TestList := TObjectList<TEvalTest>.Create;
  GroupID := NextGroupID;
  GroupNum := 1;
  Self.SetID := SetID;

  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('insert into EvalGroups values (:NextGroupID, :NextGroupNum, :SetID)');
    Parameters.ParamByName('SetID').Value := SetID.ToString;
    Parameters.ParamByName('NextGroupID').Value := NextGroupID.ToString;
    Parameters.ParamByName('NextGroupNum').Value :=  1; // Need to enumerate group nums
    Prepared := True;
    ExecSQL;
    Close;
    Free;
  end;

end;

procedure TEvalGroup.DeleteGroup(GroupID: Integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    try
      DeleteGroupTests;
      Connection := _ChromaDataModule.ChromaData;
      SQL.Add('delete from EvalGroups where GroupID = :GroupID');
      Parameters.ParamByName('GroupID').Value := GroupID.ToString;
      ExecSQL;
      Free;
    except
      ///Raise some type of error
    end;
  end;
end;

procedure TEvalGroup.DeleteGroupTests;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('delete from EvalTests where GroupID = ' + GroupID.ToString);
    ExecSQL;
    Free;
  end;
end;

destructor TEvalGroup.destroy;
begin
  DeleteGroup(Self.GroupID);
  Self.Free;
end;


end.
