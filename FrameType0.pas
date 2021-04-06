unit FrameType0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.StdCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms,  // VCL
  Vcl.ToolWin, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Dialogs,
  System.Generics.Collections,

  // Mine
  FrameType1,
  FrameType2,
//  FrameType3,
  EvalTestOjb6;

type
  TFrameType01 = class(TFrame)
    EvalTestPanel: TPanel;
    SpeedButton1: TSpeedButton;
    NumLabel: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    TypeID: Integer;
    constructor Create(AOwner: TComponent);
    constructor CreateWithIntList(AOwner: TComponent; AIntList: TList<Integer>);
    constructor CreateWithIntEvalTest(AOwner: TComponent; MyEvalTest: TEvalTest);
  end;

implementation

var
  I: Integer;

{$R *.dfm}

constructor TFrameType01.Create(AOwner: TComponent);
var
  TestPanel1: TType1;
begin
  inherited Create(AOwner);
end;

constructor TFrameType01.CreateWithIntEvalTest(AOwner: TComponent;
  MyEvalTest: TEvalTest);
var
  TestID: Integer;
  Name: String;
  Rank: Integer;
  TestType: Integer;
  LambdaTo: String;
  LambdaFrom: String;
  LambdaAt: String;
  Value: String;
  FilePath: String;
  I: Integer;
  MyType1: TType1;
  MyType2: TType2;
begin
  TestID := MyEvalTest.TestID;
  Name := MyEvalTest.Name;
  Rank := MyEvalTest.Rank.ToInteger;
  TestType := MyEvalTest.TestType.ToInteger;
  LambdaTo := MyEvalTest.LambdaTo;
  LambdaFrom := MyEvalTest.LambdaFrom;
  LambdaAt := MyEvalTest.LambdaAt;
  Value := MyEvalTest.Value;
  FilePath := MyEvalTest.FilePath;

  case TestType of
    1: MyType1 := TType1.Create(EvalTestPanel, TestID, Name, Rank, Value,
                                LambdaTo, LambdaFrom);

//    2: MyType2 := TType2.Create(EvalTestPanel, TestID, Name, Rank, Value,
//                                LambdaAT);
  end;
end;


constructor TFrameType01.CreateWithIntList(AOwner: TComponent;
  AIntList: TList<Integer>);
var
  I: Integer;
  TestPanel1: TType1;
  TestPanel: TType2;
begin
  inherited Create(AOwner);
//  for I in AIntList do
//  begin
//    showmessage(I.ToString);
//    TestPanel := TType2.Create(Self);
//    with TestPanel do
//    begin
//      Name := 'TPanel' + I.ToString;
//      Parent := EvalTestPanel;
//      Left := 300;
//    end;
//  end;
//    for I in AIntList do
//  begin
//    showmessage(I.ToString);
//    TestPanel1 := TType1.Create(Self);
//    with TestPanel do
//    begin
//      Name := 'TPanel1' + I.ToString;
//      Parent := EvalTestPanel;
//      Left := 300;
//    end;
//  end;
end;

procedure TFrameType01.SpeedButton1Click(Sender: TObject);
begin
//  TestList.delete(0);
  Self.Destroy;
end;

end.
