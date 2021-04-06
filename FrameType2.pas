unit FrameType2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TType2 = class(TFrame)
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
    constructor CreateWithID(AOwner: TComponent; ID: Integer);
  end;

implementation

{$R *.dfm}

{ TType2 }

constructor TType2.CreateWithID(AOwner: TComponent; ID: Integer);
begin
    MinusEdit.Text := ID.ToString;
    PlusEdit.Text := ID.ToString;
    SpecEdit.Text := ID.ToString;
    AtLambdaEdit.Text := ID.ToString;
end;

end.
