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
    procedure DeleteTestGroupTests;
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
// Add CreateDateTime to EvalTestGroups
var
  Query: TADOQuery;
  NextGroupID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select max(GroupID) last_id from EvalTestGroups');
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
    SQL.Add('begin tran');
    SQL.Add('Declare @SetID int = ' + SetID.ToString);
    SQL.Add('Declare @GroupID int = ' + GroupID.ToString);
    SQL.Add('Declare @NextGroupNum int = 1'); // Need to enumerate group nums
    SQL.Add('insert into EvalTestGroups values (@GroupID, @NextGroupNum, @SetID)');
    SQL.Add('commit tran');
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
    Connection := _ChromaDataModule.ChromaData;
      SQL.Add('delete from EvalTestGroups where GroupID = ' + GroupID.ToString);
      ExecSQL;
      SQL.Add('delete from EvalTests where GroupID = ' + GroupID.ToString);
      ExecSQL;
      Free;
  end;
end;

procedure TEvalGroup.DeleteTestGroupTests;
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
var
  I: Integer;
begin
  for I := 0 to TestList.Count-1 do
    TestList.Delete(I);
  TestList.Free;
  Self.Free;
end;


end.
