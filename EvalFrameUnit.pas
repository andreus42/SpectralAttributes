unit EvalFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,

  // Database
  Data.DB, Data.Win.ADODB,

  // Mine
  ChromaDataModule,
  TEvalTestUnit, DoubledLabeledEdit;

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
    RankEdit: TEdit;
    ADODataSet1TypeID: TStringField;
    ADODataSet1ParamName: TStringField;
    SymbolComboBox: TComboBox;
    FilepathEdit: TEdit;
    TargetCheckBox: TCheckBox;
    SpecEdit1: DoulbedLabeledEdit;
    constructor CreateWithTestID (AOwner: TComponent; TestID: Integer);
    constructor Create (AOwner: TComponent);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ClearAllElements;
    procedure ShowFrame;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure UpdateParameter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TargetCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    EvalTest: TEvalTest;
//    FrameType: Integer;
  end;

implementation

{$R *.dfm}

constructor TEvalFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ADODataSet2.Parameters.ParamByName('TestID').Value := 0;
end;

constructor TEvalFrame.CreateWithTestID(AOwner: TComponent; TestID: Integer);   // refactor to have eval test parameter
var
  Query: TADOQuery;
begin
  inherited Create(AOwner);
  ADODataSet2.Parameters.ParamByName('TestID').Value := TestID;
  ADODataSet2.Requery();
  TestIDLabel.Caption := 'TestID: ' + TestID.ToString;
  EvalTest := TEvalTest.Create(TestID);
  RankEdit.Text := EvalTest.Rank;
  ToLambdaLabeledEdit.Text := EvalTest.LambdaTo;
  FromLambdaLabeledEdit.Text := EvalTest.LambdaFrom;
  AtLambdaLabeledEdit.Text := EvalTest.LambdaAt;
  PlusTolLabeledEdit.Text := EvalTest.TolPlus;
  MinusTolLabeledEdit.Text := EvalTest.TolMinus;
  SpecEdit.Text := EvalTest.Value;
  FilepathEdit.Text := EvalTest.FilePath;
  SymbolComboBox.ItemIndex := EvalTest.Symbol;
  ShowFrame;
end;

procedure TEvalFrame.ShowFrame;
const
  ControlOffSet = 290;
  Space = 145;
  LabelOffset = 78;
  P1 = 200;
  P2 = ControlOffSet + Space*0;
  P3 = ControlOffSet + Space*1;
  P4 = ControlOffSet + Space*2;
  P5 = ControlOffSet + Space*3;
begin
  // Set locations of controls
  SpecEdit.Left := P2;
  SpecLabel.Left := P2 + LabelOffset;
  SymbolComboBox.Left := P1;
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
  HideAllElements;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  // Show control fields based on test type
  case EvalTest.FrameType of
    0:  HideAllElements;
    1:  begin
            SpecLabel.Caption := 'nm';
            PlusTolLabeledEdit.Visible := True;
            PlusTolLabel.Visible := True;
            MinusTolLabeledEdit.Visible := True;
            MinusTolLabel.Visible := True;
            TargetCheckBox.Visible := True;
        end;
    2:  begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    3:  begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    4:  begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            AtLambdaLabeledEdit.Visible := True;
            AtNmLabel.Visible := True;
            TargetCheckBox.Visible := True;
        end;
    5:  begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            AtLambdaLabeledEdit.Visible := True;
            AtNmLabel.Visible := True;
            TargetCheckBox.Visible := True;
        end;
  end;
end;

procedure TEvalFrame.ClearAllElements;
begin
  SpecEdit.Text := '';
  ToLambdaLabeledEdit.Text :=  '';
  FromLambdaLabeledEdit.Text := '';
  AtLambdaLabeledEdit.Text := '';
  PlusTolLabeledEdit.Text := '';
  MinusTolLabeledEdit.Text := '';
  SymbolComboBox.ItemIndex := -1;
end;


procedure TEvalFrame.DBLookupComboBox1CloseUp(Sender: TObject);
var
  Query: TADOQuery;
  Query2: TADOQuery;
  NewFrameTypeID: Integer;
  TestType: Integer;
begin
  TestType := ADODataset2.FieldByName('ParamValue').Value;
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    EvalTest.TestType := TestType.ToString;
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + EvalTest.TestID.ToString);
    SQL.Add('Update EvalTests set ParamValue =' + TestType.ToString);
    SQL.Add('where ParamID = 3 and TestID = @TestID');
    ExecSQL;
  end;
  Query2 := TADOQuery.Create(Nil);
  with query2 do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + EvalTest.TestID.ToString);
    SQL.Add('delete from EvalTests');
    SQL.Add('where ParamID != 3 and TestID = @TestID');
    ExecSQL;
    Free;
  end;
  EvalTest.FrameType := 0;
  ClearAllElements; // Clear visual elements in text boxes
  EvalTest.ResetParameters;
  ShowFrame;
end;

procedure TEvalFrame.HideAllElements;
begin
  SpecEdit.Visible := False;
  SpecLabel.Visible := False;
  SymbolComboBox.Visible :=  False;
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
  TargetCheckBox.Visible := False;
end;

procedure TEvalFrame.SpeedButton1Click(Sender: TObject);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('delete from EvalTests where TestID = ' + EvalTest.TestID.ToString);
    ExecSQL;
    Free;
  end;
  Destroy;
end;

procedure TEvalFrame.SpeedButton2Click(Sender: TObject);
begin
  Self.ShowFrame;
end;

procedure TEvalFrame.TargetCheckBoxClick(Sender: TObject);
begin
  if TargetCheckBox.Checked then
  begin
    PlusTolLabeledEdit.Visible :=  False;
    PlusTolLabel.Visible :=  False;
    MinusTolLabeledEdit.Visible :=  False;
    MinusTolLabel.Visible :=  False;
  end
  else
  begin
    PlusTolLabeledEdit.Visible :=  True;
    PlusTolLabel.Visible :=  True;
    MinusTolLabeledEdit.Visible :=  True;
    MinusTolLabel.Visible :=  True;
  end;
end;

procedure TEvalFrame.UpdateParameter(Sender: TObject);
begin
  if (Sender = SpecEdit) and (SpecEdit.Text <> '') then
    EvalTest.UpdateParameters(SpecEdit.Text, SpecParam) // SpecEdit.Text
  else if (Sender = SpecEdit1) and (SpecEdit1.AEdit.Text <> '') then
    EvalTest.UpdateParameters(SpecEdit1.AEdit.Text, SpecParam) // SpecEdit.Text
  else if (Sender = RankEdit) and (RankEdit.Text <> '') then
    EvalTest.UpdateParameters(RankEdit.Text, RankParam)
  else if (Sender = SymbolComboBox) and (SymbolComboBox.ItemIndex <> -1) then
    EvalTest.UpdateParameters(SymbolComboBox.ItemIndex.ToString, SymbolParam)
  else if (Sender = FromLambdaLabeledEdit) and (FromLambdaLabeledEdit.Text <> '') then
    EvalTest.UpdateParameters(FromLambdaLabeledEdit.Text, FromLambdaParam)
  else if (Sender = ToLambdaLabeledEdit) and (ToLambdaLabeledEdit.Text <> '') then
    EvalTest.UpdateParameters(ToLambdaLabeledEdit.Text, ToLambdaParam)
  else if (Sender = AtLambdaLabeledEdit) and (AtLambdaLabeledEdit.Text <> '') then
    EvalTest.UpdateParameters(AtLambdaLabeledEdit.Text, AtLambdaParam)
  else if (Sender = PlusTolLabeledEdit) and (PlusTolLabeledEdit.Text <> '') then
    EvalTest.UpdateParameters(PlusTolLabeledEdit.Text, PlusTolParam)
  else if (Sender = MinusTolLabeledEdit) and (MinusTolLabeledEdit.Text <> '') then
    EvalTest.UpdateParameters(MinusTolLabeledEdit.Text, MinusTolParam);
end;

end.
