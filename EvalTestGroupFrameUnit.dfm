object EvalTestGroupFrame: TEvalTestGroupFrame
  Left = 0
  Top = 0
  Width = 1093
  Height = 757
  TabOrder = 0
  object Label3: TLabel
    Left = 13
    Top = 10
    Width = 48
    Height = 13
    Caption = 'Operation'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1093
    Height = 281
    Align = alTop
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object IDLabel: TLabel
      Left = 13
      Top = 10
      Width = 62
      Height = 13
      Caption = 'Operation ID'
    end
    object Label6: TLabel
      Left = 140
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Operation'
    end
    object IDBox: TEdit
      Left = 13
      Top = 29
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = 'IDBox'
    end
    object ParseTextButton: TButton
      Left = 296
      Top = 231
      Width = 77
      Height = 26
      Caption = 'Parse Text'
      TabOrder = 1
      TabStop = False
    end
    object ParseButton: TButton
      Left = 211
      Top = 231
      Width = 79
      Height = 26
      Caption = 'S^3 Parse'
      TabOrder = 2
      TabStop = False
    end
    object AddEvalTestButton: TButton
      Left = 11
      Top = 230
      Width = 94
      Height = 27
      Caption = 'Add Eval Test'
      TabOrder = 3
      TabStop = False
      OnClick = AddEvalTestButtonClick
    end
    object SetUpPanel: TPanel
      Left = 407
      Top = 72
      Width = 360
      Height = 152
      BevelEdges = []
      BorderStyle = bsSingle
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object Label4: TLabel
        Left = 15
        Top = 99
        Width = 47
        Height = 13
        Alignment = taCenter
        Caption = 'Capability'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ComboBox1: TComboBox
        Left = 68
        Top = 97
        Width = 125
        Height = 21
        DropDownCount = 10
        TabOrder = 0
      end
      object LabeledEdit1: TLabeledEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'AOI'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object LabeledEdit2: TLabeledEdit
        Left = 72
        Top = 43
        Width = 121
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'From'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object LabeledEdit3: TLabeledEdit
        Left = 72
        Top = 70
        Width = 121
        Height = 21
        EditLabel.Width = 12
        EditLabel.Height = 13
        EditLabel.Caption = 'To'
        LabelPosition = lpLeft
        TabOrder = 3
      end
    end
    object Button1: TButton
      Left = 111
      Top = 230
      Width = 94
      Height = 27
      Caption = 'Add Setup Param'
      TabOrder = 5
      TabStop = False
      OnClick = AddEvalTestButtonClick
    end
    object SpecTextMemo: TLabledMemo
      Left = 13
      Top = 56
      Width = 360
      Height = 168
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 360
      AMemo.Height = 155
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 360
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'Spectral Text'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 76
      Caption = 'Spectral Text'
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 6
      TabStop = False
      Text = ''
    end
  end
  object EvalScrollBox: TScrollBox
    Left = 0
    Top = 281
    Width = 1093
    Height = 476
    Align = alClient
    BevelEdges = []
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
  end
  object GroupDescEdit: TEdit
    Left = 140
    Top = 29
    Width = 121
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 2
    Text = 'IDBox'
  end
end
