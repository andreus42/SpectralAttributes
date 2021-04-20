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
  TEvalTestGroup = class(TObject)
  public
    GroupID: Integer;
    GroupNum: Integer;
    SetID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(GroupID: Integer);
    constructor CreateNew(SetID: Integer);      // needs to genearte new ID and pass back to EvalSet
    destructor destroy;
    procedure DeleteTestGroupTests;
  end;

implementation

constructor TEvalTestGroup.Create(GroupID: Integer);
var
  Query: TADOQuery;
  TestID: Integer;
  AEvalTest: TEvalTest;
begin
  TestList := TObjectList<TEvalTest>.Create;
//  IDsList := TList<Integer>.Create;
  //
  Self.GroupID := GroupID;
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
      AEvalTest := TEvalTest.Create(TestID);
      TestList.Add(AEvalTest);
      Query.Next;
    end;
    Close;
    Free;
  end;
//  AEvalTest.Free; Can't free if not created
end;


constructor TEvalTestGroup.CreateNew(SetID: Integer);
// Replace by genearting groupID from Set
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
  end;
  with Query do
  begin
    SQL.Add('begin tran');
    SQL.Add('Declare @SetID int = ' + SetID.ToString);
    SQL.Add('Declare @GroupID int = ' + NextGroupID.ToString);
    SQL.Add('Declare @NextGroupNum int = 1'); // Need to enumerate group nums
    SQL.Add('insert into EvalTestGroups values (@GroupID, @SetID, @NextGroupNum)');
    SQL.Add('commit tran');
    ExecSQL;
    Close;
    Free;
  end;
  TestList := TObjectList<TEvalTest>.Create;
  Self.GroupID := NextGroupID;
  Self.GroupNum := 1;
  Self.SetID := SetID;
end;

procedure TEvalTestGroup.DeleteTestGroupTests;
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

destructor TEvalTestGroup.destroy;
begin
   TestList.Destroy;
  inherited destroy;
end;

end.