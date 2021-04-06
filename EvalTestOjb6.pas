unit EvalTestOjb6;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule;

type
  TEvalTest = class(TObject)
//  private
  public
    TestID: Integer;
    Name: String;
    Rank: String;
    TestType: String;
    LambdaTo: String;
    LambdaFrom: String;
    LambdaAt: String;
    Value: String;
    FilePath: String;
    constructor Create(TestID: Integer);
    destructor destroy;
    procedure Stringify;
    procedure WriteEvalTest(ParamID: Integer; ParamValue: String);
  end;

  TEvalTestGroup = class(TObject)      // Future TEvalGroup;
  public
    GroupID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(GroupID: Integer);
    destructor destroy;
  end;

  TEvalTestSet = class(TObject)
  public
    SetID: Integer;
    EvalTestGroupList: TObjectList<TEvalTestGroup>;
    constructor Create(ID: Integer);
    destructor destroy;
    procedure WalkTestSet;
  end;

implementation

// CONSTRUCTORS //////////////
constructor TEvalTest.Create(TestID: Integer);
var
  Query: TADOQuery;
  ParamID: Integer;
  ParamValue: String;
begin

  // Initialize Params
  Self.TestID := TestID;
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select ParamID, ParamValue');
  Query.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query.Open;

  // Translate Query to TestEval obj
  while not Query.eof do
  begin
    ParamID := Query.FieldByName('ParamID').Value;
    ParamValue := Query.FieldByName('ParamValue').Value;
    Case ParamID of
      1 : Self.Name := ParamValue;
      2 : Self.Rank := ParamValue;
      3 : Self.TestType := ParamValue;
      4 : Self.LambdaFrom := ParamValue;
      5 : Self.LambdaTo := ParamValue;
      6 : Self.LambdaAt := ParamValue;
      7 : Self.Value := ParamValue;
      8 : Self.Filepath := ParamValue;
    End;
    Query.Next;
  end;
  Query.Close;
  Query.Free;
end;


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
  Query.SQL.Add('from EvalTestSet where GroupID = ' + GroupID.ToString);
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



constructor TEvalTestSet.Create(ID: Integer);
var
  Query : TADOQuery;
  TempEvalTestGroup: TEvalTestGroup;
  GroupID: Integer;
begin
  Self.SetID := ID;
  Self.EvalTestGroupList := TObjectList<TEvalTestGroup>.Create;
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select distinct GroupID');
  Query.SQL.Add('from EvalTestSet ETS where SetID = ' + SetID.ToString);
  Query.Open;
  while not Query.eof do
    begin
      GroupID := Query.FieldByName('GroupID').Value;
      TempEvalTestGroup := TEvalTestGroup.Create(GroupID);
      Self.EvalTestGroupList.Add(TempEvalTestGroup);
      Query.Next;
    end;
  Query.Close;
  Query.Free;
end;


// DESTRUCTORS //////////////
destructor TEvalTest.destroy;
begin
  inherited destroy;
end;

destructor TEvalTestGroup.destroy;
begin
  TestList.Free;
  inherited destroy;
end;

destructor TEvalTestSet.destroy;
begin
  EvalTestGroupList.Free;
  inherited destroy;
end;


// METHODS
procedure TEvalTest.Stringify;
begin
  writeln('TestID: ' + TestID.ToString);
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


procedure TEvalTestSet.WalkTestSet;
// Walk through each EvalTest and Stringify
var
  TempEvalTestGroup: TEvalTestGroup;
  TempEvalTest: TEvalTest;
begin
  for TempEvalTestGroup in Self.EvalTestGroupList do
  begin
    writeln('GroupID: ' + TempEvalTestGroup.GroupID.ToString);
    for TempEvalTest in TempEvalTestGroup.TestList do
    begin
      TempEvalTest.Stringify
    end;
  end;
end;


procedure TEvalTest.WriteEvalTest(ParamID: Integer; ParamValue: String);
var
  Query : TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('Update TEvalTests set ParamValue = ''' + ParamValue + '''');
  Query.SQL.Add('where ParamID = ' + ParamID.ToString);
  Query.SQL.Add('and TestID = ' + Self.TestID.ToString);
  Query.ExecSQL;
  Query.Close;
  Query.Free;
end;


end.

