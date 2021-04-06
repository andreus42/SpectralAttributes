unit TestFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTestFrame = class(TFrame)
    Panel1: TPanel;
    AtLambdaLabel: TLabel;
    SpecLabel: TLabel;
    PlusLabel: TLabel;
    MinusLabel: TLabel;
    MinusEdit: TEdit;
    PlusEdit: TEdit;
    SpecEdit: TEdit;
    AtLambdaEdit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
