unit untDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.OracleDef, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Phys.Oracle, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    CidadeTable: TFDQuery;
    dscidade: TDataSource;
    EstadoTable: TFDQuery;
    dsEstado: TDataSource;
    GrupoTable: TFDQuery;
    dsGrupo: TDataSource;
  private

    FDB_NAME: string;
    FSENHA: string;
    FUSERNAME: string;
    FSERVER: string;
    FPegaBD: string;
    procedure SetDB_NAME(const Value: string);
    procedure SetSENHA(const Value: string);
    procedure SetSERVER(const Value: string);
    procedure SetUSERNAME(const Value: string);
    class var FInstance: TDMConexao;
    class procedure Desconectar;
    procedure SetPegaBD(const Value: string);
    { Private declarations }
  public
    property DB_NAME: string read FDB_NAME write SetDB_NAME;
    property SENHA: string read FSENHA write SetSENHA;
    property USERNAME: string read FUSERNAME write SetUSERNAME;
    property SERVER: string read FSERVER write SetSERVER;
    class function GETInstance: TDMConexao;
    function PegaCon: TFDConnection;
    function Consulta: TFDQuery;
    procedure TipoConexao(pTipow: Integer);
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
    property PEGABD: string read FPEGABD write SetPEGABD;
    function ValidadorCampos(VERIFICA: Boolean; Verdadeiro, Falso: Variant): Variant;
  end;

var
  DMConexao: TDMConexao;

implementation

uses
  Vcl.Dialogs, Vcl.Controls;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConexao }

function TDMConexao.Consulta: TFDQuery;
begin
  if not (Assigned(FDQuery1)) then
    FDQuery1:= TFDQuery.Create(nil);
    FDQuery1.Connection:= PegaCon;
    Result:= FDQuery1;
end;

constructor TDMConexao.Create(AOwner: TComponent);
begin
  inherited;

end;

class procedure TDMConexao.Desconectar;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

destructor TDMConexao.Destroy;
begin

  inherited;
end;

class function TDMConexao.GETInstance: TDMConexao;
begin
  if not (Assigned(FInstance)) then
    FInstance:= TDMConexao.Create(nil);
    Result:= FInstance;
end;

function TDMConexao.PegaCon: TFDConnection;
begin
  if not (Assigned(FDConnection1)) then
    FDConnection1:= TFDConnection.Create(nil);
    Result:= FDConnection1;
end;


procedure TDMConexao.SetDB_NAME(const Value: string);
begin
  FDB_NAME := Value;
end;

procedure TDMConexao.SetPegaBD(const Value: string);
begin
  FPegaBD := Value;
end;

procedure TDMConexao.SetSENHA(const Value: string);
begin
  FSENHA := Value;
end;

procedure TDMConexao.SetSERVER(const Value: string);
begin
  FSERVER := Value;
end;

procedure TDMConexao.SetUSERNAME(const Value: string);
begin
  FUSERNAME := Value;
end;

procedure TDMConexao.TipoConexao(pTipow: Integer);
begin
  if pTipow = 0 then
    begin
      PegaCon.Connected:= False;
      PegaCon.Params.DriverID := 'FB';
      PegaCon.Params.Database := DB_NAME;
      PegaCon.Params.Username:= USERNAME;
      PegaCon.Params.Password:= SENHA;
      PegaCon.Connected:= True;
      PegaBD:= 'Firebird';
    end
  else
  if pTipow = 1 then
  begin
    PegaCon.Connected:= False;
    PegaCon.Params.DriverID := 'Ora';
    PegaCon.Params.Database := SERVER;
    PegaCon.Params.UserName:= USERNAME;
    PegaCon.Params.Password:= SENHA;
    PegaCon.Connected:= True;
    PegaBD:= 'Oracle';
  end;
end;

function TDMConexao.ValidadorCampos(VERIFICA: Boolean; Verdadeiro,
  Falso: Variant): Variant;
begin
 if VERIFICA then
   Result := Verdadeiro
 else
   Result:= Falso;
end;

initialization
finalization
  TDMConexao.Desconectar;
end.
