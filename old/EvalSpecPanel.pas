unit EvalSpecPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrame1 = class(TFrame)
    AddLabel: TLabel;
    RankLabel: TLabel;
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
    Edit1: TEdit;
    PlusEdit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
