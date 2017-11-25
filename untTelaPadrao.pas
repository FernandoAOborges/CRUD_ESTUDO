unit untTelaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin;

type
  TfrmTelaPadrao = class(TForm)
    pgc1: TPageControl;
    tbsht1: TTabSheet;
    tbsht2: TTabSheet;
    pnl1: TPanel;
    cbbCampos: TComboBox;
    edtPesquisa: TEdit;
    btnProcurar: TButton;
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    btn5: TButton;
    btnSALVAR: TButton;
    btnDELETAR: TButton;
    edtNome: TEdit;
    edtCODIGO: TEdit;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn6: TToolButton;
    ImageListBUTTONS: TImageList;
    btn7: TToolButton;
    btn8: TToolButton;
    btn9: TToolButton;
    btn10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure TabControl(pTAB, pTAB2: Boolean);
    procedure btn5Click(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSALVARClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmTelaPadrao: TfrmTelaPadrao;

implementation

uses
  untDMConexao;

{$R *.dfm}

procedure TfrmTelaPadrao.btnNovoClick(Sender: TObject);
begin
  edtCODIGO.Text:= EmptyStr;
  edtNome.Text:= EmptyStr;
  TabControl(False, True);
end;

procedure TfrmTelaPadrao.btnEditarClick(Sender: TObject);
begin
  TabControl(False, True);
end;

procedure TfrmTelaPadrao.btnVisualizarClick(Sender: TObject);
begin
  TabControl(False, True);
end;

procedure TfrmTelaPadrao.btn10Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaPadrao.btn1Click(Sender: TObject);
begin
  TabControl(False, TRUE);
end;

procedure TfrmTelaPadrao.btn3Click(Sender: TObject);
begin
  TabControl(False, TRUE);
end;

procedure TfrmTelaPadrao.btn5Click(Sender: TObject);
begin
  TabControl(True, False);
end;

procedure TfrmTelaPadrao.btn6Click(Sender: TObject);
begin
  edtCODIGO.Text:= EmptyStr;
  edtNome.Text:= EmptyStr;
  TabControl(False, TRUE);
end;

procedure TfrmTelaPadrao.btnSALVARClick(Sender: TObject);
begin
  if (Length(edtNome.Text) = 0) then
    raise Exception.Create('Campo vazio');
end;

procedure TfrmTelaPadrao.FormShow(Sender: TObject);
begin
  TabControl(True, False);
end;

procedure TfrmTelaPadrao.TabControl(pTAB, pTAB2: Boolean);
begin
  pgc1.Pages[0].TabVisible:= pTAB;
  pgc1.Pages[1].TabVisible:= pTAB2;
end;
end.
