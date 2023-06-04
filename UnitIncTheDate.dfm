object IncTheDate: TIncTheDate
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1077#1076#1080#1085#1080#1094#1091' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
  Align = alClient
  ParentShowHint = False
  ShowHint = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = -5
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 33
      Height = 23
      Align = alLeft
      Caption = #1044#1072#1090#1072': '
      ExplicitHeight = 13
    end
    object poData: TMaskEdit
      Left = 34
      Top = 1
      Width = 91
      Height = 23
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
      Align = alLeft
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '  .  .    '
      OnExit = poDataExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 320
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 77
      Height = 23
      Align = alLeft
      Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1085#1072': '
      ExplicitHeight = 13
    end
    object poIncrease: TSpinEdit
      Left = 78
      Top = 1
      Width = 54
      Height = 23
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1095#1080#1089#1083#1086
      Align = alLeft
      MaxValue = 0
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0
      ExplicitLeft = 75
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 50
    Width = 320
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 50
      Height = 23
      Align = alLeft
      Caption = #1045#1076#1080#1085#1080#1094#1072': '
      ParentShowHint = False
      ShowHint = False
      ExplicitHeight = 13
    end
    object poUnit: TComboBox
      Left = 51
      Top = 1
      Width = 81
      Height = 21
      Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1077#1076#1080#1085#1080#1094#1091' '#1091#1074#1077#1083#1080#1095#1077#1085#1080#1103
      Align = alLeft
      Style = csDropDownList
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = #1044#1077#1085#1100
      Items.Strings = (
        #1044#1077#1085#1100
        #1052#1077#1089#1103#1094
        #1043#1086#1076)
      ExplicitLeft = 48
    end
  end
end
