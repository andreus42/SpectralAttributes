unit SpectralAttributes.EvalTest;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,
  SpectralAttributes.ParsingLogic;


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
    constructor Create(TestID: Integer); overload;
    constructor Create(GroupID: Integer; SetID: Integer) overload;
    constructor Create(GroupID: Integer; SetID: Integer; AString: String) overload;
    function GetNextTestID(): Integer;
    function GetFrameType(): Integer;
    function Stringify(): String;
    procedure ResetParameters;
    procedure UpdateParameters(ParamValue: String; ParamID: Integer);
    procedure WriteToDB;
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
  MinusTolParam = 10;
  SymbolParam = 11;

implementation

// Create new with Existing Set, Group
constructor TEvalTest.Create(GroupID: Integer; SetID: Integer);
begin
    Self.SetID := SetID;
    Self.GroupID := GroupID;
    Self.TestID := GetNextTestID;
    Self.TestType := '0';
    Self.FrameType := 0;
    Self.Name := '';
    Self.Rank := '0'; // need logic to determine next rank somewhere
    Self.LambdaTo := '';
    Self.LambdaFrom := '';
    Self.LambdaAt := '';
    Self.Value := '';
    Self.Symbol := 0;
    Self.FilePath := '';
    Self.TolPlus := '';
    Self.TolMinus := '';
    Self.WriteToDB;
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

  // Read in test associations  // We should already know GroupID & SetID
  Query0 := TADOQuery.Create(Nil);
  with Query0 do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select GroupID, SetID');       // Explore using EvalSets Table
    SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
    Open;
    GroupID := Query0.FieldByName('GroupID').Value;
    SetID := Query0.FieldByName('SetID').Value;
    Close;
    Free;
  end;
  // Read in test parameters  // Possibly change into reading from stringlist or other list
  Query1 := TADOQuery.Create(Nil);
  with Query1 do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select ParamID, ParamValue');
    SQL.Add('from EvalTests where TestID = ' + TestID.ToString);
    Open;
    while not eof do
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
      Next;
    end;
    Close;
    Free;
  end;
  FrameType := GetFrameType;
end;

constructor TEvalTest.Create(GroupID, SetID: Integer; AString: String);
var
  SpecParams: TSpecParams;
  LambdaRangeList: TList<TLambdaRange>;
  LambdaRange: TLambdaRange;
  SpecValueList: TList<Real>;
  Value: Real;
  SymbolParam: Integer;
  Tolerance: TTolerance;
begin
    Self.GroupID := GroupID;
    Self.SetID := SetID;
    Self.TestID := GetNextTestID;
    SpecParams := GetSpecParams(AString);
    ///SOMETHING funny with getting spec value
    SpecValueList:= TList<Real>.Create;
    SpecValueList := GetSpecValuesList(AString);
    Self.Name := SpecParams.ParamName;
    Self.TestType := SpecParams.TypeID.ToString;
    Self.FrameType := SpecParams.FrameTypeID;
    Self.Rank := '0'; // needs logic
    Self.Value :=  FloatToStr(SpecValueList[0]); //temp until looping for vals/ranges

    case FrameType of
      1: begin  //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
        Tolerance := GetTolerance(AString);
        Self.TolPlus := FloatToStr(Tolerance.PlusTol);
        Self.TolMinus := FloatToStr(Tolerance.MinusTol);
      end;
      2,3: begin  //To-From: T-Avg, R-Avg, B-Avg
        LambdaRangeList := GetRangeList(AString);
        Self.LambdaFrom := FloatToStr(LambdaRangeList[0].FromLambda);
        Self.LambdaTo := FloatToStr(LambdaRangeList[0].ToLambda);
        Self.Symbol := GetSymbolParamID(AString);
      end;
      4,5: begin  //At: T-Avg@, R-Avg@, B-Avg@
        Self.LambdaAt :=  '';
        Self.Symbol:= GetSymbolParamID(AString);
      end;
      7: begin  //CIE
          //get filepath
        Self.FilePath := '';
      end;
    end;

    WriteToDB; //WriteOutEvalTest
end;

function TEvalTest.GetFrameType: Integer;
var
  Query: TADOQuery;
begin
  // Use TestType to LookUp Frame Type
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select FrameTypeID, ParamName from TestTypes where TypeID = ' + TestType);
  Query.Open;
  FrameType := Query.FieldByName('FrameTypeID').Value;
  Name := Query.FieldByName('ParamName').Value;
  Query.Close;
  Query.Free;
  Result := FrameType;
end;

function TEvalTest.GetNextTestID: Integer;
var
  Query: TADOQuery;
  NextTestID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    // need Try/Except Blocks
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('SELECT MAX(TestID) LastID FROM EvalTests');
    Open;
    if (FieldByName('LastID').IsNull) then
      NextTestID := 1
    else
      NextTestID := FieldByName('LastID').Value + 1;
    Close;
    Free;
  end;
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
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
  Result := NextTestID;
end;

procedure TEvalTest.ResetParameters;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + TestID.ToString);
    SQL.Add('delete from EvalTests');
    SQL.Add('where ParamID != 3 and TestID = @TestID');
    ExecSQL;
    WriteToDB;
    Free;
  end;
end;

procedure TEvalTest.WriteToDB;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
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
    // Inserts for all
    SQL.Add('update EvalTests set ParamValue = '''+TestType+''' where TestID = '+TestID.ToString+' and ParamID = @TestTypeParam');
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @RankParam, '''+Rank+''')');

    // Write Value if exists
//    If (Value <> '') then
      SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SpecParam, '''+Value+''')');

    case FrameType of
      1: begin  //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @PlusTolParam, '''+TolPlus+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @MinusTolParam, '''+TolMinus+''')');
      end;
      2,3: begin  //To-From: T-Avg, R-Avg, B-Avg
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @FromLambdaParam, '''+LambdaFrom+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @ToLambdaParam, '''+LambdaTo+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SymbolParam, '''+Symbol.ToString+''')');
      end;
      4,5: begin  //At: T-Avg@, R-Avg@, B-Avg@
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @AtLambdaParam, '''+LambdaAt+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SymbolParam, '''+Symbol.ToString+''')');
      end;
      7: begin  //CIE
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @FilepathParam, '''+Filepath+''')');
      end;
    end;
    ExecSQL;
  end;
end;


function TEvalTest.Stringify: String;
const
  SymbolArray: array[0..4] of string = ('>=', '>', '=', '<=', '<');
var
  TextSymbol: String;
begin
  TextSymbol := SymbolArray[Self.Symbol];
  case Self.FrameType of
    1: Result := Name + ': ' + Value + 'nm ' + '+' + TolPlus + '/' + '-' + TolMinus + 'nm';
    2: Result := Name + ': ' + TextSymbol + Value + '% ' + LambdaFrom + '-' + LambdaTo  + 'nm';
    3: Result := Name + ': ' + TextSymbol + ' OD' + Value + ' ' + LambdaFrom + '-' + LambdaTo + 'nm';
    4: Result := Name + ': ' + TextSymbol +  Value + '% at ' + LambdaAt + 'nm';
    5: Result := Name + ': ' + TextSymbol + ' OD' + Value + ' @' + LambdaAt + 'nm';
    7: Result := Name + ': ' + Filepath;
  end;
end;

procedure TEvalTest.UpdateParameters(ParamValue: String; ParamID: Integer);
var
  Query: TADOQuery;
begin
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

