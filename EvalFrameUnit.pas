unit EvalFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TEvalFrame = class(TFrame)
    EvalTestPanel: TPanel;
    SpeedButton1: TSpeedButton;
    RankLabel: TLabel;
    ComboBox1: TComboBox;
    SignComboBox: TComboBox;
    ToLambdaLabeledEdit: TLabeledEdit;
    NmLabel1: TLabel;
    NmLabel2: TLabel;
    FromLambdaLabeledEdit: TLabeledEdit;
    AtLambdaLabeledEdit: TLabeledEdit;
    NmLabel3: TLabel;
    SpecLabeledEdit: TLabeledEdit;

    procedure ComboBox1Change(Sender: TObject);
    constructor Create (AOwner: TComponent);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

const
  P1 = 220;
  P2 = 340;
  P3 = 460;
  P4 = 580;

  L1 = 420;
  L2 = 540;
  L3 = 640;

constructor TEvalFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;


procedure TEvalFrame.ComboBox1Change(Sender: TObject);
var
  BoxSelection: Integer;
begin
  BoxSelection := Combobox1.ItemIndex;

  case BoxSelection of
    -1:
    begin
      SignComboBox.Visible :=  False;
      ToLambdaLabeledEdit.Visible :=  False;
      NmLabel1.Visible :=  False;
      NmLabel2.Visible :=  False;
      FromLambdaLabeledEdit.Visible :=  False;
      AtLambdaLabeledEdit.Visible :=  False;
      NmLabel3.Visible :=  False;
      SpecLabeledEdit.Visible :=  False;
    end;
    0: begin
      SignComboBox.Left := P1;
      FromLambdaLabeledEdit.Left := P2;
      ToLambdaLabeledEdit.Left := P3;
      SpecLabeledEdit.Left := P4;
      NmLabel1.Left := L1;
      NmLabel2.Left := L2;
      NmLabel3.Left := L3;
      ToLambdaLabeledEdit.Visible := True;
      FromLambdaLabeledEdit.Visible := True;
      SignComboBox.Visible := True;
      SpecLabeledEdit.Visible := True;
      NmLabel1.Visible := True;
      NmLabel2.Visible := True;
      NmLabel3.Visible := True;
    end;
    1: begin
      SignComboBox.Left := P1;
      AtLambdaLabeledEdit.Left := P3;
      SpecLabeledEdit.Left := P4;
      NmLabel3.Left := L3;
      AtLambdaLabeledEdit.Visible := True;
      SignComboBox.Visible := True;
      SpecLabeledEdit.Visible := True;
      NmLabel3.Visible := True;
    end;
    2: begin
      SignComboBox.Left := P1;
      FromLambdaLabeledEdit.Left := P2;
      ToLambdaLabeledEdit.Left := P3;
      SpecLabeledEdit.Left := P4;
      NmLabel1.Left := L1;
      NmLabel2.Left := L2;
      NmLabel3.Left := L3;

      ToLambdaLabeledEdit.Visible := True;
      FromLambdaLabeledEdit.Visible := True;
      SignComboBox.Visible := True;
      SpecLabeledEdit.Visible := True;
      NmLabel1.Visible := True;
      NmLabel2.Visible := True;
      NmLabel3.Visible := True;
      SpecLabeledEdit.EditLabel.Caption := 'OD';
      SpecLabeledEdit.LabelPosition := lpLeft;
      SpecLabeledEdit.Visible := True;
    end;

  end;


end;

procedure TEvalFrame.SpeedButton1Click(Sender: TObject);
begin
  Self.Destroy;
end;

end.
