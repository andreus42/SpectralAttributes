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
    DeleteTestButton: TButton;
    AddTestGroupButton: TButton;
    PartRevLogEdit: TLabeledEdit;
    ReloadSet: TSpeedButton;
    Panel1: TPanel;
    procedure DeleteTestButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddTestGroupButtonClick(Sender: TObject);
    procedure ReloadSetClick(Sender: TObject);
    procedure ResetSet;

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      ActiveButton: TButton;
      MySpecSheet: TEvalTestGroupFrame;
    end;
  private
    procedure AddTestGroupPage(EvalTestGroup: TEvalTestGroup);
  published
    EvalTestSet: TEvalTestSet;
  end;

var
  _SpectralAttributesForm: T_SpectralAttributesForm;
  SetID: Integer;

implementation

{$R *.dfm}
{ Form 1 }

procedure T_SpectralAttributesForm.FormCreate(Sender: TObject);
var
  EvalTestGroup: TEvalTestGroup;
begin
  PartRevLogEdit.Text := SetID.ToString;
  EvalTestSet := TEvalTestSet.Create(SetID);
  for EvalTestGroup in EvalTestSet.EvalTestGroupList do
  begin
    AddTestGroupPage(EvalTestGroup);
  end;
end;

procedure T_SpectralAttributesForm.ResetSet;
var
  EvalTestGroup: TEvalTestGroup;
  I: Integer;
begin
  EvalTestSet.Destroy;
  SetID := StrToInt(PartRevLogEdit.Text);

  // delete all from PageControl1
  for I := 0  to  pagecontrol1.PageCount-1 do
    pagecontrol1.Pages[0].Free;

  EvalTestSet := TEvalTestSet.Create(SetID);
  for EvalTestGroup in EvalTestSet.EvalTestGroupList do
  begin
    AddTestGroupPage(EvalTestGroup);
  end;
end;

procedure T_SpectralAttributesForm.ReloadSetClick(Sender: TObject);
begin
  ResetSet;
end;

procedure T_SpectralAttributesForm.AddTestGroupPage(EvalTestGroup
  : TEvalTestGroup);
var
  ATabSheet: TMyTabSheet;
  TempGroupID: Integer;
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
  NewEvalTestGroup: TEvalTestGroup;
begin
  NewEvalTestGroup := TEvalTestGroup.CreateNew(SetID);
  AddTestGroupPage(NewEvalTestGroup);
end;

procedure T_SpectralAttributesForm.DeleteTestButtonClick(Sender: TObject);
var
  ActivePageName: String;
  Query: TADOQuery;
begin
  ActivePageName := PageControl1.ActivePage.Name;
//  If (PageControl1.ActivePage <> SummaryTab) then
  begin
    Query := TADOQuery.Create(Nil);
    with Query do
    begin
      Connection := _ChromaDataModule.ChromaData;
      SQL.Add('delete from EvalTestGroups where GroupID = ' +
        PageControl1.ActivePage.Tag.ToString);
      ExecSQL;
      SQL.Add('delete from EvalTests where GroupID = ' +
        PageControl1.ActivePage.Tag.ToString);
      ExecSQL;
      Free;
    end;
    PageControl1.ActivePage.Destroy;
  end;
end;

Initialization
  SetID :=  2;


end.
