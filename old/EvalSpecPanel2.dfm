object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 1109
  Height = 26
  TabOrder = 0
  object EvalTestPanel: TPanel
    Left = 0
    Top = 0
    Width = 1109
    Height = 26
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 929
    ExplicitHeight = 41
    object FromLabel: TLabel
      Left = 195
      Top = 3
      Width = 30
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'From'
      Layout = tlCenter
    end
    object ToLabel: TLabel
      Left = 340
      Top = 3
      Width = 12
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'To'
      Layout = tlCenter
    end
    object PlusLabel: TLabel
      Left = 610
      Top = 3
      Width = 15
      Height = 20
      AutoSize = False
      Caption = '  +  '
      Layout = tlCenter
    end
    object MinusLabel: TLabel
      Left = 663
      Top = 3
      Width = 20
      Height = 20
      AutoSize = False
      Caption = '  -  '
      Layout = tlCenter
    end
    object SpecLabel: TLabel
      Left = 477
      Top = 3
      Width = 35
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'Spec'
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 23
      Top = 3
      Width = 23
      Height = 20
      Caption = '-'
    end
    object NumLabel: TLabel
      Left = 0
      Top = 3
      Width = 25
      Height = 20
      Alignment = taCenter
      Caption = '#'
      Layout = tlCenter
    end
    object TestNameComboBox: TComboBox
      Left = 48
      Top = 3
      Width = 137
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      TabOrder = 4
      TextHint = 'Test type'
    end
    object FromEdit: TEdit
      Left = 225
      Top = 3
      Width = 100
      Height = 20
      Hint = 'From'
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 0
      TextHint = 'From Val'
    end
    object ToEdit: TEdit
      Left = 359
      Top = 3
      Width = 100
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 1
      TextHint = 'To Val'
    end
    object PlusEdit: TEdit
      Left = 627
      Top = 3
      Width = 30
      Height = 20
      AutoSize = False
      TabOrder = 5
      TextHint = 'Plus'
    end
    object MinusEdit: TEdit
      Left = 675
      Top = 3
      Width = 30
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 2
      TextHint = 'Minus'
    end
    object SpecEdit: TEdit
      Left = 506
      Top = 3
      Width = 100
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 3
      TextHint = 'Spec Val'
    end
  end
end
