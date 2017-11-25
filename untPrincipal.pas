unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, untDMConexao, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MENU: TMainMenu;
    PRINCIPAL1: TMenuItem;
    CONFIG1: TMenuItem;
    CLIENTE1: TMenuItem;
    stat1: TStatusBar;
    Timer: TTimer;
    Grupos1: TMenuItem;
    GRUPOSDEPRODUTOS1: TMenuItem;
    procedure CLIENTE1Click(Sender: TObject);
    procedure CONFIG1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure GRUPOSDEPRODUTOS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
implementation

uses
  untConfig, untClienteView, untGrupos;

{$R *.dfm}

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  if not (TDMConexao.GETInstance.PegaCon.Connected) then
    raise Exception.Create('Use o menu configuração para conectar antes de abrir o Cliente')
  else
  begin
  try
    if frmCliente= nil then
    begin
      Application.CreateForm(TfrmCliente, frmCliente);
      frmCliente.Show;
    end
    else
      ShowWindow(frmCliente.handle, SW_SHOW);
  except on E: Exception do
    ShowMessage('Erro ao abrir a janela de configuração.'+ ' - '+ 'Erro do tipo: ' +E.Message);
  end;
  end;
end;

procedure TfrmPrincipal.CONFIG1Click(Sender: TObject);
begin
  try
    if frmConfig = nil then
    begin
      Application.CreateForm(TfrmConfig, frmConfig);
      frmConfig.Show;
    end
    else
      ShowWindow(frmConfig.handle, SW_SHOW);
  except on E: Exception do
    ShowMessage('Erro ao abrir a janela de configuração.'+ ' - '+ 'Erro do tipo: ' +E.Message);
  end;

end;

procedure TfrmPrincipal.GRUPOSDEPRODUTOS1Click(Sender: TObject);
begin
  if not (TDMConexao.GETInstance.PegaCon.Connected) then
    raise Exception.Create('Use o menu configuração para conectar antes de abrir o grupo')
  else
  begin
    try
      if frmGrupos = nil then
      begin
        Application.CreateForm(TfrmGrupos, frmGrupos);
        frmGrupos.Show;
      end;
    except on E: Exception do
      ShowMessage('Erro ao abrir a janela de configuração.'+ ' - '+ 'Erro do tipo: ' +E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
  with Sender as TTimer do
  begin
    Timer.Interval := 2000;
    Enabled := True;
    if TDMConexao.GETInstance.PegaCon.Connected then
    begin
      stat1.Panels[0].Text := 'Conectado';
      stat1.Panels[1].Text := 'Data: ' + FormatDateTime('dd/mm/yy', Now)+'   '+'Hora: '+ TimeToStr(Time);
      stat1.Panels[2].Text := 'Banco Conectado: ' + TDMConexao.GETInstance.PegaBD;
    end
    else
    begin
      stat1.Panels[0].Text := 'Desconectado';
      stat1.Panels[1].Text := 'Desconectado';
      stat1.Panels[2].Text := 'Desconectado';
    end;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown:= True;
end.
