unit FrameType1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TType1 = class(TFrame)
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
    FromLambdaEdit1: TEdit;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; TestID: Integer; Name: String; Rank: Integer;
                       Value: String; LambdaFrom: String; LambdaTo: String);
  end;

implementation

{$R *.dfm}

{ TType1 }

constructor TType1.Create(AOwner: TComponent; TestID: Integer; Name: String;
  Rank: Integer; Value, LambdaFrom, LambdaTo: String);
begin
    FromLambdaEdit1.Text := LambdaFrom;
    ToLambdaEdit.Text := LambdaTo;
    SpecEdit.Text := Value;
    PlusEdit.Text := '0';
    MinusEdit.Text := '0';
end;

end.
