unit SpectralAttributes.EvalGroupFrame;

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

  // Regex
  System.RegularExpressions,
  System.RegularExpressionsCore,

  // Mine
  ChromaDataModule,
  SpectralAttributes.EvalGroup,
  SpectralAttributes.EvalTestFrame,
  SpectralAttributes.EvalTest,
  SpectralAttributes.EvalSet,
  SpectralAttributes.ParsingLogic,
  LabeledMemo;


type
  TEvalTestGroupFrame = class(TFrame)
    GroupPanel: TPanel;
    IDBox: TEdit;
    ParseTextButton: TButton;
    IDLabel: TLabel;
    GroupDescEdit: TEdit;
    GroupLabel: TLabel;
    Label6: TLabel;
    SpecTextMemo: TLabledMemo;
    TextToParseMemo: TLabledMemo;
    TransformButton: TButton;
    EvalScrollBox: TScrollBox;
    AddEvalTestButton: TButton;
    Button1: TButton;
    ParseButton: TButton;
    GroupBox2: TGroupBox;
    CommentsMemo: TLabledMemo;
    TestCommentsMemo: TLabledMemo;
    Panel1: TPanel;
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
  SpectalAttributes.MainForm;

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
  EvalTest: TEvalTest;
begin
  EvalTest := TEvalTest.Create(EvalTestGroup.GroupID, EvalTestGroup.SetID);
  EvalTest.Write; // Need to get an updated TestID to add new group frame
  AddEvalTestFrame(EvalTest);
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
  EvalTestGroup := TEvalTestGroup.Create(TempGroupID);
  for TempEvalTest in Self.EvalTestGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(TempEvalTest.Stringify);
  end;
end;

procedure TEvalTestGroupFrame.ParseTextButtonClick(Sender: TObject);
var
  TempString: String;
begin
  // Clean text
  TempString := TextToParseMemo.AMemo.Text;
  TextToParseMemo.AMemo.Text := TempString;
end;

procedure TEvalTestGroupFrame.TransformButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
  StringList: TStringList;
  AString: String;
  SpecParams: TSpecParams;
  LambdaRangeList: TList<TLambdaRange>;
  LambdaRange: TLambdaRange;
  SpecValueList: TList<Real>;
  Value: Real;
  SymbolParam: Integer;
  Tolerance: TTolerance;
begin
  EvalTestGroup.DeleteTestGroupTests;
  StringList := TStringList.Create;
  StringList.Assign(SpecTextMemo.AMemo.Lines);
  for AString in StringList do
  begin
    SpecParams := GetSpecParams(AString);
    LambdaRangeList := GetRangeList(AString);
    SymbolParam := GetSymbolParamID(AString);
    Tolerance := GetTolerance(AString);
    SpecValueList := GetSpecValuesList(AString);

    //With EvalTest
    EvalTest := TEvalTest.Create(GroupID, SetID);
    EvalTest.FrameType := SpecParams.FrameTypeID;
    EvalTest.Name := SpecParams.ParamName;
    EvalTest.Rank := '0';
    EvalTest.TestType := SpecParams.TypeID.ToString;
    EvalTest.LambdaFrom := FloatToStr(LambdaRangeList[0].FromLambda);
    EvalTest.LambdaTo := FloatToStr(LambdaRangeList[0].ToLambda);
    EvalTest.LambdaAt :=  '';
    EvalTest.Value :=  FloatToStr(SpecValueList[0]); //temp until looping for vals/ranges
    EvalTest.Symbol := SymbolParam;
    EvalTest.FilePath := '';
    EvalTest.TolPlus := FloatToStr(Tolerance.PlusTol);
    EvalTest.TolMinus := FloatToStr(Tolerance.MinusTol);
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
    EvalTest.Write;
    EvalTest.Free;
  end;
  _SpectralAttributesForm.ResetSet;
end;


end.
