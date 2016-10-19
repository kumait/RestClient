object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'REST Client'
  ClientHeight = 593
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 163
    Width = 802
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitLeft = 799
    ExplicitTop = 169
    ExplicitWidth = 405
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 209
      Top = 4
      Height = 24
      ExplicitLeft = 192
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object edtResource: TEdit
      Left = 212
      Top = 4
      Width = 511
      Height = 24
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'test'
      OnKeyUp = edtResourceKeyUp
    end
    object btnSend: TButton
      Left = 723
      Top = 4
      Width = 75
      Height = 24
      Action = actSend
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ExplicitLeft = 716
      ExplicitTop = 9
      ExplicitHeight = 25
    end
    object Panel4: TPanel
      Left = 4
      Top = 4
      Width = 205
      Height = 24
      Align = alLeft
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitHeight = 27
      object edtBaseUrl: TEdit
        Left = 0
        Top = 0
        Width = 192
        Height = 24
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'http://localhost:8080'
      end
      object Panel5: TPanel
        Left = 192
        Top = 0
        Width = 13
        Height = 24
        Align = alRight
        BevelOuter = bvNone
        Caption = '/'
        TabOrder = 1
        ExplicitHeight = 26
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 802
    Height = 131
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 41
    DesignSize = (
      802
      131)
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 6
      Width = 105
      Height = 115
      Caption = 'Method'
      TabOrder = 0
    end
    object rbGet: TRadioButton
      Left = 16
      Top = 24
      Width = 81
      Height = 17
      Caption = 'GET'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbPut: TRadioButton
      Left = 16
      Top = 70
      Width = 80
      Height = 17
      Caption = 'PUT'
      TabOrder = 2
    end
    object rbPost: TRadioButton
      Left = 16
      Top = 47
      Width = 80
      Height = 17
      Caption = 'POST'
      TabOrder = 3
    end
    object rbDelete: TRadioButton
      Left = 16
      Top = 93
      Width = 80
      Height = 17
      Caption = 'DELETE'
      TabOrder = 4
    end
    object PageControl1: TPageControl
      Left = 119
      Top = 6
      Width = 672
      Height = 119
      ActivePage = TabSheet1
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      ExplicitHeight = 116
      object TabSheet1: TTabSheet
        Caption = 'Body'
        ExplicitHeight = 88
        object MemRequestBody: TMemo
          Left = 0
          Top = 0
          Width = 664
          Height = 91
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitHeight = 88
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Headers'
        ImageIndex = 1
        ExplicitHeight = 88
        object VLRequestHeaders: TValueListEditor
          Left = 0
          Top = 0
          Width = 600
          Height = 91
          Align = alClient
          KeyOptions = [keyEdit, keyAdd, keyDelete]
          TabOrder = 0
          ExplicitWidth = 592
          ColWidths = (
            150
            444)
        end
        object Panel3: TPanel
          Left = 600
          Top = 0
          Width = 64
          Height = 91
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object btnAddHeader: TBitBtn
            Left = 6
            Top = 0
            Width = 51
            Height = 42
            Caption = 'Add'
            TabOrder = 0
            OnClick = btnAddHeaderClick
          end
          object btnRemoveHeader: TBitBtn
            Left = 6
            Top = 48
            Width = 51
            Height = 42
            Caption = 'Remove'
            TabOrder = 1
            OnClick = btnRemoveHeaderClick
          end
        end
      end
      object Authentication: TTabSheet
        Caption = 'Authentication'
        ImageIndex = 2
        ExplicitHeight = 88
        object chkBasicAuth: TCheckBox
          Left = 8
          Top = 8
          Width = 121
          Height = 17
          Caption = 'Basic Authentication'
          TabOrder = 0
        end
        object edtUsername: TLabeledEdit
          Left = 9
          Top = 47
          Width = 176
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = 'Username'
          Enabled = False
          TabOrder = 1
        end
        object edtPassword: TLabeledEdit
          Left = 202
          Top = 47
          Width = 175
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Passowrd'
          Enabled = False
          TabOrder = 2
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 574
    Width = 802
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 166
    Width = 802
    Height = 408
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 3
    ExplicitTop = 177
    ExplicitHeight = 405
    object TabSheet3: TTabSheet
      Caption = 'Content'
      ExplicitHeight = 377
      object MemResponse: TMemo
        Left = 0
        Top = 0
        Width = 794
        Height = 380
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitHeight = 377
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Headers'
      ImageIndex = 1
      ExplicitHeight = 374
      object VLResponseHeaders: TValueListEditor
        Left = 0
        Top = 0
        Width = 794
        Height = 380
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 374
      end
    end
  end
  object RESTResponse: TRESTResponse
    ContentType = 'text/html'
    Left = 336
    Top = 345
  end
  object RESTRequest: TRESTRequest
    Accept = '*/*'
    AcceptEncoding = 'gzip, deflate'
    Client = RESTClient
    Params = <>
    Resource = 'test'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 416
    Top = 345
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://localhost:8080'
    Params = <>
    HandleRedirects = True
    Left = 496
    Top = 345
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 220
    Top = 357
    object LinkControlToPropertyEnabled: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = chkBasicAuth
      Track = True
      Component = edtUsername
      ComponentProperty = 'Enabled'
    end
    object LinkControlToPropertyEnabled2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = chkBasicAuth
      Track = True
      Component = edtPassword
      ComponentProperty = 'Enabled'
      InitializeControlValue = False
    end
  end
  object ActionList1: TActionList
    Left = 532
    Top = 438
    object actSend: TAction
      Caption = 'Send'
      Hint = 'Send Request'
      ShortCut = 120
      OnExecute = actSendExecute
    end
  end
end
