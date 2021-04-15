unit Logic;

interface

uses
  System.SysUtils,
  System.RegularExpressions,
  System.RegularExpressionsCore;


function CommentNonSpecs(aString: string): string;
function ExpandSpecs(aString: string): string;
function FloatCommentsDown(aString: string): string;
function InitialRegex(aString: string): string;
function TestsToFront(aString: string): string;
function SplitPat(aString: string): string;
function ShrinkWhiteSpace(aString: string): string;
function RemoveAvgAbs(aString: string): string;
function FindRanges(aString: string): TArray<string>;
function ConcatStr(sArray: TArray<string>): string;
//function ___(aString: string): string;



implementation

function ConcatStr(sArray: TArray<string>): string;
var
  s, rString: String;
begin
  rString := '';
  for s in sArray do
    rString := rString + s +', ';
  ConcatStr := rString;
end;


function FindRanges(aString: string): TArray <string>;

var
  Matches: TMatchCollection;
  I, MatchCount: Integer;
  sItem: string;
  sArray: TArray <string>;
  rangeArray: TArray <string>;

const
  pattern = '(\d{3,4}\.?\d?-\d{3,4}\.?\d?)';

begin
  sItem := '';
  Matches := TRegEx.Matches(aString, pattern, [roExplicitCapture]);
  MatchCount := Matches.Count;
  SetLength(RangeArray, MatchCount);
  for I := 0 to MatchCount-1 do
    rangeArray[I] := Matches.Item[I].Groups.Item[0].Value;
  FindRanges := rangeArray;

end;

function RemoveAvgAbs(aString: string): string;
var
  OutString: string;
begin
  OutString := TRegex.Replace(aString, '([Aa]vg[:]?)|([Aa]bs[:]?)', '');
  OutString := TRegex.Replace(OutString, '[TRB]:', '');
  RemoveAvgAbs := OutString;
end;

function ShrinkWhiteSpace(aString: string): string;
begin
  // Replace multiple newlines and spaces with single
  aString := TRegex.Replace(aString, '\R*', sLineBreak);
  aString := TRegex.Replace(aString, ' *', ' ');
  ShrinkWhiteSpace := trim(aString);
end;

function CommentNonSpecs(aString: string): string;

var
  line: string;
  output: string;
  lines: TArray<string>;
  pattern: string;

begin
  lines := TRegex.Split(aString, '\R');
  pattern := '(^AOI:)|(^Avg-pol:)|(B:)|(T:)|(R:)|(^U-pol:)|(^S-pol:)|' +
    '(^P-pol:)|(^CWL:)|(^FWHM:)|(^FW: @ 10% T-max)|(^T-avg:)|' +
    '(^T-abs:)|(^T-max:)|(^T-peak:)|(^B-avg:)|(^B-abs:)|(^R-avg:)|' +
    '(^R-abs:)|(^R-avg \(r-scan\):)|(^R-abs \(r-scan\):)|(^R-max:)|' +
    '(^R-target:)|(^Cuton:)|(^Cutoff:)|(^Cuton \(20-80\):)|' +
    '(^Cutoff \(80-20\):)';

  for line in lines do
    // Line is test
    if TRegex.IsMatch(line, pattern) then
      output := output + line + sLineBreak
    else
    // Line is comment
      output := output + '# ' + line + sLineBreak;
  CommentNonSpecs := output;
end;


function ExpandSpecs(aString: string): string;

var
  s: String;
  output: String;
  line: String;
  lines: TArray<String>;
  Range: String;
  Ranges: TArray<String>;

begin
  lines := TRegex.Split(aString, '\R');
  for line in lines do
    begin
      Ranges := FindRanges(line);
      for Range in Ranges do
        output := output + line + ' ' + Range + sLineBreak;
    end;
  ExpandSpecs := output;
end;

function FloatCommentsDown(aString: string): string;
var
  s: string;
  lines: TArray<string>;
  SpecString: string;
  CommentString: string;

begin
  aString := CommentNonSpecs(aString);
  lines := TRegex.Split(aString, '\R');
  for s in lines do
    if TRegex.IsMatch(s, '^#') then
      CommentString := CommentString + s + sLineBreak
    else
      SpecString := SpecString + s + sLineBreak;
  FloatCommentsDown := trim(SpecString) + sLineBreak + trim(CommentString);
end;

function InitialRegex(aString: string): string;
// Make initial text substitutions
var
  s: string;
  line: string;
  output: string;
  lines: TArray<string>;

begin
  lines := TRegex.Split(aString, '\R');
  for line in lines do
  begin
      // strip extra whitespace
      s := ShrinkWhiteSpace(line);

      // Replace common terms
      s := TRegex.Replace(s, 'Final Spectral Analysis:?\.?\n?', '');
      s := TRegex.Replace(s, '\. Save spectra:', '');
      s := TRegex.Replace(s,
        'Measure spectra:?|Save Spectra:?\.?|Measure/Save Spectra:?',
        'Save spectra:');
      s := TRegex.Replace(s, 'assign lot.?#?,?\n?', 'Assign lot');
      s := TRegex.Replace(s, 'Save Curve\.?', 'Assign lot');
      s := TRegex.Replace(s, 'Nominal/Target', 'Nominal');
      s := TRegex.Replace(s, 'Target', 'Nominal');
      s := TRegex.Replace(s, 'In-?process.*', 'In-process');
      s := TRegex.Replace(s, '\s+(after ar).?', 'After AR');
      s := TRegex.Replace(s, 'degrees,?:?', 'deg');
      s := TRegex.Replace(s, '(?<=\d) deg', 'deg');
      s := TRegex.Replace(s, 'cut[-? ?-?]on:?', 'Cuton:');
      s := TRegex.Replace(s, 'cut[-? ?-?]off:?', 'Cutoff:');
      s := TRegex.Replace(s, 'Cuton @ 50%:', 'Cuton:');
      s := TRegex.Replace(s, 'Cutoff @ 50%:', 'Cutoff:');
      s := TRegex.Replace(s, '(Min\.)?\s?T?\s?Peak ?-?T:', 'T-Peak:');

      // Standardize test format
      s := TRegex.Replace(s, '(?<=CWL)(=? ? =? ?)', ': ');
      s := TRegex.Replace(s, '(?<=FWHM)(=? ? =? ?)', ': ');
      s := TRegex.Replace(s, 'aoi(?!:)', 'AOI: ');
      s := TRegex.Replace(s, 'cwl(?!:)', 'CWL: ');
      s := TRegex.Replace(s, 'fwhm(?!:)', 'FWHM: ');
      s := TRegex.Replace(s, 'Tabs', 'T-abs');
      s := TRegex.Replace(s, 'Tavg', 'T-avg');
      s := TRegex.Replace(s, 'Blocking:?', 'B:');

      // Standardize test type
      s := TRegex.Replace(s, '\s?avg\s?,?:?', 'avg ');
      s := TRegex.Replace(s, '\s?abs\s?,?:?', 'abs ');

      s := TRegex.Replace(s, '(?<=[TRB])\s(?=[<>=])', ':');
      // adds semicolon after [TRB] spec blank

      // Format operands (spacing, etc)
      s := TRegex.Replace(s, ' ?>\/= ?', ' >=');
      s := TRegex.Replace(s, ':(?!\s)', ': ');
      s := TRegex.Replace(s, '>\s', '>= ');
      s := TRegex.Replace(s, '>=(?=B)', '>= ');
      s := TRegex.Replace(s, '(?<=\d{3}) nm', 'nm');
      s := TRegex.Replace(s, '(?<=\d{3}) -', '-');
      s := TRegex.Replace(s, '- (?=\d{3})', '-');

      // Format Tolerances
      s := TRegex.Replace(s, '\+\/- ', '+/-');
      s := TRegex.Replace(s, '(\+\/-\s?)', '+/-');
      s := TRegex.Replace(s, '(\+\\-\s?)', '+/-');
      s := TRegex.Replace(s, '(\s+-)|(-\s+)', '-');

      output := output + s + sLineBreak;
    end;

  InitialRegex := ShrinkWhiteSpace(output);
end;

function TestsToFront(aString: string): string;
var
  line: string;
  lines: TArray<String>;
  Range: string;
  Ranges: TArray<String>;
  OutString: String;
  CompleteString: String;
  TAvgRegex: TRegex;
  TAbsRegex: TRegex;
  RAvgRegex: TRegex;
  RAbsRegex: TRegex;
  BAvgRegex: TRegex;
  BAbsRegex: TRegex;


begin
  TAvgRegex := TRegex.Create('T[-:>].*avg', [roIgnoreCase]);
  TAbsRegex := TRegex.Create('T[-:>].*abs', [roIgnoreCase]);
  RAvgRegex := TRegex.Create('R[-:>].*avg', [roIgnoreCase]);
  RAbsRegex := TRegex.Create('R[-:>].*abs', [roIgnoreCase]);
  BAvgRegex := TRegex.Create('B[-:>].*avg', [roIgnoreCase]);
  BAbsRegex := TRegex.Create('B[-:>].*abs', [roIgnoreCase]);

  // Split lines
  lines := TRegex.Split(aString, '\R');
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

function SplitPat(aString: string): string;

var
  s: string;
  output: string;
  splitOut: TArray<string>;

begin
  splitOut := TRegex.Split(aString, ':');
  for s in splitOut do
    output := output + s + sLineBreak;
  SplitPat := output;
end;

end.
