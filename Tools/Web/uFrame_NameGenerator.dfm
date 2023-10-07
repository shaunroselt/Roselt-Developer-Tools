object Frame_NameGenerator: TFrame_NameGenerator
  Left = 0
  Top = 0
  Width = 1693
  Height = 1185
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
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
    Color = clBtnFace
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ExplicitWidth = 127
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
    ShowCaption = False
    ExplicitTop = 28
    object imgExpandCollapseTestingMoreStuff: TWebHTMLDiv
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
    object WebComboBox1: TWebComboBox
      Left = 1439
      Top = 0
      Width = 254
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      HeightPercent = 100.000000000000000000
      Text = 'WebComboBox1'
      WidthPercent = 100.000000000000000000
      ItemIndex = -1
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
      ShowCaption = False
      ExplicitLeft = 145
      ExplicitWidth = 1294
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
        Caption = 'Select which letter case you want to use'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitTop = 28
        ExplicitWidth = 370
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
        Caption = 'Letter Case'
        Color = clBtnFace
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 103
      end
    end
  end
  object WebPanel3: TWebPanel
    Left = 0
    Top = 127
    Width = 1693
    Height = 56
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    BorderStyle = bsNone
    ChildOrder = 4
    ShowCaption = False
    ExplicitTop = 125
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
      ChildOrder = 1
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = btnRefreshClick
    end
  end
  object memOutput: TWebMemo
    Left = 0
    Top = 183
    Width = 1693
    Height = 1002
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    AutoSize = False
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      'memOutput')
    SelLength = 0
    SelStart = 0
    WidthPercent = 100.000000000000000000
    ExplicitTop = 181
    ExplicitHeight = 1004
  end
end
