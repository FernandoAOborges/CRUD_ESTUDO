unit untClienteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untTelaPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, untClienteModel,
  Vcl.Menus, Vcl.DBCtrls, Vcl.Mask, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin;

type
  TfrmCliente = class(TfrmTelaPadrao)
    pmGrid: TPopupMenu;
    Visualizar1: TMenuItem;
    Editar1: TMenuItem;
    DBGridEstado: TDBGrid;
    DBGridCidade: TDBGrid;
    chk1: TCheckBox;
    DateTimePicker: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    ds1: TDataSource;
    DBText: TDBText;
    edtData: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSALVARClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDELETARClick(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure Visualizar1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure DBGridCidadeDblClick(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    FTipo: string;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;
  FCLienteCRUD: TCliente;

implementation

uses
  untDMConexao;

{$R *.dfm}

procedure TfrmCliente.btn1Click(Sender: TObject);
begin
  inherited;
  edtNome.Enabled := False;
  btnDELETAR.Enabled := False;
  btnSALVAR.Enabled := False;
  edtCODIGO.Visible := True;
  DBGridCidade.Visible := False;
  DBGridEstado.Visible := False;
  chk1.Visible := False;
  lblEstado.Visible := False;
  lblCidade.Visible := False;
  DateTimePicker.Visible := False;

  try
    edtCODIGO.Text := TDMConexao.GETInstance.Consulta.FieldByName('CODIGO').Text;
    edtNome.Text := TDMConexao.GETInstance.Consulta.FieldByName('NOME').Text;
    edtData.Text := TDMConexao.GETInstance.Consulta.FieldByName('DATA').Text;
  except on E: Exception do
    ShowMessage('Verifique sua Conexão!');
  end;
end;

procedure TfrmCliente.btn3Click(Sender: TObject);
begin
  inherited;
  DBGridCidade.Visible := True;
  DBGridEstado.Visible := True;
  edtNome.Enabled := True;
  edtData.Enabled := False;
  btnDELETAR.Enabled := True;
  btnSALVAR.Enabled := True;
  edtCODIGO.Visible := True;
  FTipo := 'UPDATE';
  DBGridEstado.Enabled := False;
  DBGridCidade.Enabled := False;
  chk1.Visible := True;
  lblEstado.Visible := True;
  lblCidade.Visible := True;
  DateTimePicker.Visible := True;
  lblEstado.Enabled := False;
  lblCidade.Enabled := False;

  try
    edtCODIGO.Text := TDMConexao.GETInstance.Consulta.FieldByName('CODIGO').Text;
    edtNome.Text := TDMConexao.GETInstance.Consulta.FieldByName('NOME').Text;
    edtData.Text := TDMConexao.GETInstance.Consulta.FieldByName('DATA').Text;
  except on E: Exception do
    ShowMessage('Verifique sua Conexão!');
  end;

end;

procedure TfrmCliente.btn6Click(Sender: TObject);
begin
  inherited;
  FTipo := 'SALVAR';
  btnDELETAR.Enabled := False;
  btnSALVAR.Enabled := True;
  edtCODIGO.Visible := False;
  edtNome.Enabled := True;
  edtData.Enabled := False;
  DBGridCidade.Visible := True;
  DBGridEstado.Visible := True;
  DBGridEstado.Enabled := True;
  DBGridCidade.Enabled := True;
  chk1.Visible := False;
  lblEstado.Visible := True;
  lblCidade.Visible := True;
  DateTimePicker.Visible := True;
  lblEstado.Enabled := True;
  lblCidade.Enabled := True;
end;

procedure TfrmCliente.btnDELETARClick(Sender: TObject);
begin
  inherited;
  FCLienteCRUD:= TCliente.Create;
  try
    if not TDMConexao.GETInstance.Consulta.IsEmpty then
    begin
      if MessageDlg('Deseja Deletar???', mtInformation, [mbYes, mbNo], 0) = mrYes then
        FCLienteCRUD.DELETAR(edtCODIGO.Text);
    end;
    TabControl(True, False);
  finally
    FCLienteCRUD.Free;
  end;

end;

procedure TfrmCliente.btnProcurarClick(Sender: TObject);
begin
  inherited;
  FCLienteCRUD := TCliente.Create;
  try
    FCLienteCRUD.Pesquisar(cbbCampos.Text, edtPesquisa.Text);
  finally
    FCLienteCRUD.Free;
  end;
end;

procedure TfrmCliente.btnSALVARClick(Sender: TObject);
begin
  inherited;
  FCLienteCRUD := TCliente.Create;
  try
    TDMConexao.GETInstance.Consulta.Edit;
    if TDMConexao.GETInstance.Consulta.State IN [dsEdit, dsInsert] then
    begin
      if MessageDlg('Deseja Salvar???', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        FCLienteCRUD.InsereUpdate([COPY(edtNome.Text,0,40),FormatDateTime('DD/MM/YYYY',DateTimePicker.DateTime), DBText.Caption,edtCODIGO.Text], FTipo);
        TabControl(True, False);
        chk1.Checked := False;
      end;
    end;
  finally
    FCLienteCRUD.Free;
  end;


end;

procedure TfrmCliente.chk1Click(Sender: TObject);
begin
  inherited;
  if chk1.Checked then
  begin
    DBGridEstado.Enabled:= True;
    DBGridCidade.Enabled:= True;
    DBGridEstado.Refresh;
    DBGridCidade.Refresh;
    lblEstado.Enabled := True;
    lblCidade.Enabled := True;
  end
  else
  begin
    DBGridCidade.Enabled:= False;
    DBGridEstado.Enabled:= False;
    DBGridEstado.Refresh;
    DBGridCidade.Refresh;
    lblEstado.Enabled := False;
    lblCidade.Enabled := False;
  end;

end;

procedure TfrmCliente.dbgrd1DblClick(Sender: TObject);
begin
  inherited;
  pmGrid.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
end;

procedure TfrmCliente.dbgrd1TitleClick(Column: TColumn);
begin
  inherited;
  if TDMConexao.GETInstance.Consulta.IndexFieldNames = Column.FieldName then
    TDMConexao.GETInstance.Consulta.IndexFieldNames := Column.FieldName + ':D'
  else
    TDMConexao.GETInstance.Consulta.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCliente.DBGridCidadeDblClick(Sender: TObject);
begin
  inherited;
  btnSALVARClick(Sender);
end;

procedure TfrmCliente.Editar1Click(Sender: TObject);
begin
  inherited;
  btn3Click(Sender);
end;

procedure TfrmCliente.edtPesquisaExit(Sender: TObject);
begin
  inherited;
  if edtPesquisa.Text = EmptyStr then
  begin
    btnProcurarClick(Sender);
  end;
end;

procedure TfrmCliente.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    btnProcurarClick(Sender);
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Action := caFree;
   frmCliente := nil;
end;

procedure TfrmCliente.FormShow(Sender: TObject);
var
  vSQL_Entrada: string;
begin
  inherited;
  vSQL_Entrada := ' SELECT C.cod_cliente as CODIGO, '+
                  ' C.cod_cidade AS CODIGO_CIDADE, '+
                  ' C.nome AS NOME, '+
                  ' C.datainicial AS DATA, '+
                  ' CI.nom_cidade AS NOME_CIDADE, '+
                  ' CI.cod_estado AS CODIGO_ESTADO, '+
                  ' ES.nom_estado AS NOME_ESTADO FROM CLIENTE C '+
                  ' INNER JOIN cidade CI ON C.cod_cidade = CI.cod_cidade '+
                  ' INNER JOIN ESTADO ES ON ES.cod_estado = CI.cod_estado ';
  try
    TDMConexao.GETInstance.Consulta.Close;
    TDMConexao.GETInstance.Consulta.SQL.Clear;
    TDMConexao.GETInstance.Consulta.Open(vSQL_Entrada);
    TDMConexao.GETInstance.CidadeTable.Open;
    TDMConexao.GETInstance.EstadoTable.Open;
  except on E: Exception do
    ShowMessage(E.Message);
  end;


end;

procedure TfrmCliente.Visualizar1Click(Sender: TObject);
begin
  inherited;
  btn1Click(Sender);
end;

end.
