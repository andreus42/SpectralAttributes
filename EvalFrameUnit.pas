unit EvalFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,

  // Mine
  ChromaDataModule,
  EvalTestOjb7, Data.DB, Data.Win.ADODB;

type
  TEvalFrame = class(TFrame)
    SpeedButton1: TSpeedButton;
    ToLambdaLabeledEdit: TLabeledEdit;
    FromNmLabel: TLabel;
    ToNmLabel: TLabel;
    FromLambdaLabeledEdit: TLabeledEdit;
    AtLambdaLabeledEdit: TLabeledEdit;
    AtNmLabel: TLabel;
    SpecEdit: TEdit;
    SpecLabel: TLabel;
    PlusTolLabeledEdit: TLabeledEdit;
    PlusTolLabel: TLabel;
    MinusTolLabeledEdit: TLabeledEdit;
    MinusTolLabel: TLabel;
    TestIDLabel: TLabel;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet2: TADODataSet;
    DataSource2: TDataSource;
    ADODataSet2ParamValue: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    SignLookUpComboBox: TDBLookupComboBox;
    RankEdit: TEdit;
    ADODataSet3: TADODataSet;
    ADODataSet4: TADODataSet;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    Edit1: TEdit;
    constructor CreateWithTestID (AOwner: TComponent; TestID: Integer);
    constructor Create (AOwner: TComponent);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ShowFrame;
    procedure ShowEvalType1;
    procedure ShowEvalType2;
    procedure ShowEvalType3;
    procedure ShowEvalType4;
    procedure ShowEvalType5;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure SpecEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    EvalTest: TEvalTest;
    FrameType: Integer;
    TestType: String;
    Filepath: String;
    TestName: String;
    I: Integer;
  end;

implementation

{$R *.dfm}

const
  EditOffSet = 290;
  Space = 145;
  LabelOffset = 78;
  P1 = 200;
  P2 = EditOffSet + Space*0;
  P3 = EditOffSet + Space*1;
  P4 = EditOffSet + Space*2;


constructor TEvalFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ADODataSet2.Parameters.ParamByName('TestID').Value := 0;
  DBLookupComboBox1.Refresh;
end;

constructor TEvalFrame.CreateWithTestID(AOwner: TComponent; TestID: Integer);
var
  Query: TADOQuery;
begin
  inherited Create(AOwner);
  ADODataSet2.Parameters.ParamByName('TestID').Value := TestID;
  ADODataSet2.Requery();
  EvalTest := TEvalTest.Create(TestID);
  TestName := EvalTest.Name;
  RankEdit.Text := EvalTest.Rank;
  TestType := EvalTest.TestType;
  ToLambdaLabeledEdit.Text := EvalTest.LambdaTo;
  FromLambdaLabeledEdit.Text := EvalTest.LambdaFrom;
  AtLambdaLabeledEdit.Text := EvalTest.LambdaAt;
  PlusTolLabeledEdit.Text := EvalTest.TolPlus;
  MinusTolLabeledEdit.Text := EvalTest.TolMinus;
  SpecEdit.Text := EvalTest.Value;
  FilePath := EvalTest.FilePath;
  TestIDLabel.Caption := 'TestID: ' + TestID.ToString;
  ShowFrame;
end;

procedure TEvalFrame.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  HideAllElements;
  Edit1.Text := ADODataset2.FieldByName('ParamValue').Value;
  TestType := ADODataset2.FieldByName('ParamValue').Value;
  ADODataSet2ParamValue.Value := ADODataset2.FieldByName('ParamValue').Value;
  ShowFrame;
end;

procedure TEvalFrame.HideAllElements;
begin
  SignLookUpComboBox.Visible :=  False;
  ToLambdaLabeledEdit.Visible :=  False;
  FromLambdaLabeledEdit.Visible :=  False;
  AtLambdaLabeledEdit.Visible :=  False;
  SpecEdit.Visible :=  False;
  FromNmLabel.Visible :=  False;
  ToNmLabel.Visible :=  False;
  AtNmLabel.Visible :=  False;
  SpecLabel.Visible :=  False;
  PlusTolLabeledEdit.Visible :=  False;
  PlusTolLabel.Visible :=  False;
  MinusTolLabeledEdit.Visible :=  False;
  MinusTolLabel.Visible :=  False;
end;

procedure TEvalFrame.ShowEvalType1;
begin
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'nm';
  SpecLabel.Left := P2 + LabelOffset;
  PlusTolLabeledEdit.Left := P3;
  PlusTolLabel.Left := P3 + LabelOffset;
  MinusTolLabeledEdit.Left := P4;
  MinusTolLabel.Left := P4 + LabelOffset;

  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  PlusTolLabeledEdit.Visible := True;
  PlusTolLabel.Visible := True;
  MinusTolLabeledEdit.Visible := True;
  MinusTolLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType2;
begin
  SignLookUpComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := '%';
  SpecLabel.Left := P2 + LabelOffset;
  FromLambdaLabeledEdit.Left := P3;
  FromNmLabel.Left := P3 + LabelOffset;
  ToLambdaLabeledEdit.Left := P4;
  ToNmLabel.Left := P4 + LabelOffset;
  SignLookUpComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  FromLambdaLabeledEdit.Visible := True;
  FromNmLabel.Visible := True;
  ToLambdaLabeledEdit.Visible := True;
  ToNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType3;
begin
  SignLookUpComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'OD';
  SpecLabel.Left := P2 - 18;
  FromLambdaLabeledEdit.Left := P3;
  FromNmLabel.Left := P3 + LabelOffset;
  ToLambdaLabeledEdit.Left := P4;
  ToNmLabel.Left := P4 + LabelOffset;
  SignLookUpComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  FromLambdaLabeledEdit.Visible := True;
  FromNmLabel.Visible := True;
  ToLambdaLabeledEdit.Visible := True;
  ToNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType4;
begin
  SignLookUpComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := '%';
  SpecLabel.Left := P2 + LabelOffset;
  AtLambdaLabeledEdit.Left := P3;
  AtNmLabel.Left := P3 + LabelOffset;
  SignLookUpComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  AtLambdaLabeledEdit.Visible := True;
  AtNmLabel.Visible := True;
end;

procedure TEvalFrame.ShowEvalType5;
begin
  SignLookUpComboBox.Left := P1;
  SpecEdit.Left := P2;
  SpecLabel.Caption := 'OD';
  SpecLabel.Left := P2 - 18;
  AtLambdaLabeledEdit.Left := P3;
  AtNmLabel.Left := P3 + LabelOffset;
  SignLookUpComboBox.Visible := True;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  AtLambdaLabeledEdit.Visible := True;
  AtNmLabel.Visible := True;
end;


procedure TEvalFrame.ShowFrame;
var
  Query: TADOQuery;
begin
//   Use TestType to LookUp Frame Type
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select FrameTypeID from TestTYpes where TypeID = ' + TestType);
  Query.Open;
  FrameType := Query.FieldByName('FrameTypeID').Value;
  Query.Close;
  Query.Free;

  FrameType := 1; //debug
  case FrameType of
    1: ShowEvalType1;
    2: ShowEvalType2;
    3: ShowEvalType3;
    4: ShowEvalType4;
    5: ShowEvalType5;
  end;
end;


procedure TEvalFrame.SpecEditChange(Sender: TObject);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('Update EvalTests set ParamValue = ' + SpecEdit.Text);
  Query.SQL.Add('where TestID = ' + EvalTest.TestID.ToString);
  Query.SQL.Add('and ParamID = 7');
  Query.ExecSQL;
  Query.Free;
end;

procedure TEvalFrame.SpeedButton1Click(Sender: TObject);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('delete from EvalTests where TestID = ' + EvalTest.TestID.ToString);
  Query.ExecSQL;
  Query.Free;
  Self.Destroy;
end;

end.
