unit untConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.AppEvnts;

type
  TfrmConfig = class(TForm)
    rg1: TRadioGroup;
    pnl1: TPanel;
    edtDB: TEdit;
    edtServer: TEdit;
    edtUsername: TEdit;
    edtSenha: TEdit;
    lblDB: TLabel;
    lblServer: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btnLocalizar: TBitBtn;
    pnl2: TPanel;
    btnAbrir: TButton;
    dlgOpen1: TOpenDialog;
    stat1: TStatusBar;
    btnDeslogar: TButton;
    procedure rg1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnDeslogarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    destructor Destroy; override;
  end;
var
  frmConfig: TfrmConfig;
implementation

uses
  Data.DB, untDMConexao, untClienteView;

{$R *.dfm}

procedure TfrmConfig.btnDeslogarClick(Sender: TObject);
var
  I: Integer;
begin
  if TDMConexao.GETInstance.PegaCon.Connected then
  begin
    TDMConexao.GETInstance.PegaCon.Connected:= False;
    btnAbrir.Enabled:= True;
    stat1.Panels.Items[1].Text:= rg1.Items[rg1.ItemIndex]+': '+'Desconectado';
    stat1.Panels.Items[0].Text := EmptyStr;
    rg1.Enabled:= True;
    btnDeslogar.Enabled:= False;
    pnl1.Enabled:= True;
    for I := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
      Application.MainForm.MDIChildren[I].Close;
    end;
    ShowMessage('Desconectado');
  end;
end;

procedure TfrmConfig.btnAbrirClick(Sender: TObject);
begin
  if ((Length(edtDB.Text)=0)
      or(Length(edtUsername.Text)=0)
      or(Length(edtSenha.Text)=0)
      or(Length(edtServer.Text)=0)) then
  begin
    stat1.Panels[0].Text := 'CAMPO VAZIO';
    stat1.Panels[1].Text := EmptyStr;
    raise Exception.Create('campo vazio');
  end
  else
  begin
    TDMConexao.GETInstance.DB_NAME := edtDB.Text;
    TDMConexao.GETInstance.USERNAME:= edtUsername.Text;
    TDMConexao.GETInstance.SENHA:= edtSenha.Text;
    TDMConexao.GETInstance.SERVER:= edtServer.Text;
  end;

  if (rg1.ItemIndex = 0) and (not TDMConexao.GETInstance.PegaCon.Connected) then
  begin
    try
      TDMConexao.GETInstance.TipoConexao(0);
      if TDMConexao.GETInstance.PegaCon.Connected then
      begin
        btnAbrir.Enabled:= False;
        btnDeslogar.Enabled:= True;
        stat1.Panels.Items[0].Text:= rg1.Items[rg1.ItemIndex]+': '+'Conectado';
        stat1.Panels.Items[1].Text := EmptyStr;
        rg1.Enabled:= False;
        pnl1.Enabled:= False;
      end;
    except on E: Exception do
     begin
       ShowMessage('ERRO AO CONECTAR AO SERVIDOR oracle : '+' '+E.Message);
       stat1.Panels.Items[1].Text:= rg1.Items[rg1.ItemIndex]+': '+'Desconectado';
       stat1.Panels.Items[0].Text := EmptyStr;
     end;
    end;
  end
  else
  if (rg1.ItemIndex = 1) and (not TDMConexao.GETInstance.PegaCon.Connected) then
  begin
    try
      TDMConexao.GETInstance.TipoConexao(1);
      if TDMConexao.GETInstance.PegaCon.Connected then
      begin
        btnAbrir.Enabled:= False;
        btnDeslogar.Enabled:= True;
        stat1.Panels.Items[0].Text:= rg1.Items[rg1.ItemIndex]+': '+'Conectado';
        stat1.Panels.Items[1].Text := EmptyStr;
        rg1.Enabled:= False;
        pnl1.Enabled:= False;
      end;
    except on E: Exception do
     begin
       ShowMessage('ERRO AO CONECTAR AO SERVIDOR oracle : '+' '+E.Message);
       stat1.Panels.Items[1].Text:= rg1.Items[rg1.ItemIndex]+': '+'Desconectado';
       stat1.Panels.Items[0].Text := EmptyStr;
     end;
    end;
  end;
end;

procedure TfrmConfig.btnLocalizarClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
    edtDB.Text:= dlgOpen1.FileName;
end;

destructor TfrmConfig.Destroy;
begin

  inherited;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowWindow(frmConfig.Handle, SW_HIDE);
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  rg1.ItemIndex:= 0;
  if TDMConexao.GETInstance.PegaCon.Connected then
    btnDeslogar.Enabled:= True
  else
    btnDeslogar.Enabled:= False;
end;

procedure TfrmConfig.rg1Click(Sender: TObject);
begin
  if rg1.ItemIndex = 0 then
  begin
    edtServer.Enabled:= False;
    lblServer.Enabled:= False;
    edtServer.Text:= 'Server';
    edtDB.Enabled:= True;
    lblDB.Enabled:= True;
    btnLocalizar.Enabled := True;
  end
  else
  if rg1.ItemIndex = 1 then
  begin
    edtServer.Enabled:= True;
    lblServer.Enabled:= True;
    edtDB.Enabled:= False;
    lblDB.Enabled:= False;
    btnLocalizar.Enabled:= False;
    edtDB.Text:= 'DB';
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown:= True;
end.
