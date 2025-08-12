object frmMain: TfrmMain
  Width = 2195
  Height = 1402
  Caption = 'Roselt Developer Tools'
  Color = 3947580
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object layStuffThatWillNeverShow: TWebPanel
    Left = 701
    Top = 85
    Width = 1494
    Height = 1317
    Align = alClient
    BorderStyle = bsNone
    ChildOrder = 2
    Color = 3947580
    ElementFont = efCSS
    Visible = False
  end
  object TopBar: TWebPanel
    Left = 0
    Top = 0
    Width = 2195
    Height = 85
    Align = alTop
    BorderStyle = bsNone
    Caption = 'Home'
    Color = 3947580
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    object btnHamburger: TWebHTMLDiv
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 85
      Height = 85
      Margins.Top = 0
      Margins.Bottom = 0
      ElementClassName = 'btn btn-outline-dark'
      WidthStyle = ssAuto
      Align = alLeft
      ChildOrder = 2
      ElementFont = efCSS
      HTML.Strings = (
        
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
          'ill="currentColor" class="bi bi-list" viewBox="0 0 16 16">'
        
          '  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 ' +
          '0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1' +
          ' 0 1H3a.5.5 0 0 1-.5-.5zm0-'
        '4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>'
        '</svg>')
      Role = ''
      OnClick = btnHamburgerClick
    end
  end
  object SplitterNavContent: TWebSplitter
    Left = 700
    Top = 85
    Width = 1
    Height = 1317
    Align = alLeft
    ChildOrder = 3
    Color = clWhite
  end
  object MultiView: TWebScrollBox
    Left = 0
    Top = 85
    Width = 700
    Height = 1317
    Align = alLeft
    BorderStyle = bsNone
    ChildOrder = 5
    Color = 3947580
    ScrollBars = ssVertical
    object WebImageControl1: TWebImageControl
      Left = 255
      Top = 876
      Width = 100
      Height = 81
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      ChildOrder = 3
    end
    object layNavAllTools: TWebPanel
      Left = 0
      Top = 0
      Width = 700
      Height = 88
      Align = alTop
      BorderStyle = bsNone
      Color = 3947580
      ElementFont = efCSS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      object btnAllTools: TWebPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 690
        Height = 78
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BorderStyle = bsNone
        Color = 3947580
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        OnClick = btnAllToolsClick
        OnMouseEnter = btnAllToolsMouseEnter
        OnMouseLeave = btnAllToolsMouseLeave
        object lblAllTools: TWebLabel
          AlignWithMargins = True
          Left = 93
          Top = 3
          Width = 597
          Height = 75
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'All Tools'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Segoe UI'
          Font.Style = []
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          HTMLType = tSPAN
          Layout = tlCenter
          ParentFont = False
          WidthPercent = 100.000000000000000000
          OnClick = btnAllToolsClick
          ExplicitWidth = 136
          ExplicitHeight = 50
        end
        object imgAllTools: TWebHTMLDiv
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 78
          Height = 78
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          WidthStyle = ssAuto
          Align = alLeft
          ChildOrder = 2
          ElementFont = efCSS
          HTML.Strings = (
            
              '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
              'ill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">'
            
              '  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.' +
              '5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H' +
              '14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 '
            
              '0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.2' +
              '93L8.354 1.146ZM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0' +
              '-.5-.5h-3a.5.5 0 0 0'
            '-.5.5v4H2.5Z"/>'
            '</svg>')
          Role = ''
          OnClick = btnAllToolsClick
        end
      end
    end
    object layNavTestingStuff: TWebPanel
      Left = 0
      Top = 88
      Width = 700
      Height = 88
      Align = alTop
      BorderStyle = bsNone
      ChildOrder = 6
      Color = 3947580
      ElementFont = efCSS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      object btnTestingStuff: TWebPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 690
        Height = 78
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BorderStyle = bsNone
        Color = 3947580
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        OnClick = btnAllToolsClick
        OnMouseEnter = btnAllToolsMouseEnter
        OnMouseLeave = btnAllToolsMouseLeave
        object lblTestingStuff: TWebLabel
          AlignWithMargins = True
          Left = 93
          Top = 3
          Width = 597
          Height = 75
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Testing Stuff'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Segoe UI'
          Font.Style = []
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          HTMLType = tSPAN
          Layout = tlCenter
          ParentFont = False
          WidthPercent = 100.000000000000000000
          ExplicitWidth = 202
          ExplicitHeight = 50
        end
        object imgTestingStuff: TWebHTMLDiv
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 78
          Height = 78
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 6
          Margins.Bottom = 0
          WidthStyle = ssAuto
          Align = alLeft
          ChildOrder = 2
          ElementFont = efCSS
          HTML.Strings = (
            
              '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
              'ill="currentColor" class="bi bi-box" viewBox="0 0 16 16">'
            
              '  <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.1' +
              '54 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14' +
              '.762V6.838L1 '
            
              '4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852' +
              'A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 ' +
              '0 1-.372 0L.63 13.09a1 1 0 '
            '0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>'
            '</svg>')
          Role = ''
        end
      end
    end
    object layNavTestingMoreStuff: TWebPanel
      Left = 0
      Top = 176
      Width = 700
      Height = 371
      Align = alTop
      BorderStyle = bsNone
      ChildOrder = 6
      Color = 3947580
      ElementFont = efCSS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      object layNavExpandCollapseTestingMoreStuff: TWebPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 88
        Align = alTop
        BorderStyle = bsNone
        ChildOrder = 6
        Color = 3947580
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        object btnExpandCollapseTestingMoreStuff: TWebPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 690
          Height = 78
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          BorderStyle = bsNone
          Color = 3947580
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          OnClick = ExpandCollapseNavItem
          OnDblClick = ExpandCollapseNavItem
          OnMouseEnter = btnAllToolsMouseEnter
          OnMouseLeave = btnAllToolsMouseLeave
          object lblExpandCollapseTestingMoreStuff: TWebLabel
            AlignWithMargins = True
            Left = 93
            Top = 3
            Width = 513
            Height = 75
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Testing More Stuff'
            ElementFont = efCSS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -37
            Font.Name = 'Segoe UI'
            Font.Style = []
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            HTMLType = tSPAN
            Layout = tlCenter
            ParentFont = False
            WidthPercent = 100.000000000000000000
            OnClick = ExpandCollapseNavItem
            OnDblClick = ExpandCollapseNavItem
            ExplicitWidth = 299
            ExplicitHeight = 50
          end
          object imgExpandCollapseTestingMoreStuff: TWebHTMLDiv
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 78
            Height = 78
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 6
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
            OnClick = ExpandCollapseNavItem
            OnDblClick = ExpandCollapseNavItem
          end
          object imgExpandCollapseIconTestingMoreStuff: TWebHTMLDiv
            AlignWithMargins = True
            Left = 609
            Top = 0
            Width = 78
            Height = 78
            Margins.Top = 0
            Margins.Bottom = 0
            WidthStyle = ssAuto
            Align = alRight
            ChildOrder = 2
            ElementFont = efCSS
            HTML.Strings = (
              
                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
                'ill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16' +
                '">'
              
                '  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 ' +
                '10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6' +
                '-6a.5.5 0 0 1 0-.708z"/>'
              '</svg>')
            Role = ''
            OnClick = ExpandCollapseNavItem
            OnDblClick = ExpandCollapseNavItem
          end
        end
      end
      object WebPanel654: TWebPanel
        Left = 0
        Top = 264
        Width = 700
        Height = 88
        Align = alTop
        BorderStyle = bsNone
        ChildOrder = 6
        Color = 3947580
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        object WebPanel7532: TWebPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 690
          Height = 78
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          BorderStyle = bsNone
          Color = 3947580
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          OnClick = btnAllToolsClick
          OnMouseEnter = btnAllToolsMouseEnter
          OnMouseLeave = btnAllToolsMouseLeave
          object WebLabel1: TWebLabel
            AlignWithMargins = True
            Left = 93
            Top = 3
            Width = 597
            Height = 75
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Testing 1'
            ElementFont = efCSS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -37
            Font.Name = 'Segoe UI'
            Font.Style = []
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            HTMLType = tSPAN
            Layout = tlCenter
            ParentFont = False
            WidthPercent = 100.000000000000000000
            ExplicitWidth = 145
            ExplicitHeight = 50
          end
          object WebHTMLDiv1: TWebHTMLDiv
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 78
            Height = 78
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 6
            Margins.Bottom = 0
            WidthStyle = ssAuto
            Align = alLeft
            ChildOrder = 2
            ElementFont = efCSS
            HTML.Strings = (
              
                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
                'ill="currentColor" class="bi bi-box" viewBox="0 0 16 16">'
              
                '  <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.1' +
                '54 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14' +
                '.762V6.838L1 '
              
                '4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852' +
                'A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 ' +
                '0 1-.372 0L.63 13.09a1 1 0 '
              '0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>'
              '</svg>')
            Role = ''
          end
        end
      end
      object WebPanel8325: TWebPanel
        Left = 0
        Top = 176
        Width = 700
        Height = 88
        Align = alTop
        BorderStyle = bsNone
        ChildOrder = 6
        Color = 3947580
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        object WebPanel9436: TWebPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 690
          Height = 78
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          BorderStyle = bsNone
          Color = 3947580
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          OnClick = btnAllToolsClick
          OnMouseEnter = btnAllToolsMouseEnter
          OnMouseLeave = btnAllToolsMouseLeave
          object WebLabel2: TWebLabel
            AlignWithMargins = True
            Left = 93
            Top = 3
            Width = 597
            Height = 75
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Testing 1'
            ElementFont = efCSS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -37
            Font.Name = 'Segoe UI'
            Font.Style = []
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            HTMLType = tSPAN
            Layout = tlCenter
            ParentFont = False
            WidthPercent = 100.000000000000000000
            ExplicitWidth = 145
            ExplicitHeight = 50
          end
          object WebHTMLDiv2: TWebHTMLDiv
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 78
            Height = 78
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 6
            Margins.Bottom = 0
            WidthStyle = ssAuto
            Align = alLeft
            ChildOrder = 2
            ElementFont = efCSS
            HTML.Strings = (
              
                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
                'ill="currentColor" class="bi bi-box" viewBox="0 0 16 16">'
              
                '  <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.1' +
                '54 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14' +
                '.762V6.838L1 '
              
                '4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852' +
                'A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 ' +
                '0 1-.372 0L.63 13.09a1 1 0 '
              '0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>'
              '</svg>')
            Role = ''
          end
        end
      end
      object WebPanel10857: TWebPanel
        Left = 0
        Top = 88
        Width = 700
        Height = 88
        Align = alTop
        BorderStyle = bsNone
        ChildOrder = 6
        Color = 3947580
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        object WebPanel11345: TWebPanel
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 690
          Height = 78
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          BorderStyle = bsNone
          Color = 3947580
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          OnClick = btnAllToolsClick
          OnMouseEnter = btnAllToolsMouseEnter
          OnMouseLeave = btnAllToolsMouseLeave
          object WebLabel3: TWebLabel
            AlignWithMargins = True
            Left = 93
            Top = 3
            Width = 597
            Height = 75
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Testing 1'
            ElementFont = efCSS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -37
            Font.Name = 'Segoe UI'
            Font.Style = []
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            HTMLType = tSPAN
            Layout = tlCenter
            ParentFont = False
            WidthPercent = 100.000000000000000000
            ExplicitWidth = 145
            ExplicitHeight = 50
          end
          object WebHTMLDiv3: TWebHTMLDiv
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 78
            Height = 78
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 6
            Margins.Bottom = 0
            WidthStyle = ssAuto
            Align = alLeft
            ChildOrder = 2
            ElementFont = efCSS
            HTML.Strings = (
              
                '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" f' +
                'ill="currentColor" class="bi bi-box" viewBox="0 0 16 16">'
              
                '  <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.1' +
                '54 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14' +
                '.762V6.838L1 '
              
                '4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852' +
                'A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 ' +
                '0 1-.372 0L.63 13.09a1 1 0 '
              '0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>'
              '</svg>')
            Role = ''
          end
        end
      end
    end
  end
  object LayoutContainer: TWebScrollBox
    Left = 701
    Top = 85
    Width = 1494
    Height = 1317
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    BorderStyle = bsNone
    ChildOrder = 6
    Color = 3947580
    ScrollBars = ssVertical
    object layTesting: TWebPanel
      Left = 0
      Top = 0
      Width = 1494
      Height = 1317
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 1
      Color = clWindow
      ShowCaption = False
      object WebLabel10: TWebLabel
        Left = 352
        Top = 270
        Width = 116
        Height = 30
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        Caption = 'Testing Page'
        ElementFont = efCSS
        HeightStyle = ssAuto
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object lblAppInfoDescription: TWebLabel
        Left = 0
        Top = 0
        Width = 1494
        Height = 30
        Align = alTop
        Caption = 'lblAppInfoDescription'
        ElementFont = efCSS
        HeightStyle = ssAuto
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 202
      end
    end
    object layAllTools: TWebPanel
      Left = 0
      Top = 0
      Width = 1494
      Height = 1317
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      BorderStyle = bsNone
      ChildOrder = 2
      Color = 3947580
      ShowCaption = False
      object WebLabel4: TWebLabel
        Left = 0
        Top = 85
        Width = 1494
        Height = 1232
        Align = alClient
        Caption = 'WebLabel4'
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -58
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightStyle = ssAuto
        HeightPercent = 100.000000000000000000
        ParentFont = False
        WidthPercent = 100.000000000000000000
        ExplicitWidth = 282
        ExplicitHeight = 77
      end
      object edtSearchAllTools: TWebEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1488
        Height = 79
        Align = alTop
        ElementClassName = 'form-control'
        ElementFont = efCSS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -58
        Font.Name = 'Segoe UI'
        Font.Style = []
        HeightStyle = ssAuto
        HeightPercent = 100.000000000000000000
        ParentFont = False
        Text = 'Search...'
        WidthPercent = 100.000000000000000000
      end
    end
  end
end
