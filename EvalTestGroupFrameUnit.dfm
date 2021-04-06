object EvalTestGroupFrame: TEvalTestGroupFrame
  Left = 0
  Top = 0
  Width = 1363
  Height = 830
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1363
    Height = 249
    Align = alTop
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 11
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Group ID'
    end
    object SpecTextMemo: TMemo
      Left = 11
      Top = 41
      Width = 318
      Height = 160
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object IDBox: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = 'IDBox'
    end
    object LoadButton: TButton
      Left = 42
      Top = 206
      Width = 66
      Height = 26
      Caption = 'Load'
      TabOrder = 2
    end
    object Button5: TButton
      Left = 114
      Top = 206
      Width = 134
      Height = 26
      Caption = 'Parse'
      TabOrder = 3
    end
    object AddEvalTestButton: TButton
      Left = 11
      Top = 206
      Width = 25
      Height = 25
      Caption = '+'
      TabOrder = 4
      OnClick = AddEvalTestButtonClick
    end
    object SetUpPanel: TPanel
      Left = 351
      Top = 41
      Width = 698
      Height = 160
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      object Label4: TLabel
        Left = 14
        Top = 19
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
        Left = 42
        Top = 66
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
        Left = 37
        Top = 104
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
        Left = 145
        Top = 104
        Width = 12
        Height = 13
        Caption = 'To'
      end
      object ComboBox1: TComboBox
        Left = 67
        Top = 20
        Width = 121
        Height = 21
        DropDownCount = 10
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 67
        Top = 63
        Width = 38
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 67
        Top = 101
        Width = 60
        Height = 21
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 167
        Top = 101
        Width = 57
        Height = 21
        TabOrder = 3
      end
    end
  end
  object EvalScrollBox: TScrollBox
    Left = 0
    Top = 249
    Width = 1363
    Height = 653
    Align = alTop
    BevelEdges = []
    Color = clGradientActiveCaption
    ParentColor = False
    TabOrder = 1
  end
  object Edit4: TEdit
    Left = 1128
    Top = 111
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit4'
  end
end
