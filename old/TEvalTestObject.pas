unit TEvalTestObject;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Vcl.DBGrids,
  Data.Win.ADODB,
  Datasnap.DBClient,

  //Mine
  ConnectionUnit;

type TEvalTest = class(TObject)
  public
    TestID: Integer;
    TestGroupID: Integer;
    Name: String;
    Rank: String;
    TestType: String;
    LambdaTo: String;
    LambdaFrom: String;
    LambdaAt: String;
    Value: String;
    FilePath: String;
    procedure Stringify;
    constructor Create(TestID: Integer);
end;

implementation

procedure TEvalTest.Stringify;
var
  tempString: String;
  returnString: String;
begin
  writeln('TestID: ' + TestID.ToString);
  writeln('TestGroupID: ' + TestGroupID.ToString);
  case TestType.ToInteger of
    1:
      begin
        writeln('Test Type: ' + TestType);
        writeln('Name: ' + Name);
        writeln('Rank: ' + Rank);
        writeln('LambdaFrom: ' + LambdaFrom);
        writeln('LambdaTo: ' + LambdaTo);
        writeln('Value: ' + Value);
      end;
    2:
      begin
        writeln('Test Type: ' + TestType);
        writeln('Name: ' + Name);
        writeln('Rank: ' + Rank);
        writeln('LambdaAt: ' + LambdaAt);
        writeln('Value: ' + Value);
      end;
     3:
      begin
        writeln('Test Type: ' + TestType);
        writeln('Name: ' + Name);
        writeln('Rank: ' + Rank);
        writeln('Filepath: ' + Filepath);
      end;
  end;
  writeln;
end;

constructor TEvalTest.Create(TestID: Integer);
var
  AdoQuery: TADOQuery;
  ParamNum: Integer;
  ParamVal: String;
begin
  SetupConnection('Mydb');
  AdoQuery := TADOQuery.Create(nil);
  AdoQuery.Connection := AdoConnection;

  self.TestID := TestID;

  // Read in eval object from database
  AdoQuery.SQL.Add(' select etTestGroupID, etTestNum, etParamID, etValue'
                 + ' from EvalTests where etTestNum = ' + TestID.ToString);
  AdoQuery.Open;

  // Loop through query to create EvalTest from DB
  while not AdoQuery.eof do
  begin
    TestGroupID := AdoQuery.FieldByName('etTestGroupID').Value;
    ParamNum := AdoQuery.FieldByName('etParamID').Value;
    ParamVal := AdoQuery.FieldByName('etValue').Value;

    Case ParamNum of
      1 : Self.Name := ParamVal;
      2 : Self.Rank := ParamVal;
      3 : Self.TestType := ParamVal;
      4 : Self.LambdaFrom := ParamVal;
      5 : Self.LambdaTo := ParamVal;
      6 : Self.LambdaAt := ParamVal;
      7 : Self.Value := ParamVal;
      8 : Self.Filepath := ParamVal;
    End;

    AdoQuery.Next;
  end;

  AdoQuery.Free;
  CloseConnection;
end;

end.



