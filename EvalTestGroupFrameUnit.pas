unit EvalTestGroupFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  System.Generics.Collections,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  ActiveX,

  // Mine
  ChromaDataModule,
  EvalFrameUnit,
  TEvalTestUnit,
  TEvalTestGroupUnit;

type
  TEvalTestGroupFrame = class(TFrame)
    Panel1: TPanel;
    SpecTextMemo: TMemo;
    IDBox: TEdit;
    LoadButton: TButton;
    ParseButton: TButton;
    IDLabel: TLabel;
    AddEvalTestButton: TButton;
    EvalScrollBox: TScrollBox;
    SetUpPanel: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    GroupDescEdit: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    procedure AddEvalTestButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
  public
    PanelList: TList<Integer>;
    EvalTestGroup: TEvalTestGroup;
    GroupID: Integer;
    SetID: Integer;
    constructor Create(AOwner: TComponent; EvalTestGroup: TEvalTestGroup);
  end;


implementation
{$R *.dfm}

constructor TEvalTestGroupFrame.Create(AOwner: TComponent;
  EvalTestGroup: TEvalTestGroup);
var
  EvalTest: TEvalTest;
begin
  inherited Create(AOwner);
  SpecTextMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalTestGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalTestGroup.GroupID.ToString;
  for EvalTest in EvalTestGroup.TestList do
  begin
    SpecTextMemo.Lines.Add(EvalTest.Stringify2);
    AddEvalTestFrame(EvalTest);
  end;
  Self.GroupID := EvalTestGroup.GroupID;
  Self.SetID := EvalTestGroup.SetID;
end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  NewEvalTEest: TEvalTest;
begin
  NewEvalTEest := TEvalTest.CreateNew(GroupID, SetID);
  AddEvalTestFrame(NewEvalTEest);
end;

procedure TEvalTestGroupFrame.AddEvalTestFrame(EvalTest: TEvalTest);
var
  TestFrame: TEvalFrame;
begin
  TestFrame := TEvalFrame.CreateWithTestID(EvalScrollBox, EvalTest.TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + EvalTest.TestID.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
  end;
end;

end.


