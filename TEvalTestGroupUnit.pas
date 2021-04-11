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
  TEvalTestGroup = class(TObject)      // Future TEvalGroup;
  public
    GroupID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(GroupID: Integer);
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
  Self.TestList := TObjectList<TEvalTest>.Create;

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

destructor TEvalTestGroup.destroy;
begin
  TestList.Free;
  inherited destroy;
end;


end.
