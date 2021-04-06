object SpecEvalTestFrame: TSpecEvalTestFrame
  Left = 0
  Top = 0
  Width = 1363
  Height = 830
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1363
    Height = 179
    Align = alTop
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 33
      Top = 12
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label6: TLabel
      Left = 33
      Top = 59
      Width = 20
      Height = 13
      Caption = 'Last'
    end
    object Label5: TLabel
      Left = 33
      Top = 35
      Width = 21
      Height = 13
      Caption = 'First'
    end
    object Label4: TLabel
      Left = 7
      Top = 84
      Width = 47
      Height = 13
      Caption = 'Capability'
    end
    object Label1: TLabel
      Left = 568
      Top = 35
      Width = 59
      Height = 24
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 568
      Top = 74
      Width = 59
      Height = 24
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Memo1: TMemo
      Left = 203
      Top = 10
      Width = 318
      Height = 159
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object LastNameBox: TEdit
      Left = 60
      Top = 57
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'LastNameBox'
      OnExit = LastNameBoxExit
    end
    object FirstNameBox: TEdit
      Left = 60
      Top = 33
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'FirstNameBox'
      OnExit = FirstNameBoxExit
    end
    object IDBox: TEdit
      Left = 60
      Top = 9
      Width = 121
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
      Text = 'IDBox'
    end
    object ComboBox1: TComboBox
      Left = 60
      Top = 84
      Width = 121
      Height = 21
      DropDownCount = 10
      TabOrder = 4
      Text = 'ComboBox1'
    end
    object LoadButton: TButton
      Left = 39
      Top = 147
      Width = 66
      Height = 26
      Caption = 'Load'
      TabOrder = 5
    end
    object Button5: TButton
      Left = 8
      Top = 111
      Width = 173
      Height = 26
      Caption = 'Parse'
      TabOrder = 6
    end
    object AddEvalTestButton: TButton
      Left = 8
      Top = 148
      Width = 25
      Height = 25
      Caption = '+'
      TabOrder = 7
      OnClick = AddEvalTestButtonClick
    end
    object Button1: TButton
      Left = 111
      Top = 148
      Width = 75
      Height = 25
      Caption = '+2'
      TabOrder = 8
      OnClick = Button1Click
    end
  end
  object EvalScrollBox: TScrollBox
    Left = 0
    Top = 179
    Width = 1363
    Height = 653
    Align = alTop
    BevelEdges = []
    Color = clGradientActiveCaption
    ParentColor = False
    TabOrder = 1
  end
end
