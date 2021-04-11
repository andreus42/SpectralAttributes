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
  TempEvalTest: TEvalTest;
begin
  // Initialize Params
  Self.GroupID := GroupID;
  Self.TestList := TObjectList<TEvalTest>.Create;

// Query
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select distinct TestID');
  Query.SQL.Add('from EvalTests where GroupID = ' + GroupID.ToString);
  Query.Open;
  while not Query.eof do
    begin
      // Loop to add TestIDs to TestList
      TestID := Query.FieldByName('TestID').Value;
      TempEvalTest := TEvalTest.Create(TestID);
      TestList.Add(TempEvalTest);
      Query.Next;
    end;
  Query.Close;
  Query.Free;
end;

destructor TEvalTestGroup.destroy;
begin
  TestList.Free;
  inherited destroy;
end;


end.
