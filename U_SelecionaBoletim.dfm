object Frm_SelecionaBoletim: TFrm_SelecionaBoletim
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Frm_SelecionaBoletim'
  ClientHeight = 194
  ClientWidth = 248
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 248
    Height = 23
    Align = alTop
    Caption = 'Sele'#231#227'o de Boletim'
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
    Width = 248
    Height = 137
    Align = alClient
    TabOrder = 1
    object Rdg_Bimestre: TRadioGroup
      Left = 34
      Top = 10
      Width = 185
      Height = 113
      Items.Strings = (
        '1o BIMESTRE'
        '2o BIMESTRE'
        '3o BIMESTRE'
        '4o BIMESTRE')
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 160
    Width = 248
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 69
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 144
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
