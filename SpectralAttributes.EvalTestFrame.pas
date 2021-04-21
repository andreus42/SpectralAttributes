unit SpectralAttributes.EvalTestFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,

  // Database
  Data.DB, Data.Win.ADODB,

  // Mine
  ChromaDataModule,
  SpectralAttributes.EvalTest,
  DoubledLabeledEdit,
  DoubledLabeledEdit_v3;

type
  TEvalFrame = class(TFrame)
    SpeedButton1: TSpeedButton;
    SpecEdit: TEdit;
    SpecLabel: TLabel;
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
    RefOnlyCheckBox: TCheckBox;
    FilepathEdit: TLabeledEdit;
    FromLambdaEdit: DoulbedLabeledEdit_v3;
    AtLambdaEdit: DoulbedLabeledEdit_v3;
    ToLambdaEdit: DoulbedLabeledEdit_v3;
    PlusTolEdit: DoulbedLabeledEdit_v3;
    MinusTolEdit: DoulbedLabeledEdit_v3;
    NoTolCheckBox: TCheckBox;
    constructor Create (AOwner: TComponent; TestID: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ClearVisualElements;
    procedure ShowFrame;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure UpdateParameter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NolTolCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    EvalTest: TEvalTest;
    FrameGroupID: Integer;
  end;

implementation

uses
  SpectralAttributes.EvalGroupFrame;

{$R *.dfm}

constructor TEvalFrame.Create(AOwner: TComponent; TestID: Integer);   // refactor to have eval test as parameter
var
  Query: TADOQuery;
begin
  inherited Create(AOwner);
  ///want to refactor out ADODataSets
  ADODataSet2.Parameters.ParamByName('TestID').Value := TestID;
  ADODataSet2.Requery();
  TestIDLabel.Caption := 'TestID: ' + TestID.ToString;
  EvalTest := TEvalTest.Create(TestID);
  RankEdit.Text := EvalTest.Rank;
  ToLambdaEdit.Text := EvalTest.LambdaTo;
  FromLambdaEdit.Text := EvalTest.LambdaFrom;
  AtLambdaEdit.Text := EvalTest.LambdaAt;
  PlusTolEdit.Text := EvalTest.TolPlus;
  MinusTolEdit.Text := EvalTest.TolMinus;
  SpecEdit.Text := EvalTest.Value;
  FilepathEdit.Text := EvalTest.FilePath;
  SymbolComboBox.ItemIndex := EvalTest.Symbol;
  FrameGroupID := EvalTest.GroupID;
  ShowFrame;
end;

procedure TEvalFrame.ShowFrame;
const
  ControlOffSet = 290;
  Spacing = 125;
  LabelOffset = 78;
  P1 = 200;
  P2 = ControlOffSet + Spacing*0;
  P3 = ControlOffSet + Spacing*1;
  P4 = ControlOffSet + Spacing*2;
  P5 = ControlOffSet + Spacing*3 + 15;
  P6 = ControlOffSet + Spacing*4;
begin
  // Set locations of controls
  SpecEdit.Left := P2;
  SpecLabel.Left := P2 + LabelOffset;
  SymbolComboBox.Left := P1;
  SpecEdit.Left := P2;
  FromLambdaEdit.Left := P3;
  ToLambdaEdit.Left := P4;
  AtLambdaEdit.Left := P3;
  PlusTolEdit.Left := P3;
  MinusTolEdit.Left := P4;
  RefOnlyCheckBox.Left := P5;
  NoTolCheckBox.Left := P6;
  HideAllElements;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;

  // Show control fields based on test type
  case EvalTest.FrameType of
    0:  HideAllElements;
    1:  begin       //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
            SpecLabel.Caption := 'nm';
            PlusTolEdit.Visible := True;
            MinusTolEdit.Visible := True;
            RefOnlyCheckBox.Visible := True;
            NoTolCheckBox.Visible := True;
        end;
    2:  begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            FromLambdaEdit.Visible := True;
            ToLambdaEdit.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    3:  begin //To-From: T-Avg, R-Avg
            SpecLabel.Caption := '%';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            FromLambdaEdit.Visible := True;
            ToLambdaEdit.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    4:  begin //At %: T-Avg@, R-Avg@
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            AtLambdaEdit.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    5:  begin //At OD: B-abs@
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            AtLambdaEdit.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    7:  begin // Filepath
          SpecLabel.Visible := False;
          SpecEdit.Visible := False;
          FilepathEdit.Left := P2;
          FilepathEdit.Visible := True;
        end;
  end;
end;

procedure TEvalFrame.ClearVisualElements;
begin
  SpecEdit.Text := '';
  ToLambdaEdit.Text :=  '';
  FromLambdaEdit.Text := '';
  PlusTolEdit.Text := '';
  AtLambdaEdit.Text := '';
  MinusTolEdit.Text := '';
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
  EvalTest.FrameType := EvalTest.GetFrameType;
  EvalTest.ResetParameters;
  ClearVisualElements; // Clear visual elements in text boxes
  ShowFrame;
end;


procedure TEvalFrame.HideAllElements;
begin
  SpecEdit.Visible := False;
  SpecLabel.Visible := False;
  SpecEdit.Visible :=  False;
  SymbolComboBox.Visible :=  False;
  ToLambdaEdit.Visible :=  False;
  FromLambdaEdit.Visible :=  False;
  AtLambdaEdit.Visible :=  False;
  PlusTolEdit.Visible :=  False;
  MinusTolEdit.Visible :=  False;
  AtLambdaEdit.Visible :=  False;
  PlusTolEdit.Visible :=  False;
  MinusTolEdit.Visible :=  False;
end;

procedure TEvalFrame.SpeedButton1Click(Sender: TObject);
// move whole DestroyEvalTest into EvalTest
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

procedure TEvalFrame.NolTolCheckBoxClick(Sender: TObject);
begin
  if (RefOnlyCheckBox.Checked = True) then //and (EvalTest.FrameType = 1)then
  begin
    PlusTolEdit.Visible :=  False;
    MinusTolEdit.Visible :=  False;
  end
  else if (RefOnlyCheckBox.Checked = False) then // and (EvalTest.FrameType = 1) then
  begin
    PlusTolEdit.Visible :=  True;
    MinusTolEdit.Visible :=  True;
  end;
end;

procedure TEvalFrame.UpdateParameter(Sender: TObject);
begin
  if (Sender = SpecEdit) and (SpecEdit.Text <> '') then
    EvalTest.UpdateParameters(SpecEdit.Text, SpecParam) // TODO: Change second conditions to validate as real
  else if (Sender = RankEdit) and (RankEdit.Text <> '') then
    EvalTest.UpdateParameters(RankEdit.Text, RankParam)
  else if (Sender = SymbolComboBox) and (SymbolComboBox.ItemIndex <> -1) then
    EvalTest.UpdateParameters(SymbolComboBox.ItemIndex.ToString, SymbolParam)
  else if (Sender = FromLambdaEdit.AEdit) and (FromLambdaEdit.AEdit.Text <> '') then
    EvalTest.UpdateParameters(FromLambdaEdit.AEdit.Text, FromLambdaParam)
  else if (Sender = ToLambdaEdit.AEdit) and (ToLambdaEdit.AEdit.Text <> '') then
    EvalTest.UpdateParameters(ToLambdaEdit.AEdit.Text, ToLambdaParam)
  else if (Sender = AtLambdaEdit.AEdit) and (AtLambdaEdit.AEdit.Text <> '') then
    EvalTest.UpdateParameters(AtLambdaEdit.AEdit.Text, AtLambdaParam)
  else if (Sender = PlusTolEdit.AEdit) and (PlusTolEdit.AEdit.Text <> '') then
    EvalTest.UpdateParameters(PlusTolEdit.AEdit.Text, PlusTolParam)
  else if (Sender = MinusTolEdit.AEdit) and (MinusTolEdit.AEdit.Text <> '') then
    EvalTest.UpdateParameters(MinusTolEdit.AEdit.Text, MinusTolParam)
  else if (Sender = FilepathEdit) and (FilepathEdit.Text <> '') then
    EvalTest.UpdateParameters(FilepathEdit.Text, FilepathParam);
end;

end.
