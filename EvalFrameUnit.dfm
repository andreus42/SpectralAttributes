object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 28
  Align = alTop
  TabOrder = 0
  object EvalTestPanel: TPanel
    Left = 0
    Top = 0
    Width = 1200
    Height = 28
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -40
    object RankLabel: TLabel
      Left = 29
      Top = 7
      Width = 8
      Height = 13
      Caption = '#'
    end
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 1
      Width = 23
      Height = 24
      Caption = '-'
      OnClick = SpeedButton1Click
    end
    object ToNmLabel: TLabel
      Left = 645
      Top = 6
      Width = 14
      Height = 13
      Caption = 'nm'
      Layout = tlBottom
      Visible = False
    end
    object FromNmLabel: TLabel
      Left = 520
      Top = 7
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object AtNmLabel: TLabel
      Left = 783
      Top = 7
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object SpecLabel: TLabel
      Left = 370
      Top = 7
      Width = 11
      Height = 13
      Caption = '%'
      Visible = False
    end
    object PlusTolLabel: TLabel
      Left = 911
      Top = 7
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object MinusTolLabel: TLabel
      Left = 1031
      Top = 7
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object TestIDLabel: TLabel
      Left = 1167
      Top = 1
      Width = 32
      Height = 26
      Align = alRight
      Alignment = taCenter
      Caption = 'TestID'
      Layout = tlCenter
      ExplicitLeft = 1136
      ExplicitTop = 6
      ExplicitHeight = 13
    end
    object ComboBox1: TComboBox
      Left = 43
      Top = 3
      Width = 145
      Height = 21
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'T-avg'
        'B-avg'
        'T-Avg@'
        'B-Avg@'
        'CWL')
    end
    object SignComboBox: TComboBox
      Left = 210
      Top = 3
      Width = 55
      Height = 21
      TabOrder = 1
      Visible = False
      OnChange = ComboBox1Change
      Items.Strings = (
        '>='
        '>'
        '='
        '<='
        '<')
    end
    object ToLambdaLabeledEdit: TLabeledEdit
      Left = 564
      Top = 3
      Width = 75
      Height = 21
      Alignment = taCenter
      EditLabel.Width = 12
      EditLabel.Height = 13
      EditLabel.Caption = 'To'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 2
      Visible = False
    end
    object FromLambdaLabeledEdit: TLabeledEdit
      Left = 439
      Top = 3
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
    object AtLambdaLabeledEdit: TLabeledEdit
      Left = 702
      Top = 3
      Width = 75
      Height = 21
      Alignment = taCenter
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'At'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 4
      Visible = False
    end
    object SpecEdit: TEdit
      Left = 289
      Top = 3
      Width = 75
      Height = 21
      Alignment = taCenter
      TabOrder = 5
      Visible = False
    end
    object PlusTolLabeledEdit: TLabeledEdit
      Left = 830
      Top = 3
      Width = 75
      Height = 21
      Alignment = taCenter
      EditLabel.Width = 8
      EditLabel.Height = 13
      EditLabel.Caption = '+'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 6
      Visible = False
    end
    object MinusTolLabeledEdit: TLabeledEdit
      Left = 950
      Top = 3
      Width = 75
      Height = 21
      Alignment = taCenter
      EditLabel.Width = 4
      EditLabel.Height = 13
      EditLabel.Caption = '-'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 7
      Visible = False
    end
  end
end
