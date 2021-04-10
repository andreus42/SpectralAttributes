unit frameConnectionTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  ChromaDataModule, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrame1 = class(TFrame)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Query: TADOQuery;
  FrameType: Integer;

implementation

{$R *.dfm}


procedure TFrame1.SpeedButton1Click(Sender: TObject);
begin
  Query.SQL.Add('select FrameTypeID from TestTypes where TypeID = 1');
  Query.Open;
  Edit1.Text := Query.FieldByName('FrameTypeID').Value;
  Query.Close;
  Query.Free;
end;

initialization
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;

finalization
  Query.Free;


end.




