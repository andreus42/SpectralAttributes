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
  EvalTestOjb6;

  type
  T_SpectralAttributesForm = class(TForm)
    PageControl1: TPageControl;
    Button2: TButton;
    Button3: TButton;
    SummaryTab: TTabSheet;
    SummaryPanel: TPanel;
    Memo1: TMemo;
    SummaryLabel: TLabel;
    Memo2: TMemo;
//    function  GetTestGroups(TestSetNum: Integer): Integer;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MakePageInt(K: Integer);
    procedure MakePage(MyEvalTestGroup: TEvalTestGroup);
    procedure UpdateButtonClick(Sender: TObject);

  type
    TMyTabSheet = class(TTabSheet)
      EditBox: TEdit;
      MemoBox: TMemo;
      MyFrame: TFrame;
      ActiveButton: TButton;
      MySpecSheet: TEvalTestGroupFrame;
    end;

  private
    { Private declarations }
  public
    ChromaData: TADOConnection;
  end;

const SetID = 100;

var
  _SpectralAttributesForm: T_SpectralAttributesForm;
  I: integer;
  MyIntList: TList<Integer>;
  Query: TADOQuery;
  MySet: TEvalTestSet;


implementation

{$R *.dfm}

{ Form 1 }

procedure T_SpectralAttributesForm.FormCreate(Sender: TObject);
// On creation, add all SpecGroups of the Spectral set
var
  GroupID: Integer;
  TempEvalTest: TEvalTest;
  TempEvalTestGroup: TEvalTestGroup;
begin
  Memo1.Clear;
  MySet := TEvalTestSet.Create(SetID);
  begin
    for TempEvalTestGroup in MySet.EvalTestGroupList do
    begin
      GroupID := TempEvalTestGroup.GroupID;
      MakePage(TempEvalTestGroup);
      Memo1.Lines.Add('Add Page: ' + GroupID.ToString);
    end;
  end;
end;


// CREATE TAB ///////////////////////
procedure T_SpectralAttributesForm.MakePageInt(K: Integer);
var
  ATabSheet: TMyTabSheet;
begin
  ATabSheet := TMyTabSheet.Create(PageControl1);
  with ATabSheet do
  begin
    Caption := 'Group #' + K.ToString;
    PageControl := PageControl1;

    Tag := K;
    MySpecSheet := TEvalTestGroupFrame.CreateWithInt(ATabSheet, K);
    with MySpecSheet do
    begin
      Parent := ATabSheet;
      Align := alClient;
    end;
  end;
end;


procedure T_SpectralAttributesForm.MakePage(MyEvalTestGroup: TEvalTestGroup);
var
  ATabSheet: TMyTabSheet;
  GroupID: Integer;
begin
  ATabSheet := TMyTabSheet.Create(PageControl1);
  GroupID := MyEvalTestGroup.GroupID;
  with ATabSheet do
  begin
    Caption := 'Group #' + GroupID.ToString;
    Name := 'TabSheet' + GroupID.ToString;
    PageControl := PageControl1;
    Tag := GroupID;
    MySpecSheet := TEvalTestGroupFrame.CreateWithEvalGroup(ATabSheet, MyEvalTestGroup);
    with MySpecSheet do
    begin
      Parent := ATabSheet;
      Align := alClient;
    end;
  end;
end;

procedure T_SpectralAttributesForm.Button2Click(Sender: TObject);
var
  ActivePageName: String;
begin
  ActivePageName := PageControl1.ActivePage.Name;
  If (PageControl1.ActivePage <> SummaryTab) then PageControl1.ActivePage.Destroy;
end;


procedure T_SpectralAttributesForm.UpdateButtonClick(Sender: TObject);
var
  j: Integer;
begin
  for j := 1 to (PageControl1.PageCount-1) do
  begin
//    Application.MessageBox('Hello, World', 0, 0);
//    Memo1.Text := Memo1.Text + ATabSheet.Name
  end;
end;


procedure T_SpectralAttributesForm.Button3Click(Sender: TObject);
var
  NextPageNum: Integer;
begin
  NextPageNum := MyIntList.Count + 1;
  MyIntList.Add(NextPageNum);
  MakePageInt(NextPageNum);
end;

Initialization
  MyIntList := TList<Integer>.Create;

Finalization
  MyIntList.Free;

end.
