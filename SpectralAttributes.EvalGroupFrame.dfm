object EvalTestGroupFrame: TEvalTestGroupFrame
  Left = 0
  Top = 0
  Width = 1402
  Height = 810
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
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
    Width = 273
    Height = 810
    Align = alLeft
    BevelEdges = []
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
    object IDLabel: TLabel
      Left = 18
      Top = 418
      Width = 96
      Height = 13
      Caption = 'Group ID (Op Level)'
    end
    object OperationIDBoxLabel: TLabel
      Left = 8
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Operation'
    end
    object GroupSetLabel: TLabel
      Left = 69
      Top = 448
      Width = 45
      Height = 13
      Caption = 'GroupSet'
    end
    object TransformTextButton: TSpeedButton
      Left = 146
      Top = 210
      Width = 121
      Height = 26
      Caption = 'Transform Text >>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = TransformTextButtonClick
    end
    object AddSpecSpeedButton: TSpeedButton
      Left = 160
      Top = 24
      Width = 101
      Height = 26
      Caption = 'Add Spec'
      OnClick = AddSpecSpeedButtonClick
    end
    object CleanTextSpeedButton: TSpeedButton
      Left = 8
      Top = 210
      Width = 121
      Height = 26
      Caption = 'Clean Text'
      OnClick = CleanTextSpeedButtonClick
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
    object GroupFrameSetIDEDit: TEdit
      Left = 120
      Top = 442
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object SpecTextMemo: TLabeledMemo
      Left = 14
      Top = 56
      Width = 253
      Height = 148
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 253
      AMemo.Height = 135
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      AMemo.OnEnter = SpecTextMemoLabledMemoEnter
      AMemo.OnExit = SpecTextMemoLabledMemoExit
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 253
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'SpectralText'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 73
      Caption = 'SpectralText'
      FieldWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelSpacing = 1
      ParentFont = False
      TabOrder = 2
      TabStop = False
      Text = ''
    end
    object CommentsMemo2: TLabeledMemo
      Left = 8
      Top = 242
      Width = 253
      Height = 106
      AMemo.Left = 0
      AMemo.Top = 13
      AMemo.Width = 253
      AMemo.Height = 93
      AMemo.Align = alClient
      AMemo.TabOrder = 0
      ALabel.Left = 0
      ALabel.Top = 0
      ALabel.Width = 253
      ALabel.Height = 13
      ALabel.Align = alTop
      ALabel.Caption = 'Comments'
      ALabel.Font.Charset = DEFAULT_CHARSET
      ALabel.Font.Color = clWindowText
      ALabel.Font.Height = -11
      ALabel.Font.Name = 'Tahoma'
      ALabel.Font.Style = [fsBold]
      ALabel.ParentFont = False
      ALabel.Layout = tlCenter
      ALabel.ExplicitWidth = 61
      Caption = 'Comments'
      FieldWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelSpacing = 1
      ParentFont = False
      TabOrder = 3
      TabStop = False
      Text = ''
    end
    object TestEditBox: TEdit
      Left = 69
      Top = 528
      Width = 121
      Height = 21
      TabOrder = 4
      OnKeyPress = TestEditBoxKeyPress
    end
  end
  object GroupDescEdit: TEdit
    Left = 120
    Top = 415
    Width = 121
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 1
    Text = 'IDBox'
  end
  object EvalScrollBox: TScrollBox
    Left = 273
    Top = 0
    Width = 1129
    Height = 810
    Align = alClient
    TabOrder = 2
  end
end
