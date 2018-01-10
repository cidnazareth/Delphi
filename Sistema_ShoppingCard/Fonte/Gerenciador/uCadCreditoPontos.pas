unit uCadCreditoPontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, Grids, DBGrids, DB, StdCtrls, ENumEd, Buttons,
  EDateEd, EChkCPF, ComCtrls, ExtCtrls, ELibFnc, jpeg, EChkCGC, DBXpress;

type
  TfrmCadCreditoPontos = class(TForm)
    Label20: TLabel;
    BtnSair: TBitBtn;
    gbCpf: TGroupBox;
    sbLocalizaCPF: TSpeedButton;
    meCpf: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    gbDadosCliente: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    BtnConfirmar: TBitBtn;
    gbCnpj: TGroupBox;
    sbLocalizaCnpjLoja: TSpeedButton;
    meCnpj: TMaskEdit;
    gpDadosCompra: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    dtcompra: TEvDateEdit;
    Image1: TImage;
    gpDadosLoja: TGroupBox;
    Label22: TLabel;
    Label24: TLabel;
    Label5: TLabel;
    edRazaoSocial: TEdit;
    edNomeFantasia: TEdit;
    edNumeroLoja: TEdit;
    gpTipo: TGroupBox;
    Label11: TLabel;
    edTipoMovimento: TEdit;
    Panel2: TPanel;
    neNumCartao: TEvNumEdit;
    Panel1: TPanel;
    lblAtivo: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    lblTipoCpf: TLabel;
    Label12: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    neNumSaldoCartao: TEvNumEdit;
    CheckCNPJ: TEvCheckCGC;
    EvNumValor: TEvNumEdit;
    GroupBox2: TGroupBox;
    btnDigital: TBitBtn;
    procedure sbLocalizaCPFClick(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure sbLocalizaCnpjLojaClick(Sender: TObject);
    procedure EvNumValorChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure meCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure btnDigitalClick(Sender: TObject);
    procedure EvNumValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtcompraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function localizaCartao(cpf:string):boolean;
    function LocalizaCPF(cpf:string):boolean;
    function localizaCnpj(cnpj: string): boolean;
    function ValidaFormulario():boolean;
    procedure carregaTelaConfirmaDigital(cpf: String);

    procedure LimpaCadastro;
    procedure habilitaCadastro(op: boolean);
    procedure habilitaDadosCompra(op: boolean);
    procedure habilitaLoja(op: boolean);
    function localizaTipoMovimento(idTipo:integer):boolean;

  public
    { Public declarations }
    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;    
  end;

var
  frmCadCreditoPontos: TfrmCadCreditoPontos;
  IdCartao:integer;
  idCupom :integer;
  idLoja : integer;
  FatorCusto : double;

implementation

uses uDmLocaliza, uDmInsert, uPrincipal, uMensagens, uDmGlobal,
  uVincularCartaoDependente, uConfirmaDigital, uDmConsulta;

{$R *.dfm}


procedure TfrmCadCreditoPontos.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmGlobal.SQLConnecShopCard.StartTransaction(Trans);
end;

procedure TfrmCadCreditoPontos.CommitTransaction;
begin
  dmGlobal.SQLConnecShopCard.Commit(Trans);
end;

procedure TfrmCadCreditoPontos.RollbackTransaction;
begin
  dmGlobal.SQLConnecShopCard.Rollback(Trans);
  //raise Exception.Create('Erro no Rollback');
end;
 

procedure TfrmCadCreditoPontos.sbLocalizaCPFClick(Sender: TObject);
begin
try
   //Verifica se o CPF é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      exit;
   end;

   if LocalizaCPF(meCpf.Text)  then begin
      edNome.text             := dmlocaliza.cdsLocalizaCpfNOME.value;
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfOE.value;
      neNumCartao.Text        := '';

      habilitaLoja(true);

      if localizaCartao(meCpf.Text) then begin
         neNumCartao.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;
         lblAtivo.Caption := dmglobal.iif(dmlocaliza.cdsLocalizaCartaoATIVO.AsString='S', 'Ativo', 'Inativo');
         lblTipoCpf.Caption := Stralltrim(dmlocaliza.cdsLocalizaCartaoTipo.AsString);
         neNumSaldoCartao.text := dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsString;
         IdCartao := dmlocaliza.cdsLocalizaCartaoID.value;
         
         lblAtivo.width := 277;
         lblTipoCpf.width := 277;

         if dmlocaliza.cdsLocalizaCartaoATIVO.AsString='S' then
            panel1.Color := clGreen
         else
            panel1.Color := clRed;

          if dmlocaliza.cdsLocalizaCartaoAtivo.value = 'N' then begin
            showmessage('O cartão encontra-se INATIVO.');
            LimpaCadastro();
            mecpf.SetFocus;
            exit;
          end;


          if localizaTipoMovimento(1) then begin
             edTipoMovimento.Text := dmConsulta.cdsConsTipoMovimentoDESCRICAO.value;
             FatorCusto := dmConsulta.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
             if FatorCusto = 1 then
                FatorCusto := 0
             else
                FatorCusto := dmConsulta.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
          end;


      end
      else begin
          showmessage('Não foi encontrado nenhum cartão vinculado a este CPF.');
          exit;
      end;
   end
   else begin
     showmessage('CPF não encontrado !');
     exit;
   end;

   activecontrol:=meCnpj;

  except
    showmessage('Erro ao consultar CPF.');
    exit;
  end;
end;

function TfrmCadCreditoPontos.localizaTipoMovimento(idTipo:integer):boolean;
begin
   with dmConsulta.cdsConsTipoMovimento do begin
      close;
      params[0].value := idTipo;
      open;
   end;

   result:= false;
   if dmConsulta.cdsConsTipoMovimento.RecordCount > 0 then
      result:= true;
end;

function TfrmCadCreditoPontos.localizaCartao(cpf:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result:= false;
   if dmlocaliza.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;
end;


procedure TfrmCadCreditoPontos.habilitaCadastro(op: boolean);
begin
   if op = True then begin
      BtnConfirmar.Enabled := true;
      ActiveControl        := BtnConfirmar;
   end
   else begin
      BtnConfirmar.Enabled := false;
      ActiveControl        := meCpf;
   end;
end;


function TfrmCadCreditoPontos.LocalizaCPF(cpf:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCpf do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpf.recordcount > 0 then
      result := true;
end;

procedure TfrmCadCreditoPontos.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPF.Click;
   end;
end;


procedure TfrmCadCreditoPontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaCpf.close;
  dmlocaliza.cdsLocalizaCartao.Close;
  dmLocaliza.cdsLocalizaCnpjLoja.Close;
  dmConsulta.cdsConsTipoMovimento.Close;
end;


procedure TfrmCadCreditoPontos.LimpaCadastro;
begin
    mecpf.Clear;
    ednome.Clear;
    dtnascimento.clear;
    edidentidade.clear;
    edoe.clear;
    nenumcartao.Clear;
    lblAtivo.Caption := '';
    lblTipoCpf.Caption := '';
    neNumSaldoCartao.clear;
    mecnpj.clear;
    edRazaoSocial.Clear;
    edNomeFantasia.Clear;
    edNumeroLoja.Clear;
    edTipoMovimento.Clear;
    evnumvalor.Clear;
    dtcompra.Clear;
    btnDigital.Enabled := false;
    btnconfirmar.Enabled := false;
    panel1.Color := $009D9D9D;
    mecpf.SetFocus;
end;


procedure TfrmCadCreditoPontos.habilitaDadosCompra(op: boolean);
begin
   if op then
      gpDadosCompra.Enabled := true
   else
      gpDadosCompra.Enabled := false;
end;

procedure TfrmCadCreditoPontos.habilitaLoja(op: boolean);
begin
   if op then
      gbCnpj.Enabled := true
   else
      gbCnpj.Enabled := false;
end;


procedure TfrmCadCreditoPontos.FormShow(Sender: TObject);
begin
  LimpaCadastro();
end;

procedure TfrmCadCreditoPontos.BtnConfirmarClick(Sender: TObject);
var
  Sucesso: Boolean;
begin

    if not ValidaFormulario then begin
       frmMensagens.showmodal;
       exit;
    end;

    if MessageDlg('Confirma o CRÉDITO DOS PONTOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
    exit;

    StartTransaction;

try

    // Insere na tabela de Movimento
    with dmInsert.sqlMovimentoIns do begin
    close;
      Params[0].Value := idCartao;
      Params[1].Value := 1; // Tipo de Movimento: Compra em Estabelecimento
      Params[2].Value := NULL; // idCupom = Como não foi geração de cupom, o ID é nulo
      Params[3].Value := idLoja;
      Params[4].Value := Null;  // (idVoucher) - Como não foi a emissão de um voucher, o ID é nulo
      Params[5].Value := EvNumValor.value;
      Params[6].Value := EvNumValor.value * FatorCusto;      // custo
      Params[7].Value := frmprincipal.gIdTerminal;
      Params[8].Value := frmprincipal.gIdUsuarioSistema;
      ExecSQL;
    end;

    Sucesso := True;

  except
     Sucesso := False;
  end;


	if Sucesso then begin
    CommitTransaction;
    showmessage('Pontuação cadastrada com sucesso !');

    LimpaCadastro();
    habilitaDadosCompra(false);
    habilitaloja(false);
    habilitaCadastro(false);
	end
	else begin
    RollbackTransaction;
		showmessage('Erro ao incluir pontuação.');
	end;

end;

function TfrmCadCreditoPontos.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if EvNumValor.value <= 0 then
      frmMensagens.RichEdit1.Lines.Add('Valor da compra deve ser preenchido.');

   if dtCompra.datevalue = -693594 then
      frmMensagens.RichEdit1.Lines.Add('Data da compra deve ser preenchida.'); 

   if dtCompra.datevalue > date then
      frmMensagens.RichEdit1.Lines.Add('Data da compra é maior que a atual.');

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;


procedure TfrmCadCreditoPontos.sbLocalizaCnpjLojaClick(Sender: TObject);
begin
try
   //Verifica Validade do CPF
   CheckCNPJ.CGC := meCnpj.Text;
   if (CheckCNPJ.Valid = false) or (meCnpj.Text = '  .   .   /    -  ')  then begin
      habilitaCadastro(false);
      showmessage('CNPJ Inválido !');
      exit;
   end;

   if localizaCnpj(meCnpj.text) then begin
      idLoja := dmLocaliza.cdsLocalizaCnpjLojaID.Value;
      edRazaoSocial.text  := dmLocaliza.cdsLocalizaCnpjLojaRAZAO_SOCIAL.Value;
      edNomeFantasia.text := dmLocaliza.cdsLocalizaCnpjLojaNOME_FANTASIA.Value;
      edNumeroLoja.text   := dmLocaliza.cdsLocalizaCnpjLojaNUMERO_LOJA.Value;
      edTipoMovimento.Text := 'COMPRA EM ESTABELECIMENTO';

      habilitaDadosCompra(true);
   end;

   activecontrol:=dtcompra;

  except
    showmessage('Erro ao consultar CNPJ da loja.');
    exit;
  end;

end;


function TfrmCadCreditoPontos.localizaCnpj(cnpj: string): boolean;
begin
   with dmLocaliza.cdsLocalizaCnpjLoja do begin
      close;
      params[0].value := null;
      params[1].value := cnpj;
      open;
   end;

   result := false;

   if dmLocaliza.cdsLocalizaCnpjLoja.recordcount > 0 then
      result := true
end;


procedure TfrmCadCreditoPontos.EvNumValorChange(Sender: TObject);
begin   
  if EvNumValor.Value > 0 then
      btnDigital.Enabled := true
  else
      btnDigital.Enabled := false;
end;

procedure TfrmCadCreditoPontos.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento de CRÉDITO DE PONTUAÇÃO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
  frmCadCreditoPontos.Close;
end;

procedure TfrmCadCreditoPontos.meCnpjKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCnpjLoja.Click;
   end;
end;

procedure TfrmCadCreditoPontos.btnDigitalClick(Sender: TObject);
begin
  carregaTelaConfirmaDigital(meCpf.Text);
end;


procedure TfrmCadCreditoPontos.carregaTelaConfirmaDigital(cpf: String);
begin
   try
      Application.CreateForm(TfrmConfirmaDigital,frmConfirmaDigital);
      frmConfirmaDigital.cpf.Text := cpf;
      frmConfirmaDigital.ShowModal;
   finally
      if frmConfirmaDigital.DigitalConfirmada.Text = 'S' then begin
          btnConfirmar.Enabled := true;
          btnDigital.Enabled := false;
          btnConfirmar.SetFocus
      end;
          
      frmConfirmaDigital.free;
      frmConfirmaDigital := nil;
   end;
end;


procedure TfrmCadCreditoPontos.EvNumValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      btnDigital.SetFocus;
   end;
end;

procedure TfrmCadCreditoPontos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;

procedure TfrmCadCreditoPontos.dtcompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
