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
    FrameType: Integer;
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
    constructor CreateNew(GroupID: Integer; SetID: Integer);
    destructor destroy;
    function GetFrameType(): Integer;
    function Stringify2(): String;
    procedure ResetParameters;
    procedure UpdateParameters(ParamValue: String; ParamID: Integer);
  end;

implementation

// CONSTRUCTORS //////////////

// Create Brand New, needs to check for test IDs and create from last ID

// Create Given Existing ID
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

  // Read in test associations
  Query0 := TADOQuery.Create(Nil);
  Query0.Connection := _ChromaDataModule.ChromaData;
  Query0.SQL.Add('select GroupID, SetID');
  Query0.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query0.Open;
  GroupID := Query0.FieldByName('GroupID').Value;
  SetID := Query0.FieldByName('SetID').Value;
  Query0.Close;
  Query0.Free;

  // Read in test parameters
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
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
  FrameType := GetFrameType; // Should make into function
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
constructor TEvalTest.CreateNew(GroupID: Integer; SetID: Integer);
var
  Query: TADOQuery;
  NextTestID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select max(TestID) last_id from EvalTests');
    Open;
    NextTestID := FieldByName('last_id').Value + 1;
    Close;
  end;
  with query do
  begin
    SQL.Add('begin tran');
    SQL.Add('Declare @TestID int = ' + NextTestID.ToString);
    SQL.Add('Declare @GroupID int = ' + GroupID.ToString);
    SQL.Add('Declare @SetID int = ' + SetID.ToString);
    SQL.Add('if exists (select * from EvalTests with (updlock,serializable) where TestID = @TestID) ');
    SQL.Add('begin');
    SQL.Add('update EvalTests set ParamValue = 0 ');
    SQL.Add('where TestID = @TestID and ParamID = 2 ');
    SQL.Add('end');
    SQL.Add('else');
    SQL.Add('begin');
    SQL.Add('insert EvalTests (TestID, GroupID, SetID, ParamID, ParamValue)');
    SQL.Add('values (@TestID, @GroupID, @SetID, 3, 0)');
    SQL.Add('end');
    SQL.Add('commit tran');
    ExecSQL;
    Close;
    Free;
  end;
end;

destructor TEvalTest.destroy;
begin
  inherited destroy;
end;

function TEvalTest.GetFrameType: Integer;
var
  Query: TADOQuery;
begin
  // Use TestType to LookUp Frame Type
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select FrameTypeID from TestTYpes where TypeID = ' + TestType);
  Query.Open;
  FrameType := Query.FieldByName('FrameTypeID').Value;
  Query.Close;
  Query.Free;
  Result := FrameType;
end;

procedure TEvalTest.ResetParameters;
var
  Query: TADOQuery;
  FrameTypeID: Integer;
begin
  // Currently moving from EvalFrame
  Query := TADOQuery.Create(Nil);
  FrameTypeID := GetFrameType;
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + TestID.ToString);
    SQL.Add('Declare @GroupID int =' + GroupID.ToString);
    SQL.Add('Declare @SetID int =' + SetID.ToString);
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 2, ''0'')');
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 7, '''')');
    case FrameTypeID of
      1: begin
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 10, ''0'')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 11, ''0'')');
      end;
      2,3: begin
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 4, ''0'')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 5, ''0'')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 9, ''0'')');
      end;
      4,5: begin
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 6, ''0'')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 9, ''0'')');
      end;
    end;
    ExecSQL;
  end;
end;

destructor TEvalTestGroup.destroy;
begin
  TestList.Free;
  inherited destroy;
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

procedure TEvalTest.UpdateParameters(ParamValue: String; ParamID: Integer);
var
  Query: TADOQuery;
begin
  // Moving from EvalFrame
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int = ' + TestID.ToString);
    SQL.Add('Update EvalTests set ParamValue = ' + ParamValue);
    SQL.Add('where TestID = @TestID and ParamID = ' + ParamID.ToString);
    ExecSQL;
    Free
  end;
end;

end.

