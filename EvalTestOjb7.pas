unit EvalTestOjb7;

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
    GroupID: Integer;
    SetID: Integer;
    Name: String;
    Rank: String;
    TestType: String;
    LambdaTo: String;
    LambdaFrom: String;
    LambdaAt: String;
    Value: String;
    Symbol: Integer;
    FilePath: String;
    TolPlus: String;
    TolMinus: String;
    constructor Create(TestID: Integer);
    destructor destroy;
    procedure Stringify;
    function Stringify2():String;
    procedure WriteEvalTest(ParamID: Integer; ParamValue: String);
  end;

  TEvalTestGroup = class(TObject)      // Future TEvalGroup;
  public
    GroupID: Integer;
    TestList: TObjectList<TEvalTest>;
    constructor Create(GroupID: Integer);
    destructor destroy;
  end;

implementation

// CONSTRUCTORS //////////////
constructor TEvalTest.Create(TestID: Integer);
var
  Query: TADOQuery;
  Query0: TADOQuery;
  Query2: TADOQuery;
  ParamID: Integer;
  ParamValue: String;
begin
  // Initialize Params
  Self.TestID := TestID;
  Self.GroupID := GroupID;

  // Read in test associations
  Query0 := TADOQuery.Create(Nil);
  Query0.Connection := _ChromaDataModule.ChromaData;
  Query0.SQL.Add('select SetID');
  Query0.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query0.Open;
  SetID := Query.FieldByName('SetID').Value;
  Query0.Close;
  Query0.Free;

  // Read in test parameters
  Query.SQL.Add('select ParamID, ParamValue');
  Query.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query.Open;
  while not Query.eof do
  begin
    ParamID := Query.FieldByName('ParamID').Value;
    ParamValue := Query.FieldByName('ParamValue').Value;
    Case ParamID of
      2 : Rank := ParamValue;
      3 : TestType := ParamValue;
      4 : LambdaFrom := ParamValue;
      5 : LambdaTo := ParamValue;
      6 : LambdaAt := ParamValue;
      7 : Value := ParamValue;
      8 : Filepath := ParamValue;
      9 : Symbol := ParamValue.ToInteger;
      10: TolPlus := ParamValue;
      11: TolMinus := ParamValue;
    End;
    Query.Next;
  end;
  Query.Close;
  Query.Free;
  Query2 := TADOQuery.Create(Nil);
  Query2.Connection := _ChromaDataModule.ChromaData;
  Query2.SQL.Add('select ParamName from TestTypes where TypeID = ' + TestType);
  Query2.Open;
  Name := Query2.FieldByName('ParamName').Value;
  Query2.Close;
  Query2.Free;
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

function TEvalTest.Stringify2: String;
begin
  case Self.TestType.ToInteger of
    1: Result := Name + ': ' + Value + 'nm ' + '+' + TolPlus + '/' + '-' + TolMinus + 'nm';
    2: Result := Name + ': ' + Symbol.ToString + 'f ' + Value + '% ' + LambdaFrom + '-' + LambdaTo +'nm';
    3: Result := Name + ': ' + Symbol.ToString + 'f ' + Value + '% at ' + LambdaAt + 'nm';
    4: Result := Name + ': ' + Filepath;
    10: Result := Name + ': ' + Symbol.ToString + 'f ' + 'OD' + Value + ' ' + LambdaFrom + '-' + LambdaTo +'nm';
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

