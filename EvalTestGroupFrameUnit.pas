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
    Edit4: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    procedure AddEvalTestButtonClick(Sender: TObject);
  private
    procedure AddEvalTestPanel(TestID: Integer); overload;
    procedure AddEvalTestPanel(EvalTest: TEvalTest); overload;
  public
    PanelList: TList<Integer>;
    EvalTestGroup: TEvalTestGroup;
    constructor CreateWithGroupID(AOwner: TComponent; GroupID: Integer);  // Create with EvalGroup
    constructor CreateWithInt(AOwner: TComponent; AnInt: Integer);   // future needs to create group like eval test
  end;


implementation
{$R *.dfm}

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalTestPanel(TestID: Integer);
var
  TestFrame: TEvalFrame;
begin
  TestFrame := TEvalFrame.CreateWithTestID(EvalScrollBox, TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + TestID.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
  end;
end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  NewEvalTEest: TEvalTest;
begin
  NewEvalTEest := TEvalTest.CreateNew(555, 1);  // TODO: EvalGroupObj to return GroupID, SetID
  AddEvalTestPanel(NewEvalTEest);
end;

procedure TEvalTestGroupFrame.AddEvalTestPanel(EvalTest: TEvalTest);
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

constructor TEvalTestGroupFrame.CreateWithGroupID(AOwner: TComponent; GroupID: Integer);
var
  AnEvalTest: TEvalTest;
  TestID : Integer;
  I: Integer;
begin
  inherited Create(AOwner);
  EvalTestGroup := TEvalTestGroup.Create(GroupID);
  SpecTextMemo.Clear;
  IDBox.Text := GroupID.ToString;
  Name := 'EvalFrame' + GroupID.ToString;

  // Loop through list of tests
  for AnEvalTest in EvalTestGroup.TestList do
  begin
    SpecTextMemo.Lines.Add(AnEvalTest.Stringify2);
    AddEvalTestPanel(AnEvalTest.TestID);
  end;
end;

constructor TEvalTestGroupFrame.CreateWithInt(AOwner: TComponent;
  AnInt: Integer);
begin
  inherited Create(AOwner);
  EvalTestGroup := TEvalTestGroup.Create(AnInt);
  SpecTextMemo.Clear;
  IDBox.Text := AnInt.ToString;
  Name := 'EvalFrame' + AnInt.ToString;
end;

end.


