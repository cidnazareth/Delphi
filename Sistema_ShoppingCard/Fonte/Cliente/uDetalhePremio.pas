unit uDetalhePremio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, DBXpress, Printers;

type
  TfrmDetalhePremio = class(TForm)
    imgFundo: TImage;
    TimeClose: TTimer;
    imgPremio: TImage;
    Shape1: TShape;
    lblPremio: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label4: TLabel;
    Label3: TLabel;
    lblValor: TLabel;
    lblPontos: TLabel;
    Shape6: TShape;
    lblDtUltimoDia: TLabel;
    Label6: TLabel;
    Shape4: TShape;
    Label9: TLabel;
    lblDtSorteio: TLabel;
    lblMensagem: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Label1: TLabel;
    pnGerarCupom: TPanel;
    procedure FormShow(Sender: TObject);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnGerarCupomClick(Sender: TObject);
  private
    { Private declarations }
    function localizaTipoMovimento(idTipo:integer):boolean;
    function localizaCartao(cpf:string):boolean;
    procedure ZeraApplication();
    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure ProcessaCupom(cpf:string);
    procedure mensagem(msg:string);
    function CarregaPremio(idpremio:integer):boolean;
    procedure GeraCupom(idCartao:integer; idPremio:integer; FatorCusto:double);
    function GeraNumeroCupom(idSorteio:integer):integer;
    procedure imprimeCupom(NrCupom:integer;NrCartao:string;Premio:string;Sorteio:string;DtSorteio:string);

  public
    { Public declarations }
    idPremio : integer;

    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

var
  frmDetalhePremio: TfrmDetalhePremio;

  idCartao, idCupom, idSorteio, NrCupom : integer;
  NrCartao, Premio, Sorteio, DtSorteio, DtUltimoDia : string;
  Pontos, Valor : Double;

implementation

uses uDmCliente, uConfirmaDigital, uPrincipal, uDmInsert;

{$R *.dfm}


procedure TfrmDetalhePremio.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmCliente.SQLConnecShoppCard.StartTransaction(Trans);
end;

procedure TfrmDetalhePremio.CommitTransaction;
begin
  dmCliente.SQLConnecShoppCard.Commit(Trans);
end;

procedure TfrmDetalhePremio.RollbackTransaction;
begin
  dmCliente.SQLConnecShoppCard.Rollback(Trans);
end;



function TfrmDetalhePremio.localizaCartao(cpf:string):boolean;
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

function TfrmDetalhePremio.localizaTipoMovimento(idTipo:integer):boolean;
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


procedure TfrmDetalhePremio.FormShow(Sender: TObject);
var
  path : string;
begin
    frmDetalhePremio.Height := 768;
    frmDetalhePremio.Width := 1024;

    if CarregaPremio(idPremio) then begin
         path := dmCliente.cdsPremioSorteio.FieldByName('PATH_IMAGEM').AsString;
         Pontos := dmCliente.cdsPremioSorteio.FieldByName('QTDE_PONTOS_CUPOM').value;
         Premio := dmCliente.cdsPremioSorteio.FieldByName('DESC_PREMIO').AsString;
         Sorteio := dmCliente.cdsPremioSorteio.FieldByName('DESC_SORTEIO').AsString;
         DtUltimoDia := dmCliente.cdsPremioSorteio.FieldByName('DT_FIM').AsString;
         DtSorteio := dmCliente.cdsPremioSorteio.FieldByName('DT_SORTEIO').AsString;
         Valor := dmCliente.cdsPremioSorteio.FieldByName('VALOR_FISCAL_PREMIO').value;
         idSorteio := dmCliente.cdsPremioSorteio.FieldByName('ID_SORTEIO').value;

         imgPremio.Picture.LoadFromFile(path);

         lblPremio.Caption := Premio;
         lblPontos.Caption := floattostr(Pontos);
         lblDtUltimoDia.Caption := DtUltimoDia;
         lblDtSorteio.Caption := DtSorteio;
         lblValor.Caption := dmCliente.transform(Valor);

         lblpontos.Width := 236;
         lblDtUltimoDia.Width := 236;
         lblDtSorteio.Width := 236;
         lblValor.Width := 236;


         //if length(lblResgate.Caption) > 21 then
           // lblResgate.Font.Size := 12;
    end
    else begin
      showmessage('Houve uma falha ao carregar detalhe do sorteio.');
      frmDetalhePremio.close;
    end;
end;  


function TfrmDetalhePremio.CarregaPremio(idpremio:integer):boolean;
begin 
    with dmCliente.cdsPremioSorteio do begin
        close;
        open;
    end;

    dmCliente.cdsPremioSorteio.Filter := 'ID=' + inttostr(idpremio);
    dmCliente.cdsPremioSorteio.Filtered := TRUE;     

   result:= false;
   if dmCliente.cdsPremioSorteio.RecordCount > 0 then
      result:= true;
end;


procedure TfrmDetalhePremio.TimeCloseTimer(Sender: TObject);
begin
    frmDetalhePremio.Close;
end;



procedure TfrmDetalhePremio.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmDetalhePremio.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmDetalhePremio.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmDetalhePremio.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;


procedure TfrmDetalhePremio.ProcessaCupom(cpf:string);
var
  FatorCusto, SaldoCartao : Double;
begin
  idCupom := 0;

  if localizaCartao(cpf) then begin
      idCartao := dmCliente.cdsLocalizaCartao.fieldbyname('ID').value;
      NrCartao := dmCliente.cdsLocalizaCartao.fieldbyname('CARTAO').AsString;
      SaldoCartao := dmCliente.cdsLocalizaCartao.fieldbyname('QTDE_PONTOS').asFloat;


      if SaldoCartao >= Pontos then begin // verifica se cliente tem saldo para gerar o cupom
         if localizaTipoMovimento(2) then begin
            FatorCusto := dmCliente.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
            if FatorCusto = 1 then
               FatorCusto := 0
            else
               FatorCusto := dmCliente.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
         end;

         dmCliente.cdsConsTipoMovimento.close;

         GeraCupom(idCartao, idPremio, FatorCusto);

      end
      else begin
       mensagem('Saldo insuficiente...');
       exit
      end;

  end
  else
     showmessage('Cartão não localizado !');


  if idCupom > 0 then
     imprimeCupom(NrCupom,NrCartao,Premio,Sorteio,dtSorteio);

end;

procedure TfrmDetalhePremio.mensagem(msg:string);
begin
  lblMensagem.caption := msg;
  lblMensagem.width := 370;
  lblMensagem.Visible := true;
  application.ProcessMessages;
  sleep(3000);
  lblMensagem.Visible := false;
end;



procedure TfrmDetalhePremio.GeraCupom(idCartao:integer; idPremio:integer; FatorCusto:Double);
var
	Sucesso: Boolean;
begin
    NrCupom  := GeraNumeroCupom(idSorteio);

    StartTransaction;

try
    // gera o cupom para sorteio
    with dmInsert.sqlCupomSorteioIns do begin
      close;
      Params[0].Value := idSorteio;
      Params[1].Value := NrCupom;
      Params[2].Value := idPremio;
      Params[3].Value := idCartao;
      Params[4].Value := frmprincipal.gIdTerminal;
      Params[5].Value := frmprincipal.gIdUsuarioSistema;
      ExecSQL;
      idCupom := ParamByName('id').AsInteger;
    end;


    // Insere na tabela de Movimento
    with dmInsert.sqlMovimentoIns do begin
    close;
      Params[0].Value := idCartao;
      Params[1].Value := 2;       // (id_tipo_movimento) - Geração de cupom para sorteio
      Params[2].Value := idCupom;
      Params[3].Value := Null;     // (idLoja) - Como não foi uma compra, o ID é nulo
      Params[4].Value := Null;     // (idVoucher) - Como não foi a emissão de um voucher, o ID é nulo
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



function TfrmDetalhePremio.GeraNumeroCupom(idSorteio:integer):integer;
var nrCupom:integer;
var qtdeNumeros:integer;
var numeroUnico:boolean;
begin

  with dmCliente.cdsConsultaParametros do begin
     close;
     Params[0].Value := 'QTDE_NUMEROS_SORTEIO';
     open;
  end;

  qtdeNumeros := 0;

  // Pega a quantidade de números possíveis para o sorteio.
  if dmCliente.cdsConsultaParametros.RecordCount > 0 then
    qtdeNumeros:= strtoint(dmCliente.cdsConsultaParametrosVALOR.value);


  numeroUnico := false;
  nrcupom := 0;

  // Gera número até não existir igual cadastrado para este sorteio
  while not numeroUnico do
  begin

    Randomize;
    nrcupom := random(qtdeNumeros);

    with dmCliente.cdsLocalizaCupomSorteio do begin
     close;
     Params[0].Value := idSorteio;
     Params[1].Value := nrcupom;
     Params[2].Value := null;
     open;
    end;

    if dmCliente.cdsLocalizaCupomSorteio.RecordCount = 0 then
       numeroUnico:=true;
  end;

  dmCliente.cdsConsultaParametros.Close;
  dmCliente.cdsLocalizaCupomSorteio.Close;

  result:= nrcupom;
end;



procedure TfrmDetalhePremio.imprimeCupom(NrCupom:integer; NrCartao:string; Premio:string;
                                         Sorteio:string; DtSorteio:string);
var
  Linha:integer;
  Coluna:integer;
begin

  mensagem('Aguarde, imprimindo Cupom...');

  Printer.Orientation := poPortrait; //poLandscape;
  Printer.BeginDoc;
  Printer.Canvas.Pen.Width := 5;
  Printer.Canvas.Font.Name := 'Arial';
  Printer.Canvas.Font.Size := 15;
  Linha := 10;
  Coluna:= 20;

	Printer.Canvas.TextOut(Coluna-5,Linha,'SHOPPING CARD');

	Linha := Linha - Printer.Canvas.Font.Height + 60 ;

	Printer.Canvas.TextOut(Coluna+95,Linha,'Cupom: ' + inttostr(NrCupom));

	Linha := Linha - Printer.Canvas.Font.Height + 80 ;
  Printer.Canvas.Font.Size := 10;

	Printer.Canvas.TextOut(Coluna,Linha,'Cartão: ' + NrCartao);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Sorteio: ' + Sorteio);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Data do Sorteio: ' + dtSorteio);

	Linha := Linha - Printer.Canvas.Font.Height + 20 ;

	Printer.Canvas.TextOut(Coluna,Linha,'Prêmio: ' + Premio);

	Linha := Linha - Printer.Canvas.Font.Height + 80 ;

	Printer.Canvas.Font.Size := 9;
	Printer.Canvas.TextOut(Coluna,Linha, DateTimeToStr(now));

  Printer.EndDoc;
end;


procedure TfrmDetalhePremio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ZeraApplication();

    dmCliente.cdsPremioSorteio.Filtered := false;
    dmCliente.cdsLocalizaCartao.Close;
    dmCliente.cdsConsTipoMovimento.Close;
    dmCliente.cdsPremioSorteio.Close;
    dmCliente.cdsConsultaParametros.Close;
    dmCliente.cdsLocalizaCupomSorteio.Close;
end;

procedure TfrmDetalhePremio.pnGerarCupomClick(Sender: TObject);
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

          ProcessaCupom(cpf);
      end;

      frmDetalhePremio.Close;
   end;
end;

end.
