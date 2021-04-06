object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 918
  Height = 23
  TabOrder = 0
  object EvalTestPanel: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 23
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -40
    ExplicitWidth = 956
    ExplicitHeight = 36
    object AddLabel: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 1
      Width = 32
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = False
      Caption = '  +   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1
      ExplicitHeight = 19
    end
    object RankLabel: TLabel
      AlignWithMargins = True
      Left = 63
      Top = 1
      Width = 57
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'TestRank    '
      ExplicitLeft = 22
      ExplicitHeight = 50
    end
    object FromLabel: TLabel
      AlignWithMargins = True
      Left = 375
      Top = 1
      Width = 24
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = False
      Caption = 'From'
      ExplicitLeft = 473
      ExplicitHeight = 13
    end
    object MinusLabel: TLabel
      Left = 790
      Top = 1
      Width = 22
      Height = 21
      Align = alLeft
      AutoSize = False
      Caption = '   -   '
      ExplicitLeft = 731
      ExplicitTop = 2
      ExplicitHeight = 26
    end
    object PlusLabel: TLabel
      Left = 738
      Top = 1
      Width = 20
      Height = 21
      Align = alLeft
      AutoSize = False
      Caption = '  +  '
      ExplicitLeft = 734
      ExplicitHeight = 29
    end
    object SpecLabel: TLabel
      AlignWithMargins = True
      Left = 609
      Top = 1
      Width = 35
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = False
      Caption = '  Spec  '
      ExplicitLeft = 893
      ExplicitHeight = 13
    end
    object ToLabel: TLabel
      AlignWithMargins = True
      Left = 520
      Top = 1
      Width = 12
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = False
      Caption = 'To'
      ExplicitLeft = 716
      ExplicitHeight = 13
    end
    object FromEdit: TEdit
      AlignWithMargins = True
      Left = 419
      Top = 1
      Width = 81
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      TabOrder = 0
      Text = 'FromEdit'
      ExplicitLeft = 517
      ExplicitWidth = 179
    end
    object ToEdit: TEdit
      AlignWithMargins = True
      Left = 552
      Top = 1
      Width = 37
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      TabOrder = 1
      Text = 'ToEdit'
      ExplicitLeft = 878
      ExplicitWidth = 200
      ExplicitHeight = 71
    end
    object MinusEdit: TEdit
      AlignWithMargins = True
      Left = 822
      Top = 1
      Width = 66
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Text = 'MinusEdit'
      ExplicitLeft = 836
      ExplicitTop = -2
      ExplicitWidth = 55
      ExplicitHeight = 29
    end
    object SpecEdit: TEdit
      AlignWithMargins = True
      Left = 664
      Top = 1
      Width = 64
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      TabOrder = 3
      Text = 'SpecEdit'
      ExplicitLeft = 938
      ExplicitWidth = 162
    end
    object TestNameComboBox: TComboBox
      AlignWithMargins = True
      Left = 140
      Top = 1
      Width = 145
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      TabOrder = 4
      Text = 'TestNameComboBox'
      ExplicitLeft = 95
      ExplicitTop = -2
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 305
      Top = 1
      Width = 50
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      TabOrder = 5
      Text = 'Edit2'
      ExplicitWidth = 148
    end
    object PlusEdit: TEdit
      Left = 758
      Top = 1
      Width = 32
      Height = 21
      Align = alLeft
      TabOrder = 6
      Text = 'PlusEdit'
      ExplicitLeft = 769
      ExplicitHeight = 29
    end
  end
end
