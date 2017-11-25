object frmGrupos: TfrmGrupos
  Left = 0
  Top = 0
  Hint = 'Grupos'
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Grupos de Produtos'
  ClientHeight = 129
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ShowHint = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 8
    Top = 88
    Width = 70
    Height = 13
    Caption = 'NOME_GRUPO'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 446
    Height = 81
    Align = alTop
    DataSource = DMConexao.dsGrupo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_GRUPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_GRUPO'
        Width = 200
        Visible = True
      end>
  end
  object btn1: TButton
    Left = 135
    Top = 102
    Width = 75
    Height = 21
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 224
    Top = 102
    Width = 75
    Height = 21
    Caption = 'Deletar'
    TabOrder = 2
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 8
    Top = 102
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
end
