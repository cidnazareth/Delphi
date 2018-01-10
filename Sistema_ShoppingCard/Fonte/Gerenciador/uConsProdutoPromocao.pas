unit uConsProdutoPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, eLibFnc, Mask,
  DBCtrls, jpeg;

type
  TfrmConsProdutoPromocao = class(TForm)
    Label20: TLabel;
    BtnImprimir: TBitBtn;
    BtnExportaExcel: TBitBtn;
    BtnSair: TBitBtn;
    gbTitular: TGroupBox;
    imgProduto: TImage;
    DBGrid2: TDBGrid;
    dsConsProdutosPromocao: TDataSource;
    Label1: TLabel;
    lbQtdeProd: TLabel;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBCnpj: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    function consultaProdutos():integer;
    procedure carregaImagem(path:string);
    procedure localizaLoja(id_loja:integer);
  public
    { Public declarations }
  end;

var
  frmConsProdutoPromocao: TfrmConsProdutoPromocao;
  id_loja : integer;

implementation

uses uDmConsulta, uDmLocaliza;

{$R *.dfm}

procedure TfrmConsProdutoPromocao.BtnSairClick(Sender: TObject);
begin
   frmConsProdutoPromocao.close;
end;

procedure TfrmConsProdutoPromocao.carregaImagem(path: string);
begin
   try
      if isfile(path) then
         imgProduto.Picture.LoadFromFile(path)
      else
         imgProduto.Picture := nil;
          
   except
      exit;
   end;
end;

function TfrmConsProdutoPromocao.consultaProdutos: integer;
begin
   //Consulta loja
   with dmConsulta.cdsConsProdutosPromocao do begin
      close;
      Params[0].Value := null;
      open;
   end;

   result := dmConsulta.cdsConsProdutosPromocao.recordCount;

   if dmConsulta.cdsConsProdutosPromocao.RecordCount > 0 then
      id_loja := dmConsulta.cdsConsProdutosPromocaoID_LOJA.Value;


end;

procedure TfrmConsProdutoPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmconsulta.cdsConsProdutosPromocao.close;
   dmLocaliza.cdsLocalizaCnpjLoja.Close;
end;

procedure TfrmConsProdutoPromocao.FormShow(Sender: TObject);
begin
   lbqtdeProd.caption := inttostr(consultaProdutos());
   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);

   //if (id_loja <> dmConsulta.cdsConsProdutosPromocaoID_LOJA.Value) then
      localizaLoja(dmConsulta.cdsConsProdutosPromocaoID_LOJA.Value);
end;

procedure TfrmConsProdutoPromocao.DBGrid2DblClick(Sender: TObject);
begin
   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);
   if (id_loja <> dmConsulta.cdsConsProdutosPromocaoID_LOJA.Value) then
      localizaLoja(dmConsulta.cdsConsProdutosPromocaoID_LOJA.Value);
end;


procedure TfrmConsProdutoPromocao.localizaLoja(id_loja:integer);
begin
   //Localiza Loja
   with dmLocaliza.cdsLocalizaCnpjLoja do begin
      close;
      params[0].Value := id_loja;
      params[1].Value := null;
      open;
   end;
end;



end.
