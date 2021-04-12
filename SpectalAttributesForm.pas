unit SpectalAttributesForm;

interface

uses
  Winapi.Windows, Winapi.Messages,                                    // WinAPI
  System.SysUtils, System.Variants, System.Classes,                   // System
  System.Generics.Collections,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms,  // VCL
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.ExtCtrls, Dialogs,

  // DB
  Data.DB, Data.Win.ADODB,

  // Proj
  EvalTestGroupFrameUnit,
  ChromaDataModule,
  TEvalTestUnit,
  TEvalTestGroupUnit,
  TEvalTestSetUnit, LabeledMemo;

  type
    T_SpectralAttributesForm = class(TForm)
      PageControl1: TPageControl;
      DeleteTestButton: TButton;
      AddTestGroupButton: TButton;
      SummaryTab: TTabSheet;
      SummaryPanel: TPanel;
    LabledMemo1: TLabledMemo;
    LabledMemo2: TLabledMemo;
      procedure DeleteTestButtonClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure AddTestGroupButtonClick(Sender: TObject);

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      ActiveButton: TButton;
      MySpecSheet: TEvalTestGroupFrame;
    end;
  private
    procedure AddTestGroupPage(EvalTestGroup: TEvalTestGroup);
  end;

const SetID = 1;

var
  _SpectralAttributesForm: T_SpectralAttributesForm;
  EvalTestSet: TEvalTestSet;

implementation

{$R *.dfm}

{ Form 1 }

procedure T_SpectralAttributesForm.FormCreate(Sender: TObject);
var
  EvalTestGroup: TEvalTestGroup;
begin
  EvalTestSet := TEvalTestSet.Create(SetID);
  for EvalTestGroup in EvalTestSet.EvalTestGroupList do
  begin
    AddTestGroupPage(EvalTestGroup);
  end;
end;

procedure T_SpectralAttributesForm.AddTestGroupPage(EvalTestGroup: TEvalTestGroup);
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
  If (PageControl1.ActivePage <> SummaryTab) then
    begin
      Query := TADOQuery.Create(Nil);
      with Query do
      begin
        Connection := _ChromaDataModule.ChromaData;
        SQL.Add('delete from EvalTestGroups where GroupID = ' + PageControl1.ActivePage.Tag.ToString);
        ExecSQL;
        SQL.Add('delete from EvalTests where GroupID = ' + PageControl1.ActivePage.Tag.ToString);
        ExecSQL;
        Free;
      end;
      PageControl1.ActivePage.Destroy;
    end;
end;

end.
