object Frame_NameGenerator: TFrame_NameGenerator
  Left = 0
  Top = 0
  Width = 1693
  Height = 1185
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
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
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Configuration'
    Color = 3947580
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    HeightPercent = 100.000000000000000000
    ParentFont = False
    WidthPercent = 100.000000000000000000
    ExplicitWidth = 127
  end
  object layLetterCase: TWebPanel
    Left = 0
    Top = 127
    Width = 1693
    Height = 97
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    ChildOrder = 1
    Color = 3947580
    ShowCaption = False
    ExplicitTop = 30
    object imgLetterCase: TWebHTMLDiv
      AlignWithMargins = True
      Left = 9
      Top = 0
      Width = 128
      Height = 97
      Margins.Left = 9
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
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
      Left = 1439
      Top = 0
      Width = 254
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
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
      Left = 146
      Top = 0
      Width = 1293
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      object lblDescriptionLetterCase: TWebLabel
        Left = 0
        Top = 30
        Width = 1293
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
        ExplicitLeft = 9
      end
      object lblTitleLetterCase: TWebLabel
        Left = 0
        Top = 0
        Width = 1293
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Letter Case'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitLeft = 9
        ExplicitTop = 14
      end
    end
  end
  object WebPanel3: TWebPanel
    Left = 0
    Top = 515
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
    ExplicitTop = 127
    object WebLabel4: TWebLabel
      Left = 0
      Top = 0
      Width = 1525
      Height = 56
      Margins.Left = 9
      Margins.Top = 9
      Margins.Right = 9
      Margins.Bottom = 9
      Align = alClient
      Caption = 'Names'
      Color = clBtnFace
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ExplicitWidth = 65
      ExplicitHeight = 30
    end
    object btnRefresh: TWebButton
      Left = 1525
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
      ExplicitTop = -10
    end
  end
  object memOutput: TWebMemo
    Left = 0
    Top = 571
    Width = 1693
    Height = 614
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
    Lines.Strings = (
      'memOutput')
    ParentFont = False
    SelLength = 0
    SelStart = 0
    WidthPercent = 100.000000000000000000
    ExplicitTop = 183
    ExplicitHeight = 1002
  end
  object layAmount: TWebPanel
    Left = 0
    Top = 418
    Width = 1693
    Height = 97
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    ChildOrder = 1
    Color = 3947580
    ShowCaption = False
    ExplicitTop = 44
    object imgAmount: TWebHTMLDiv
      AlignWithMargins = True
      Left = 9
      Top = 0
      Width = 128
      Height = 97
      Margins.Left = 9
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
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
      Left = 146
      Top = 0
      Width = 1284
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      ExplicitWidth = 1293
      object lblDescriptionAmount: TWebLabel
        Left = 0
        Top = 30
        Width = 1284
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
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
        Width = 1284
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Amount'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 75
      end
    end
    object sbAmount: TWebSpinEdit
      Left = 1430
      Top = 0
      Width = 263
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
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
      ExplicitLeft = 714
      ExplicitTop = 28
      ExplicitHeight = 63
    end
  end
  object WebPanel1: TWebPanel
    Left = 0
    Top = 30
    Width = 1693
    Height = 97
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    ChildOrder = 1
    Color = 3947580
    ShowCaption = False
    ExplicitTop = 100
    object WebHTMLDiv1: TWebHTMLDiv
      AlignWithMargins = True
      Left = 9
      Top = 0
      Width = 128
      Height = 97
      Margins.Left = 9
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
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
      Left = 1439
      Top = 0
      Width = 254
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
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
    object WebPanel2: TWebPanel
      Left = 146
      Top = 0
      Width = 1293
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      object WebLabel2: TWebLabel
        Left = 0
        Top = 30
        Width = 1293
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
      object WebLabel3: TWebLabel
        Left = 0
        Top = 0
        Width = 1293
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Name List'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 93
      end
    end
  end
  object WebPanel4: TWebPanel
    Left = 0
    Top = 321
    Width = 1693
    Height = 97
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    ChildOrder = 1
    Color = 3947580
    ShowCaption = False
    ExplicitTop = 200
    object WebHTMLDiv2: TWebHTMLDiv
      AlignWithMargins = True
      Left = 9
      Top = 0
      Width = 128
      Height = 97
      Margins.Left = 9
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
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
      Left = 146
      Top = 0
      Width = 1284
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      object WebLabel5: TWebLabel
        Left = 0
        Top = 30
        Width = 1284
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
        Width = 1284
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Max Length'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 110
      end
    end
    object sbMaxLength: TWebSpinEdit
      Left = 1430
      Top = 0
      Width = 263
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
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
  object WebPanel6: TWebPanel
    Left = 0
    Top = 224
    Width = 1693
    Height = 97
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    ChildOrder = 1
    Color = 3947580
    ShowCaption = False
    ExplicitTop = 141
    object WebHTMLDiv3: TWebHTMLDiv
      AlignWithMargins = True
      Left = 9
      Top = 0
      Width = 128
      Height = 97
      Margins.Left = 9
      Margins.Top = 0
      Margins.Right = 9
      Margins.Bottom = 0
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
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
      Left = 146
      Top = 0
      Width = 1503
      Height = 97
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      ExplicitWidth = 1293
      object WebLabel7: TWebLabel
        Left = 0
        Top = 30
        Width = 1503
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
        Width = 1503
        Height = 30
        Margins.Left = 9
        Margins.Top = 9
        Margins.Right = 9
        Margins.Bottom = 9
        Align = alTop
        Caption = 'Surname'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 82
      end
    end
    object SwitchSurname: TWebToggleButton
      Left = 1649
      Top = 0
      Width = 44
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      ExplicitLeft = 1232
    end
  end
end
