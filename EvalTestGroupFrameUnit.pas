unit EvalTestGroupFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  System.Generics.Collections,

  // Database
  Data.DB, Data.Win.ADODB, Datasnap.DBClient,
  ActiveX,

  // Mine
  ChromaDataModule,
  EvalFrameUnit,
  TEvalTestUnit,
  TEvalTestGroupUnit, LabeledMemo;

type
  TEvalTestGroupFrame = class(TFrame)
    Panel1: TPanel;
    IDBox: TEdit;
    ParseTextButton: TButton;
    ParseButton: TButton;
    IDLabel: TLabel;
    AddEvalTestButton: TButton;
    EvalScrollBox: TScrollBox;
    SetUpPanel: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    GroupDescEdit: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Button1: TButton;
    SpecTextMemo: TLabledMemo;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    procedure AddEvalTestButtonClick(Sender: TObject);
  private
    procedure AddEvalTestFrame(EvalTest: TEvalTest); overload;
  public
    EvalTestGroup: TEvalTestGroup;
    GroupID: Integer;
    SetID: Integer;
//    constructor Create(AOwner: TComponent; GroupID: Integer); overload;
    constructor Create(AOwner: TComponent;
      EvalTestGroup: TEvalTestGroup); overload;
  end;

const
  FrameHeight = 26;

implementation

{$R *.dfm}

constructor TEvalTestGroupFrame.Create(AOwner: TComponent;
  EvalTestGroup: TEvalTestGroup);
var
  EvalTest: TEvalTest;
begin
  inherited Create(AOwner);
  Self.EvalTestGroup := EvalTestGroup;
  SpecTextMemo.AMemo.Clear;
  GroupDescEdit.Text := 'In-Process #' + EvalTestGroup.GroupID.ToString;
  Name := 'EvalFrame' + EvalTestGroup.GroupID.ToString;
  for EvalTest in EvalTestGroup.TestList do
  begin
//    SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
    // debug
//    TestListMemo.Lines.Add(EvalTestGroup.GroupID.ToString);
    AddEvalTestFrame(EvalTest);
    Self.SetID := EvalTestGroup.SetID;
  end;
  Self.GroupID := EvalTestGroup.GroupID;

end;

//// new constructor
//constructor TEvalTestGroupFrame.Create(AOwner: TComponent; GroupID: Integer);
//var
//  EvalTest: TEvalTest;
//begin
//  inherited Create(AOwner);
//  EvalTestGroup.Create(GroupID);
//  SpecTextMemo.AMemo.Clear;
//  GroupDescEdit.Text := 'In-Process #' + EvalTestGroup.GroupID.ToString;
//  Name := 'EvalFrame' + EvalTestGroup.GroupID.ToString;
//  for EvalTest in EvalTestGroup.TestList do
//    begin
//       SpecTextMemo.AMemo.Lines.Add(EvalTest.Stringify);
//       AddEvalTestFrame(EvalTest);
//    end;
//  Self.GroupID := EvalTestGroup.GroupID;
//  Self.SetID := EvalTestGroup.SetID;
//end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
var
  NewEvalTEest: TEvalTest;
  temp: integer;
begin
  temp := 0;
  NewEvalTEest := TEvalTest.CreateNew(EvalTestGroup.GroupID, EvalTestGroup.SetID);
//  NewEvalTEest := TEvalTest.CreateNew(GroupID, SetID);
  AddEvalTestFrame(NewEvalTEest);
end;

procedure TEvalTestGroupFrame.AddEvalTestFrame(EvalTest: TEvalTest);
var
  TestFrame: TEvalFrame;
begin
  TestFrame := TEvalFrame.Create(EvalScrollBox, EvalTest.TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + EvalTest.TestID.ToString;
    Parent := EvalScrollBox;
    Align := alTop;
    Height := FrameHeight;
  end;
end;

end.
