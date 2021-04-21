object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1230
  Height = 28
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
    Left = 1198
    Top = 0
    Width = 32
    Height = 28
    Align = alRight
    Alignment = taCenter
    Caption = 'TestID'
    Layout = tlCenter
    ExplicitHeight = 13
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
    TabOrder = 8
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
    Alignment = taCenter
    TabOrder = 0
    OnChange = UpdateParameter
  end
  object SymbolComboBox: TComboBox
    Left = 191
    Top = 3
    Width = 47
    Height = 21
    TabOrder = 1
    TabStop = False
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
    Left = 904
    Top = 5
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Ref Only'
    TabOrder = 10
    Visible = False
    OnClick = RefOnlyCheckBoxClick
  end
  object FilepathEdit: TLabeledEdit
    Left = 342
    Top = 3
    Width = 417
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'Filepath'
    LabelPosition = lpLeft
    TabOrder = 3
    Visible = False
    OnExit = UpdateParameter
  end
  object FromLambdaEdit: DoulbedLabeledEdit_v3
    Left = 404
    Top = 3
    Width = 125
    Height = 21
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 33
    LLabel.Height = 21
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Anchors = [akLeft, akTop, akRight, akBottom]
    LLabel.Caption = '  From '
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 21
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '  From '
    RCaption = 'nm'
    TabOrder = 4
    TabStop = False
    Text = ''
  end
  object AtLambdaEdit: DoulbedLabeledEdit_v3
    Left = 524
    Top = 3
    Width = 125
    Height = 21
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
    LLabel.Height = 21
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Anchors = [akLeft, akTop, akRight, akBottom]
    LLabel.Caption = '      At'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 21
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '      At'
    RCaption = 'nm'
    TabOrder = 9
    TabStop = False
    Text = ''
  end
  object ToLambdaEdit: DoulbedLabeledEdit_v3
    Left = 524
    Top = 3
    Width = 125
    Height = 21
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 33
    LLabel.Height = 21
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Anchors = [akLeft, akTop, akRight, akBottom]
    LLabel.Caption = '      To '
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 21
    RLabel.Align = alRight
    RLabel.Anchors = [akRight]
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '      To '
    RCaption = 'nm'
    TabOrder = 5
    TabStop = False
    Text = ''
  end
  object PlusTolEdit: DoulbedLabeledEdit_v3
    Left = 647
    Top = 3
    Width = 125
    Height = 21
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 32
    LLabel.Height = 21
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Anchors = [akLeft, akTop, akRight, akBottom]
    LLabel.Caption = '        +'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 21
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '        +'
    RCaption = 'nm'
    TabOrder = 6
    TabStop = False
    Text = ''
  end
  object MinusTolEdit: DoulbedLabeledEdit_v3
    Left = 765
    Top = 3
    Width = 125
    Height = 21
    AEdit.Left = 33
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 31
    LLabel.Height = 21
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '         -'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 111
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 21
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '         -'
    RCaption = 'nm'
    TabOrder = 7
    TabStop = False
    Text = ''
  end
  object NoTolCheckBox: TCheckBox
    Left = 983
    Top = 5
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'No Tol'
    TabOrder = 11
    Visible = False
    OnClick = RefOnlyCheckBoxClick
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = _ChromaDataModule.ChromaData
    CursorType = ctStatic
    CommandText = 'select * from TestTypes'
    Parameters = <>
    Left = 1080
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
    Left = 1128
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
    Left = 1104
    object ADODataSet2ParamValue: TStringField
      DisplayWidth = 15
      FieldName = 'ParamValue'
      Size = 32
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 1152
  end
end
