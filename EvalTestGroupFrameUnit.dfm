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
    Height = 265
    Align = alTop
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
    object SpecTextMemo: TMemo
      Left = 11
      Top = 56
      Width = 318
      Height = 160
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object IDBox: TEdit
      Left = 13
      Top = 29
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = 'IDBox'
    end
    object LoadButton: TButton
      Left = 164
      Top = 223
      Width = 77
      Height = 26
      Caption = 'Load Existing'
      TabOrder = 2
    end
    object ParseButton: TButton
      Left = 79
      Top = 223
      Width = 79
      Height = 26
      Caption = 'Parse'
      TabOrder = 3
    end
    object AddEvalTestButton: TButton
      Left = 11
      Top = 222
      Width = 62
      Height = 27
      Caption = 'Add Test'
      TabOrder = 4
      OnClick = AddEvalTestButtonClick
    end
    object SetUpPanel: TPanel
      Left = 375
      Top = 53
      Width = 498
      Height = 160
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
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
  end
  object EvalScrollBox: TScrollBox
    Left = 0
    Top = 265
    Width = 1093
    Height = 492
    Align = alClient
    BevelEdges = []
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    ExplicitTop = 249
    ExplicitWidth = 1073
    ExplicitHeight = 480
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
