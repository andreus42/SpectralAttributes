object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1230
  Height = 421
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
    Height = 20
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
    Left = 1198
    Top = 0
    Width = 32
    Height = 421
    Align = alRight
    Alignment = taCenter
    Caption = 'TestID'
    Layout = tlCenter
    ExplicitTop = 3
    ExplicitHeight = 110
  end
  object SpecEdit: TEdit
    Tag = 7
    Left = 264
    Top = 3
    Width = 75
    Height = 20
    Alignment = taCenter
    TabOrder = 2
    Visible = False
    OnExit = UpdateParameter
  end
  object RankEdit: TEdit
    Left = 29
    Top = 3
    Width = 24
    Height = 20
    Alignment = taCenter
    TabOrder = 0
    OnChange = UpdateParameter
  end
  object SymbolComboBox: TComboBox
    Left = 194
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
    Left = 960
    Top = 3
    Width = 73
    Height = 20
    TabStop = False
    Caption = 'Ref Only'
    TabOrder = 4
    Visible = False
  end
  object FilepathEdit: TLabeledEdit
    Left = 264
    Top = 63
    Width = 492
    Height = 24
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'Filepath'
    LabelPosition = lpLeft
    TabOrder = 3
    Visible = False
    OnExit = UpdateParameter
  end
  object NoTolCheckBox: TCheckBox
    Left = 1039
    Top = 3
    Width = 73
    Height = 20
    TabStop = False
    Caption = 'No Tol'
    TabOrder = 5
    Visible = False
    OnClick = NolTolCheckBoxClick
  end
  object NewSpecComboBox: TComboBox
    Left = 67
    Top = 3
    Width = 121
    Height = 21
    DropDownCount = 50
    TabOrder = 6
    OnCloseUp = NewSpecComboBoxCloseUp
  end
  object FromLambdaEdit: DoulbedLabeledEdit_v3
    Left = 376
    Top = 3
    Width = 129
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 85
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 24
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = 'From'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -8
    LLabel.ExplicitHeight = 13
    RLabel.Left = 115
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 160
    RLabel.ExplicitHeight = 13
    LCaption = 'From'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 7
    TabStop = False
    Text = ''
  end
  object ToLambdaEdit: DoulbedLabeledEdit_v3
    Left = 511
    Top = 3
    Width = 129
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 85
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 21
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '   To'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 115
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 251
    RLabel.ExplicitHeight = 13
    LCaption = '   To'
    OnExit = UpdateParameter
    TabOrder = 8
    TabStop = False
    Text = ''
  end
  object AtLambdaEdit: DoulbedLabeledEdit_v3
    Left = 376
    Top = 33
    Width = 129
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 85
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 20
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '   At'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 115
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 200
    RLabel.ExplicitHeight = 13
    LCaption = '   At'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 9
    TabStop = False
    Text = ''
  end
  object MinusTolEdit: DoulbedLabeledEdit_v3
    Left = 781
    Top = 3
    Width = 129
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 85
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 19
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '     -'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 115
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 251
    RLabel.ExplicitHeight = 13
    LCaption = '     -'
    OnExit = UpdateParameter
    TabOrder = 10
    TabStop = False
    Text = ''
  end
  object PlusTolEdit: DoulbedLabeledEdit_v3
    Left = 646
    Top = 3
    Width = 129
    Height = 24
    AEdit.Left = 26
    AEdit.Top = 0
    AEdit.Width = 85
    AEdit.Height = 21
    AEdit.Alignment = taCenter
    AEdit.TabOrder = 0
    AEdit.OnExit = UpdateParameter
    LLabel.Left = 0
    LLabel.Top = 0
    LLabel.Width = 20
    LLabel.Height = 24
    LLabel.Align = alLeft
    LLabel.Alignment = taRightJustify
    LLabel.Caption = '    +'
    LLabel.Layout = tlCenter
    LLabel.ExplicitLeft = -3
    LLabel.ExplicitHeight = 13
    RLabel.Left = 115
    RLabel.Top = 0
    RLabel.Width = 14
    RLabel.Height = 24
    RLabel.Align = alRight
    RLabel.Caption = 'nm'
    RLabel.Layout = tlCenter
    RLabel.ExplicitLeft = 241
    RLabel.ExplicitHeight = 13
    LCaption = '    +'
    RCaption = 'nm'
    OnExit = UpdateParameter
    TabOrder = 11
    TabStop = False
    Text = ''
  end
end
