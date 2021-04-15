unit TEvalTestUnit;

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
    constructor Create(); overload;
    constructor Create(TestID: Integer); overload;
    constructor CreateNew(GroupID: Integer; SetID: Integer);
    destructor destroy;
    function GetFrameType(): Integer;
    function Stringify(): String;
    procedure ResetParameters;
    procedure UpdateParameters(ParamValue: String; ParamID: Integer);
  end;

const
  RankParam = 2;
  TestTypeParam = 3;
  FromLambdaParam = 4;
  ToLambdaParam = 5;
  AtLambdaParam = 6;
  SpecParam = 7;
  FilepathParam = 8;
  PlusTolParam = 9;
  SymbolParam = 11;

  MinusTolParam = 10;

implementation

// Create Given Existing ID
constructor TEvalTest.Create;
begin
    inherited;
end;

// Create Given Existing ID
constructor TEvalTest.Create(TestID: Integer);
var
  Query0: TADOQuery;
  Query1: TADOQuery;
  Query2: TADOQuery;
  ParamID: Integer;
  ParamValue: String;
begin
  // Initialize Params
  Self.TestID := TestID;

  // Read in test associations
  Query0 := TADOQuery.Create(Nil);
  Query0.Connection := _ChromaDataModule.ChromaData;
  Query0.SQL.Add('select GroupID, SetID');       // Explore using EvalSets Table
  Query0.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query0.Open;
  GroupID := Query0.FieldByName('GroupID').Value;
  SetID := Query0.FieldByName('SetID').Value;
  Query0.Close;
  Query0.Free;

  // Read in test parameters
  Query1 := TADOQuery.Create(Nil);
  Query1.Connection := _ChromaDataModule.ChromaData;
  Query1.SQL.Add('select ParamID, ParamValue');
  Query1.SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
  Query1.Open;
  while not Query1.eof do
  begin
    ParamID := Query1.FieldByName('ParamID').Value;
    ParamValue := Query1.FieldByName('ParamValue').Value;
    Case ParamID of
      RankParam: Rank := ParamValue;
      TestTypeParam: TestType := ParamValue;
      FromLambdaParam: LambdaFrom := ParamValue;
      ToLambdaParam: LambdaTo := ParamValue;
      AtLambdaParam: LambdaAt := ParamValue;
      SpecParam: Value := ParamValue;
      FilepathParam: Filepath := ParamValue;
      SymbolParam: Symbol := ParamValue.ToInteger;
      PlusTolParam: TolPlus := ParamValue;
      MinusTolParam: TolMinus := ParamValue;
    End;
    Query1.Next;
  end;
  Query1.Close;
  Query1.Free;
  Query2 := TADOQuery.Create(Nil);
  Query2.Connection := _ChromaDataModule.ChromaData;
  Query2.SQL.Add('select ParamName from TestTypes where TypeID = ' + TestType);
  Query2.Open;
  Name := Query2.FieldByName('ParamName').Value;
  Query2.Close;
  Query2.Free;
  FrameType := GetFrameType; // Should make into function
end;


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
    // need Try/Except Blocks
    if (FieldByName('last_id').IsNull) then
      NextTestID := 1
    else
      NextTestID := FieldByName('last_id').Value + 1;
    Close;
  end;
  with query do
  begin
    SQL.Add('begin tran');
    SQL.Add('Declare @TestID int = ' + NextTestID.ToString);
    SQL.Add('Declare @GroupID int = ' + GroupID.ToString);
    SQL.Add('Declare @SetID int = ' + SetID.ToString);
    SQL.Add('Declare @TestParam int =' + TestID.ToString);
    SQL.Add('Declare @TestTypeParam int =' + TestTypeParam.ToString);
    SQL.Add('if exists (select * from EvalTests with (updlock,serializable) where TestID = @TestID) ');
    SQL.Add('begin');
    SQL.Add('update EvalTests set ParamValue = 0 ');
    SQL.Add('where TestID = @TestID and ParamID = @TestParam ');
    SQL.Add('end');
    SQL.Add('else');
    SQL.Add('begin');
    SQL.Add('insert EvalTests (TestID, GroupID, SetID, ParamID, ParamValue)');
    SQL.Add('values (@TestID, @GroupID, @SetID, @TestTypeParam, 0)');
    SQL.Add('end');
    SQL.Add('commit tran');
    ExecSQL;
    Close;
    Free;
  end;
    Self.TestID := NextTestID;
    Self.GroupID := GroupID;
    Self.SetID := SetID;
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
  Query.SQL.Add('select FrameTypeID from TestTypes where TypeID = ' + TestType);
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
    SQL.Add('Declare @RankParam int =' + RankParam.ToString);
    SQL.Add('Declare @TestTypeParam int =' + TestTypeParam.ToString);
    SQL.Add('Declare @FromLambdaParam int =' + FromLambdaParam.ToString);
    SQL.Add('Declare @ToLambdaParam int =' + ToLambdaParam.ToString);
    SQL.Add('Declare @AtLambdaParam int =' + AtLambdaParam.ToString);
    SQL.Add('Declare @SpecParam int =' + SpecParam.ToString);
    SQL.Add('Declare @FilepathParam int =' + FilepathParam.ToString);
    SQL.Add('Declare @SymbolParam int =' + SymbolParam.ToString );
    SQL.Add('Declare @PlusTolParam int =' + PlusTolParam.ToString);
    SQL.Add('Declare @MinusTolParam int =' + MinusTolParam.ToString);

    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @RankParam, ''0'')');
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SpecParam, '''')');
    case FrameTypeID of
      1: begin  //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @PlusTolParam, '''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @MinusTolParam, '''')');
      end;
      2,3: begin  //To-From: T-Avg, R-Avg, B-Avg
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @FromLambdaParam, '''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @ToLambdaParam, '''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SymbolParam, '''')');
      end;
      4,5: begin  //At: T-Avg@, R-Avg@, B-Avg@
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @AtLambdaParam, '''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SymbolParam, '''')');
      end;
      7: begin  //CIE
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @FilepathParam, '''')');
      end;
    end;
    ExecSQL;
  end;
end;

function TEvalTest.Stringify: String;
var
  TextSymbol: String;
begin
  case Self.Symbol of
    0: TextSymbol := '>=';
    1: TextSymbol := '>';
    2: TextSymbol := '=';
    3: TextSymbol := '<=';
    4: TextSymbol := '<';
  end;
  case Self.FrameType of     // Perhaps do by frame type?
    1: Result := Name + ': ' + Value + 'nm ' + '+' + TolPlus + '/' + '-' + TolMinus + 'nm';
    2: Result := Name + ': ' + TextSymbol + Value + '% ' + LambdaFrom + '-' + LambdaTo  + 'nm';
    3: Result := Name + ': ' + TextSymbol +  Value + '% at ' + LambdaAt + 'nm';
    4: Result := Name + ': ' + TextSymbol + ' OD' + Value + ' ' + LambdaFrom + '-' + LambdaTo + 'nm';
    5: Result := Name + ': ' + TextSymbol + ' OD' + Value + '@' + LambdaAt + 'nm';
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

