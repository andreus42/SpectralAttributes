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
  EvalFrameUnit,
  EvalTestOjb7;

type
  TEvalTestGroupFrame = class(TFrame)
    Panel1: TPanel;
    SpecTextMemo: TMemo;
    IDBox: TEdit;
    LoadButton: TButton;
    Button5: TButton;
    Label3: TLabel;
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
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure AddEvalPanel(K: Integer);
    procedure AddEvalTestPanel(TestID: Integer);
  private
    { Private declarations }
  public
    RecID: Integer;
    I: Integer;
    K: Integer;
    PanelList: TList<Integer>;
    constructor CreateWithGroupID(AOwner: TComponent; GroupID: Integer);
    constructor CreateWithInt(AOwner: TComponent; AnInt: Integer);
  end;


implementation
{$R *.dfm}

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalTestPanel(TestID: Integer);
var
  TestFrame: TEvalFrame;
begin
  Inc(K);
  TestFrame := TEvalFrame.CreateWithTestID(Self, TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + (TestID+K).ToString;
    Parent := EvalScrollBox;     // error here, scrollbox exist?
    Align := alTop;
    Height := 26;
  end;
end;

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalPanel(K: Integer);
var
  TestFrame: TEvalFrame;
begin
  Inc(K);
  TestFrame := TEvalFrame.Create(Self);
  with TestFrame do
  begin
    Name := 'EvalFrame' + K.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
    Height := 26;
    RankLabel.Caption := K.ToString;
    if Odd(K) then
      TestFrame.EvalTestPanel.Color := clMoneyGreen
    else
      TestFrame.EvalTestPanel.Color := clWhite;
  end;
end;


procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
begin
  Inc(K);
  AddEvalPanel(K);
end;


constructor TEvalTestGroupFrame.CreateWithGroupID(AOwner: TComponent; GroupID: Integer);
var
  MyEvalTest: TEvalTest;
  MyEvalTestGroup: TEvalTestGroup;
  TestID : Integer;
  I: Integer;
begin
  inherited Create(AOwner);
  MyEvalTestGroup := TEvalTestGroup.Create(GroupID);
  SpecTextMemo.Clear;
  IDBox.Text := GroupID.ToString;
  Name := 'EvalFrame' + GroupID.ToString;

  // Loop through list of tests
  for I := 0 to MyEvalTestGroup.TestList.Count-1 do
  begin
    MyEvalTest := MyEvalTestGroup.TestList.Items[I];
//    SpecTextMemo.Lines.Add(MyEvalTest.TestID.ToString);
    SpecTextMemo.Lines.Add(MyEvalTest.Stringify2);
    AddEvalTestPanel(MyEvalTest.TestID);
  end;
end;


constructor TEvalTestGroupFrame.CreateWithInt(AOwner: TComponent;
  AnInt: Integer);
begin
    inherited Create(AOwner);
end;

end.


