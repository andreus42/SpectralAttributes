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
    PartRevLogEdit: TLabeledEdit;
    ReloadSet: TSpeedButton;
    Panel1: TPanel;
    DarkModeCheckBox: TCheckBox;
    DeleteTestGroupSpeedButton: TSpeedButton;
    AddTestGroupSpeedButton: TSpeedButton;
    ResetDataButton: TButton;
    procedure CreateGroupFrames(SetID: Integer);
    procedure DeleteTestGroupButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddTestGroupButtonClick(Sender: TObject);
    procedure ReloadSetClick(Sender: TObject);
    procedure ResetPageControl;
    procedure DarkModeCheckBoxClick(Sender: TObject);
    procedure AddTestGroupSpeedButtonClick(Sender: TObject);
    procedure DeleteTestGroupSpeedButtonClick(Sender: TObject);
    procedure ResetDataButtonClick(Sender: TObject);
    procedure AppException(Sender: TObject; E: Exception);

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      ActiveButton: TButton;
      SpecSheet: TEvalTestGroupFrame;
    end;
  private
    procedure AddTestGroupPage(EvalTestGroup: TEvalGroup);
  published
    EvalSet: TEvalSet;
  end;

var
  _SpectralAttributesForm: T_SpectralAttributesForm;
  SetID: Integer;
  DarkMode: Boolean;

implementation

{$R *.dfm}
{ Form 1 }

procedure T_SpectralAttributesForm.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;
  PartRevLogEdit.Text := SetID.ToString;
  CreateGroupFrames(SetID);
  if pagecontrol1.PageCount = 0 then DeleteTestGroupSpeedButton.Enabled := False;
end;

procedure T_SpectralAttributesForm.AppException(Sender: TObject; E: Exception);
begin
//  ShowMessage('Appolgoies for the inconvience, but your last action caused ' +
//              'the application to become unstable. The resulting error has been ' +
//              'logged.');
  Application.ShowException(E);
end;


procedure T_SpectralAttributesForm.CreateGroupFrames(SetID: Integer);
var
  EvalGroup: TEvalGroup;
begin
  EvalSet := TEvalSet.Create(SetID);
  for EvalGroup in EvalSet.EvalGroupList do
  begin
    AddTestGroupPage(EvalGroup);
  end;
end;

procedure T_SpectralAttributesForm.ResetDataButtonClick(Sender: TObject);
var
  Query: TADOQuery;
begin
  begin
  if Dialogs.MessageDlg('This will clear all data from the database ' +
                        '(a.k.a. "The Nuclear Option") ' +
                        'if it becomes corrupted during testing. ' +
                        'Proceed only if you want to reset all existing ' +
                        'data. This will remove work done by other testers.',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Dialogs.MessageDlg('Database reset.', mtInformation,
        [mbOk], 0, mbOk);
      Query := TADOQuery.Create(Nil);
      with Query do
      begin
        Connection := _ChromaDataModule.ChromaData;
        SQL.Add('Delete from EvalTests');
        ExecSQL;
        SQL.Add('Delete from EvalGroups');
        ExecSQL;
        Free;
      end;
      ResetPageControl;
    end;
  end;
end;

procedure T_SpectralAttributesForm.ResetPageControl;
var
  EvalTestGroup: TEvalGroup;
  I: Integer;
begin
  EvalSet.Destroy;
  SetID := StrToInt(PartRevLogEdit.Text);
  for I := 0  to  pagecontrol1.PageCount-1 do
    pagecontrol1.Pages[0].Free;
  CreateGroupFrames(SetID);
  DeleteTestGroupSpeedButton.Enabled := False;
end;

procedure T_SpectralAttributesForm.AddTestGroupPage(EvalTestGroup
  : TEvalGroup);
var
  ATabSheet: TMyTabSheet;
begin
  ATabSheet := TMyTabSheet.Create(PageControl1);
  with ATabSheet do
  begin
    Caption := 'In-Process #' + EvalTestGroup.GroupNum.ToString;
//    Caption := 'In-Process #' + EvalTestGroup.GroupID.ToString;
    Name := 'TabSheet' + EvalTestGroup.GroupID.ToString;
    Tag := EvalTestGroup.GroupID;
    PageControl := PageControl1;
    SpecSheet := TEvalTestGroupFrame.Create(ATabSheet, EvalTestGroup);
    with SpecSheet do
    begin
      Parent := ATabSheet;
      Align := alClient;
    end;
  end;
  if pagecontrol1.PageCount = 0 then DeleteTestGroupSpeedButton.Enabled := False;

end;

procedure T_SpectralAttributesForm.AddTestGroupSpeedButtonClick(
  Sender: TObject);
var
  NewEvalTestGroup: TEvalGroup;
begin
  NewEvalTestGroup := TEvalGroup.Create(SetID);
  AddTestGroupPage(NewEvalTestGroup);
  DeleteTestGroupSpeedButton.Enabled := True;
end;


procedure T_SpectralAttributesForm.AddTestGroupButtonClick(Sender: TObject);
var
  NewEvalTestGroup: TEvalGroup;
begin
  NewEvalTestGroup := TEvalGroup.Create(SetID);
  AddTestGroupPage(NewEvalTestGroup);
end;

procedure T_SpectralAttributesForm.DarkModeCheckBoxClick(Sender: TObject);
begin
  DarkMode := True;
  Refresh;
end;

procedure T_SpectralAttributesForm.DeleteTestGroupButtonClick(Sender: TObject);
begin
  EvalTestGroup.DeleteGroup(PageControl1.ActivePage.Tag);
  PageControl1.ActivePage.Destroy;
end;

procedure T_SpectralAttributesForm.DeleteTestGroupSpeedButtonClick(
  Sender: TObject);
begin
  EvalTestGroup.DeleteGroup(PageControl1.ActivePage.Tag);
  PageControl1.ActivePage.Destroy;
  if pagecontrol1.PageCount = 0 then DeleteTestGroupSpeedButton.Enabled := False;
end;

procedure T_SpectralAttributesForm.ReloadSetClick(Sender: TObject);
begin
  ResetPageControl;
end;

Initialization
  SetID :=  1;

end.
