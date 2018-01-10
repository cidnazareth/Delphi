unit uCadTransferenciaPontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, Grids, DBGrids, DB, StdCtrls, ENumEd, Buttons,
  EDateEd, EChkCPF, ComCtrls, ExtCtrls, ELibFnc, jpeg, EChkCGC, DBXpress;

type
  TfrmCadTransferenciaPontos = class(TForm)
    Label20: TLabel;
    BtnSair: TBitBtn;
    BtnConfirmar: TBitBtn;
    gbDadosTransferencia: TGroupBox;
    Image1: TImage;
    gpTipo: TGroupBox;
    edTipoMovimentoDebito: TEdit;
    EvPontos: TEvNumEdit;
    GroupBox2: TGroupBox;
    btnDigital: TBitBtn;
    Label24: TLabel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label23: TLabel;
    evCusto: TEvNumEdit;
    GroupBox3: TGroupBox;
    gbCpfOrigem: TGroupBox;
    sbLocalizaCPFOrigem: TSpeedButton;
    meCpfOrigem: TMaskEdit;
    gbDadosOrigem: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edNomeOrigem: TEdit;
    dtNascimentoOrigem: TEvDateEdit;
    edIdentidadeOrigem: TEdit;
    edOeOrigem: TEdit;
    Panel2: TPanel;
    Label8: TLabel;
    neNumCartaoOrigem: TEvNumEdit;
    Panel1: TPanel;
    lblAtivoOrigem: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    lblTipoCpfOrigem: TLabel;
    Label12: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    neNumSaldoCartaoOrigem: TEvNumEdit;
    CheckCpfOrigem: TEvCheckCPF;
    gbPontosCreditar: TGroupBox;
    Label21: TLabel;
    evCredito: TEvNumEdit;
    Label25: TLabel;
    EvTotal: TEvNumEdit;
    GroupBox1: TGroupBox;
    gbCpfDestino: TGroupBox;
    meCpfDestino: TMaskEdit;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edNomeDestino: TEdit;
    dtNascimentoDestino: TEvDateEdit;
    edIdentidadeDestino: TEdit;
    edOeDestino: TEdit;
    Panel5: TPanel;
    Label14: TLabel;
    neNumCartaoDestino: TEvNumEdit;
    Panel6: TPanel;
    lblAtivoDestino: TLabel;
    Label16: TLabel;
    Panel7: TPanel;
    lblTipoCpfDestino: TLabel;
    Label18: TLabel;
    Panel8: TPanel;
    Label19: TLabel;
    neNumSaldoCartaoDestino: TEvNumEdit;
    CheckCpfDestino: TEvCheckCPF;
    sbLocalizaCPFDestino: TSpeedButton;
    Label15: TLabel;
    GroupBox6: TGroupBox;
    edTipoMovimentoCredito: TEdit;
    procedure sbLocalizaCPFOrigemClick(Sender: TObject);
    procedure meCpfOrigemKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnDigitalClick(Sender: TObject);
    procedure sbLocalizaCPFDestinoClick(Sender: TObject);
    procedure meCpfDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EvPontosExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure EvPontosChange(Sender: TObject);
    procedure EvPontosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function localizaCartao(cpf:string):boolean;
    function LocalizaCPF(cpf:string):boolean;
    function localizaTipoMovimento(idTipo:integer):boolean;
    function ValidaFormulario():boolean;
    procedure carregaTelaConfirmaDigital(cpf: String);

    procedure LimpaCadastroOrigem;
    procedure LimpaCadastroDestino;
    procedure LimpaCadastroDados;

    procedure habilitaCadastroOrigem(op: boolean);
    procedure habilitaCadastroDestino(op: boolean);
    procedure habilitaCadastroDados(op: boolean);

  public
    { Public declarations }
    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

var
  frmCadTransferenciaPontos: TfrmCadTransferenciaPontos;
  IdCartaoOrigem:integer;
  IdCartaoDestino:integer;
  FatorCusto : double;
  Sucesso: boolean;
implementation

uses uDmLocaliza, uDmInsert, uPrincipal, uMensagens, uDmGlobal,
  uVincularCartaoDependente, uConfirmaDigital, uDmConsulta;

{$R *.dfm}


procedure TfrmCadTransferenciaPontos.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmGlobal.SQLConnecShopCard.StartTransaction(Trans);
end;

procedure TfrmCadTransferenciaPontos.CommitTransaction;
begin
  dmGlobal.SQLConnecShopCard.Commit(Trans);
end;

procedure TfrmCadTransferenciaPontos.RollbackTransaction;
begin
  dmGlobal.SQLConnecShopCard.Rollback(Trans);
  //raise Exception.Create('Erro no Rollback');
end;


procedure TfrmCadTransferenciaPontos.sbLocalizaCPFOrigemClick(Sender: TObject);
begin
try
   //Verifica se o CPF é válido
   CheckCpfOrigem.CPF := meCpfOrigem.Text;
   if (CheckCpfOrigem.Valid = false) or (meCpfOrigem.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      exit;
   end;

   if LocalizaCPF(meCpfOrigem.Text)  then begin
      edNomeOrigem.text             := dmlocaliza.cdsLocalizaCpfNOME.value;
      edIdentidadeOrigem.text       := dmlocaliza.cdsLocalizaCpfIDENTIDADE.value;
      edOeOrigem.text               := dmlocaliza.cdsLocalizaCpfOE.value;
      neNumCartaoOrigem.Text        := '';

     // habilitaLoja(true);

      if localizaCartao(meCpfOrigem.Text) then begin
         neNumCartaoOrigem.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;
         lblAtivoOrigem.Caption := dmglobal.iif(dmlocaliza.cdsLocalizaCartaoATIVO.AsString='S', 'Ativo', 'Inativo');
         lblTipoCpfOrigem.Caption := Stralltrim(dmlocaliza.cdsLocalizaCartaoTipo.AsString);
         neNumSaldoCartaoOrigem.text := dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsString;
         IdCartaoOrigem := dmlocaliza.cdsLocalizaCartaoID.value;

         lblAtivoOrigem.width := 220;
         lblTipoCpfOrigem.width := 220;

         if dmlocaliza.cdsLocalizaCartaoATIVO.AsString='N' then begin
            panel1.Color := clRed;
            showmessage('O cartão encontra-se INATIVO.');
            LimpaCadastroOrigem();
            mecpfOrigem.SetFocus;
            exit;
          end;

          if dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsFloat = 0 then begin
            showmessage('Não há pontos acumulados neste cartão.');
            LimpaCadastroOrigem();
            mecpfOrigem.SetFocus;
            exit;
          end;


          if localizaTipoMovimento(3) then begin
             edTipoMovimentoDebito.Text := dmConsulta.cdsConsTipoMovimentoDESCRICAO.value;
             FatorCusto := dmConsulta.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
             if FatorCusto = 1 then
                evCusto.Value := 0
             else
                evCusto.Value := FatorCusto * 100;
          end;


          if localizaTipoMovimento(4) then
             edTipoMovimentoCredito.Text := dmConsulta.cdsConsTipoMovimentoDESCRICAO.value;


          habilitaCadastroDestino(true);
          activecontrol:=meCpfDestino;
          exit;

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

   activecontrol:=meCpfOrigem;

  except
    showmessage('Erro ao consultar CPF.');
    exit;
  end;
end;


function TfrmCadTransferenciaPontos.localizaCartao(cpf:string):boolean;
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


function TfrmCadTransferenciaPontos.localizaTipoMovimento(idTipo:integer):boolean;
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


function TfrmCadTransferenciaPontos.LocalizaCPF(cpf:string):boolean;
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

procedure TfrmCadTransferenciaPontos.meCpfOrigemKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFOrigem.Click;
   end;
end;

procedure TfrmCadTransferenciaPontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaCpf.close;
  dmlocaliza.cdsLocalizaCartao.Close;
end;

procedure TfrmCadTransferenciaPontos.FormShow(Sender: TObject);
begin
  LimpaCadastroOrigem();
  activecontrol:= meCpfOrigem;
end;

procedure TfrmCadTransferenciaPontos.BtnConfirmarClick(Sender: TObject);
begin
    if not ValidaFormulario then begin
       frmMensagens.showmodal;
       exit;
    end;

    if MessageDlg('Confirma o CRÉDITO DOS PONTOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
    exit;

    StartTransaction;

try

    // Insere a Transferência a Débito na tabela de Movimento
    with dmInsert.sqlMovimentoIns do begin
    close;
      Params[0].Value := idCartaoOrigem;
      Params[1].Value := 3; // Tipo de Movimento: Transferência a Débito
      Params[2].Value := Null; // idCupom
      Params[3].Value := Null; // idLoja
      Params[4].Value := Null;  // (idVoucher) - Como não foi a emissão de um voucher, o ID é nulo
      Params[5].Value := EvPontos.value;   // Valor da operação de transferencia
      Params[6].Value := EvTotal.value - EvPontos.Value; //CustoOperacao;
      Params[7].Value := frmprincipal.gIdTerminal;
      Params[8].Value := frmprincipal.gIdUsuarioSistema;
      ExecSQL;
    end;

    // Insere a Transferência a Crédito na tabela de Movimento
    with dmInsert.sqlMovimentoIns do begin
    close;
      Params[0].Value := idCartaoDestino;
      Params[1].Value := 4; // Tipo de Movimento: Transferência a Crédito
      Params[2].Value := Null; // idCupom
      Params[3].Value := Null; // idLoja
      Params[4].Value := Null;  // (idVoucher) - Como não foi a emissão de um voucher, o ID é nulo
      Params[5].Value := EvCredito.value;  // Valor da operação de transferencia
      Params[6].Value := 0.00; // Custo da operação       todo: (incluir variável de custo)
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

    showmessage('Cadastrado efetuado com sucesso !');

    LimpaCadastroOrigem();
    LimpaCadastroDestino();
    LimpaCadastroDados();

    habilitaCadastroOrigem(False);
    habilitaCadastroDestino(False);
    habilitaCadastroDados(False);

    activecontrol:=meCpfOrigem;

	end
	else begin
    RollbackTransaction;
		showmessage('Erro ao salvar cadastro !');
	end;
end;



procedure TfrmCadTransferenciaPontos.habilitaCadastroOrigem(op: boolean);
begin
   Panel1.Enabled := op;
   Panel2.Enabled := op;
   Panel3.Enabled := op;
   Panel4.Enabled := op;
end;
procedure TfrmCadTransferenciaPontos.habilitaCadastroDestino(op: boolean);
begin
   gbCpfDestino.Enabled := op;
   Panel5.Enabled := op;
   Panel6.Enabled := op;
   Panel7.Enabled := op;
   Panel8.Enabled := op;
end;
procedure TfrmCadTransferenciaPontos.habilitaCadastroDados(op: boolean);
begin
   gbDadosTransferencia.Enabled := op;
   gbPontosCreditar.Enabled := op;
end;


procedure TfrmCadTransferenciaPontos.LimpaCadastroOrigem;
begin
    mecpfOrigem.Clear;
    ednomeOrigem.Clear;
    dtnascimentoOrigem.clear;
    edidentidadeOrigem.clear;
    edoeOrigem.clear;
    nenumcartaoOrigem.Clear;
    lblAtivoOrigem.Caption := '';
    lblTipoCpfOrigem.Caption := '';
    neNumSaldoCartaoOrigem.clear;
    panel1.Color := $009D9D9D;
    mecpfOrigem.SetFocus;
end;
procedure TfrmCadTransferenciaPontos.LimpaCadastroDestino;
begin
    mecpfDestino.Clear;
    ednomeDestino.Clear;
    dtnascimentoDestino.clear;
    edidentidadeDestino.clear;
    edoeDestino.clear;
    nenumcartaoDestino.Clear;
    lblAtivoDestino.Caption := '';
    lblTipoCpfDestino.Caption := '';
    neNumSaldoCartaoDestino.clear;
    panel6.Color := $009D9D9D;
    mecpfDestino.SetFocus;
end;
procedure TfrmCadTransferenciaPontos.LimpaCadastroDados;
begin
   EvPontos.Clear;
   EvCusto.Clear;
   EvTotal.Clear;
   EvCredito.Clear;
   Checkbox1.Checked := false;
   edTipoMovimentoDebito.Clear;
   edTipoMovimentoCredito.Clear;
end;



function TfrmCadTransferenciaPontos.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if EvPontos.value <= 0 then
      frmMensagens.RichEdit1.Lines.Add('Quantidade de pontos a creditar deve ser informado.');

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;


procedure TfrmCadTransferenciaPontos.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento de TRANSFERÊNCIA DE PONTUAÇÃO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
  frmCadTransferenciaPontos.Close;
end;

procedure TfrmCadTransferenciaPontos.btnDigitalClick(Sender: TObject);
begin
  carregaTelaConfirmaDigital(meCpfOrigem.Text);
end;


procedure TfrmCadTransferenciaPontos.carregaTelaConfirmaDigital(cpf: String);
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



procedure TfrmCadTransferenciaPontos.sbLocalizaCPFDestinoClick(
  Sender: TObject);
begin

try
   //Verifica se o CPF é válido
   CheckCpfDestino.CPF := meCpfDestino.Text;
   if (CheckCpfDestino.Valid = false) or (meCpfDestino.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      exit;
   end;

   if LocalizaCPF(meCpfDestino.Text)  then begin
      edNomeDestino.text             := dmlocaliza.cdsLocalizaCpfNOME.value;
      edIdentidadeDestino.text       := dmlocaliza.cdsLocalizaCpfIDENTIDADE.value;
      edOeDestino.text               := dmlocaliza.cdsLocalizaCpfOE.value;
      neNumCartaoDestino.Text        := '';

      //habilitaLoja(true);

      if localizaCartao(meCpfDestino.Text) then begin
         neNumCartaoDestino.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;
         lblAtivoDestino.Caption := dmglobal.iif(dmlocaliza.cdsLocalizaCartaoATIVO.AsString='S', 'Ativo', 'Inativo');
         lblTipoCpfDestino.Caption := Stralltrim(dmlocaliza.cdsLocalizaCartaoTipo.AsString);
         neNumSaldoCartaoDestino.text := dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsString;
         IdCartaoDestino := dmlocaliza.cdsLocalizaCartaoID.value;

         lblAtivoDestino.width := 220;
         lblTipoCpfDestino.width := 220;

         if dmlocaliza.cdsLocalizaCartaoATIVO.AsString='N' then begin
            panel6.Color := clRed;
            showmessage('O cartão encontra-se INATIVO.');
            LimpaCadastroDestino();
            mecpfDestino.SetFocus;
            exit;
         end;

         habilitaCadastroDados(true);
         activecontrol := evpontos;
         exit;

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

   activecontrol:=meCpfDestino;

  except
    showmessage('Erro ao consultar CPF.');
    exit;
  end;

end;

procedure TfrmCadTransferenciaPontos.meCpfDestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFDestino.Click;
   end;
end;

procedure TfrmCadTransferenciaPontos.EvPontosExit(Sender: TObject);
begin
  Evtotal.Value := Evpontos.Value + ( Evpontos.Value * (evCusto.Value /100));

  if neNumSaldoCartaoOrigem.Value < Evtotal.Value then begin
      showmessage('Saldo insufuciente para efetuar a transferência.');
      EvPontos.SetFocus;
      exit
  end;

  evCredito.Value := Evpontos.Value;


end;

procedure TfrmCadTransferenciaPontos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;


procedure TfrmCadTransferenciaPontos.CheckBox1Click(Sender: TObject);
var
  QtdePontosCusto : double;
begin

  if CheckBox1.Checked then begin
     QtdePontosCusto := neNumSaldoCartaoOrigem.Value * FatorCusto;
     EvPontos.Value := neNumSaldoCartaoOrigem.Value - QtdePontosCusto;
     EvTotal.Value := EvPontos.Value + QtdePontosCusto;
     EvCredito.Value := EvPontos.Value;
     btnDigital.enabled := true;
   end
   else begin
     EvPontos.Clear;
     EvTotal.Clear;
     EvCredito.Clear;
     btnDigital.enabled := false
   end;
end;

procedure TfrmCadTransferenciaPontos.EvPontosChange(Sender: TObject);
begin

  
  if EvPontos.Value > 0 then
      btnDigital.Enabled := true
  else
      btnDigital.Enabled := false;



end;

procedure TfrmCadTransferenciaPontos.EvPontosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
