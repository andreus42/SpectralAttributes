unit SpectalAttributes.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, // WinAPI
  System.SysUtils, System.Variants, System.Classes, // System
  System.Generics.Collections,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, // VCL
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.ExtCtrls, Dialogs, Vcl.DBCtrls, Vcl.Buttons,

  // DB
  Data.DB, Data.Win.ADODB,
  ChromaDataModule,

  // Project
  SpectralAttributes.EvalGroupFrame,
  SpectralAttributes.EvalTest,
  SpectralAttributes.EvalGroup,
  SpectralAttributes.EvalSet,
  LabeledMemo;

type
  T_SpectralAttributesForm = class(TForm)
    PageControl1: TPageControl;
    DeleteTestGroupButton: TButton;
    AddTestGroupButton: TButton;
    PartRevLogEdit: TLabeledEdit;
    ReloadSet: TSpeedButton;
    Panel1: TPanel;
    procedure CreateGroupFrames(SetID: Integer);
    procedure DeleteTestGroupButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddTestGroupButtonClick(Sender: TObject);
    procedure ReloadSetClick(Sender: TObject);
    procedure ResetPageControl;

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      ActiveButton: TButton;
      MySpecSheet: TEvalTestGroupFrame;
    end;
  private
    procedure AddTestGroupPage(EvalTestGroup: TEvalGroup);
  published
    EvalTestSet: TEvalSet;
  end;

var
  _SpectralAttributesForm: T_SpectralAttributesForm;
  SetID: Integer;

implementation

{$R *.dfm}
{ Form 1 }

procedure T_SpectralAttributesForm.FormCreate(Sender: TObject);
begin
  PartRevLogEdit.Text := SetID.ToString;
  CreateGroupFrames(SetID);
end;

procedure T_SpectralAttributesForm.CreateGroupFrames(SetID: Integer);
var
  EvalTestGroup: TEvalGroup;
begin
  EvalTestSet := TEvalSet.Create(SetID);
  for EvalTestGroup in EvalTestSet.EvalTestGroupList do
  begin
    AddTestGroupPage(EvalTestGroup);
  end;
end;

procedure T_SpectralAttributesForm.ReloadSetClick(Sender: TObject);
begin
  ResetPageControl;
end;

procedure T_SpectralAttributesForm.ResetPageControl;
var
  EvalTestGroup: TEvalGroup;
  I: Integer;
begin
  EvalTestSet.Destroy;
  SetID := StrToInt(PartRevLogEdit.Text);
  // Remove pages from page control
  for I := 0  to  pagecontrol1.PageCount-1 do
    pagecontrol1.Pages[0].Free;
  CreateGroupFrames(SetID);
end;

procedure T_SpectralAttributesForm.AddTestGroupPage(EvalTestGroup
  : TEvalGroup);
var
  ATabSheet: TMyTabSheet;
begin
  ATabSheet := TMyTabSheet.Create(PageControl1);
  with ATabSheet do
  begin
    Caption := 'In-Process #' + EvalTestGroup.GroupID.ToString;
    Name := 'TabSheet' + EvalTestGroup.GroupID.ToString;
    Tag := EvalTestGroup.GroupID;
    PageControl := PageControl1;
    MySpecSheet := TEvalTestGroupFrame.Create(ATabSheet, EvalTestGroup);
    with MySpecSheet do
    begin
      Parent := ATabSheet;
      Align := alClient;
    end;
  end;
end;


procedure T_SpectralAttributesForm.AddTestGroupButtonClick(Sender: TObject);
var
  NewEvalTestGroup: TEvalGroup;
begin
  NewEvalTestGroup := TEvalGroup.Create(SetID);
  AddTestGroupPage(NewEvalTestGroup);
end;

procedure T_SpectralAttributesForm.DeleteTestGroupButtonClick(Sender: TObject);
begin
  EvalTestGroup.DeleteGroup(PageControl1.ActivePage.Tag);
  PageControl1.ActivePage.Destroy;
end;

Initialization
  SetID :=  2;

end.
