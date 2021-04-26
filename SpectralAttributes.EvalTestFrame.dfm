object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 865
  Height = 146
  Align = alClient
  Color = clBtnFace
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
  object SpecLabel: TLabel
    Left = 345
    Top = 3
    Width = 11
    Height = 13
    Caption = '%'
    Layout = tlCenter
    Visible = False
  end
  object RemoveSpecButton: TSpeedButton
    Left = 0
    Top = 3
    Width = 23
    Height = 20
    Caption = '-'
    OnClick = RemoveSpecButtonClick
  end
  object TestIDLabel: TLabel
    Left = 833
    Top = 0
    Width = 32
    Height = 146
    Align = alRight
    Alignment = taCenter
    Caption = 'TestID'
    Layout = tlCenter
    ExplicitHeight = 13
  end
  object SpecEdit: TEdit
    Tag = 7
    Left = 264
    Top = 3
    Width = 75
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Visible = False
    OnExit = UpdateParameter
    OnKeyPress = EditKeyPressEnter
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
    Left = 194
    Top = 3
    Width = 47
    Height = 21
    TabOrder = 2
    Visible = False
    OnChange = UpdateParameter
    OnKeyPress = EditKeyPressEnter
    Items.Strings = (
      '>='
      '>'
      '='
      '<='
      '<')
  end
  object RefOnlyCheckBox: TCheckBox
    Left = 672
    Top = 3
    Width = 73
    Height = 20
    TabStop = False
    Caption = 'Ref Only'
    TabOrder = 9
    Visible = False
  end
  object FilepathEdit: TLabeledEdit
    Left = 264
    Top = 103
    Width = 492
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'Filepath'
    LabelPosition = lpLeft
    TabOrder = 11
    Visible = False
    OnExit = UpdateParameter
  end
  object NoTolCheckBox: TCheckBox
    Left = 751
    Top = 3
    Width = 73
    Height = 20
    TabStop = False
    Caption = 'No Tol'
    TabOrder = 10
    Visible = False
    OnClick = NolTolCheckBoxClick
  end
  object NewSpecComboBox: TComboBox
    Left = 67
    Top = 3
    Width = 121
    Height = 21
    DropDownCount = 50
    TabOrder = 1
    OnCloseUp = NewSpecComboBoxCloseUp
    OnKeyPress = EditKeyPressEnter
  end
  object FromLambdaEdit: DoulbedLabeledEdit_v3
    Left = 376
    Top = 3
    Width = 121
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    AEdit.OnKeyPress = EditKeyPressEnter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 24
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = 'From'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 107
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = 'From'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 4
    TabStop = False
    Text = ''
  end
  object ToLambdaEdit: DoulbedLabeledEdit_v3
    Left = 511
    Top = 3
    Width = 122
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    AEdit.OnKeyPress = EditKeyPressEnter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 21
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '   To'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 108
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '   To'
    OnExit = UpdateParameter
    TabOrder = 6
    TabStop = False
    Text = ''
  end
  object AtLambdaEdit: DoulbedLabeledEdit_v3
    Left = 376
    Top = 33
    Width = 121
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    AEdit.OnKeyPress = EditKeyPressEnter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 20
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '   At'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 107
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '   At'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 5
    TabStop = False
    Text = ''
  end
  object MinusTolEdit: DoulbedLabeledEdit_v3
    Left = 511
    Top = 63
    Width = 124
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    AEdit.OnKeyPress = EditKeyPressEnter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 19
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '     -'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 110
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '     -'
    OnExit = UpdateParameter
    TabOrder = 8
    TabStop = False
    Text = ''
  end
  object PlusTolEdit: DoulbedLabeledEdit_v3
    Left = 374
    Top = 63
    Width = 123
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 75
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    AEdit.OnKeyPress = EditKeyPressEnter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 20
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '    +'
    LLabel.Layout = tlCenter
    LLabel.ExplicitHeight = 13
    RLabel.Left = 109
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitHeight = 13
    LCaption = '    +'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 7
    TabStop = False
    Text = ''
  end
end
