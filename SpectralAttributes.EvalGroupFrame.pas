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
    CleanTextButton: TButton;
    IDLabel: TLabel;
    GroupDescEdit: TEdit;
    GroupLabel: TLabel;
    Label6: TLabel;
    SpecTextMemo: TLabledMemo;
    TextToParseMemo: TLabledMemo;
    TransformButton: TButton;
    AddEvalTestButton: TButton;
    AddSetupParamButton: TButton;
    S3ParseButton: TButton;
    CommentsMemo: TLabledMemo;
    TestCommentsMemo: TLabledMemo;
    ScrollBoxPanel: TPanel;
    ControlsPanel: TPanel;
    GroupFrameSetIDEDit: TEdit;
    GroupSetLabel: TLabel;
    EvalScrollBox: TScrollBox;

    //testing scrollbox
//    EvalScrollBox: TScrollBox;

    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure S3ParseButtonClick(Sender: TObject);
    procedure CleanTextButtonClick(Sender: TObject);
    procedure TransformButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
  public
    EvalGroup: TEvalGroup;
    constructor Create(AOwner: TComponent; TempEvalGroup: TEvalGroup);
    destructor destroy;
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
  //Create EvalGroup Obj with Frame
  EvalGroup := TempEvalGroup; // Currently just a copy of the object passed to it
  GroupFrameSetIDEDit.Text := EvalGroup.SetID.ToString;  // Should display Group Num (i.e. Inprocess-#1)
  SpecTextMemo.AMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalGroup.GroupID.ToString;
  IDBox.Text := EvalGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalGroup.GroupID.ToString;
  for EvalTest in EvalGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
    AddEvalTestFrame(EvalTest);
  end;
  //  EvalTest.Free;  // need to figure out how to remove if it doesn't exist
end;

destructor TEvalTestGroupFrame.destroy;
var
  I: Integer;
begin
  for I := 0 to Self.ControlCount do
    Self.Controls[I].Free;
  EvalGroup.Free;
  Self.Free;
end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
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
  TestFrame := TEvalFrame.Create(EvalScrollBox, EvalTest);
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

procedure TEvalTestGroupFrame.CleanTextButtonClick(Sender: TObject);
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
//  GroupID, SetID: Integer;
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
  // TESTING: ScrollBox is not redrawing
  EvalScrollBox.Destroy;
  EvalScrollBox := TScrollBox.Create(ScrollBoxPanel);
  EvalScrollBox.Parent := ScrollBoxPanel;
  EvalScrollBox.Align := alClient;
  for EvalTest in EvalGroup.TestList do
  begin
    AddEvalTestFrame(EvalTest);
  end;
  EvalScrollBox.Update;
  StringList.Free;
end;

end.
