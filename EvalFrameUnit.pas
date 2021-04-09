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
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure SpecEditChange(Sender: TObject);
    procedure UpdateParameter(Sender: TObject);
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

procedure TEvalFrame.ShowFrame;
const
  ControlOffSet = 290;
  Space = 145;
  LabelOffset = 78;
  P1 = 200;
  P2 = ControlOffSet + Space*0;
  P3 = ControlOffSet + Space*1;
  P4 = ControlOffSet + Space*2;
var
  Query: TADOQuery;
begin
  // Use TestType to LookUp Frame Type
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('select FrameTypeID from TestTYpes where TypeID = ' + TestType);
  Query.Open;
  FrameType := Query.FieldByName('FrameTypeID').Value;
  Query.Close;
  Query.Free;

  // Set locations of controls
  SpecEdit.Left := P2;
  SpecLabel.Left := P2 + LabelOffset;
  SignLookUpComboBox.Left := P1;
  SpecEdit.Left := P2;
  FromLambdaLabeledEdit.Left := P3;
  FromNmLabel.Left := P3 + LabelOffset;
  ToLambdaLabeledEdit.Left := P4;
  ToNmLabel.Left := P4 + LabelOffset;
  AtLambdaLabeledEdit.Left := P3;
  AtNmLabel.Left := P3 + LabelOffset;
  PlusTolLabeledEdit.Left := P3;
  PlusTolLabel.Left := P3 + LabelOffset;
  MinusTolLabeledEdit.Left := P4;
  MinusTolLabel.Left := P4 + LabelOffset;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;

  case FrameType of
    0:  HideAllElements;
    1:  begin
            SpecLabel.Caption := 'nm';
            PlusTolLabeledEdit.Visible := True;
            PlusTolLabel.Visible := True;
            MinusTolLabeledEdit.Visible := True;
            MinusTolLabel.Visible := True;
        end;
    2:  begin
            SpecLabel.Caption := '%';
            SignLookUpComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    3: begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SignLookUpComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    4: begin
            SpecLabel.Caption := '%';
            SignLookUpComboBox.Visible := True;
            AtLambdaLabeledEdit.Visible := True;
            AtNmLabel.Visible := True;
      end;
    5: begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SignLookUpComboBox.Visible := True;
            AtLambdaLabeledEdit.Visible := True;
            AtNmLabel.Visible := True;
       end;
  end;
end;

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
  Edit1.Text := ADODataset2.FieldByName('ParamValue').Value;
  TestType := ADODataset2.FieldByName('ParamValue').Value;
  ADODataSet2ParamValue.Value := ADODataset2.FieldByName('ParamValue').Value;
  ShowFrame;
end;

procedure TEvalFrame.HideAllElements;
begin
  SpecEdit.Visible := False;
  SpecLabel.Visible := False;
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

procedure TEvalFrame.SpecEditChange(Sender: TObject);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  Query.SQL.Add('Update EvalTests set ParamValue = ' + SpecEdit.Text);
  Query.SQL.Add('where ParamID = 7 and TestID = ' + EvalTest.TestID.ToString);
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

procedure TEvalFrame.UpdateParameter(Sender: TObject);
var
  Query: TADOQuery;
begin
  Query.Connection := _ChromaDataModule.ChromaData;
  Query := TADOQuery.Create(Nil);
  if Sender = FromLambdaLabeledEdit then
  begin
    Query.SQL.Add('Update EvalTests set ParamValue = ' + FromLambdaLabeledEdit.Text);
    Query.SQL.Add('where ParamID = 4');
  end
  else if Sender = ToLambdaLabeledEdit then
  begin
    Query.SQL.Add('Update EvalTests set ParamValue = ' + ToLambdaLabeledEdit.Text);
    Query.SQL.Add('where TestID = 5');
  end;
    Query.SQL.Add('and TestID = ' + EvalTest.TestID.ToString);
    Query.ExecSQL;
    Query.Free
end;

end.
