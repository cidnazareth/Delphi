unit uConsLojaShopping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, EChkCGC, Mask, Grids, DBGrids, DB,
  ELibFnc, jpeg;

type
  TfrmConsLojaShopping = class(TForm)
    Label20: TLabel;
    BtnSair: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnExportaExcel: TBitBtn;
    gbCpfDependente: TGroupBox;
    sbLocalizaCnpjLoja: TSpeedButton;
    meCnpjLoja: TMaskEdit;
    CheckCNPJ: TEvCheckCGC;
    btnConsultaTodos: TBitBtn;
    dsConsLojasShopping: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    dsConsProdutosPromocao: TDataSource;
    gbTitular: TGroupBox;
    imgProduto: TImage;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCnpjLojaClick(Sender: TObject);
    procedure btnConsultaTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meCnpjLojaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure consProdutosLoja(id_loja:integer);
    procedure carregaImagem(path:string);
    function  localizaCnpj(cnpj: string): boolean;
  public
    { Public declarations }
  end;

var
  frmConsLojaShopping: TfrmConsLojaShopping;

implementation

uses uDmConsulta;

{$R *.dfm}

procedure TfrmConsLojaShopping.BtnSairClick(Sender: TObject);
begin
   frmConsLojaShopping.close;
end;

procedure TfrmConsLojaShopping.sbLocalizaCnpjLojaClick(Sender: TObject);
begin

   //Verifica Validade do CPF
   CheckCNPJ.CGC := meCnpjLoja.Text;
   if (CheckCNPJ.Valid = false) or (meCnpjLoja.Text = '  .   .   /    -  ') then begin
      showmessage('CNPJ Inválido !');
      exit;
   end;


  if localizaCnpj(meCnpjLoja.Text) then begin
    //Pesquisa Produtos loja
    consProdutosLoja(dmConsulta.cdsConsLojasShoppingID.value);
    carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);
  end;


end;



function TfrmConsLojaShopping.localizaCnpj(cnpj: string): boolean;
begin
try

   //Consulta loja
   with dmConsulta.cdsConsLojasShopping do begin
      close;
      Params[0].Value := null;
      Params[1].Value := meCnpjLoja.Text;
      open;
   end;

   result := false;

   if dmConsulta.cdsConsLojasShopping.recordcount > 0 then
      result := true


   except
      showmessage('Ocorreu um erro consultando loja !');
   end;

end;




procedure TfrmConsLojaShopping.consProdutosLoja(id_loja: integer);
begin
try
   //Consulta loja
   with dmConsulta.cdsConsProdutosPromocao do begin
      close;
      Params[0].Value := id_loja;
      open;
   end;

   except
      showmessage('Ocorreu um erro consultando produtos !');
   end;

end;



procedure TfrmConsLojaShopping.btnConsultaTodosClick(Sender: TObject);
begin
try
   //Consulta loja
   with dmConsulta.cdsConsLojasShopping do begin
      close;
      Params[0].Value := null;
      Params[1].Value := null;
      open;
   end;   

   //Pesquisa Produtos loja
   consProdutosLoja(dmConsulta.cdsConsLojasShoppingID.Value);
   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);

   except
      showmessage('Ocorreu um erro consultando as lojas !');
   end;

end;

procedure TfrmConsLojaShopping.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmConsulta.cdsConsLojasShopping.close;
   dmConsulta.cdsConsProdutosPromocao.close;

end;

procedure TfrmConsLojaShopping.meCnpjLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) then begin
      key := #0;
      sbLocalizaCnpjLoja.Click;
   end;
end;



procedure TfrmConsLojaShopping.DBGrid1DblClick(Sender: TObject);
begin
   consProdutosLoja(dmConsulta.cdsConsLojasShoppingId.Value);
   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);
end;

procedure TfrmConsLojaShopping.DBGrid2DblClick(Sender: TObject);
begin
   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);
end;

procedure TfrmConsLojaShopping.carregaImagem(path: string);
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

end.
