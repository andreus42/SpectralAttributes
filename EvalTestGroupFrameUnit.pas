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
//  ConnectionUnit,
  EvalFrameUnit,
  FrameType0,
  FrameType1,
  EvalTestOjb6;

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
    Edit4: TEdit;
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure AddEvalPanel(K: Integer);
    procedure AddEvalTestPanel(MyEvalTest: TEvalTest);
  private
    FTestList: TList<Integer>;
    procedure SetTestList(const Value: TList<Integer>);
    { Private declarations }
  public
    RecID: Integer;
    I: Integer;
    K: Integer;
    PanelList: TList<Integer>;
    property TestList: TList<Integer> read FTestList write SetTestList;
    constructor CreateWithEvalGroup(AOwner: TComponent; MyEvalTestGroup: TEvalTestGroup);
    constructor CreateWithInt(AOwner: TComponent; AnInt: Integer);
  end;


implementation
{$R *.dfm}

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalTestPanel(MyEvalTest: TEvalTest);
var
  TestFrame: TFrameType01;
begin
  FTestList.Add(1);
  TestFrame := TFrameType01.Create(Self);
  with TestFrame do
  begin
    Name := 'EvalFrame' + TestList.Count.ToString;
    Parent := EvalScrollBox;     // error here, scrollbox exist?
    Align := alTop;
    Height := 26;
    if Odd(FTestList.Count) then
      EvalTestPanel.Color := clMoneyGreen
    else
      EvalTestPanel.Color := clWhite;
  end;
end;

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalPanel(K: Integer);
var
  TestFrame: TEvalFrame;
begin
  FTestList.Add(K);
  TestFrame := TEvalFrame.Create(Self);
  with TestFrame do
  begin
    Name := 'EvalFrame' + TestList.Count.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
    Height := 26;
    NumLabel.Caption := K.ToString;
    if Odd(K) then
      TestFrame.EvalTestPanel.Color := clMoneyGreen
    else
      TestFrame.EvalTestPanel.Color := clWhite;
  end;
end;


procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  NextPanelNum: Integer;
begin
  NextPanelNum := FTestList.Count+1;
  AddEvalPanel(NextPanelNum);
end;


constructor TEvalTestGroupFrame.CreateWithEvalGroup(AOwner: TComponent;
  MyEvalTestGroup: TEvalTestGroup);
var
  MyEvalTest: TEvalTest;
  TestID : Integer;
  GroupID: Integer;
  I: Integer;
begin
  inherited Create(AOwner);
  FTestList := TList<Integer>.Create;
  SpecTextMemo.Clear;
  GroupID := MyEvalTestGroup.GroupID;
  IDBox.Text := GroupID.ToString;
  Name := 'EvalFrame' + GroupID.ToString;

  with Combobox1 do
  begin
    AddItem('Bench', nil);
    AddItem('Cary', nil);
    AddItem('RMP', nil);
  end;

  // Walker Loop
  for I := 1 to MyEvalTestGroup.TestList.Count-1 do
  begin
    MyEvalTest := MyEvalTestGroup.TestList.Items[I];
    SpecTextMemo.Lines.Add(MyEvalTest.TestID.ToString);
    TestList.Add(TestID);
    AddEvalTestPanel(MyEvalTest);
  end;
end;


constructor TEvalTestGroupFrame.CreateWithInt(AOwner: TComponent;
  AnInt: Integer);
begin
    inherited Create(AOwner);
    FTestList := TList<Integer>.Create;
end;

procedure TEvalTestGroupFrame.SetTestList(const Value: TList<Integer>);
begin
  FTestList := Value;
end;

end.


