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
    Color = clActiveBorder
    ParentBackground = False
    TabOrder = 0
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
    object LoadButton: TButton
      Left = 296
      Top = 231
      Width = 77
      Height = 26
      Caption = 'Load Existing'
      TabOrder = 1
    end
    object ParseButton: TButton
      Left = 211
      Top = 231
      Width = 79
      Height = 26
      Caption = 'Parse'
      TabOrder = 2
    end
    object AddEvalTestButton: TButton
      Left = 11
      Top = 230
      Width = 94
      Height = 27
      Caption = 'Add Eval Test'
      TabOrder = 3
      OnClick = AddEvalTestButtonClick
    end
    object SetUpPanel: TPanel
      Left = 471
      Top = 53
      Width = 498
      Height = 160
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object Label4: TLabel
        Left = 7
        Top = 75
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
      object Label2: TLabel
        Left = 23
        Top = 12
        Width = 19
        Height = 13
        Alignment = taCenter
        Caption = 'AOI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 23
        Top = 39
        Width = 24
        Height = 13
        Alignment = taCenter
        Caption = 'From'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 133
        Top = 39
        Width = 12
        Height = 13
        Caption = 'To'
      end
      object ComboBox1: TComboBox
        Left = 60
        Top = 70
        Width = 149
        Height = 21
        DropDownCount = 10
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 59
        Top = 9
        Width = 60
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 59
        Top = 36
        Width = 60
        Height = 21
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 151
        Top = 36
        Width = 58
        Height = 21
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
