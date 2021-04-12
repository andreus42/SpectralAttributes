object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1015
  Height = 31
  Align = alClient
  TabOrder = 0
  object SpecLabel: TLabel
    Left = 244
    Top = 7
    Width = 11
    Height = 13
    Caption = '%'
    Layout = tlCenter
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 3
    Width = 23
    Height = 21
    Caption = '-'
    OnClick = SpeedButton1Click
  end
  object TestIDLabel: TLabel
    Left = 966
    Top = 0
    Width = 49
    Height = 31
    Align = alRight
    Alignment = taCenter
    Caption = 'TestID'
    Layout = tlCenter
    ExplicitLeft = 977
  end
  object DBLookupComboBox1: TDBLookupComboBox
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
    OnCloseUp = DBLookupComboBox1CloseUp
  end
  object SpecEdit: TEdit
    Tag = 7
    Left = 261
    Top = 3
    Width = 75
    Height = 21
    Alignment = taCenter
    TabOrder = 2
    Visible = False
    OnExit = UpdateParameter
  end
  object RankEdit: TEdit
    Left = 29
    Top = 3
    Width = 24
    Height = 21
    TabOrder = 3
    OnChange = UpdateParameter
  end
  object SymbolComboBox: TComboBox
    Left = 191
    Top = 3
    Width = 47
    Height = 21
    TabOrder = 1
    Visible = False
    OnChange = UpdateParameter
    Items.Strings = (
      '>='
      '>'
      '='
      '<='
      '<')
  end
  object RefOnlyCheckBox: TCheckBox
    Left = 864
    Top = 7
    Width = 73
    Height = 17
    Caption = 'Ref Only'
    TabOrder = 4
    Visible = False
    OnClick = RefOnlyCheckBoxClick
  end
  object FilepathEdit: TLabeledEdit
    Left = 272
    Top = 3
    Width = 38
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'Filepath'
    LabelPosition = lpLeft
    TabOrder = 5
    Visible = False
    OnExit = UpdateParameter
  end
  object FromLambdaEdit_v3: DoulbedLabeledEdit_v3
    Left = 342
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 36
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '   From '
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 25
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 107
    LCaption = '   From '
    RCaption = 'nm'
    TabOrder = 6
    TabStop = False
    Text = ''
  end
  object AtLambdaEdit_v3: DoulbedLabeledEdit_v3
    Left = 473
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
    LLabel.Width = 29
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '      At'
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
    RLabel.ExplicitLeft = 114
    RLabel.ExplicitHeight = 13
    LCaption = '       At'
    RCaption = 'nm'
    TabOrder = 7
    TabStop = False
    Text = ''
  end
  object ToLambdaEdit_v3: DoulbedLabeledEdit_v3
    Left = 470
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 36
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '       To '
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -6
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 25
    RLabel.Align = alRight
    RLabel.Caption = 'nm  '
    RLabel.Layout = tlCenter
    LCaption = '       To '
    RCaption = 'nm'
    TabOrder = 8
    TabStop = False
    Text = ''
  end
  object PlusTolEdit_v3: DoulbedLabeledEdit_v3
    Left = 601
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 29
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '       +'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 25
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 114
    RLabel.ExplicitHeight = 13
    LCaption = '       +'
    RCaption = 'nm'
    TabOrder = 9
    TabStop = False
    Text = ''
  end
  object MinusTolEdit_v3: DoulbedLabeledEdit_v3
    Left = 724
    Top = 3
    Width = 125
    Height = 25
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 28
    LLabel.Height = 25
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '        -'
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
    RLabel.ExplicitLeft = 114
    RLabel.ExplicitHeight = 13
    LCaption = '        -'
    RCaption = 'nm'
    TabOrder = 10
    TabStop = False
    Text = ''
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 'select * from TestTypes'
    Parameters = <>
    Left = 944
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
        Value = 1233
      end>
    Left = 968
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
