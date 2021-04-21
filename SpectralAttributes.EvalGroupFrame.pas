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
    S3ParseButton: TButton;
    GroupBox2: TGroupBox;
    CommentsMemo: TLabledMemo;
    TestCommentsMemo: TLabledMemo;
    Panel1: TPanel;
    GroupFrameSetIDEDit: TEdit;
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure S3ParseButtonClick(Sender: TObject);
    procedure ParseTextButtonClick(Sender: TObject);
    procedure TransformButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
  public
    EvalGroup: TEvalGroup;
    IntList: TList<Integer>;
    constructor Create(AOwner: TComponent; TempEvalGroup: TEvalGroup);
  end;

const
  FrameHeight = 26;

implementation

uses
  SpectalAttributes.MainForm;

{$R *.dfm}

constructor TEvalTestGroupFrame.Create(AOwner: TComponent;
  TempEvalGroup: TEvalGroup);
var
  EvalTest: TEvalTest;
begin
  inherited Create(AOwner);
  IntList := TList<Integer>.Create;

  //Create EvalGroup Obj with Frame
  EvalGroup := TempEvalGroup; // Currently just a copy of the object passed to it


  GroupFrameSetIDEDit.Text := EvalGroup.SetID.ToString;

  SpecTextMemo.AMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalGroup.GroupID.ToString; // use group num in future
  IDBox.Text := EvalGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalGroup.GroupID.ToString;
  for EvalTest in EvalGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
    AddEvalTestFrame(EvalTest);
  end;

end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
  I: Integer;
begin
  EvalTest := TEvalTest.Create(EvalGroup.GroupID, EvalGroup.SetID);
  EvalGroup.TestList.Add(EvalTest);
  EvalTest.WriteToDB;
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

procedure TEvalTestGroupFrame.S3ParseButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
  GroupID, SetID: Integer;
begin
  SpecTextMemo.AMemo.Clear;
  //consider a better update to EvalGroup by Updating EvalTest in Group
  GroupID := EvalGroup.GroupID;
  SetID := EvalGroup.SetID;
  EvalGroup.Free;
  EvalGroup := TEvalGroup.Create(GroupID, SetID);
  for EvalTest in Self.EvalGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
  end;
end;

procedure TEvalTestGroupFrame.ParseTextButtonClick(Sender: TObject);
var
  TempString: String;
begin
  // Clean text functions needed
  TempString := TextToParseMemo.AMemo.Text;
  TextToParseMemo.AMemo.Text := TempString;
end;

procedure TEvalTestGroupFrame.TransformButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
  StringList: TStringList;
  AString: String;
  //testing
  TestFrame: TEvalFrame;
begin
  EvalGroup.DeleteTestGroupTests;
  StringList := TStringList.Create;
  StringList.Assign(SpecTextMemo.AMemo.Lines);
  for AString in StringList do
  begin
    if AString <> '' then
    begin
      EvalTest := TEvalTest.Create(EvalGroup.GroupID, EvalGroup.SetID, AString);
      EvalTest.WriteToDB;
      EvalTest.Free;
    end;
  end;
  //_SpectralAttributesForm.ResetPageControl;

  // TESTING
  // Try recreating scroll box
  EvalScrollBox.Destroy;
  EvalScrollBox := TScrollBox.Create(Self);
  EvalScrollBox.Parent := Panel1;
  EvalScrollBox.Align := alClient;
  for EvalTest in EvalGroup.TestList do
  begin
    TestFrame := TEvalFrame.Create(EvalScrollBox, EvalTest);     /// needs to pass groupID, setID
    with TestFrame do
    begin
      Name := 'EvalFrame_' + EvalTest.TestID.ToString;
      Parent := EvalScrollBox;
      Align := alTop;
      Height := FrameHeight;
    end;
  end;

end;

end.
