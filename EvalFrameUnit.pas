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
    ADODataSet1TypeID: TStringField;
    ADODataSet1ParamName: TStringField;
    SymbolComboBox: TComboBox;
    constructor CreateWithTestID (AOwner: TComponent; TestID: Integer);
    constructor Create (AOwner: TComponent);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HideAllElements;
    procedure ShowFrame;
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure UpdateParameter(Sender: TObject);
    procedure InsertTestParameters(TestTypeID: Integer);
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
  ControlOffSet = 250;
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
            SymbolComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    3: begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            FromLambdaLabeledEdit.Visible := True;
            FromNmLabel.Visible := True;
            ToLambdaLabeledEdit.Visible := True;
            ToNmLabel.Visible := True;
        end;
    4: begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            AtLambdaLabeledEdit.Visible := True;
            AtNmLabel.Visible := True;
      end;
    5: begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
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
  TestIDLabel.Caption := 'TestID: ' + TestID.ToString;
  EvalTest := TEvalTest.Create(TestID);
  RankEdit.Text := EvalTest.Rank;
  TestType := EvalTest.TestType;
  ToLambdaLabeledEdit.Text := EvalTest.LambdaTo;
  FromLambdaLabeledEdit.Text := EvalTest.LambdaFrom;
  AtLambdaLabeledEdit.Text := EvalTest.LambdaAt;
  PlusTolLabeledEdit.Text := EvalTest.TolPlus;
  MinusTolLabeledEdit.Text := EvalTest.TolMinus;
  SpecEdit.Text := EvalTest.Value;
  FilePath := EvalTest.FilePath;
  SymbolComboBox.ItemIndex := EvalTest.Symbol;
  ShowFrame;
end;

procedure TEvalFrame.DBLookupComboBox1CloseUp(Sender: TObject);
var
  Query: TADOQuery;
begin
  TestType := ADODataset2.FieldByName('ParamValue').Value;
  Edit1.Text := TestType;
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + EvalTest.TestID.ToString);
    SQL.Add('Update EvalTests set ParamValue =' + TestType);
    SQL.Add('where ParamID = 3 and TestID = @TestID');
    ExecSQL;
    SQL.Add('delete from EvalTests');
    SQL.Add('where ParamID != 3 and TestID = @TestID');
    ExecSQL;
    Free;
  end;
  // create fields specific to test type

  case TestType.ToInteger of
    1: ShowMessage('Here');
  end;
  ShowFrame;
end;

procedure TEvalFrame.HideAllElements;
begin
  SpecEdit.Visible := False;
  SpecLabel.Visible := False;
  SignLookUpComboBox.Visible :=  False;
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
end;


procedure TEvalFrame.InsertTestParameters(TestTypeID: Integer);
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  with query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('Declare @TestID int =' + EvalTest.TestID.ToString);
    SQL.Add('Declare @GroupID int =' + EvalTest.TestID.ToString);
    SQL.Add('Declare @SetID int =' + EvalTest.TestID.ToString);
    SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 7, '''')');
    case TestTypeID of
      1: begin
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 10, '''')');
          SQL.Add('insert into EvalTests values (@TestID, @GroupID, @SetID, 11, '''')');
      end;
      2: begin
            SpecLabel.Caption := '%';
            SymbolComboBox.Visible := True;
            FromNmLabel.Visible := True;
            ToNmLabel.Visible := True;
      end;
      3: begin
            SpecLabel.Caption := 'OD';
            SpecLabel.Left := P2 - 18;
            SymbolComboBox.Visible := True;
            FromNmLabel.Visible := True;
            ToNmLabel.Visible := True;
      end;
      4: begin
              SpecLabel.Caption := '%';
              SymbolComboBox.Visible := True;
              AtNmLabel.Visible := True;
      end;
      5: begin
              SpecLabel.Caption := 'OD';
              SpecLabel.Left := P2 - 18;
              SymbolComboBox.Visible := True;
              AtNmLabel.Visible := True;
      end;
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
const
  RankParam = '2';
  TestTypeParam = '3' ;
  FromLambdaParam = '4';
  ToLambdaParam = '5';
  AtLambdaParam = '6';
  SpecParam = '7' ;
  FilepathParam = '8';
  SymbolParam = '9';
  PlusTolParam = '10';
  MinusTolParam = '11';

var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(Nil);
  Query.Connection := _ChromaDataModule.ChromaData;
  with Query do
  begin
    if (Sender = SpecEdit) and (SpecEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + SpecEdit.Text);
      SQL.Add('where ParamID = ' + SpecParam);
    end
    else if (Sender = RankEdit) and (RankEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + RankEdit.Text);
      SQL.Add('where ParamID = ' + RankParam);
    end
    else if (Sender = SymbolComboBox) and (SymbolComboBox.ItemIndex <> -1) then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + SymbolComboBox.ItemIndex.ToString);
      SQL.Add('where ParamID = ' + SymbolParam);
    end
    else if (Sender = FromLambdaLabeledEdit) and (FromLambdaLabeledEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + FromLambdaLabeledEdit.Text);
      SQL.Add('where ParamID = ' + FromLambdaParam);
    end
    else if (Sender = ToLambdaLabeledEdit) and (ToLambdaLabeledEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + ToLambdaLabeledEdit.Text);
      SQL.Add('where ParamID = ' + ToLambdaParam);
    end
    else if (Sender = AtLambdaLabeledEdit) and (AtLambdaLabeledEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + AtLambdaLabeledEdit.Text);
      SQL.Add('where ParamID = ' + AtLambdaParam);
    end
    else if (Sender = PlusTolLabeledEdit) and (PlusTolLabeledEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + PlusTolLabeledEdit.Text);
      SQL.Add('where ParamID = ' + PlusTolParam)
    end
    else if (Sender = MinusTolLabeledEdit) and (MinusTolLabeledEdit.Text <> '') then
    begin
      SQL.Add('Update EvalTests set ParamValue = ' + MinusTolLabeledEdit.Text);
      SQL.Add('where ParamID = ' + MinusTolParam);
    end;
    SQL.Add('and TestID = ' + EvalTest.TestID.ToString);
    ExecSQL;
    Free
  end;
end;

//Initialization
//
//Finalization

end.
