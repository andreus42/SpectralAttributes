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
  EvalTestOjb7;

type
  TEvalTestGroupFrame = class(TFrame)
    Panel1: TPanel;
    SpecTextMemo: TMemo;
    IDBox: TEdit;
    LoadButton: TButton;
    ParseButton: TButton;
    IDLabel: TLabel;
    AddEvalTestButton: TButton;
    EvalScrollBox: TScrollBox;
    SetUpPanel: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    procedure AddEvalTestButtonClick(Sender: TObject);
    procedure AddEvalTestPanel(TestID: Integer);
  private
    { Private declarations }
  public
    I: Integer;
    K: Integer;
    PanelList: TList<Integer>;
    ThisGroupID: Integer;
    EvalTestGroup: TEvalTestGroup;
    function InsertNewEvalTest(): Integer;
    constructor CreateWithGroupID(AOwner: TComponent; GroupID: Integer);
    constructor CreateWithInt(AOwner: TComponent; AnInt: Integer);   // future needs to create group like eval test
  end;


implementation
{$R *.dfm}

// Add Eval Test from TestEvalObj to Grid
procedure TEvalTestGroupFrame.AddEvalTestPanel(TestID: Integer);
var
  TestFrame: TEvalFrame;
begin
  TestFrame := TEvalFrame.CreateWithTestID(Self, TestID);
  with TestFrame do
  begin
    Name := 'EvalFrame_' + TestID.ToString;
    Parent := EvalScrollBox;     // error here, scrollbox exist?
    Align := alTop;
  end;
end;

procedure TEvalTestGroupFrame.AddEvalTestButtonClick(Sender: TObject);
begin
  AddEvalTestPanel(InsertNewEvalTest); // Create & Add New TestID
end;


constructor TEvalTestGroupFrame.CreateWithGroupID(AOwner: TComponent; GroupID: Integer);
var
  MyEvalTest: TEvalTest;
  TestID : Integer;
  I: Integer;
begin
  inherited Create(AOwner);
  EvalTestGroup := TEvalTestGroup.Create(GroupID);
  SpecTextMemo.Clear;
  IDBox.Text := GroupID.ToString;
  ThisGroupID := GroupID;
  Name := 'EvalFrame' + GroupID.ToString;

  // Loop through list of tests
  for I := 0 to EvalTestGroup.TestList.Count-1 do
  begin
    MyEvalTest := EvalTestGroup.TestList.Items[I];
//    SpecTextMemo.Lines.Add(MyEvalTest.TestID.ToString);
    SpecTextMemo.Lines.Add(MyEvalTest.Stringify2);
    AddEvalTestPanel(MyEvalTest.TestID);
  end;
end;


constructor TEvalTestGroupFrame.CreateWithInt(AOwner: TComponent;
  AnInt: Integer);
begin
    inherited Create(AOwner);
end;

function TEvalTestGroupFrame.InsertNewEvalTest: Integer;
var
  Query: TADOQuery;
  Query2: TADOQuery;
  NextTestID: Integer;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select max(TestID) last_id from EvalTests');
  Query.Open;
  NextTestID := Query.FieldByName('last_id').Value + 1;
  Query.Close;
  Query.Free;
  Query2 := TADOQuery.Create(Nil);
  Query2.Connection := _ChromaDataModule.ChromaData;
  Query2.SQL.Add('insert into EvalTests values (' + NextTestID.ToString + ',');
  Query2.SQL.Add(EvalTestGroup.GroupID.ToString + ', 1, 3, 0)');
  Query2.ExecSQL;
  Query2.Close;
  Query2.Free;
  Result := NextTestID;
end;

end.


