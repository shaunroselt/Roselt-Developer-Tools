object Frame_NameGenerator: TFrame_NameGenerator
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 1693
  Height = 1185
  Margins.Left = 24
  Margins.Top = 24
  Margins.Right = 24
  Margins.Bottom = 24
  Color = 3947580
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  PixelsPerInch = 168
  object WebLabel1: TWebLabel
    Left = 0
    Top = 0
    Width = 1693
    Height = 47
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Configuration'
    Color = 3947580
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -35
    Font.Name = 'Segoe UI'
    Font.Style = []
    HeightPercent = 100.000000000000000000
    ParentFont = False
    WidthPercent = 100.000000000000000000
    ExplicitWidth = 214
  end
  object layLetterCase: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 150
    Width = 1693
    Height = 97
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 6
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 1
    Color = 2829099
    ShowCaption = False
    object imgLetterCase: TWebHTMLDiv
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 73
      Height = 73
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 9
      Margins.Bottom = 12
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 1' +
          '6 16">'
        
          '  <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3' +
          '.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0' +
          ' 0 0-.708.708L13.293 '
        
          '11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.' +
          '5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.70' +
          '8L2.707 4H14.5a.5.5 0 0 1 '
        '.5.5z"/>'
        '</svg>')
      Role = ''
    end
    object cbLetterCase: TWebComboBox
      AlignWithMargins = True
      Left = 1418
      Top = 12
      Width = 263
      Height = 38
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alRight
      Color = 3947580
      HeightPercent = 100.000000000000000000
      Text = 'Regular'
      WidthPercent = 100.000000000000000000
      ItemIndex = 0
      Items.Strings = (
        'Regular'
        'lower'
        'UPPER')
    end
    object layTitleDescriptionLetterCase: TWebPanel
      AlignWithMargins = True
      Left = 94
      Top = 12
      Width = 1324
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 2829099
      ShowCaption = False
      object lblDescriptionLetterCase: TWebLabel
        Left = 0
        Top = 38
        Width = 1324
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Select which letter case you want to use'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 370
      end
      object lblTitleLetterCase: TWebLabel
        Left = 0
        Top = 0
        Width = 1324
        Height = 38
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Letter Case'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 137
      end
    end
  end
  object layAmount: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 459
    Width = 1693
    Height = 97
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 6
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 1
    Color = 2829099
    ShowCaption = False
    object imgAmount: TWebHTMLDiv
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 73
      Height = 73
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 9
      Margins.Bottom = 12
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 1' +
          '6 16">'
        
          '  <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3' +
          '.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0' +
          ' 0 0-.708.708L13.293 '
        
          '11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.' +
          '5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.70' +
          '8L2.707 4H14.5a.5.5 0 0 1 '
        '.5.5z"/>'
        '</svg>')
      Role = ''
    end
    object layTitleDescriptionAmount: TWebPanel
      AlignWithMargins = True
      Left = 94
      Top = 12
      Width = 1324
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 2829099
      ShowCaption = False
      object lblDescriptionAmount: TWebLabel
        Left = 0
        Top = 38
        Width = 1324
        Height = 30
        Margins.Left = 16
        Margins.Top = 16
        Margins.Right = 16
        Margins.Bottom = 16
        Align = alTop
        Caption = 'Select how many names you want'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 315
      end
      object lblTitleAmount: TWebLabel
        Left = 0
        Top = 0
        Width = 1324
        Height = 38
        Margins.Left = 16
        Margins.Top = 16
        Margins.Right = 16
        Margins.Bottom = 16
        Align = alTop
        Caption = 'Amount'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 99
      end
    end
    object sbAmount: TWebSpinEdit
      AlignWithMargins = True
      Left = 1418
      Top = 12
      Width = 263
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alRight
      AutoSize = False
      BorderStyle = bsSingle
      ChildOrder = 2
      Color = 3947580
      Increment = 1
      MaxValue = 1000
      MinValue = 0
      Role = ''
      Value = 20
    end
  end
  object layNameList: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 47
    Width = 1693
    Height = 97
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 6
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 1
    Color = 2829099
    ShowCaption = False
    object imgNameList: TWebHTMLDiv
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 73
      Height = 73
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 9
      Margins.Bottom = 12
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 1' +
          '6 16">'
        
          '  <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3' +
          '.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0' +
          ' 0 0-.708.708L13.293 '
        
          '11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.' +
          '5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.70' +
          '8L2.707 4H14.5a.5.5 0 0 1 '
        '.5.5z"/>'
        '</svg>')
      Role = ''
    end
    object cbNameList: TWebComboBox
      AlignWithMargins = True
      Left = 1418
      Top = 12
      Width = 263
      Height = 38
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alRight
      Color = 3947580
      HeightPercent = 100.000000000000000000
      Text = 'Real Life'
      WidthPercent = 100.000000000000000000
      ItemIndex = 0
      Items.Strings = (
        'Real Life'
        'GTA Vice City'
        'GTA San Andreas')
    end
    object layTitleDescriptionNameList: TWebPanel
      AlignWithMargins = True
      Left = 94
      Top = 12
      Width = 1324
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 2829099
      ShowCaption = False
      object lblDescriptionNameList: TWebLabel
        Left = 0
        Top = 38
        Width = 1324
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Select what kind of names you want'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 334
      end
      object lblTitleNameList: TWebLabel
        Left = 0
        Top = 0
        Width = 1324
        Height = 38
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Name List'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 123
      end
    end
  end
  object layMaxLength: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 356
    Width = 1693
    Height = 97
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 6
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 1
    Color = 2829099
    ShowCaption = False
    object WebHTMLDiv2: TWebHTMLDiv
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 73
      Height = 73
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 9
      Margins.Bottom = 12
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 1' +
          '6 16">'
        
          '  <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3' +
          '.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0' +
          ' 0 0-.708.708L13.293 '
        
          '11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.' +
          '5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.70' +
          '8L2.707 4H14.5a.5.5 0 0 1 '
        '.5.5z"/>'
        '</svg>')
      Role = ''
    end
    object WebPanel5: TWebPanel
      AlignWithMargins = True
      Left = 94
      Top = 12
      Width = 1324
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 2829099
      ShowCaption = False
      object WebLabel5: TWebLabel
        Left = 0
        Top = 38
        Width = 1324
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Select the max length of the name.'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 325
      end
      object WebLabel6: TWebLabel
        Left = 0
        Top = 0
        Width = 1324
        Height = 38
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Max Length'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 145
      end
    end
    object sbMaxLength: TWebSpinEdit
      AlignWithMargins = True
      Left = 1418
      Top = 12
      Width = 263
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alRight
      AutoSize = False
      BorderStyle = bsSingle
      ChildOrder = 2
      Color = 3947580
      Increment = 1
      MaxValue = 1000
      MinValue = 6
      Role = ''
      Value = 100
    end
  end
  object laySurname: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 253
    Width = 1693
    Height = 97
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 6
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 1
    Color = 2829099
    ShowCaption = False
    object WebHTMLDiv3: TWebHTMLDiv
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 73
      Height = 73
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 9
      Margins.Bottom = 12
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 1' +
          '6 16">'
        
          '  <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3' +
          '.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0' +
          ' 0 0-.708.708L13.293 '
        
          '11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.' +
          '5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.70' +
          '8L2.707 4H14.5a.5.5 0 0 1 '
        '.5.5z"/>'
        '</svg>')
      Role = ''
    end
    object WebPanel7: TWebPanel
      AlignWithMargins = True
      Left = 94
      Top = 12
      Width = 1324
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 2829099
      ShowCaption = False
      ExplicitWidth = 1543
      object WebLabel7: TWebLabel
        Left = 0
        Top = 38
        Width = 1324
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Select whether you want to generate a surname or not'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 505
      end
      object WebLabel8: TWebLabel
        Left = 0
        Top = 0
        Width = 1324
        Height = 38
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Surname'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -28
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 110
      end
    end
    object SwitchSurname: TWebToggleButton
      AlignWithMargins = True
      Left = 1418
      Top = 12
      Width = 263
      Height = 73
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alRight
      Checked = True
    end
  end
  object layBottom: TWebPanel
    AlignWithMargins = True
    Left = 0
    Top = 586
    Width = 1693
    Height = 599
    Margins.Left = 0
    Margins.Top = 24
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BorderStyle = bsNone
    ChildOrder = 8
    ShowCaption = False
    object memOutput: TWebMemo
      Left = 0
      Top = 56
      Width = 1693
      Height = 543
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      AutoSize = False
      Color = 2829099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeightPercent = 100.000000000000000000
      ParentFont = False
      SelLength = 0
      SelStart = 0
      WidthPercent = 100.000000000000000000
    end
    object layMemTitleOutput: TWebPanel
      Left = 0
      Top = 0
      Width = 1693
      Height = 56
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BorderStyle = bsNone
      ChildOrder = 4
      Color = 3947580
      ShowCaption = False
      object memTitleOutput: TWebLabel
        Left = 0
        Top = 0
        Width = 1352
        Height = 56
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alClient
        Caption = 'Names'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 107
        ExplicitHeight = 47
      end
      object btnRefresh: TWebButton
        Left = 1352
        Top = 0
        Width = 168
        Height = 56
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Caption = 'Refresh'
        Color = 3947580
        ChildOrder = 1
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnRefreshClick
      end
      object btnCopy: TWebButton
        AlignWithMargins = True
        Left = 1525
        Top = 0
        Width = 168
        Height = 56
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Copy'
        Color = 3947580
        ChildOrder = 1
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = btnRefreshClick
      end
    end
  end
end
