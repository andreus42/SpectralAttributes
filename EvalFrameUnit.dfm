object EvalFrame: TEvalFrame
  Left = 0
  Top = 0
  Width = 1200
  Height = 28
  TabOrder = 0
  object EvalTestPanel: TPanel
    Left = 0
    Top = 0
    Width = 1200
    Height = 28
    Align = alClient
    TabOrder = 0
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
    object NmLabel2: TLabel
      Left = 515
      Top = 6
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object NmLabel1: TLabel
      Left = 392
      Top = 6
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object NmLabel3: TLabel
      Left = 647
      Top = 6
      Width = 14
      Height = 13
      Caption = 'nm'
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 43
      Top = 3
      Width = 145
      Height = 21
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Item1'
        'Item2'
        'Item3')
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
        'Item1'
        'Item2'
        'Item3')
    end
    object ToLambdaLabeledEdit: TLabeledEdit
      Left = 436
      Top = 3
      Width = 75
      Height = 21
      EditLabel.Width = 12
      EditLabel.Height = 13
      EditLabel.Caption = 'To'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 2
      Visible = False
    end
    object FromLambdaLabeledEdit: TLabeledEdit
      Left = 333
      Top = 3
      Width = 75
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'From'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 3
      Visible = False
    end
    object AtLambdaLabeledEdit: TLabeledEdit
      Left = 568
      Top = 3
      Width = 75
      Height = 21
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'At'
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      TabOrder = 4
      Visible = False
    end
    object SpecLabeledEdit: TLabeledEdit
      Left = 689
      Top = 3
      Width = 75
      Height = 21
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = '%'
      EditLabel.Layout = tlCenter
      LabelPosition = lpRight
      TabOrder = 5
      Visible = False
    end
  end
end
