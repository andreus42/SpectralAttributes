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
  TEvalTestUnit, DoubledLabeledEdit, DoubledLabeledEdit_v3;

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
    FromLambdaEdit_v3: DoulbedLabeledEdit_v3;
    AtLambdaEdit_v3: DoulbedLabeledEdit_v3;
    ToLambdaEdit_v3: DoulbedLabeledEdit_v3;
    PlusTolEdit_v3: DoulbedLabeledEdit_v3;
    MinusTolEdit_v3: DoulbedLabeledEdit_v3;
    constructor CreateWithTestID (AOwner: TComponent; TestID: Integer);
    constructor Create (AOwner: TComponent);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ClearAllElements;
    procedure ShowFrame;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure UpdateParameter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RefOnlyCheckBoxClick(Sender: TObject);
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

  ToLambdaEdit_v3.Text := EvalTest.LambdaTo;
  FromLambdaEdit_v3.Text := EvalTest.LambdaFrom;
  PlusTolEdit_v3.Text := EvalTest.TolPlus;
  MinusTolEdit_v3.Text := EvalTest.TolMinus;

  SpecEdit.Text := EvalTest.Value;
  FilepathEdit.Text := EvalTest.FilePath;
  SymbolComboBox.ItemIndex := EvalTest.Symbol;
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
begin
  // Set locations of controls
  SpecEdit.Left := P2;
  SpecLabel.Left := P2 + LabelOffset;
  SymbolComboBox.Left := P1;
  SpecEdit.Left := P2;
  FromLambdaEdit_v3.Left := P3;
  ToLambdaEdit_v3.Left := P4;
  AtLambdaEdit_v3.Left := P3;
  PlusTolEdit_v3.Left := P3;
  MinusTolEdit_v3.Left := P4;
  RefOnlyCheckBox.Left := P5;
  HideAllElements;
  SpecEdit.Visible := True;
  SpecLabel.Visible := True;
  // Show control fields based on test type

  case EvalTest.FrameType of
    0:  HideAllElements;
    1:  begin
            SpecLabel.Caption := 'nm';
            PlusTolEdit_v3.Visible := True;
            MinusTolEdit_v3.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    2:  begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            FromLambdaEdit_v3.Visible := True;
            ToLambdaEdit_v3.Visible := True;
        end;
    3:  begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            FromLambdaEdit_v3.Visible := True;
            ToLambdaEdit_v3.Visible := True;
        end;
    4:  begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            AtLambdaEdit_v3.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
    5:  begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            AtLambdaEdit_v3.Visible := True;
            RefOnlyCheckBox.Visible := True;
        end;
  end;
end;

procedure TEvalFrame.ClearAllElements;
begin
  SpecEdit.Text := '';
  ToLambdaEdit_v3.Text :=  '';
  FromLambdaEdit_v3.Text := '';
  PlusTolEdit_v3.Text := '';
  AtLambdaEdit_v3.Text := '';
  MinusTolEdit_v3.Text := '';
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
  SpecEdit.Visible :=  False;
  SymbolComboBox.Visible :=  False;
  ToLambdaEdit_v3.Visible :=  False;
  FromLambdaEdit_v3.Visible :=  False;
  AtLambdaEdit_v3.Visible :=  False;
  PlusTolEdit_v3.Visible :=  False;
  MinusTolEdit_v3.Visible :=  False;

  AtLambdaEdit_v3.Visible :=  False;
  PlusTolEdit_v3.Visible :=  False;
  MinusTolEdit_v3.Visible :=  False;
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

procedure TEvalFrame.RefOnlyCheckBoxClick(Sender: TObject);
begin
  if (RefOnlyCheckBox.Checked = True) and (EvalTest.FrameType = 1)then
  begin
    PlusTolEdit_v3.Visible :=  False;
    MinusTolEdit_v3.Visible :=  False;
  end
  else if (RefOnlyCheckBox.Checked = False) and (EvalTest.FrameType = 1) then
  begin
    PlusTolEdit_v3.Visible :=  True;
    MinusTolEdit_v3.Visible :=  True;
  end;
end;

procedure TEvalFrame.UpdateParameter(Sender: TObject);
begin
  if (Sender = SpecEdit) and (SpecEdit.Text <> '') then
    EvalTest.UpdateParameters(SpecEdit.Text, SpecParam) // SpecEdit.Text
  else if (Sender = RankEdit) and (RankEdit.Text <> '') then
    EvalTest.UpdateParameters(RankEdit.Text, RankParam)
  else if (Sender = SymbolComboBox) and (SymbolComboBox.ItemIndex <> -1) then
    EvalTest.UpdateParameters(SymbolComboBox.ItemIndex.ToString, SymbolParam)

    //----------------------Adding
  else if (Sender = FromLambdaEdit_v3) and (FromLambdaEdit_v3.AEdit.Text <> '') then
    EvalTest.UpdateParameters(FromLambdaEdit_v3.AEdit.Text, FromLambdaParam)

  else if (Sender = ToLambdaEdit_v3) and (ToLambdaEdit_v3.AEdit.Text <> '') then
    EvalTest.UpdateParameters(ToLambdaEdit_v3.AEdit.Text, ToLambdaParam)

  else if (Sender = AtLambdaEdit_v3) and (AtLambdaEdit_v3.AEdit.Text <> '') then
    EvalTest.UpdateParameters(AtLambdaEdit_v3.AEdit.Text, AtLambdaParam)

  else if (Sender = PlusTolEdit_v3) and (PlusTolEdit_v3.AEdit.Text <> '') then
    EvalTest.UpdateParameters(PlusTolEdit_v3.AEdit.Text, PlusTolParam)

  else if (Sender = MinusTolEdit_v3) and (MinusTolEdit_v3.AEdit.Text <> '') then
    EvalTest.UpdateParameters(MinusTolEdit_v3.AEdit.Text, MinusTolParam);

end;

end.
