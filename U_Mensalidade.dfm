object Frm_Mensalidade: TFrm_Mensalidade
  Left = 60
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Frm_Mensalidade'
  ClientHeight = 452
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 23
    Align = alTop
    Caption = 'Mensalidades'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 23
    Width = 740
    Height = 388
    Align = alClient
    DataSource = Frm_Modulo.Dts_Mensalidade
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'MENS_ANO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENS_MES'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSALUN'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALUNNOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSDTVC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSDTPG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSVLPG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MENSPAGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 411
    Width = 740
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Btn_filtrar: TButton
      Left = 364
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Aberto'
      TabOrder = 2
      OnClick = Btn_filtrarClick
    end
    object Btn_editar: TButton
      Left = 456
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Editar'
      TabOrder = 3
      OnClick = Btn_editarClick
    end
    object btn_sair: TButton
      Left = 641
      Top = 10
      Width = 92
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 5
      OnClick = btn_sairClick
    end
    object Button1: TButton
      Left = 272
      Top = 10
      Width = 92
      Height = 25
      Caption = '&Geral'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 180
      Top = 10
      Width = 92
      Height = 25
      Caption = 'Por &S'#233'ries'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 549
      Top = 10
      Width = 92
      Height = 25
      Caption = 'Apa&gar'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
end
