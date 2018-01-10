unit uDetalheProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, DBXpress, Printers;

type
  TfrmDetalheProduto = class(TForm)
    imgFundo: TImage;
    TimeClose: TTimer;
    imgProduto: TImage;
    pnGerarVoucher: TPanel;
    Shape1: TShape;
    lblProduto: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label4: TLabel;
    Label3: TLabel;
    lblDisponivel: TLabel;
    lblPontos: TLabel;
    Shape6: TShape;
    lblResgate: TLabel;
    Label6: TLabel;
    Shape4: TShape;
    Label9: TLabel;
    lblNumero: TLabel;
    lblMensagem: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnGerarVoucherClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CarregaProduto(idProduto:integer):boolean;
    function localizaTipoMovimento(idTipo:integer):boolean;
    function localizaCartao(cpf:string):boolean;
    procedure ZeraApplication();
    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure GeraVoucher(idCartao:integer; idProduto:integer; FatorCusto:double);
    procedure imprimeVoucher(idvoucher:integer; NrCartao: string; NomeLoja:string;
                             CNPJ:string; Nrloja:string; Produto:string);
    procedure ProcessaVoucher(cpf:string);
    procedure mensagem(msg:string);

  public
    { Public declarations }
    idProduto : integer;

    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

var
  frmDetalheProduto: TfrmDetalheProduto;

  idCartao, idLoja, idVoucher : integer;
  NrCartao, CNPJ, Nrloja, NomeLoja, Produto : string;
  Pontos : Double;

implementation

uses uDmCliente, uConfirmaDigital, uPrincipal, uDmInsert;

{$R *.dfm}


procedure TfrmDetalheProduto.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmCliente.SQLConnecShoppCard.StartTransaction(Trans);
end;

procedure TfrmDetalheProduto.CommitTransaction;
begin
  dmCliente.SQLConnecShoppCard.Commit(Trans);
end;

procedure TfrmDetalheProduto.RollbackTransaction;
begin
  dmCliente.SQLConnecShoppCard.Rollback(Trans);
end;


function TfrmDetalheProduto.localizaCartao(cpf:string):boolean;
begin
   with dmCliente.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result:= false;
   if dmCliente.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;
end;

function TfrmDetalheProduto.localizaTipoMovimento(idTipo:integer):boolean;
begin
   with dmCliente.cdsConsTipoMovimento do begin
      close;
      params[0].value := idTipo;
      open;
   end;

   result:= false;
   if dmCliente.cdsConsTipoMovimento.RecordCount > 0 then
      result:= true;
end;


procedure TfrmDetalheProduto.FormShow(Sender: TObject);
var
  path : string;
  disponivel : integer;
begin
    frmDetalheProduto.Height := 768;
    frmDetalheProduto.Width := 1024;

    if CarregaProduto(idProduto) then begin
         path := dmCliente.cdsProdutosPromocao.FieldByName('PATH_IMAGEM').AsString;
         Pontos := dmCliente.cdsProdutosPromocao.FieldByName('QTDE_PONTOS').value;
         disponivel := dmCliente.cdsProdutosPromocao.FieldByName('QTDE_PRODUTO').value -
                       dmCliente.cdsProdutosPromocao.FieldByName('QTDE_CUPOM_EMITIDO').value;

         Produto := dmCliente.cdsProdutosPromocao.FieldByName('DESC_PRODUTO').AsString;
         idLoja := dmCliente.cdsProdutosPromocao.FieldByName('ID_LOJA').value;
         NomeLoja := dmCliente.cdsProdutosPromocao.FieldByName('NOME_FANTASIA').asstring;
         CNPJ := dmCliente.cdsProdutosPromocao.FieldByName('CNPJ').asstring;
         Nrloja := dmCliente.cdsProdutosPromocao.FieldByName('NUMERO_LOJA').asstring;


         imgProduto.Picture.LoadFromFile(path);

         lblProduto.Caption := produto;
         lblPontos.Caption := floattostr(pontos);
         lblDisponivel.Caption := inttostr(disponivel);
         lblpontos.Width := 236;
         lbldisponivel.Width := 236;
         lblProduto.Width := 980;

         lblResgate.Caption := NomeLoja;
         lblNumero.Caption := Nrloja;
         lblResgate.Width := 236;
         lblNumero.Width := 236;

         if length(lblResgate.Caption) > 21 then
            lblResgate.Font.Size := 12;
    end
    else begin
      showmessage('Produto indisponível.');
      frmDetalheProduto.close;
    end;
end;  


function TfrmDetalheProduto.CarregaProduto(idProduto:integer):boolean;
begin 
    with dmCliente.cdsProdutosPromocao do begin
        close;
        params[0].value := null;
        params[1].value := idProduto;
        open;
    end;

   result:= false;
   if dmCliente.cdsProdutosPromocao.RecordCount > 0 then
      result:= true;
end;


procedure TfrmDetalheProduto.TimeCloseTimer(Sender: TObject);
begin
    frmDetalheProduto.Close;
end;

procedure TfrmDetalheProduto.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmDetalheProduto.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmDetalheProduto.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmDetalheProduto.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;

procedure TfrmDetalheProduto.pnGerarVoucherClick(Sender: TObject);
var
  cpf : string;
begin
   try
      Application.CreateForm(TfrmConfirmaDigital,frmConfirmaDigital);
      frmConfirmaDigital.ShowModal;
   finally

      if frmConfirmaDigital.DigitalConfirmada.Text = 'S' then begin
          cpf := frmConfirmaDigital.meCpf.Text;
          frmConfirmaDigital.free;
          frmConfirmaDigital := nil;

          ProcessaVoucher(cpf);
      end;

      frmDetalheProduto.Close;
   end;
end;


procedure TfrmDetalheProduto.ProcessaVoucher(cpf:string);
var
  FatorCusto, SaldoCartao : Double;
begin
  idVoucher := 0;

  if localizaCartao(cpf) then begin
      idCartao := dmCliente.cdsLocalizaCartao.fieldbyname('ID').value;
      NrCartao := dmCliente.cdsLocalizaCartao.fieldbyname('CARTAO').AsString;
      SaldoCartao := dmCliente.cdsLocalizaCartao.fieldbyname('QTDE_PONTOS').asFloat;


      if SaldoCartao >= Pontos then begin // verifica se cliente tem saldo para gerar o cupom
         if localizaTipoMovimento(6) then begin
            FatorCusto := dmCliente.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
            if FatorCusto = 1 then
               FatorCusto := 0
            else
                FatorCusto := dmCliente.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
         end;

         dmCliente.cdsConsTipoMovimento.close;

         GeraVoucher(idCartao, idProduto, FatorCusto)
      end
      else begin
       mensagem('Saldo insuficiente...');
       exit
      end;

  end
  else
     showmessage('Cartão não localizado !');


  if idVoucher > 0 then
     imprimeVoucher(idVoucher,NrCartao,NomeLoja,CNPJ,Nrloja,Produto);

end;

procedure TfrmDetalheProduto.mensagem(msg:string);
begin
  lblMensagem.caption := msg;
  lblMensagem.width := 370;
  lblMensagem.Visible := true;
  application.ProcessMessages;
  sleep(3000);
  lblMensagem.Visible := false; 
end;




procedure TfrmDetalheProduto.GeraVoucher(idCartao:integer; idProduto:integer; FatorCusto:Double);
var
	Sucesso: Boolean; 
begin
    StartTransaction;
try
       // Insere na tabela de Voucher e retorna o ID
       with dmInsert.sqlVoucherIns do begin
         close;
         Params[0].Value := idProduto;
         Params[1].Value := frmprincipal.gIdTerminal;
         Params[2].Value := frmprincipal.gIdUsuarioSistema;
         ExecSQL;
         idVoucher := ParamByName('id').AsInteger;
       end;

       // Insere na tabela de Movimento
       with dmInsert.sqlMovimentoIns do begin
       close;
         Params[0].Value := idCartao;
         Params[1].Value := 6;         // (id_tipo_movimento) - Geração de Voucher para Produto.
         Params[2].Value := null;      // (idCupom) - Como não foi geração de cupom, ID é nulo
         Params[3].Value := idLoja;    // (idLoja) - Loja que vai trocar o Voucher por produto
         Params[4].Value := idVoucher; // (idVoucher) - ID do Voucher gerado
         Params[5].Value := Pontos;
         Params[6].Value := Pontos * FatorCusto;      // Custo da Operação
         Params[7].Value := frmprincipal.gIdTerminal;
         Params[8].Value := frmprincipal.gIdUsuarioSistema;
         ExecSQL;
       end;

       Sucesso := True;

    except
       Sucesso := False;
    end;

	  if Sucesso then
       CommitTransaction
	  else
       RollbackTransaction;
end;


procedure TfrmDetalheProduto.imprimeVoucher(idvoucher:integer; NrCartao: string; NomeLoja:string;
                                         CNPJ:string; Nrloja:string; Produto:string);
var
  Linha:integer;
  Coluna:integer;
begin

  mensagem('Aguarde, imprimindo voucher...');

  Printer.Orientation := poPortrait; //poLandscape;
  Printer.BeginDoc;
  Printer.Canvas.Pen.Width := 5;
  Printer.Canvas.Font.Name := 'Arial';
  Printer.Canvas.Font.Size := 15;
  Linha := 10;
  Coluna:= 20;

	Printer.Canvas.TextOut(Coluna-5,Linha,'SHOPPING CARD');

	Linha := Linha - Printer.Canvas.Font.Height + 60 ;

	Printer.Canvas.TextOut(Coluna+95,Linha,'Voucher: ' + inttostr(idvoucher));

	Linha := Linha - Printer.Canvas.Font.Height + 80 ;
  Printer.Canvas.Font.Size := 10;

	Printer.Canvas.TextOut(Coluna,Linha,'Cartão: ' + NrCartao);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'CNPJ: ' + CNPJ);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Loja: ' + NomeLoja);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Loja Nr.: ' + Nrloja);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Produto: ' + Produto);

	Linha := Linha - Printer.Canvas.Font.Height + 80 ;

	Printer.Canvas.Font.Size := 9;
	Printer.Canvas.TextOut(Coluna,Linha, DateTimeToStr(now));

  Printer.EndDoc;
end;

procedure TfrmDetalheProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ZeraApplication();

    dmCliente.cdsLocalizaCartao.close;
    dmCliente.cdsConsTipoMovimento.close;
    dmCliente.cdsProdutosPromocao.close;

end;

end.
