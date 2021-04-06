unit EvalTestFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms,  // VCL
  Vcl.ToolWin, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Dialogs,

  // Mine
//  Type1TestPanel,
  FrameType1,
  FrameType2_v2,
  FrameType3,
  TMyList,
  TestFrameUnit;

type
  TEvalTestFrame = class(TFrame)
    EvalTestPanel: TPanel;
    SpeedButton1: TSpeedButton;
    NumLabel: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    I: Integer;
//    constructor Create(AOwner: TComponent); override;
    constructor CreateWithIntList(AOwner: TComponent; AIntList: TMyList<Integer>);
  end;

implementation

{$R *.dfm}

procedure TEvalTestFrame.Button1Click(Sender: TObject);
var
  TestPanel: TTestFrame;
begin
  TestPanel:= TTestFrame.Create(Self);
  TestPanel.Parent := EvalTestPanel;
  TestPanel.Left := 300;
end;

procedure TEvalTestFrame.Button2Click(Sender: TObject);
var
  TestPane2: TType1;
begin
  TestPane2:= TType1.Create(Self);
  TestPane2.Parent := EvalTestPanel;
  TestPane2.Left := 300;
end;


constructor TEvalTestFrame.CreateWithIntList(AOwner: TComponent;
  AIntList: TMyList<Integer>);
var
  I: Integer;
  TestPanel: TTestFrame;
begin
  inherited;
//  for I in AIntList do
//    showmessage(I.ToString);

  begin
    TestPanel := TTestFrame.Create(Self);
    TestPanel.Parent := EvalTestPanel;
    TestPanel.Left := 300;
  end;


end;

procedure TEvalTestFrame.SpeedButton1Click(Sender: TObject);
begin
  Self.Destroy;
end;

end.
