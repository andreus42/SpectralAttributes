unit TEvalTestGroupUnit;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,
  TEvalTestUnit;

type
  TEvalTestGroup = class(TObject)
  public
    GroupID: Integer;
    GroupNum: Integer;
    SetID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(GroupID: Integer);
    constructor CreateNew(SetID: Integer);
    destructor destroy;
  end;

implementation

constructor TEvalTestGroup.Create(GroupID: Integer);
var
  Query : TADOQuery;
  TestID: Integer;
  EvalTest: TEvalTest;
begin
  // Initialize Params
  Self.GroupID := GroupID;
  TestList := TObjectList<TEvalTest>.Create;

// Query
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

constructor TEvalTestGroup.CreateNew(SetID: Integer);
var
  Query: TADOQuery;
  NextGroupID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select max(GroupID) last_id from EvalTestGroups');
    Open;
    NextGroupID := FieldByName('last_id').Value + 1;
    Close;
  end;
  with query do
  begin
    SQL.Add('begin tran');
    SQL.Add('Declare @SetID int = ' + SetID.ToString);
    SQL.Add('Declare @GroupID int = ' + NextGroupID.ToString);
    SQL.Add('Declare @NextGroupNum int = 1'); //Need to enumerate group nums
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


destructor TEvalTestGroup.destroy;
begin
  TestList.Free;
  inherited destroy;
end;


end.
