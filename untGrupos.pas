unit untGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxTextEdit, cxDBEdit, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmGrupos = class(TForm)
    DBGrid1: TDBGrid;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    edt1: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupos: TfrmGrupos;

implementation

uses
  untDMConexao;

{$R *.dfm}

procedure TfrmGrupos.btn1Click(Sender: TObject);
const
  vInsert = ' INSERT INTO GRUPO (NOME_GRUPO) ' +
                               '  VALUES (:NOME_GRUPO)';
begin
  TDMConexao.GETInstance.PegaCon.StartTransaction;
  try
    if Length(Trim(edt1.Text)) = 0 then
    begin
      edt1.SetFocus;
      raise Exception.Create('Para salvar coloque nome do grupo 1°.');
    end;
    TDMConexao.GETInstance.GrupoTable.SQL.Text:= vInsert;
    TDMConexao.GETInstance.GrupoTable.ParamByName('NOME_GRUPO').Value :=  UpperCase(edt1.Text);
    TDMConexao.GETInstance.GrupoTable.ExecSQL;
    TDMConexao.GETInstance.PegaCon.Commit;
    ShowMessage('Salvo com sucesso');
    TDMConexao.GETInstance.GrupoTable.Open('SELECT * FROM GRUPO');
  except on E: Exception do
  BEGIN
    ShowMessage(E.Message);
    TDMConexao.GETInstance.PegaCon.Rollback;
  END;
end;
end;

procedure TfrmGrupos.btn2Click(Sender: TObject);
const
  vDelete = 'DELETE FROM GRUPO '+
            ' WHERE (ID_GRUPO = :ID_GRUPO)' ;
var
  vPegaCodigo: string;
begin
  vPegaCodigo := TDMConexao.GETInstance.GrupoTable.FieldByName('ID_GRUPO').Value;
  TDMConexao.GETInstance.PegaCon.StartTransaction;
  try
  if MessageDlg('Deseja deletar o Grupo com nome : '+ TDMConexao.GETInstance.GrupoTable.FieldByName('NOME_GRUPO').Value,
                 mtInformation, mbYesNo,0) = mrYes then
  begin
    TDMConexao.GETInstance.GrupoTable.SQL.Text:= vDelete;
    TDMConexao.GETInstance.GrupoTable.ParamByName('ID_GRUPO').AsInteger :=  StrToInt(vPegaCodigo);
    TDMConexao.GETInstance.GrupoTable.ExecSQL;
    TDMConexao.GETInstance.PegaCon.Commit;
    ShowMessage('Deletado com sucesso');
    TDMConexao.GETInstance.GrupoTable.Open('SELECT * FROM GRUPO');
  end;
  except on E: Exception do
  begin
    ShowMessage(E.Message);
    TDMConexao.GETInstance.PegaCon.Rollback;
  end;
end;
end;

procedure TfrmGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmGrupos:= nil;
end;

procedure TfrmGrupos.FormShow(Sender: TObject);
begin
  try
    TDMConexao.GETInstance.GrupoTable.Open;
  except on E: Exception do
    ShowMessage(E.Message);
  end;

end;
end.
