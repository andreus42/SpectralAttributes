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
  DoubledLabeledEdit_v3,
  ChromaPackageLite;

type
  TEvalFrame = class(TFrame)
    RemoveSpecButton: TSpeedButton;
    SpecEdit: TEdit;
    SpecLabel: TLabel;
    TestIDLabel: TLabel;
    RankEdit: TEdit;
    SymbolComboBox: TComboBox;
    RefOnlyCheckBox: TCheckBox;
    FilepathEdit: TLabeledEdit;
    FromLambdaEdit: DoulbedLabeledEdit_v3;
    AtLambdaEdit: DoulbedLabeledEdit_v3;
    ToLambdaEdit: DoulbedLabeledEdit_v3;
    PlusTolEdit: DoulbedLabeledEdit_v3;
    MinusTolEdit: DoulbedLabeledEdit_v3;
    NoTolCheckBox: TCheckBox;
    NewSpecComboBox: TComboBox;
    constructor Create (AOwner: TComponent; TempEvalTest: TEvalTest);
    procedure RemoveSpecButtonClick(Sender: TObject);
    procedure HideAllElements;
    procedure ClearVisualElements;
    procedure ShowFrame;
    procedure UpdateParameter(Sender: TObject);
    procedure EditKeyPressEnter(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AddComboBoxItemsFromDB;
    procedure NewSpecComboBoxCloseUp(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure RefOnlyCheckBoxClick(Sender: TObject);
    procedure NolTolCheckBoxClick(Sender: TObject);
    procedure ParamChange(Sender: TObject);
  private
    { Private declarations }
  public
    EvalTest: TEvalTest;
    FrameGroupID: Integer;
  end;

const
  DarkMode = False;

implementation

uses
  SpectralAttributes.EvalGroupFrame;

{$R *.dfm}

constructor TEvalFrame.Create(AOwner: TComponent; TempEvalTest: TEvalTest);   // refactor to have eval test as parameter
var
  Query: TADOQuery;
begin
  inherited Create(AOwner);
  EvalTest := TempEvalTest;
  AddComboBoxItemsFromDB;
  NewSpecComboBox.ItemIndex := EvalTest.TestType.ToInteger;

  //existing code
  TestIDLabel.Caption := 'TestID: ' + EvalTest.TestID.ToString;

  //SPEC not reading in
//  RankEdit.Text := EvalTest.Rank;
  SpecEdit.Text := EvalTest.Value;
  ////
  ToLambdaEdit.AEdit.Text := EvalTest.LambdaTo;
  FromLambdaEdit.AEdit.Text := EvalTest.LambdaFrom;
  AtLambdaEdit.AEdit.Text := EvalTest.LambdaAt;
  PlusTolEdit.AEdit.Text := EvalTest.TolPlus;
  MinusTolEdit.AEdit.Text := EvalTest.TolMinus;
  FilepathEdit.Text := EvalTest.FilePath;
  SymbolComboBox.ItemIndex := EvalTest.Symbol;
  FrameGroupID := EvalTest.GroupID;
  RefOnlyCheckBox.Checked := EvalTest.RefOnly.ToBoolean;
  NoTolCheckBox.Checked := EvalTest.NoTol.ToBoolean;
  ShowFrame;
end;

procedure TEvalFrame.FrameEnter(Sender: TObject);
begin
  Color := clInactiveCaption;
end;

procedure TEvalFrame.FrameExit(Sender: TObject);
begin
  Color := clBtnFace;
  (Owner.Owner as TEvalTestGroupFrame).GroupStringify;
end;


procedure TEvalFrame.ShowFrame;
const
  ControlOffSet = 290;
  Spacing = 125;
  P1 = 210;
  P2 = ControlOffSet + Spacing*0;
  P3 = ControlOffSet + Spacing*1;
  P4 = ControlOffSet + Spacing*2;
  P5 = ControlOffSet + Spacing*3+15;
  P6 = ControlOffSet + Spacing*4+15;
begin
  // Set locations of controls
  SpecEdit.Left := P2;
  SpecLabel.Left := P2 + 80; //label offset, see about doublelabeled edit
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

  // Set Top
  SpecEdit.Top := 3;
  SpecLabel.Top := 3;
  SymbolComboBox.Top := 3;
  SpecEdit.Top := 3;
  FromLambdaEdit.Top := 3;
  ToLambdaEdit.Top := 3;
  AtLambdaEdit.Top := 3;
  PlusTolEdit.Top := 3;
  MinusTolEdit.Top := 3;
  RefOnlyCheckBox.Top := 3;
  NoTolCheckBox.Top := 3;

  // Show control fields based on test type
  case EvalTest.FrameType of
    0:  HideAllElements;
    1:  begin       //With Tol+, Tol-, CWL, FWHM, Cuton, Cutoff
          SpecLabel.Caption := 'nm';
          if (EvalTest.NoTol.ToBoolean = False) then
          begin
            PlusTolEdit.Visible := True;
            MinusTolEdit.Visible := True;
          end
          else
          begin
            PlusTolEdit.Visible := False;
            MinusTolEdit.Visible := False;
          end;
          RefOnlyCheckBox.Visible := True;
          if (EvalTest.RefOnly.ToBoolean = True) then
            NoTolCheckBox.Visible := True
          else
            NoTolCheckBox.Visible := False;
        end;
    2:  begin // T-peak???, Blocking???
            SpecLabel.Caption := '%';           //????
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

procedure TEvalFrame.AddComboBoxItemsFromDB;
var
  Query: TADOQuery;
  TestTypeID: Integer;
  TestName: String;
begin
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select TypeID, ParamName from EvalTestTypes');
    Open;
    while not eof do
    begin
      TestTypeID := Query.FieldByName('TypeID').Value;
      TestName := Query.FieldByName('ParamName').Value;
      NewSpecComboBox.Items.Add(TestName);
      Next;
    End;
    Close;
    Free;
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
  RefOnlyCheckBox.Visible :=  False;
  NoTolCheckBox.Visible :=  False;
end;

procedure TEvalFrame.RefOnlyCheckBoxClick(Sender: TObject);
begin
  if (RefOnlyCheckBox.Checked = True) and (EvalTest.FrameType = 1) then
    NoTolCheckBox.Visible := True
  else if (RefOnlyCheckBox.Checked = False) and (EvalTest.FrameType = 1) then
  begin
    NoTolCheckBox.Visible := False;
    PlusTolEdit.Visible :=  True;
    MinusTolEdit.Visible :=  True;
//    EvalTest.UpdateParameters(NoTolCheckBox.Checked.ToString, NoTolParam);
    EvalTest.UpdateParameters('0', NoTolParam);
  end;
  EvalTest.UpdateParameters(RefOnlyCheckBox.Checked.ToString, RefOnlyParam);
  (Owner.Owner as TEvalTestGroupFrame).GroupStringify;
end;

procedure TEvalFrame.RemoveSpecButtonClick(Sender: TObject);
begin
  EvalTest.Delete;
  (Owner.Owner as TEvalTestGroupFrame).GroupStringify;
  Self.Destroy;
end;

procedure TEvalFrame.ParamChange(Sender: TObject);
begin
  if (Sender = SpecEdit) then
    ValidateAsFloat(SpecEdit)
  else if (Sender = RankEdit)then
    ValidateAsFloat(RankEdit)
  else if (Sender = FromLambdaEdit.AEdit) then
    ValidateAsFloat(FromLambdaEdit.AEdit)
  else if (Sender = ToLambdaEdit.AEdit) then
    ValidateAsFloat(ToLambdaEdit.AEdit)
  else if (Sender = AtLambdaEdit.AEdit) then
    ValidateAsFloat(AtLambdaEdit.AEdit)
  else if (Sender = PlusTolEdit.AEdit) then
    ValidateAsFloat(PlusTolEdit.AEdit)
  else if (Sender = MinusTolEdit.AEdit) then
    ValidateAsFloat(MinusTolEdit.AEdit)
end;

procedure TEvalFrame.SpeedButton2Click(Sender: TObject);
begin
  Self.ShowFrame;
end;

procedure TEvalFrame.NewSpecComboBoxCloseUp(Sender: TObject);
var
  Query: TADOQuery;
  Query2: TADOQuery;
  NewFrameTypeID: Integer;
  ComboBoxTestType: Integer;
begin
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    if NewSpecComboBox.ItemIndex = -1 then NewSpecComboBox.ItemIndex := 0;
    EvalTest.TestType :=  NewSpecComboBox.ItemIndex.ToString;
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Update EvalTests set ParamValue = :ParamValue');
    SQL.Add('where ParamID = 3 and TestID = :TestID');
    Parameters.ParamByName('TestID').Value := EvalTest.TestID.ToString;
    Parameters.ParamByName('ParamValue').Value := EvalTest.TestType;
    ExecSQL;
  end;
  EvalTest.FrameType := EvalTest.GetFrameType;
  EvalTest.ResetParameters;
  ClearVisualElements;
  ShowFrame;
end;

procedure TEvalFrame.NolTolCheckBoxClick(Sender: TObject);
begin
  if (NoTolCheckBox.Checked = True) then //and (EvalTest.FrameType = 1)then
  begin
    PlusTolEdit.Visible :=  False;
    MinusTolEdit.Visible :=  False;
    PlusTolEdit.AEdit.Text := '';
    MinusTolEdit.AEdit.Text := '';
    EvalTest.UpdateParameters('', PlusTolParam);
    EvalTest.UpdateParameters('', MinusTolParam);
  end
  else if (NoTolCheckBox.Checked = False) then // and (EvalTest.FrameType = 1) then
  begin
    PlusTolEdit.Visible :=  True;
    MinusTolEdit.Visible :=  True;
    PlusTolEdit.AEdit.Text := '0';
    MinusTolEdit.AEdit.Text := '0';
    EvalTest.UpdateParameters('0', PlusTolParam);
    EvalTest.UpdateParameters('0', MinusTolParam);
  end;
  EvalTest.UpdateParameters(NoTolCheckBox.Checked.ToString, NoTolParam);
  (Owner.Owner as TEvalTestGroupFrame).GroupStringify;
end;

procedure TEvalFrame.UpdateParameter(Sender: TObject);
begin
  if (Sender = SpecEdit) and ValidateAsFloat(SpecEdit) then
    EvalTest.UpdateParameters(SpecEdit.Text, SpecParam) // TODO: Change second conditions to validate as real

    ////something is also screwed up here
  else if (Sender = RankEdit) and ValidateAsInt(RankEdit) then
    EvalTest.UpdateParameters(RankEdit.Text, RankParam)

  else if (Sender = SymbolComboBox) and (SymbolComboBox.ItemIndex <> -1) then
    EvalTest.UpdateParameters(SymbolComboBox.ItemIndex.ToString, SymbolParam)
  else if (Sender = FromLambdaEdit.AEdit) and ValidateAsFloat(FromLambdaEdit.AEdit) then
    EvalTest.UpdateParameters(FromLambdaEdit.AEdit.Text, FromLambdaParam)
  else if (Sender = ToLambdaEdit.AEdit) and ValidateAsFloat(ToLambdaEdit.AEdit) then
    EvalTest.UpdateParameters(ToLambdaEdit.AEdit.Text, ToLambdaParam)
  else if (Sender = AtLambdaEdit.AEdit) and ValidateAsFloat(AtLambdaEdit.AEdit) then
      EvalTest.UpdateParameters(AtLambdaEdit.AEdit.Text, AtLambdaParam)
  else if (Sender = PlusTolEdit.AEdit) and ValidateAsFloat(PlusTolEdit.AEdit) then
    EvalTest.UpdateParameters(PlusTolEdit.AEdit.Text, PlusTolParam)
  else if (Sender = MinusTolEdit.AEdit) and ValidateAsFloat(MinusTolEdit.AEdit) then
    EvalTest.UpdateParameters(MinusTolEdit.AEdit.Text, MinusTolParam)
  else if (Sender = FilepathEdit) and (FilepathEdit.Text <> '') then
    EvalTest.UpdateParameters(FilepathEdit.Text, FilepathParam);
end;

procedure TEvalFrame.EditKeyPressEnter(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      UpdateParameter(Sender);
     (Owner.Owner as TEvalTestGroupFrame).GroupStringify;
    end;
end;

end.
