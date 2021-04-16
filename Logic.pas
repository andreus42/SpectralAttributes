unit Logic;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.RegularExpressions,
  System.RegularExpressionsCore,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  ActiveX, ChromaDataModule;

// new functions
function FindSpecToken(AString: string): string;
function FindSpecParamID(AString: string): Integer;
function FindSymbolParamID(AString: string): Integer;
function FindSpecVal(AString: string): string;

// Old functions
function CommentNonSpecs(AString: string): string;
function ExpandSpecs(AString: string): string;
function FloatCommentsDown(AString: string): string;
function InitialRegex(AString: string): string;
function TestsToFront(AString: string): string;
function SplitPat(AString: string): string;
function ShrinkWhiteSpace(AString: string): string;
function RemoveAvgAbs(AString: string): string;
function FindRanges(AString: string): TArray<string>;
function ConcatStr(sArray: TArray<string>): string;

// function ___(aString: string): string;

implementation

function ConcatStr(sArray: TArray<string>): string;
var
  s, rString: String;
begin
  rString := '';
  for s in sArray do
    rString := rString + s + ', ';
  ConcatStr := rString;
end;

function FindRanges(AString: string): TArray<string>;
var
  Matches: TMatchCollection;
  I, MatchCount: Integer;
  sItem: string;
  sArray: TArray<string>;
  rangeArray: TArray<string>;
const
  pattern = '(\d{3,4}\.?\d?-\d{3,4}\.?\d?)';
begin
  sItem := '';
  Matches := TRegEx.Matches(AString, pattern);
  MatchCount := Matches.Count;
  SetLength(rangeArray, MatchCount);
  for I := 0 to MatchCount - 1 do
    rangeArray[I] := Matches.Item[I].Groups.Item[0].Value;
  FindRanges := rangeArray;
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
  s: String;
  output: String;
  line: String;
  lines: TArray<String>;
  Range: String;
  Ranges: TArray<String>;

begin
  lines := TRegEx.Split(AString, '\R');
  for line in lines do
  begin
    Ranges := FindRanges(line);
    for Range in Ranges do
      output := output + line + ' ' + Range + sLineBreak;
  end;
  ExpandSpecs := output;
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

  // Split lines
  lines := TRegEx.Split(AString, '\R');
  for line in lines do
  begin
    if TAvgRegex.IsMatch(line) and TAbsRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'T-avg: ' + OutString + ' ' + Range + sLineBreak;
        OutString := 'T-abs: ' + OutString + ' ' + Range;
      end;
    end
    else if TAvgRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'T-avg: ' + OutString + ' ' + Range;
      end;
    end
    else if TAbsRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'T-abs: ' + OutString + ' ' + Range + sLineBreak;;
      end;
    end
    else if RAvgRegex.IsMatch(line) and RAbsRegex.IsMatch(line) then
    begin
      OutString := RemoveAvgAbs(line);
      OutString := 'R-avg: ' + OutString + sLineBreak + 'R-abs:' + OutString;
    end
    else if RAvgRegex.IsMatch(line) then
    begin
      OutString := RemoveAvgAbs(line);
      OutString := 'R-avg: ' + OutString;
    end
    else if RAbsRegex.IsMatch(line) then
    begin
      OutString := RemoveAvgAbs(line);
      OutString := 'R-abs: ' + OutString;
    end
    else if BAvgRegex.IsMatch(line) and BAbsRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'B-avg: ' + OutString + ' ' + Range + sLineBreak;
        OutString := 'B-abs: ' + OutString + ' ' + Range;
      end;
    end
    else if BAvgRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'B-avg: ' + OutString + ' ' + Range;
      end;
    end
    else if BAbsRegex.IsMatch(line) then
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
      begin
        OutString := RemoveAvgAbs(line);
        OutString := 'B-abs: ' + OutString + ' ' + Range;
      end;
    end
    else
      OutString := line;

    CompleteString := CompleteString + OutString + sLineBreak;
  end;
  TestsToFront := ShrinkWhiteSpace(CompleteString);
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
  pattern = '[^:]*';
var
  Matches: TMatchCollection;
begin
  Matches := TRegEx.Matches(AString, pattern);
  Result := Matches.Item[0].Groups.Item[0].Value;
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

function FindSpecVal(AString: string): string;
const
pattern = '(?:OD)?\d{1,2}(\.\d{1,2})?(?:%)?';
var
  Matches: TMatchCollection;
  OutString: String;
  I: Integer;
begin
  Matches := TRegEx.Matches(AString, pattern, [roExplicitCapture]);
  OutString := OutString + Matches.Item[I].Groups.Item[0].Value;
  Result := OutString;
end;

end.
