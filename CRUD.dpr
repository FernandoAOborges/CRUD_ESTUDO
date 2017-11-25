program CRUD;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDMConexao in 'untDMConexao.pas' {DMConexao: TDataModule},
  untConfig in 'untConfig.pas' {frmConfig},
  untTelaPadrao in 'untTelaPadrao.pas' {frmTelaPadrao},
  untClienteView in 'untClienteView.pas' {frmCliente},
  untClienteModel in 'untClienteModel.pas',
  untGrupos in 'untGrupos.pas' {frmGrupos},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
