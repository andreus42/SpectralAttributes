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
    Width = 276
    Height = 810
    Align = alLeft
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
    object IDLabel: TLabel
      Left = 140
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Group ID (Op Level)'
    end
    object Label6: TLabel
      Left = 8
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Operation'
    end
    object GroupSetLabel: TLabel
      Left = 44
      Top = 59
      Width = 45
      Height = 13
      Caption = 'GroupSet'
    end
    object IDBox: TEdit
      Left = 8
      Top = 29
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = 'IDBox'
    end
    object CleanTextButton: TButton
      Left = 194
      Top = 364
      Width = 77
      Height = 26
      Caption = 'Clean Text'
      TabOrder = 1
      TabStop = False
      OnClick = CleanTextButtonClick
    end
    object SpecTextMemo: TLabledMemo
      Left = 10
      Top = 96
      Width = 260
      Height = 168
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 260
      AMemo.Height = 155
      AMemo.Align = alClient
      AMemo.Color = clBtnHighlight
      AMemo.Font.Charset = DEFAULT_CHARSET
      AMemo.Font.Color = clBlack
      AMemo.Font.Height = -11
      AMemo.Font.Name = 'Tahoma'
      AMemo.Font.Style = []
      AMemo.ParentFont = False
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
      Color = clActiveBorder
      FieldWidth = 100
      LabelSpacing = 1
      ParentColor = False
      TabOrder = 2
      TabStop = False
      Text = ''
    end
    object TextToParseMemo: TLabledMemo
      Left = 8
      Top = 444
      Width = 258
      Height = 168
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 258
      AMemo.Height = 155
      AMemo.Align = alClient
      AMemo.Font.Charset = DEFAULT_CHARSET
      AMemo.Font.Color = clYellow
      AMemo.Font.Height = -11
      AMemo.Font.Name = 'Tahoma'
      AMemo.Font.Style = []
      AMemo.ParentFont = False
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
      Left = 10
      Top = 270
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
      Color = clActiveBorder
      FieldWidth = 100
      LabelSpacing = 1
      ParentColor = False
      TabOrder = 4
      TabStop = False
      Text = ''
    end
    object TestCommentsMemo: TLabledMemo
      Left = 8
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
    object GroupFrameSetIDEDit: TEdit
      Left = 95
      Top = 56
      Width = 89
      Height = 21
      TabOrder = 6
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
  object ScrollBoxPanel: TPanel
    Left = 276
    Top = 0
    Width = 1126
    Height = 810
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 281
    ExplicitWidth = 1121
    object ControlsPanel: TPanel
      Left = 1
      Top = 1
      Width = 112
      Height = 808
      Align = alLeft
      ParentBackground = False
      TabOrder = 0
      object AddEvalTestButton: TButton
        Left = 5
        Top = 65
        Width = 101
        Height = 27
        Caption = 'Add Eval Test'
        TabOrder = 0
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
      object AddSetupParamButton: TButton
        Left = 5
        Top = 117
        Width = 101
        Height = 27
        Caption = 'Add Setup Param'
        TabOrder = 1
        TabStop = False
        OnClick = AddEvalTestButtonClick
      end
      object S3ParseButton: TButton
        Left = 5
        Top = 169
        Width = 101
        Height = 26
        Caption = '<< S^3 Parse'
        TabOrder = 2
        TabStop = False
        OnClick = S3ParseButtonClick
      end
      object TransformButton: TButton
        Left = 5
        Top = 222
        Width = 101
        Height = 25
        Caption = 'Transform Text >>'
        TabOrder = 3
        OnClick = TransformButtonClick
      end
    end
    object EvalScrollBox: TScrollBox
      Left = 113
      Top = 1
      Width = 1012
      Height = 808
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitWidth = 1010
      ExplicitHeight = 806
    end
  end
end
