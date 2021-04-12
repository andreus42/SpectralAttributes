object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1015
  Height = 31
  Align = alClient
  TabOrder = 0
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 3
    Width = 23
    Height = 21
    Caption = '-'
    OnClick = SpeedButton1Click
  end
  object TestIDLabel: TLabel
    Left = 940
    Top = 0
    Width = 75
    Height = 31
    Align = alRight
    Alignment = taCenter
    Caption = 'Setup Param ID'
    Layout = tlCenter
    ExplicitLeft = 947
    ExplicitHeight = 13
  end
  object DBSetupLookupComboBox: TDBLookupComboBox
    Left = 59
    Top = 3
    Width = 126
    Height = 21
    DataField = 'ParamValue'
    DataSource = DataSource2
    DropDownRows = 40
    KeyField = 'TypeID'
    ListField = 'ParamName'
    ListSource = DataSource1
    TabOrder = 0
    OnCloseUp = DBSetupLookupComboBoxCloseUp
  end
  object RankEdit: TEdit
    Left = 29
    Top = 3
    Width = 24
    Height = 21
    TabOrder = 1
    OnChange = UpdateParameter
  end
  object AtLambdaEdit: DoulbedLabeledEdit_v3
    Left = 441
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 33
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '       To'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -6
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 25
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '       To'
    RCaption = 'nm'
    TabOrder = 2
    TabStop = False
    Text = ''
  end
  object DoulbedLabeledEdit_v31: DoulbedLabeledEdit_v3
    Left = 318
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 30
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '  From'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = 3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 25
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '  From'
    RCaption = 'nm'
    TabOrder = 3
    TabStop = False
    Text = ''
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 'select * from SetupParamTypes'
    Parameters = <>
    Left = 808
    object ADODataSet1TypeID: TStringField
      FieldName = 'TypeID'
      Size = 32
    end
    object ADODataSet1ParamName: TStringField
      FieldName = 'ParamName'
      Size = 32
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 872
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
        Value = 1233
      end>
    Left = 840
    object ADODataSet2ParamValue: TStringField
      DisplayWidth = 15
      FieldName = 'ParamValue'
      Size = 32
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 1016
  end
end
