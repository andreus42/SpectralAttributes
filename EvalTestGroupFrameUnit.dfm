object EvalTestGroupFrame: TEvalTestGroupFrame
  Left = 0
  Top = 0
  Width = 980
  Height = 793
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
    Width = 980
    Height = 361
    Align = alTop
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = -3
    object IDLabel: TLabel
      Left = 13
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Group ID (Op Level)'
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
      Left = 286
      Top = 167
      Width = 77
      Height = 26
      Caption = 'Clean Text'
      TabOrder = 1
      TabStop = False
      OnClick = ParseTextButtonClick
    end
    object SetUpPanel: TPanel
      Left = 670
      Top = 71
      Width = 283
      Height = 153
      BevelEdges = []
      BorderStyle = bsSingle
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
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
        Top = 8
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
    object SpecTextMemo: TLabledMemo
      Left = 13
      Top = 56
      Width = 260
      Height = 168
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 260
      AMemo.Height = 155
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 260
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
      TabOrder = 3
      TabStop = False
      Text = ''
    end
    object TextToParseMemo: TLabledMemo
      Left = 369
      Top = 56
      Width = 258
      Height = 168
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 258
      AMemo.Height = 155
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 258
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'Unformatted Text'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 102
      Caption = 'Unformatted Text'
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 4
      TabStop = False
      Text = ''
    end
    object TransformButton: TButton
      Left = 13
      Top = 333
      Width = 94
      Height = 25
      Caption = 'Text-to-table'
      TabOrder = 5
      OnClick = TransformButtonClick
    end
    object Button2: TButton
      Left = 311
      Top = 135
      Width = 33
      Height = 26
      Caption = '<<'
      TabOrder = 6
      TabStop = False
      OnClick = ParseTextButtonClick
    end
    object LabledMemo1: TLabledMemo
      Left = 13
      Top = 230
      Width = 260
      Height = 89
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 260
      AMemo.Height = 76
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      AMemo.ExplicitWidth = 100
      AMemo.ExplicitHeight = 90
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 260
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'LabeledMemo'
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 65
      Caption = ''
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 7
      TabStop = False
      Text = ''
    end
    object LabledMemo2: TLabledMemo
      Left = 369
      Top = 230
      Width = 260
      Height = 89
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 260
      AMemo.Height = 76
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      AMemo.ExplicitWidth = 100
      AMemo.ExplicitHeight = 90
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 260
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'LabeledMemo'
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 65
      Caption = ''
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 8
      TabStop = False
      Text = ''
    end
  end
  object GroupDescEdit: TEdit
    Left = 140
    Top = 29
    Width = 121
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 1
    Text = 'IDBox'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 361
    Width = 980
    Height = 432
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 2
    ExplicitTop = 273
    ExplicitWidth = 939
    ExplicitHeight = 497
    object EvalScrollBox: TScrollBox
      Left = 111
      Top = 15
      Width = 867
      Height = 415
      Align = alClient
      BevelEdges = []
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      ExplicitWidth = 825
      ExplicitHeight = 480
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 15
      Width = 109
      Height = 415
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 480
      object ParseButton: TButton
        Left = 3
        Top = 9
        Width = 94
        Height = 26
        Caption = 'S^3 Parse'
        TabOrder = 0
        TabStop = False
        OnClick = ParseButtonClick
      end
      object Button1: TButton
        Left = 3
        Top = 102
        Width = 94
        Height = 27
        Caption = 'Add Setup Param'
        TabOrder = 1
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
      object AddEvalTestButton: TButton
        Left = 3
        Top = 56
        Width = 94
        Height = 27
        Caption = 'Add Eval Test'
        TabOrder = 2
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
    end
  end
end
