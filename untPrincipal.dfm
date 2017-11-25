object frmPrincipal: TfrmPrincipal
  Left = 740
  Top = 0
  Caption = 'CRUD'
  ClientHeight = 664
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MENU
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object stat1: TStatusBar
    Left = 0
    Top = 645
    Width = 1068
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object MENU: TMainMenu
    Left = 968
    Top = 560
    object PRINCIPAL1: TMenuItem
      Caption = 'PRINCIPAL'
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE1Click
      end
    end
    object Grupos1: TMenuItem
      Caption = 'PRODUTOS'
      object GRUPOSDEPRODUTOS1: TMenuItem
        Caption = 'GRUPOS DE PRODUTOS'
        OnClick = GRUPOSDEPRODUTOS1Click
      end
    end
    object CONFIG1: TMenuItem
      Caption = 'CONFIGURA'#199#195'O'
      OnClick = CONFIG1Click
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 1008
    Top = 560
  end
end
