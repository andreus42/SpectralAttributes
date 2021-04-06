unit TEvalTestGroupObject;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Vcl.DBGrids,
  Data.Win.ADODB,

  // Mine
  TEvalTestObject,
  ConnectionUnit;

type TEvalTestGroup = class(TObject)
public
  GroupID: Integer;
  TestList: TList<TEvalTest>;
  procedure ListStringify2;
  constructor Create(TestGroupID: Integer);
  Destructor  Destroy; override;
end;

implementation

{ TEvalTestGroup }

constructor TEvalTestGroup.Create(TestGroupID: Integer);
var
  AdoQuery: TADOQuery;
  TestNum: Integer;
  TempEvalTest: TEvalTest;

begin
  Self.GroupID := TestGroupID;
  Self.TestList := TList<TEvalTest>.Create;

  SetupConnection('Mydb');
  AdoQuery := TADOQuery.Create(nil);
  AdoQuery.Connection := AdoConnection;
  AdoQuery.SQL.Add(' select distinct etTestNum '
                 + ' from EvalTests where etTestGroupID = '
                 + Self.GroupID.ToString);
  AdoQuery.Open;

  while not AdoQuery.eof do
  begin
    TestNum := AdoQuery.FieldByName('etTestNum').Value;
    TempEvalTest := TEvalTest.Create(TestNum);
    Self.TestList.Add(TempEvalTest);
    AdoQuery.Next;
  end;

end;

destructor TEvalTestGroup.Destroy;
begin
  TestList.Free;
  inherited;
end;

procedure TEvalTestGroup.ListStringify2;
var
  TempEvalTest: TEvalTest;
begin
  for TempEvalTest in Self.TestList do
  begin
    TempEvalTest.Stringify;
  end;
end;

end.
