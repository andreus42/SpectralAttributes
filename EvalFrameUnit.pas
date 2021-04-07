unit EvalFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,

  // Mine
  EvalTestOjb7;

type
  TEvalFrame = class(TFrame)
    EvalTestPanel: TPanel;
    SpeedButton1: TSpeedButton;
    RankLabel: TLabel;
    ComboBox1: TComboBox;
    SignComboBox: TComboBox;
    ToLambdaLabeledEdit: TLabeledEdit;
    FromNmLabel: TLabel;
    ToNmLabel: TLabel;
    FromLambdaLabeledEdit: TLabeledEdit;
    AtLambdaLabeledEdit: TLabeledEdit;
    AtNmLabel: TLabel;
    SpecEdit: TEdit;
    SpecLabel: TLabel;
    PlusTolLabeledEdit: TLabeledEdit;
    PlusTolLabel: TLabel;
    MinusTolLabeledEdit: TLabeledEdit;
    MinusTolLabel: TLabel;
    TestIDLabel: TLabel;

    constructor Create (AOwner: TComponent);
    constructor CreateWithTestID (AOwner: TComponent; TestID: Integer);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ShowEvalType1;
    procedure ShowEvalType2;
    procedure ShowEvalType3;
    procedure ShowEvalType4;
    procedure ShowEvalType5;

  private
    { Private declarations }
  public
    EvalTest: TEvalTest;
    TestType: String;
    Filepath: String;
    TestName: String;
    I: Integer;
  end;

implementation

{$R *.dfm}

const
  EditOffSet = 290;
  Space = 145;
  LabelOffset = 78;
  P1 = 200;
  P2 = EditOffSet + Space*0;
  P3 = EditOffSet + Space*1;
  P4 = EditOffSet + Space*2;

constructor TEvalFrame.Create(AOwner: TComponent);
begin
//  inherited Create(AOwner);
  Create(AOwner);
//  EvalTest := TEvalTest.Create(1234);
end;


constructor TEvalFrame.CreateWithTestID(AOwner: TComponent; TestID: Integer);
begin
//  inherited Create(AOwner);
  Create(AOwner);
  EvalTest := TEvalTest.Create(TestID);
  TestName := EvalTest.Name;
  RankLabel.Caption := EvalTest.Rank;
  TestType := EvalTest.TestType;
  ToLambdaLabeledEdit.Text := EvalTest.LambdaTo;
  FromLambdaLabeledEdit.Text := EvalTest.LambdaFrom;
  AtLambdaLabeledEdit.Text := EvalTest.LambdaAt;
  SpecEdit.Text := EvalTest.Value;
  FilePath := EvalTest.FilePath;
  TestIDLabel.Caption := 'TestID: ' + TestID.ToString;

  case TestType.ToInteger of
    1: ShowEvalType1;
    2: ShowEvalType2;
    3: ShowEvalType3;
    4: ShowEvalType4;
    5: ShowEvalType5;
  end;

end;

procedure TEvalFrame.HideAllElements;
begin
  SignComboBox.Visible :=  False;
  ToLambdaLabeledEdit.Visible :=  False;
  FromLambdaLabeledEdit.Visible :=  False;
  AtLambdaLabeledEdit.Visible :=  False;
  SpecEdit.Visible :=  False;
  FromNmLabel.Visible :=  False;
  ToNmLabel.Visible :=  False;
  AtNmLabel.Visible :=  False;
  SpecLabel.Visible :=  False;
  PlusTolLabeledEdit.Visible :=  False;
  PlusTolLabel.Visible :=  False;
  MinusTolLabeledEdit.Visible :=  False;
  MinusTolLabel.Visible :=  False;
end;

procedure TEvalFrame.ComboBox1Change(Sender: TObject);
var
  BoxSelection: Integer;
begin
  HideAllElements;
  BoxSelection := Combobox1.ItemIndex;
  case BoxSelection of
    -1: HideAllElements;
    0: ShowEvalType1;
    1: ShowEvalType2;
    2: ShowEvalType3;
    3: ShowEvalType4;
    4: ShowEvalType5;
  end;
end;

procedure TEvalFrame.ShowEvalType1;
begin
  SignComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := '%';
  SpecLabel.Left := P2 + LabelOffset;
  FromLambdaLabeledEdit.Left := P3;
  FromNmLabel.Left := P3 + LabelOffset;
  ToLambdaLabeledEdit.Left := P4;
  ToNmLabel.Left := P4 + LabelOffset;
  SignComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  FromLambdaLabeledEdit.Visible := True;
  FromNmLabel.Visible := True;
  ToLambdaLabeledEdit.Visible := True;
  ToNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType2;
begin
  SignComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'OD';
  SpecLabel.Left := P2 - 18;
  FromLambdaLabeledEdit.Left := P3;
  FromNmLabel.Left := P3 + LabelOffset;
  ToLambdaLabeledEdit.Left := P4;
  ToNmLabel.Left := P4 + LabelOffset;
  SignComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  FromLambdaLabeledEdit.Visible := True;
  FromNmLabel.Visible := True;
  ToLambdaLabeledEdit.Visible := True;
  ToNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType3;
begin
  SignComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := '%';
  SpecLabel.Left := P2 + LabelOffset;
  AtLambdaLabeledEdit.Left := P3;
  AtNmLabel.Left := P3 + LabelOffset;
  SignComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  AtLambdaLabeledEdit.Visible := True;
  AtNmLabel.Visible := True;

end;

procedure TEvalFrame.ShowEvalType4;
begin
  SignComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'OD';
  SpecLabel.Left := P2 - 18;
  AtLambdaLabeledEdit.Left := P3;
  AtNmLabel.Left := P3 + LabelOffset;
  SignComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  AtLambdaLabeledEdit.Visible := True;
  AtNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType5;
begin
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'nm';
  SpecLabel.Left := P2 + LabelOffset;
  PlusTolLabeledEdit.Left := P3;
  PlusTolLabel.Left := P3 + LabelOffset;
  MinusTolLabeledEdit.Left := P4;
  MinusTolLabel.Left := P4 + LabelOffset;

  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  PlusTolLabeledEdit.Visible := True;
  PlusTolLabel.Visible := True;
  MinusTolLabeledEdit.Visible := True;
  MinusTolLabel.Visible := True;
end;

//  // Bringing in values
//  SpecEdit.Text := EvalTest.Value;
//  ToLambdaLabeledEdit.Text := EvalTest.LambdaTo;
//  FromLambdaLabeledEdit.Text := EvalTest.LambdaFrom;

procedure TEvalFrame.SpeedButton1Click(Sender: TObject);
begin
  Self.Destroy;
end;

end.
