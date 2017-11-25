object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o do BD'
  ClientHeight = 326
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rg1: TRadioGroup
    Left = 0
    Top = 0
    Width = 555
    Height = 89
    Align = alTop
    Caption = 'rg1'
    Items.Strings = (
      'FIREBIRD'
      'ORACLE')
    TabOrder = 0
    OnClick = rg1Click
  end
  object pnl1: TPanel
    Left = 0
    Top = 89
    Width = 555
    Height = 144
    Align = alTop
    TabOrder = 1
    object lblDB: TLabel
      Left = 10
      Top = 30
      Width = 69
      Height = 16
      Caption = 'DATABASE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblServer: TLabel
      Left = 19
      Top = 56
      Width = 49
      Height = 16
      Caption = 'SERVER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 9
      Top = 82
      Width = 68
      Height = 16
      Caption = 'USERNAME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 30
      Top = 114
      Width = 42
      Height = 16
      Caption = 'SENHA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 146
      Top = 6
      Width = 183
      Height = 16
      Caption = 'DADOS DO BANCO DE DADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDB: TEdit
      Left = 83
      Top = 28
      Width = 357
      Height = 21
      TabOrder = 0
      Text = 'E:\DELPHI MVC DB\11-12.FDB'
    end
    object edtServer: TEdit
      Left = 83
      Top = 55
      Width = 257
      Height = 21
      TabOrder = 2
      Text = 'localhost'
    end
    object edtUsername: TEdit
      Left = 83
      Top = 82
      Width = 257
      Height = 21
      TabOrder = 3
      Text = 'sysdba'
    end
    object edtSenha: TEdit
      Left = 83
      Top = 109
      Width = 257
      Height = 21
      TabOrder = 4
      Text = 'masterkey'
    end
    object btnLocalizar: TBitBtn
      Left = 446
      Top = 26
      Width = 75
      Height = 25
      Caption = 'ABRIR'
      TabOrder = 1
      OnClick = btnLocalizarClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 233
    Width = 555
    Height = 96
    Align = alTop
    TabOrder = 2
    object btnAbrir: TButton
      Left = 211
      Top = 6
      Width = 102
      Height = 64
      Caption = 'ABRIR'
      TabOrder = 0
      OnClick = btnAbrirClick
    end
    object stat1: TStatusBar
      Left = 1
      Top = 76
      Width = 553
      Height = 19
      Panels = <
        item
          Width = 150
        end
        item
          Width = 200
        end
        item
          Width = 50
        end>
    end
    object btnDeslogar: TButton
      Left = 472
      Top = 6
      Width = 75
      Height = 45
      Caption = 'Deslogar'
      TabOrder = 1
      OnClick = btnDeslogarClick
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 496
    Top = 16
  end
end
