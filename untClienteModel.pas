unit untClienteModel;

interface

uses
  Vcl.StdCtrls;
type
  TCliente = class
  public
    procedure InsereUpdate(pParam: array of string; pTipo:String);
    procedure Pesquisar(pCombo, pEdit: string);
    procedure DELETAR(pDeletar: string);
  end;

implementation



uses
  untDMConexao, Vcl.Dialogs, System.SysUtils, Data.DB;

const
 vSql = ' SELECT C.COD_CLIENTE AS CODIGO, '+
        ' C.COD_CIDADE AS CODIGO_CIDADE, '+
        ' C.NOME AS NOME, '+
        ' C.DATAINICIAL AS DATA, '+
        ' CI.NOM_CIDADE AS NOME_CIDADE, '+
        ' CI.COD_ESTADO AS CODIGO_ESTADO, '+
        ' ES.NOM_ESTADO AS NOME_ESTADO FROM CLIENTE C '+
        ' INNER JOIN CIDADE CI ON C.COD_CIDADE = CI.COD_CIDADE '+
        ' INNER JOIN ESTADO ES ON ES.COD_ESTADO = CI.COD_ESTADO ';

{ TCliente }

procedure TCliente.DELETAR(pDeletar: string);
const
  DELETAR = 'DELETE FROM CLIENTE WHERE (COD_CLIENTE = :CODIGO)';
begin
  TDMConexao.GETInstance.PegaCon.StartTransaction;
  try
    TDMConexao.GETInstance.Consulta.Edit;
    if TDMConexao.GETInstance.Consulta.State in [dsEdit, dsInsert] then
    begin
      TDMConexao.GETInstance.Consulta.Close;
      TDMConexao.GETInstance.Consulta.SQL.Text:= DELETAR;
      TDMConexao.GETInstance.Consulta.ParamByName('CODIGO').AsString := pDeletar;
      TDMConexao.GETInstance.Consulta.ExecSQL;
      ShowMessage('Deletado com sucesso');
      TDMConexao.GETInstance.Consulta.Open(vSql);
    end;
  except on E: Exception do
  begin
    ShowMessage('Erro ao Deletar');
    TDMConexao.GETInstance.PegaCon.Rollback;
  end;
  end;
end;

procedure TCliente.InsereUpdate(pParam: array of string; pTipo: String);
var
 vTeste: string;
const
  SALVAR ='INSERT INTO CLIENTE (NOME,      ' +
                                ' DATAINICIAL,   ' +
                                ' COD_CIDADE) ' +
                      'VALUES (:NOME, :DATA, :CODIGO_CIDADE) ';

  UPDATE ='UPDATE CLIENTE SET NOME = :NOME, '+
                            ' DATAINICIAL = :DATA, '+
                            ' COD_CIDADE = :CODIGO_CIDADE '+
                            ' WHERE (COD_CLIENTE = :CODIGO)';
begin
  TDMConexao.GETInstance.PegaCon.StartTransaction;
  try
    if pTipo = 'SALVAR' then
      vTeste := SALVAR;
    if pTipo = 'UPDATE' then
      vTeste := UPDATE;
    TDMConexao.GETInstance.Consulta.Edit;
    TDMConexao.GETInstance.Consulta.Close;
    TDMConexao.GETInstance.Consulta.SQL.Text:= vTeste;
    TDMConexao.GETInstance.Consulta.ParamByName('NOME').AsString := pParam[0];
    TDMConexao.GETInstance.Consulta.ParamByName('DATA').AsString := pParam[1];
    TDMConexao.GETInstance.Consulta.ParamByName('CODIGO_CIDADE').AsString := pParam[2];
    if pTipo ='UPDATE'  then
    begin
      TDMConexao.GETInstance.Consulta.ParamByName('CODIGO').AsString := pParam[3];
    end;
    TDMConexao.GETInstance.Consulta.ExecSQL;
    TDMConexao.GETInstance.PegaCon.Commit;
    ShowMessage('Salvo com sucesso');
    TDMConexao.GETInstance.Consulta.Open(vSql);
  except on E: Exception do
  begin
    ShowMessage(E.Message);
    TDMConexao.GETInstance.PegaCon.Rollback;
  end;
  end;
end;

procedure TCliente.Pesquisar(pCombo, pEdit: string);
begin
  try
    TDMConexao.GETInstance.Consulta.Filtered := False;
    TDMConexao.GETInstance.Consulta.Filter := pCombo + ' Like ' + QuotedStr('%' + pEdit + '%');
    TDMConexao.GETInstance.Consulta.Filtered := True;
  except on E: Exception do
    ShowMessage('Erro ao fazer uma pesquisa.');
  end;
  ;
end;
end.
