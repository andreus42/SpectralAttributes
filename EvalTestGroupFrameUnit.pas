unit EvalTestGroupFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  System.Generics.Collections, Vcl.Buttons,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  ActiveX,

  // Mine
  ChromaDataModule,
  Logic,
  EvalFrameUnit,
  TEvalTestUnit,
  TEvalTestSetUnit,
  TEvalTestGroupUnit,
  LabeledMemo,

  //Temp
  System.RegularExpressions,
  System.RegularExpressionsCore;

type
  TEvalTestGroupFrame = class(TFrame)
    Panel1: TPanel;
    IDBox: TEdit;
    ParseTextButton: TButton;
    ParseButton: TButton;
    IDLabel: TLabel;
    AddEvalTestButton: TButton;
    EvalScrollBox: TScrollBox;
    SetUpPanel: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    GroupDescEdit: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Button1: TButton;
    SpecTextMemo: TLabledMemo;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    TextToParseMemo: TLabledMemo;
    TransformButton: TButton;
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure ParseButtonClick(Sender: TObject);
    procedure ParseTextButtonClick(Sender: TObject);
    procedure TransformButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
  public
    EvalTestGroup: TEvalTestGroup;
    IntList: TList<Integer>;
    GroupID: Integer;
    SetID: Integer;
    constructor CreateByInt(AOwner: TComponent; GroupID: Integer); overload;
    constructor Create(AOwner: TComponent;
      EvalTestGroup: TEvalTestGroup); overload;
  end;

const
  FrameHeight = 26;

implementation

uses
  SpectalAttributesForm;

{$R *.dfm}

constructor TEvalTestGroupFrame.Create(AOwner: TComponent;
  EvalTestGroup: TEvalTestGroup);
var
  EvalTest: TEvalTest;
begin
  inherited Create(AOwner);
  IntList := TList<Integer>.Create;
  Self.EvalTestGroup := EvalTestGroup;
  SpecTextMemo.AMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalTestGroup.GroupID.ToString;
  IDBox.Text := EvalTestGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalTestGroup.GroupID.ToString;
  for EvalTest in EvalTestGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
    AddEvalTestFrame(EvalTest);
    Self.SetID := EvalTestGroup.SetID;
  end;
  Self.GroupID := EvalTestGroup.GroupID;

end;

//// new constructor
constructor TEvalTestGroupFrame.CreateByInt(AOwner: TComponent; GroupID: Integer);
var
  EvalTest: TEvalTest;
begin
  inherited Create(AOwner);
  EvalTestGroup.Create(GroupID);
  SpecTextMemo.AMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalTestGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalTestGroup.GroupID.ToString;
  for EvalTest in EvalTestGroup.TestList do
    begin
       SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
       AddEvalTestFrame(EvalTest);
    end;
  Self.GroupID := EvalTestGroup.GroupID;
  Self.SetID := EvalTestGroup.SetID;
end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  NewEvalTEest: TEvalTest;
  temp: integer;
begin
  temp := 0;
  NewEvalTEest := TEvalTest.CreateNew(EvalTestGroup.GroupID, EvalTestGroup.SetID);
  AddEvalTestFrame(NewEvalTEest);
end;

procedure TEvalTestGroupFrame.AddEvalTestFrame(EvalTest: TEvalTest);
var
  TestFrame: TEvalFrame;
begin
  TestFrame := TEvalFrame.Create(EvalScrollBox, EvalTest.TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + EvalTest.TestID.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
    Height := FrameHeight;
  end;
end;


procedure TEvalTestGroupFrame.ParseButtonClick(Sender: TObject);
var
  TempEvalTest: TEvalTest;
  TempGroupID: Integer;
begin
  TempGroupID := EvalTestGroup.GroupID;
  SpecTextMemo.AMemo.Clear;
  Self.EvalTestGroup.Free;
  Self.EvalTestGroup := TEvalTestGroup.Create(TempGroupID);
  for TempEvalTest in Self.EvalTestGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(TempEvalTest.Stringify);
  end;
end;

procedure TEvalTestGroupFrame.ParseTextButtonClick(Sender: TObject);
var
  TempString: String;
begin
  TempString := TextToParseMemo.AMemo.Text;
  TempString := InitialRegex(TempString);
  TempString := CommentNonSpecs(TempString);
  TempString := FloatCommentsDown(TempString);
  TempString := TestsToFront(TempString);
  TempString := ShrinkWhiteSpace(TempString);

//  TempString := ExpandSpecs(TempString);
//  TempString := SplitPat(TempString);
//  TempString := RemoveAvgAbs(TempString);
  TextToParseMemo.AMemo.Text := TempString;
end;

procedure TEvalTestGroupFrame.TransformButtonClick(Sender: TObject);
var
  Temp: TStringList;
  OutLine: String;
  SpecToken: String;
  SpecParamID: Integer;
  SpecVal: String;
  SymbolParam: Integer;
  I: Integer;
  RangeArray: TArray <string>;
begin
  Temp := TStringList.Create;
  try
    Temp.Assign(SpecTextMemo.AMemo.Lines);
    for I := 0 to Temp.Count - 1 do
    begin
      RangeArray := FindRanges(Temp[I]);
      SpecToken := FindSpecToken(Temp[I]);
      SpecParamID := FindSpecParamID(SpecToken);
      SymbolParam := FindSymbolParamID(Temp[I]);
      SpecVal := FindSpecVal(Temp[I]);
      Temp[I] := SpecToken + '; ' + SymbolParam.ToString + ' <- ' + SpecParamID.ToString;



    end;
    TextToParseMemo.AMemo.Lines.Assign(Temp);
  finally
    Temp.Free;
  end;


end;


end.
