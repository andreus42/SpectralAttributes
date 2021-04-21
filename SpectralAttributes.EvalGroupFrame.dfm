object EvalTestGroupFrame: TEvalTestGroupFrame
  Left = 0
  Top = 0
  Width = 1402
  Height = 810
  TabOrder = 0
  object GroupLabel: TLabel
    Left = 13
    Top = 10
    Width = 48
    Height = 13
    Caption = 'Operation'
  end
  object GroupPanel: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 810
    Align = alLeft
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
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
      Left = 15
      Top = 332
      Width = 77
      Height = 26
      Caption = 'Clean Text'
      TabOrder = 1
      TabStop = False
      OnClick = ParseTextButtonClick
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
      TabOrder = 2
      TabStop = False
      Text = ''
    end
    object TextToParseMemo: TLabledMemo
      Left = 15
      Top = 444
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
      TabOrder = 3
      TabStop = False
      Text = ''
    end
    object CommentsMemo: TLabledMemo
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
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 260
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'Operation Comments'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 120
      Caption = 'Operation Comments'
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 4
      TabStop = False
      Text = ''
    end
    object TestCommentsMemo: TLabledMemo
      Left = 13
      Top = 618
      Width = 260
      Height = 89
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 260
      AMemo.Height = 76
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 260
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'Test Comments'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 89
      Caption = 'Test Comments'
      FieldWidth = 100
      LabelSpacing = 1
      TabOrder = 5
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
  object Panel1: TPanel
    Left = 281
    Top = 0
    Width = 1121
    Height = 810
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object EvalScrollBox: TScrollBox
      Left = 113
      Top = 1
      Width = 1007
      Height = 808
      Align = alClient
      BevelEdges = []
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 112
      Height = 808
      Align = alLeft
      TabOrder = 1
      object ParseButton: TButton
        Left = 9
        Top = 160
        Width = 94
        Height = 26
        Caption = 'S^3 Parse'
        TabOrder = 0
        TabStop = False
        OnClick = ParseButtonClick
      end
      object Button1: TButton
        Left = 9
        Top = 114
        Width = 94
        Height = 27
        Caption = 'Add Setup Param'
        TabOrder = 1
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
      object AddEvalTestButton: TButton
        Left = 9
        Top = 69
        Width = 94
        Height = 27
        Caption = 'Add Eval Test'
        TabOrder = 2
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
      object TransformButton: TButton
        Left = 9
        Top = 206
        Width = 94
        Height = 25
        Caption = 'Text-to-table'
        TabOrder = 3
        OnClick = TransformButtonClick
      end
      object GroupFrameSetIDEDit: TEdit
        Left = 17
        Top = 297
        Width = 89
        Height = 21
        TabOrder = 4
      end
    end
  end
end
