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
    IDLabel: TLabel;
    GroupDescEdit: TEdit;
    GroupLabel: TLabel;
    Label6: TLabel;
    GroupFrameSetIDEDit: TEdit;
    GroupSetLabel: TLabel;
    EvalScrollBox: TScrollBox;
    SpecTextMemo: TLabeledMemo;
    CommentsMemo2: TLabeledMemo;
    TransformTextButton: TSpeedButton;
    AddSpecSpeedButton: TSpeedButton;
    CleanTextSpeedButton: TSpeedButton;

    //testing scrollbox
//    EvalScrollBox: TScrollBox;

    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure S3ParseButtonClick(Sender: TObject);
    procedure CleanTextButtonClick(Sender: TObject);
    procedure TransformTextButtonClick(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure AddSpecSpeedButtonClick(Sender: TObject);
    procedure CleanTextSpeedButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
    procedure GroupStringify;
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
  Name := 'EvalFrame' + EvalTest.TestID.ToString;
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

procedure TEvalTestGroupFrame.FrameEnter(Sender: TObject);
begin
  GroupStringify;
end;

procedure TEvalTestGroupFrame.FrameExit(Sender: TObject);
begin
  GroupStringify;
end;

procedure TEvalTestGroupFrame.GroupStringify;
var
  EvalTest: TEvalTest;
  GroupID, SetID: Integer;
begin
  GroupID := EvalGroup.GroupID;
  SetID := EvalGroup.SetID;
  SpecTextMemo.AMemo.Clear;
  EvalGroup := TEvalGroup.Create(EvalGroup.GroupID, EvalGroup.SetID);
  for EvalTest in Self.EvalGroup.TestList do
  begin
    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
  end;
  //EvalGroup.Free;
  //EvalTest.Free;
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

procedure TEvalTestGroupFrame.AddSpecSpeedButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
begin
  EvalTest := TEvalTest.Create(EvalGroup.GroupID, EvalGroup.SetID);
  EvalGroup.TestList.Add(EvalTest);
  EvalTest.WriteToDB;
  AddEvalTestFrame(EvalTest);
end;

procedure TEvalTestGroupFrame.S3ParseButtonClick(Sender: TObject);
begin
  GroupStringify;
end;

procedure TEvalTestGroupFrame.CleanTextButtonClick(Sender: TObject);
var
  TempString: String;
begin
  // Clean text functions needed
end;

procedure TEvalTestGroupFrame.CleanTextSpeedButtonClick(Sender: TObject);
var
  TempString: String;
begin
  // Clean text functions needed

end;

procedure TEvalTestGroupFrame.TransformTextButtonClick(Sender: TObject);
var
  EvalTest: TEvalTest;
  StringList: TStringList;
  AString: String;
//  GroupID, SetID: Integer;
begin
  EvalGroup.DeleteGroupTests;
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
  EvalScrollBox := TScrollBox.Create(Self);
  EvalScrollBox.Parent := Self;
  EvalScrollBox.Align := alClient;
  for EvalTest in EvalGroup.TestList do
  begin
    AddEvalTestFrame(EvalTest);
  end;
  EvalScrollBox.Update;
  StringList.Free;
  GroupStringify;
end;

end.
