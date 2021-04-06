unit _AttributesFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,

  System.Generics.Collections,

  // Mine
  ConnectionUnit,
  TEvalTestGroupObject,
  TEvalTestObject,
  EvalSpecPanel,
  Type2TestPanel,
  EvalTestFrame,
  TMyList;


type
  TSpecEvalTestFrame = class(TFrame)
    Panel1: TPanel;
    Memo1: TMemo;
    LastNameBox: TEdit;
    FirstNameBox: TEdit;
    IDBox: TEdit;
    ComboBox1: TComboBox;
    LoadButton: TButton;
    Button5: TButton;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    AddEvalTestButton: TButton;
    EvalScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
//    procedure LoadMemoVals(MyID: Integer);
    procedure PostButtonClick(Sender: TObject);
    procedure FirstNameBoxExit(Sender: TObject);
    procedure LastNameBoxExit(Sender: TObject);
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure AddEvalPanel(K: Integer);
    procedure AddEvalPanel2(K: Integer);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
   public
    RecID: Integer;
    I: Integer;
    constructor CreateWithID(AOwner: TComponent; ID: Integer);
  end;

var
  TestList: TMyList<Integer>;
  MyTEvalTestGroup: TEvalTestGroup;
  MyTEvalTestGroup2: TEvalTestGroup;

implementation
{$R *.dfm}

{ TFrame 5 }

// Add Blank Eval Test frames to the Test Grid
procedure TSpecEvalTestFrame.AddEvalPanel(K: Integer);
var
  ASpecEvalTestPanel: TEvalTestFrame;
begin
  ASpecEvalTestPanel := TEvalTestFrame.Create(Self);
    with ASpecEvalTestPanel do
    begin
      Inc(K);
      Name := 'Panel' + K.ToString;
      Parent := EvalScrollBox;
      Align := alTop;
      Height := 26;
      NumLabel.Caption := K.ToString;
      if Odd(K) then
        EvalTestPanel.Color := clMoneyGreen
      else
        EvalTestPanel.Color := clWhite;
    end;
end;

// Add Eval Test from TestEvalObj to Grid
procedure TSpecEvalTestFrame.AddEvalPanel2(K: Integer);
var
  ASpecEvalTestPanel: TEvalTestFrame;
begin
  ASpecEvalTestPanel := TEvalTestFrame.Create(Self);
  with ASpecEvalTestPanel do
  begin
    Inc(K);
    Name := 'Panel' + K.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
    Height := 26;
    NumLabel.Caption := K.ToString;
    if Odd(K) then
      EvalTestPanel.Color := clMoneyGreen
    else
      EvalTestPanel.Color := clWhite;
  end;
end;


procedure TSpecEvalTestFrame.AddEvalTestButtonClick(Sender: TObject);
var
  ASpecEvalTestPanel: TEvalTestFrame;
begin
  Inc(I);
  AddEvalPanel(I);
end;


procedure TSpecEvalTestFrame.Button1Click(Sender: TObject);
var
  tempEvalTest: TEvalTest;
begin
  MyTEvalTestGroup2 := TEvalTestGroup.Create(556);
  for tempEvalTest in MyTEvalTestGroup2.TestList do
  begin
    AddEvalPanel2(tempEvalTest.Rank.toInteger);
  end;
end;

constructor TSpecEvalTestFrame.CreateWithID(AOwner: TComponent; ID: Integer);
begin
  inherited Create(AOwner);
//  AddEvalPanel(ID);
  Label1.Caption := ID.ToString;
//  Name := 'EvalFrame' + ID.ToString;
  Label2.Caption := Self.Name;
  Combobox1.AddItem('Bench', nil);
  Combobox1.AddItem('Cary', nil);
  Combobox1.AddItem('RMP', nil);
  Memo1.Lines.Add(MyTEvalTestGroup.TestList.Items[0].Name);
  IDBox.Text := MyTEvalTestGroup.GroupID.ToString;
end;


//EVAL TEST FRAME////////////////////////////
procedure TSpecEvalTestFrame.FirstNameBoxExit(Sender: TObject);
begin
  DoSQL('Update names set firstname = ''' + FirstNameBox.Text + ''' where names.ID = ' + RecID.ToString);
end;

procedure TSpecEvalTestFrame.LastNameBoxExit(Sender: TObject);
begin
  DoSQL('Update names set lastname = ''' + LastNameBox.Text + ''' where names.ID = ' + RecID.ToString);
end;


procedure TSpecEvalTestFrame.PostButtonClick(Sender: TObject);
begin
//  DoSQL('Update names set firstname = ''' + Edit1.Text + ''' where names.ID = ' + RecID.ToString);
end;

initialization
  TestList := TMylist<Integer>.Create;
  TestList.AddRange([7,8,9]);
  MyTEvalTestGroup := TEvalTestGroup.Create(555);


Finalization
  TestList.Free;

end.


