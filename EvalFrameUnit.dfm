object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 30
  Align = alClient
  TabOrder = 0
  object AtNmLabel: TLabel
    Left = 679
    Top = 9
    Width = 14
    Height = 13
    Caption = 'nm'
    Visible = False
  end
  object FromNmLabel: TLabel
    Left = 472
    Top = 9
    Width = 14
    Height = 13
    Caption = 'nm'
    Visible = False
  end
  object MinusTolLabel: TLabel
    Left = 892
    Top = 9
    Width = 14
    Height = 13
    Caption = 'nm'
    Visible = False
  end
  object PlusTolLabel: TLabel
    Left = 791
    Top = 9
    Width = 14
    Height = 13
    Caption = 'nm'
    Visible = False
  end
  object SpecLabel: TLabel
    Left = 352
    Top = 9
    Width = 11
    Height = 13
    Caption = '%'
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 3
    Width = 23
    Height = 24
    Caption = '-'
    OnClick = SpeedButton1Click
  end
  object TestIDLabel: TLabel
    Left = 1165
    Top = 9
    Width = 32
    Height = 13
    Alignment = taCenter
    Caption = 'TestID'
    Layout = tlCenter
  end
  object ToNmLabel: TLabel
    Left = 541
    Top = 9
    Width = 14
    Height = 13
    Caption = 'nm'
    Layout = tlBottom
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 59
    Top = 6
    Width = 126
    Height = 21
    DataField = 'ParamValue'
    DataSource = DataSource2
    DropDownRows = 40
    KeyField = 'TypeID'
    ListField = 'ParamName'
    ListSource = DataSource1
    TabOrder = 0
    OnCloseUp = DBLookupComboBox1CloseUp
  end
  object AtLambdaLabeledEdit: TLabeledEdit
    Left = 598
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'At'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    TabOrder = 1
    Visible = False
  end
  object SignLookUpComboBox: TDBLookupComboBox
    Left = 202
    Top = 5
    Width = 47
    Height = 21
    DataField = 'ParamValue'
    DataSource = DataSource4
    KeyField = 'ID'
    ListField = 'Symbol'
    ListSource = DataSource3
    TabOrder = 2
    Visible = False
  end
  object FromLambdaLabeledEdit: TLabeledEdit
    Left = 391
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'From'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    TabOrder = 3
    Visible = False
  end
  object MinusTolLabeledEdit: TLabeledEdit
    Left = 811
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 4
    EditLabel.Height = 13
    EditLabel.Caption = '-'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    TabOrder = 4
    Visible = False
  end
  object PlusTolLabeledEdit: TLabeledEdit
    Left = 710
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 8
    EditLabel.Height = 13
    EditLabel.Caption = '+'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    TabOrder = 5
    Visible = False
  end
  object SpecEdit: TEdit
    Left = 271
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    TabOrder = 6
    Visible = False
    OnChange = SpecEditChange
  end
  object ToLambdaLabeledEdit: TLabeledEdit
    Left = 508
    Top = 5
    Width = 75
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = 'To'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    TabOrder = 7
    Visible = False
  end
  object RankEdit: TEdit
    Left = 29
    Top = 5
    Width = 24
    Height = 21
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 944
    Top = 5
    Width = 89
    Height = 21
    TabOrder = 9
    Text = 'Edit1'
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 'select * from TestTypes'
    Parameters = <>
    Left = 944
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 992
  end
  object ADODataSet2: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 
      'declare @TestID int'#13#10'set @TestID = :TestID'#13#10#13#10'select ParamValue ' +
      'from EvalTests'#13#10'where ParamID = 3'#13#10'and TestID = @TestID'
    Parameters = <
      item
        Name = 'TestID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 968
    object ADODataSet2ParamValue: TStringField
      FieldName = 'ParamValue'
      Size = 32
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 1024
  end
  object ADODataSet3: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 'select ID, Symbol from TestSymbols'
    Parameters = <>
    Left = 1056
  end
  object ADODataSet4: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 
      'declare @TestID int'#13#10'set @TestID = :TestID'#13#10#13#10'select ParamValue ' +
      'from EvalTests'#13#10'where ParamID = 10'#13#10'and TestID = 1234'
    Parameters = <
      item
        Name = 'TestID'
        DataType = ftWideString
        Size = 4
        Value = '1234'
      end>
    Left = 1088
  end
  object DataSource3: TDataSource
    DataSet = ADODataSet3
    Left = 1120
  end
  object DataSource4: TDataSource
    DataSet = ADODataSet4
    Left = 1152
  end
end
