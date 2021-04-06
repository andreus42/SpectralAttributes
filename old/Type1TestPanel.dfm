object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 835
  Height = 27
  TabOrder = 0
  object Type1TestPanel: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 27
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object FromLabel: TLabel
      Left = 3
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
    object PlusLabel: TLabel
      Left = 395
      Top = 3
      Width = 15
      Height = 20
      AutoSize = False
      Caption = '  +  '
      Layout = tlCenter
    end
    object SpecLabel: TLabel
      Left = 265
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
    object MinusLabel: TLabel
      Left = 448
      Top = 3
      Width = 20
      Height = 20
      AutoSize = False
      Caption = '  -  '
      Layout = tlCenter
    end
    object ToLabel: TLabel
      Left = 140
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
    object FromEdit: TEdit
      Left = 28
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
    object PlusEdit: TEdit
      Left = 412
      Top = 3
      Width = 30
      Height = 20
      AutoSize = False
      TabOrder = 1
      TextHint = 'Plus'
    end
    object SpecEdit: TEdit
      Left = 290
      Top = 3
      Width = 100
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 2
      TextHint = 'Spec Val'
    end
    object MinusEdit: TEdit
      Left = 464
      Top = 3
      Width = 30
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 3
      TextHint = 'Minus'
    end
    object ToEdit: TEdit
      Left = 155
      Top = 3
      Width = 100
      Height = 20
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Alignment = taCenter
      AutoSize = False
      TabOrder = 4
      TextHint = 'To Val'
    end
  end
end
