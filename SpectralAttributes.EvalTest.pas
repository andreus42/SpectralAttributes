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
    RefOnly: String;
    NoTol: String;
    constructor Create(TestID: Integer); overload;
    constructor Create(GroupID: Integer; SetID: Integer) overload;
    constructor Create(GroupID: Integer; SetID: Integer; AString: String) overload;
    function GetNextTestID(): Integer;
    function GetFrameType(): Integer;
    function Stringify(): String;
    procedure ResetParameters;
    procedure UpdateParameters(ParamValue: String; ParamID: Integer);
    procedure WriteToDB;
    procedure Delete;
    destructor destroy;


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
  RefOnlyParam = 12;
  NoTolParam = 13;

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
    Self.RefOnly := '0';
    Self.NoTol := '0';
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
        RefOnlyParam: RefOnly := ParamValue;
        NoTolParam: NoTol:= ParamValue;
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
  LambdaAtList: TList<Real>;
  Value: Real;
  SymbolParam: Integer;
  Tolerance: TTolerance;
begin
    Self.GroupID := GroupID;
    Self.SetID := SetID;
    Self.TestID := GetNextTestID;
    SpecParams := GetSpecParams(AString);
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
        LambdaAtList := GetLambdaAtList(AString);
        Self.LambdaAt :=  FloatToStr(LambdaAtList[0]);
        Self.Symbol:= GetSymbolParamID(AString);
      end;
      7: begin  //CIE
          //get filepath
        Self.FilePath := '';
      end;
    end;

    WriteToDB; //WriteOutEvalTest
end;

procedure TEvalTest.Delete;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('delete from EvalTests where TestID = ' + TestID.ToString);
    ExecSQL;
    Free;
  end;
end;

destructor TEvalTest.destroy;
begin
  Self.Free;
end;

function TEvalTest.GetFrameType: Integer;
var
  Query: TADOQuery;
begin
  // Use TestType to LookUp Frame Type
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select FrameTypeID, ParamName from EvalTestTypes where TypeID = ' + TestType);
    Open;
    FrameType := Query.FieldByName('FrameTypeID').Value;
    Self.Name := Query.FieldByName('ParamName').Value;
    Close;
    Free;
  end;
  Result := FrameType;
end;

function TEvalTest.GetNextTestID: Integer;
var
  Query: TADOQuery;
  NextTestID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
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
    SQL.Add('Declare @TestID int = :TestID');
    SQL.Add('Declare @GroupID int = :GroupID');
    SQL.Add('Declare @SetID int = :SetID');
    SQL.Add('Declare @TestTypeParam int = :TestTypeParam');
    SQL.Add('Declare @ParamValueID int = :ParamValueID');
    SQL.Add('if exists (select * from EvalTests with (updlock,serializable) where TestID = @TestID) ');
    SQL.Add('begin');
    SQL.Add('update EvalTests set ParamValue = 0 ');
    SQL.Add('where TestID = @TestID and ParamID = @ParamValueID ');
    SQL.Add('end');
    SQL.Add('else');
    SQL.Add('begin');
    SQL.Add('insert EvalTests (TestID, GroupID, SetID, ParamID, ParamValue)');
    SQL.Add('values (@TestID, @GroupID, @SetID, @TestTypeParam, 0)');
    SQL.Add('end');
    SQL.Add('commit tran');
    Parameters.ParamByName('TestID').Value := NextTestID;
    Parameters.ParamByName('GroupID').Value := GroupID;
    Parameters.ParamByName('SetID').Value := SetID;
    Parameters.ParamByName('TestTypeParam').Value := TestTypeParam;
    Parameters.ParamByName('ParamValueID').Value := SpecParam;
    Prepared := True;
    ExecSQL;
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
    SQL.Add('delete from EvalTests');
    SQL.Add('where ParamID != 3 and TestID = :TestID');
    Parameters.ParamByName('TestID').Value := TestID;
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
    SQL.Add('Declare @RefOnlyParam int =' + RefOnlyParam.ToString);
    SQL.Add('Declare @NoTolParam int =' + NoTolParam.ToString);
    // Inserts that exist for all tests
    SQL.Add('update EvalTests set ParamValue = '''+TestType+''' where TestID = @TestID and ParamID = @TestTypeParam');
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @RankParam, '''+Rank+''')');

    // Write Value if exists
//   If (Value <> '') then
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @SpecParam, '''+Value+''')');
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @RefOnlyParam, '''+RefOnly+''')');

    case FrameType of
      1: begin  //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @PlusTolParam, '''+TolPlus+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @MinusTolParam, '''+TolMinus+''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, @NoTolParam, '''+NoTol+''')');
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
    Free;
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
    -1,0: Result := '';
    1: Result := Name + ': ' + Value + 'nm ' + '+' + TolPlus + '/' + '-' + TolMinus + 'nm';
    2: Result := Name + ': ' + TextSymbol + Value + '% ' + LambdaFrom + '-' + LambdaTo  + 'nm';
    3: Result := Name + ': ' + TextSymbol + ' OD' + Value + ' ' + LambdaFrom + '-' + LambdaTo + 'nm';
    4: Result := Name + ': ' + TextSymbol +  Value + '% @' + LambdaAt + 'nm';
    5: Result := Name + ': ' + TextSymbol + ' OD' + Value + ' @' + LambdaAt + 'nm';
    7: Result := Name + ': ' + Filepath;
  end;
end;


procedure TEvalTest.UpdateParameters(ParamValue: String; ParamID: Integer);
var
  Query: TADOQuery;
begin
  Self.Value := ParamValue;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Update EvalTests set ParamValue = :ParamValue');
    SQL.Add('where TestID = :TestID and ParamID = :ParamID');
    Parameters.ParamByName('TestID').Value := Self.TestID;
    Parameters.ParamByName('ParamID').Value := ParamID.ToString;
    Parameters.ParamByName('ParamValue').Value := Self.Value;
    ExecSQL;
    Free;
  end;
end;

end.

