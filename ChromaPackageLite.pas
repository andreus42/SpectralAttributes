unit ChromaPackageLite;

interface

uses
  Windows,
  Graphics,
  StdCtrls,
  SysUtils,
  StrUtils;

function ValidateAsFloat(Edit: Tedit; ValidColor: TColor = clWindow;
  InvalidColor: TColor = clRed): Boolean;
function ValidateAsInt(Edit: Tedit; ValidColor: TColor = clWindow;
  InvalidColor: TColor = clRed): Boolean;
function ValidateFloatKeyPress(Edit: Tedit; var Key: char): Boolean;
function ValidateIntKeyPress(Edit: Tedit; var Key: char): Boolean;

implementation

function ValidateAsFloat(Edit: Tedit; ValidColor: TColor = clWindow;
  InvalidColor: TColor = clRed): Boolean;
var
  TempVal: extended;
begin
  Result := false;
  if not(TryStrToFloat(Edit.Text, TempVal)) then
  begin
    Edit.Color := InvalidColor
  end
  else
  begin
    Edit.Color := IfThen(Edit.Enabled, ValidColor, clMenuBar);
    Result := True;
  end;
end;

function ValidateAsInt(Edit: Tedit; ValidColor: TColor = clWindow;
  InvalidColor: TColor = clRed): Boolean;

var
  TempVal: integer;
begin
  Result := false;
  if not(TryStrToInt(Edit.Text, TempVal)) then
  begin
    Edit.Color := InvalidColor
  end
  else
  begin
    Edit.Color := IfThen(Edit.Enabled, ValidColor, clMenuBar);
    Result := True;
  end;
end;

function ValidateFloatKeyPress(Edit: Tedit; var Key: char): Boolean;
begin
  if not(Key in [#8, '0' .. '9', '-', '+', '.']) then
    Key := #0
  else if ((Key = '.') or (Key = '-')) and (Pos(Key, Edit.Text) > 0) then
    Key := #0
  else if (Key in ['-', '+']) and (Edit.SelStart <> 0) then
    Key := #0;
  Result := (Key <> #0);
end;

function ValidateIntKeyPress(Edit: Tedit; var Key: char): Boolean;
begin
  if not(Key in [#8, '0' .. '9', '-', '+', '.']) then
    Key := #0
  else if (Key in ['-', '+']) and (Edit.SelStart <> 0) then
    Key := #0;
  Result := (Key <> #0);
end;

end.
