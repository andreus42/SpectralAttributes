unit Logic;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.RegularExpressions,
  System.RegularExpressionsCore,
  System.Generics.Collections,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  ActiveX, ChromaDataModule;

type
  TSpecParams = record
    ParamName: String;
    TypeID: Integer;
    FrameTypeID: Integer;
  end;

  TLambdaRange = record
    ToLambda: Real;
    FromLambda: Real;
  end;

  TTolerance = record
    PlusTol: Real;
    MinusTol: Real;
  end;

// Translate S^3 Text to Parameters
function FindSpecToken(AString: string): string;
function FindSpecParams(AString: string): TSpecParams;
function FindSpecParamID(AString: string): Integer;
function FindSymbolParamID(AString: string): Integer;
function FindPecentSpecVal(AString: string): Real;
function FindRangeVals(AString: string): TList<String>;
function ReturnRangeList(AString: String): TList<TLambdaRange>;
function ReturnTolerance(AString: String): TTolerance;
function ReturnTransmissionValueList(AString: String): TList<Real>;
function ReturnSpecValueList(AString: String): TList<Real>;

// Unformatted Text Cleaning
function CommentNonSpecs(AString: string): string;
function ExpandSpecs(AString: string): string;
function FloatCommentsDown(AString: string): string;
function InitialRegex(AString: string): string;
function TestsToFront(AString: string): string;
function SplitPat(AString: string): string;
function ShrinkWhiteSpace(AString: string): string;
function RemoveAvgAbs(AString: string): string;
function ConcatStr(sArray: TArray<string>): string;

// Output S^3 Text
// function WriteSpecFromParams(ParamsList: List): String;

const
  SpecTokenRegexString = '(.*):';
  TolerancedSpedRegexString = '(\d{2,4})nm';
  SymbolRegexString = '>=|>|=|<|<=';
  LambdaRangesRegexString = '(\d{3,4}\.?\d?)-(\d{3,4}\.?\d?)';
  TolerancesRegexString = '(?:\+(\d?(?:\.\d)?)\/\-(\d?(?:\.\d)?)nm)';
  BSpecValueRegexString = '(?:OD)(\d{1,2}(?:\.\d{1,2})?)';

  //Spec Value Regexs
  TransSpecValueRegexString = '(\d{1,2}(?:\.\d{1,2})?)(?:%)';
  ToleranceValueRegexString = '(\d{2,4}(?:\.\d{1,2})?)nm';
  PercentValueRegexString = '(\d{1,2}(?:\.\d{1,2})?)(?:%)';
  ODValueRegexString = '(?:OD)(\d{1,2}(?:\.\d{1,2})?)';
  FilepathRegexString = '(e:\\.*)';

implementation

function ReturnSpecValueList(AString: String): TList<Real>;
var
  SpecParams: TSpecParams;
  TestString: String;
  Regex: TRegex;
  Matches: TMatchCollection;
  Group: TGroupCollection;
  I: Integer;
  ValueList: TList<Real>;
  Value: Real;
begin
  SpecParams := FindSpecParams(AString);
  case SpecParams.FrameTypeID of
    1:   Regex := ToleranceValueRegexString;
    2,4: Regex := PercentValueRegexString;
    3:   Regex := ODValueRegexString;
    5:   Regex := FilepathRegexString;
  end;
  ValueList := TList<Real>.Create;
  Regex := TRegEx.Create(Regex);
  Matches:= Regex.Matches(AString);
  for I := 0 to Matches.Count-1 do
  begin
    Group := Matches.Item[I].Groups;
    ValueList.Add(StrToFloat(Group.Item[1].Value));
  end;
  Result := ValueList;
end;


function ReturnTransmissionValueList(AString: String): TList<Real>;
var
  TransmissionValueList: TList<Real>;
  Regex: TRegex;
  Matches: TMatchCollection;
  Group: TGroupCollection;
  I: Integer;
begin
  TransmissionValueList := TList<Real>.Create;
  Regex := TRegEx.Create(TransSpecValueRegexString);
  Matches:= Regex.Matches(AString);
  for I := 0 to Matches.Count-1 do
  begin
    Group := Matches.Item[I].Groups;
    TransmissionValueList.Add(StrToFloat(Group.Item[1].Value));
  end;
  Result := TransmissionValueList;
end;


function ReturnTolerance(AString: String): TTolerance;
var
  Tolerance: TTolerance;
  Regex: TRegex;
  Matches: TMatchCollection;
  Group: TGroupCollection;
  I: Integer;
begin
  Regex := TRegEx.Create(TolerancesRegexString);
  Matches:= Regex.Matches(AString);
  for I := 0 to Matches.Count-1 do
  begin
    Group := Matches.Item[I].Groups;
    Tolerance.PlusTol := StrToFloat(Group.Item[1].Value);
    Tolerance.MinusTol := StrToFloat(Group.Item[2].Value);
  end;
  Result := Tolerance;
end;

function ConcatStr(sArray: TArray<string>): string;
var
  s, rString: String;
begin
  rString := '';
  for s in sArray do
    rString := rString + s + ', ';
  ConcatStr := rString;
end;

function ReturnRangeList(AString: String): TList<TLambdaRange>;
var
  LambdaRangeList: TList<TLambdaRange>;
  LambdaRange: TLambdaRange;
  Regex: TRegex;
  Matches: TMatchCollection;
  Group: TGroupCollection;
  I: Integer;
begin
  LambdaRangeList := TList<TLambdaRange>.Create;
  Regex := TRegEx.Create(LambdaRangesRegexString);
  Matches:= Regex.Matches(AString);
  for I := 0 to Matches.Count-1 do
  begin
    Group := Matches.Item[I].Groups;
    LambdaRange.FromLambda := StrToFloat(Group.Item[1].Value);
    LambdaRange.ToLambda := StrToFloat(Group.Item[2].Value);
    LambdaRangeList.Add(LambdaRange);
  end;
  Result := LambdaRangeList;
end;


function RemoveAvgAbs(AString: string): string;
var
  OutString: string;
begin
  OutString := TRegEx.Replace(AString, '([Aa]vg[:]?)|([Aa]bs[:]?)', '');
  OutString := TRegEx.Replace(OutString, '[TRB]:', '');
  RemoveAvgAbs := OutString;
end;

function ShrinkWhiteSpace(AString: string): string;
begin
  // Replace multiple newlines and spaces with single
  AString := TRegEx.Replace(AString, '\R*', sLineBreak);
  AString := TRegEx.Replace(AString, ' *', ' ');
  ShrinkWhiteSpace := trim(AString);
end;

function CommentNonSpecs(AString: string): string;
const
  pattern = '(^AOI:)|(^Avg-pol:)|(B:)|(T:)|(R:)|(^U-pol:)|(^S-pol:)|' +
    '(^P-pol:)|(^CWL:)|(^FWHM:)|(^FW: @ 10% T-max)|(^T-avg:)|' +
    '(^T-abs:)|(^T-max:)|(^T-peak:)|(^B-avg:)|(^B-abs:)|(^R-avg:)|' +
    '(^R-abs:)|(^R-avg \(r-scan\):)|(^R-abs \(r-scan\):)|(^R-max:)|' +
    '(^R-target:)|(^Cuton:)|(^Cutoff:)|(^Cuton \(20-80\):)|' +
    '(^Cutoff \(80-20\):)';
var
  line: string;
  output: string;
  lines: TArray<string>;
begin
  lines := TRegEx.Split(AString, '\R');

  for line in lines do
    // Line is test
    if TRegEx.IsMatch(line, pattern) then
      output := output + line + sLineBreak
    else
      // Line is comment
      output := output + '# ' + line + sLineBreak;
  CommentNonSpecs := output;
end;

function ExpandSpecs(AString: string): string;
var
  output: String;
  line: String;
  lines: TArray<String>;
  Range: String;
  Ranges: TArray<String>;
begin
  lines := TRegEx.Split(AString, '\R');
//  Ranges := FindRanges(line);  Update to new function
  for Range in Ranges do
  begin
    output := output + line + ' ' + Range + sLineBreak;
  end;
  Result := output;
end;

function FloatCommentsDown(AString: string): string;
var
  s: string;
  lines: TArray<string>;
  SpecString: string;
  CommentString: string;

begin
  AString := CommentNonSpecs(AString);
  lines := TRegEx.Split(AString, '\R');
  for s in lines do
    if TRegEx.IsMatch(s, '^#') then
      CommentString := CommentString + s + sLineBreak
    else
      SpecString := SpecString + s + sLineBreak;
  FloatCommentsDown := trim(SpecString) + sLineBreak + trim(CommentString);
end;

function InitialRegex(AString: string): string;
// Make initial text substitutions
var
  s: string;
  line: string;
  output: string;
  lines: TArray<string>;

begin
  lines := TRegEx.Split(AString, '\R');
  for line in lines do
  begin
    // strip extra whitespace
    s := ShrinkWhiteSpace(line);

    // Replace common terms
    s := TRegEx.Replace(s, 'Final Spectral Analysis:?\.?\n?', '');
    s := TRegEx.Replace(s, '\. Save spectra:', '');
    s := TRegEx.Replace(s,
      'Measure spectra:?|Save Spectra:?\.?|Measure/Save Spectra:?',
      'Save spectra:');
    s := TRegEx.Replace(s, 'assign lot.?#?,?\n?', 'Assign lot');
    s := TRegEx.Replace(s, 'Save Curve\.?', 'Assign lot');
    s := TRegEx.Replace(s, 'Nominal/Target', 'Nominal');
    s := TRegEx.Replace(s, 'Target', 'Nominal');
    s := TRegEx.Replace(s, 'In-?process.*', 'In-process');
    s := TRegEx.Replace(s, '\s+(after ar).?', 'After AR');
    s := TRegEx.Replace(s, 'degrees,?:?', 'deg');
    s := TRegEx.Replace(s, '(?<=\d) deg', 'deg');
    s := TRegEx.Replace(s, 'cut[-? ?-?]on:?', 'Cuton:');
    s := TRegEx.Replace(s, 'cut[-? ?-?]off:?', 'Cutoff:');
    s := TRegEx.Replace(s, 'Cuton @ 50%:', 'Cuton:');
    s := TRegEx.Replace(s, 'Cutoff @ 50%:', 'Cutoff:');
    s := TRegEx.Replace(s, '(Min\.)?\s?T?\s?Peak ?-?T:', 'T-Peak:');

    // Standardize test format
    s := TRegEx.Replace(s, '(?<=CWL)(=? ? =? ?)', ': ');
    s := TRegEx.Replace(s, '(?<=FWHM)(=? ? =? ?)', ': ');
    s := TRegEx.Replace(s, 'aoi(?!:)', 'AOI: ');
    s := TRegEx.Replace(s, 'cwl(?!:)', 'CWL: ');
    s := TRegEx.Replace(s, 'fwhm(?!:)', 'FWHM: ');
    s := TRegEx.Replace(s, 'Tabs', 'T-abs');
    s := TRegEx.Replace(s, 'Tavg', 'T-avg');
    s := TRegEx.Replace(s, 'Blocking:?', 'B:');

    // Standardize test type
    s := TRegEx.Replace(s, '\s?avg\s?,?:?', 'avg ');
    s := TRegEx.Replace(s, '\s?abs\s?,?:?', 'abs ');

    s := TRegEx.Replace(s, '(?<=[TRB])\s(?=[<>=])', ':');
    // adds semicolon after [TRB] spec blank

    // Format operands (spacing, etc)
    s := TRegEx.Replace(s, ' ?>\/= ?', ' >=');
    s := TRegEx.Replace(s, ':(?!\s)', ': ');
    s := TRegEx.Replace(s, '>\s', '>= ');
    s := TRegEx.Replace(s, '>=(?=B)', '>= ');
    s := TRegEx.Replace(s, '(?<=\d{3}) nm', 'nm');
    s := TRegEx.Replace(s, '(?<=\d{3}) -', '-');
    s := TRegEx.Replace(s, '- (?=\d{3})', '-');

    // Format Tolerances
    s := TRegEx.Replace(s, '\+\/- ', '+/-');
    s := TRegEx.Replace(s, '(\+\/-\s?)', '+/-');
    s := TRegEx.Replace(s, '(\+\\-\s?)', '+/-');
    s := TRegEx.Replace(s, '(\s+-)|(-\s+)', '-');

    output := output + s + sLineBreak;
  end;

  InitialRegex := ShrinkWhiteSpace(output);
end;

function TestsToFront(AString: string): string;
var
  line: string;
  lines: TArray<String>;
  Range: string;
  Ranges: TArray<String>;
  OutString: String;
  CompleteString: String;
  TAvgRegex: TRegEx;
  TAbsRegex: TRegEx;
  RAvgRegex: TRegEx;
  RAbsRegex: TRegEx;
  BAvgRegex: TRegEx;
  BAbsRegex: TRegEx;

begin
  TAvgRegex := TRegEx.Create('T[-:>].*avg', [roIgnoreCase]);
  TAbsRegex := TRegEx.Create('T[-:>].*abs', [roIgnoreCase]);
  RAvgRegex := TRegEx.Create('R[-:>].*avg', [roIgnoreCase]);
  RAbsRegex := TRegEx.Create('R[-:>].*abs', [roIgnoreCase]);
  BAvgRegex := TRegEx.Create('B[-:>].*avg', [roIgnoreCase]);
  BAbsRegex := TRegEx.Create('B[-:>].*abs', [roIgnoreCase]);

  Result := 'Commented out test result';

  // Split lines ****REDO With Find Ranges, probably break up
//  lines := TRegEx.Split(AString, '\R');
//  for line in lines do
//  begin
//    if TAvgRegex.IsMatch(line) and TAbsRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'T-avg: ' + OutString + ' ' + Range + sLineBreak;
//        OutString := 'T-abs: ' + OutString + ' ' + Range;
//      end;
//    end
//    else if TAvgRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'T-avg: ' + OutString + ' ' + Range;
//      end;
//    end
//    else if TAbsRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'T-abs: ' + OutString + ' ' + Range + sLineBreak;;
//      end;
//    end
//    else if RAvgRegex.IsMatch(line) and RAbsRegex.IsMatch(line) then
//    begin
//      OutString := RemoveAvgAbs(line);
//      OutString := 'R-avg: ' + OutString + sLineBreak + 'R-abs:' + OutString;
//    end
//    else if RAvgRegex.IsMatch(line) then
//    begin
//      OutString := RemoveAvgAbs(line);
//      OutString := 'R-avg: ' + OutString;
//    end
//    else if RAbsRegex.IsMatch(line) then
//    begin
//      OutString := RemoveAvgAbs(line);
//      OutString := 'R-abs: ' + OutString;
//    end
//    else if BAvgRegex.IsMatch(line) and BAbsRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'B-avg: ' + OutString + ' ' + Range + sLineBreak;
//        OutString := 'B-abs: ' + OutString + ' ' + Range;
//      end;
//    end
//    else if BAvgRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'B-avg: ' + OutString + ' ' + Range;
//      end;
//    end
//    else if BAbsRegex.IsMatch(line) then
//    begin
//      Ranges := FindRanges(line);
//      for Range in Ranges do
//      begin
//        OutString := RemoveAvgAbs(line);
//        OutString := 'B-abs: ' + OutString + ' ' + Range;
//      end;
//    end
//    else
//      OutString := line;
//
//    CompleteString := CompleteString + OutString + sLineBreak;
//  end;
//  TestsToFront := ShrinkWhiteSpace(CompleteString);
end;

function SplitPat(AString: string): string;

var
  s: string;
  output: string;
  splitOut: TArray<string>;

begin
  splitOut := TRegEx.Split(AString, ':');
  for s in splitOut do
    output := output + s + sLineBreak;
  SplitPat := output;
end;

function FindSpecToken(AString: string): string;
const
  pattern = SpecTokenRegexString;
begin
  Result := TRegEx.Matches(AString, pattern).Item[0].Groups.Item[1].Value;
end;

function FindSpecParams(AString: string): TSpecParams;
var
  Query: TADOQuery;
  SpecToken: String;
  SpecParam: TSpecParams;
begin
  SpecToken := FindSpecToken(AString);
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select TypeID, FrameTypeID from TestTypes where ParamName = ''' + SpecToken + '''');
    Open;
    SpecParam.TypeID := FieldByName('TypeID').Value;
    SpecParam.FrameTypeID := FieldByName('FrameTypeID').Value;
    Close;
    Free;
  end;
  SpecParam.ParamName := SpecToken;
  Result := SpecParam;
end;

function FindSpecParamID(AString: string): Integer;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select ID from TestTypes where ParamName = ''' + AString + '''');
    Open;
    Result := FieldByName('ID').Value;
    Close;
    Free;
  end;
end;

function FindSymbolParamID(AString: string): Integer;
const
  pattern = '(>=)|(>)|(=)|(<=)|(<)';
var
  SymbolToken: String;
begin
  // Will have to adapt for multiple spec lines
  // Matches := TRegEx.Matches(AString, pattern);
  // for I := 0 to Matches.Count-1 do
  // OutString := OutString + Matches.Item[I].Groups.Item[0].Value;

  SymbolToken := TRegEx.Matches(AString, pattern).Item[0].Groups.Item[0].Value;
  result := ansiindexstr(SymbolToken, ['>=', '>', '=', '<=', '<']);
end;

function FindPecentSpecVal(AString: string): Real;
const
pattern = '(\d{1,2})%';
var
  Regex: TRegex;
  Matches: TMatchCollection;
  Groups: TGroupCollection;
begin
  Regex :=  TRegEx.Create(pattern);
  Matches:= Regex.Matches(AString);
  Groups := Matches.Item[0].Groups;
  Result := StrToFloat(Groups.Item[1].Value);
end;

function FindRangeVals(AString: string): TList<String>;
const
  pattern = '(\d{3,4}\.?\d?)-(\d{3,4}\.?\d?)';
var
  Regex: TRegex;
  Matches: TMatchCollection;
  Groups: TGroupCollection;
  RangeList: TList<String>;
  I, J: Integer;
begin
  RangeList := TList<String>.Create;
  Regex := TRegEx.Create(pattern, [roIgnoreCase]);
  Matches:= regex.Matches(AString);
  for I := 0 to Matches.Count-1 do
  begin
    Groups := Matches.Item[i].Groups;
    for J := 0 to Groups.Count-1 do
      // Add each match pair (low, high) to IntList
      RangeList.Add(Groups.Item[J].Value);
  end;
  Result := RangeList;
end;

end.
