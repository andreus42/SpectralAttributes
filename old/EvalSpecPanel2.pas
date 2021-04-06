unit EvalSpecPanel2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TFrame1 = class(TFrame)
    FromLabel: TLabel;
    ToLabel: TLabel;
    PlusLabel: TLabel;
    ToEdit: TEdit;
    MinusEdit: TEdit;
    SpecLabel: TLabel;
    SpecEdit: TEdit;
    TestNameComboBox: TComboBox;
    MinusLabel: TLabel;
    FromEdit: TEdit;
    EvalTestPanel: TPanel;
    PlusEdit: TEdit;
    SpeedButton1: TSpeedButton;
    NumLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
