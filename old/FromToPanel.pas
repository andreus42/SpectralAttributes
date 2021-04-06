unit FromToPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFromToFrame = class(TFrame)
    Panel1: TPanel;
    FromLambdaLabel: TLabel;
    ToLabel: TLabel;
    SpecLabel: TLabel;
    PlusLabel: TLabel;
    ToLambdaEdit: TEdit;
    PlusEdit: TEdit;
    SpecEdit: TEdit;
    MinusLabel: TLabel;
    MinusEdit: TEdit;
    fromLambdaEdit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
