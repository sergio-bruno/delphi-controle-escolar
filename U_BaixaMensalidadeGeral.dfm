object Frm_BaixaMensalidadeGeral: TFrm_BaixaMensalidadeGeral
  Left = 181
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Frm_BaixaMensalidadeGeral'
  ClientHeight = 116
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 285
    Height = 23
    Align = alTop
    Caption = 'Baixa de Mensalidade Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 23
    Width = 285
    Height = 59
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 44
      Top = 6
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label2: TLabel
      Left = 9
      Top = 6
      Width = 20
      Height = 13
      Caption = 'M'#234's'
    end
    object Label4: TLabel
      Left = 99
      Top = 7
      Width = 52
      Height = 13
      Caption = 'Valor Pago'
      FocusControl = Button1
    end
    object Label5: TLabel
      Left = 189
      Top = 7
      Width = 54
      Height = 13
      Caption = 'Pagamento'
      FocusControl = Button1
    end
    object edt_mens_ano: TEdit
      Left = 44
      Top = 23
      Width = 51
      Height = 21
      MaxLength = 4
      TabOrder = 1
      Text = 'edt_mens_ano'
      OnExit = edt_mens_anoExit
      OnKeyPress = edt_mens_mesKeyPress
    end
    object edt_mens_mes: TEdit
      Left = 9
      Top = 23
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = 'Edt_Ano'
      OnExit = edt_mens_mesExit
      OnKeyPress = edt_mens_mesKeyPress
    end
    object Fne_mensvlpg: TFnpNumericEdit
      Left = 99
      Top = 23
      Width = 86
      Height = 21
      TabOrder = 2
    end
    object mke_mensdtpg: TMaskEdit
      Left = 189
      Top = 23
      Width = 87
      Height = 21
      EditMask = '99/99/9999;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = Mke_mensdtvcExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 285
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 128
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 203
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
