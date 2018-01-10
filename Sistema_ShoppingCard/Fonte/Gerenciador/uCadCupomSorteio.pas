unit uCadCupomSorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, EDateEd, StdCtrls, ENumEd, Buttons, ELibFnc, DB,
  DBCtrls, EChkCGC, ComCtrls, EDBDate, Grids, DBGrids, EDBNum, EChkCPF, DBXpress,
  jpeg;

type
  TfrmCadCupomSorteio = class(TForm)
    gbPremio: TGroupBox;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    gpSorteio: TGroupBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    EvDBDateEdit1: TEvDBDateEdit;
    EvDBDateEdit2: TEvDBDateEdit;
    EvDBDateEdit3: TEvDBDateEdit;
    DBRichEdit1: TDBRichEdit;
    gbCpfDependente: TGroupBox;
    dsLocalizaSorteio: TDataSource;
    dbLkCbDescSorteio: TDBLookupComboBox;
    Label20: TLabel;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpf: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    gbTitular: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    gbNumCartaoTitular: TGroupBox;
    gbLista: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    dbLkCbDescPremio: TDBLookupComboBox;
    Label1: TLabel;
    dsLocalizaPremio: TDataSource;
    gbPontosNecessarios: TGroupBox;
    dsCupomSorteio: TDataSource;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    NumCartao: TEvNumEdit;
    NumPontos: TEvNumEdit;
    EvDBNumPontos: TEvDBNumEdit;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure reObsPremioEnter(Sender: TObject);
    procedure reObsPremioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbLkCbDescSorteioClick(Sender: TObject);
    procedure dbLkCbDescSorteioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbLkCbDescSorteioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    function abreLocalizaSorteio():integer;
    function abreLocalizaPremio(idSorteio: integer):integer; 
    function localizaCartao(cpf:string):boolean;
    function GeraNumeroCupom(idSorteio:integer):integer;
    procedure CarregaCuponsJaEmitidos();
    procedure HabilitaBotao(op:boolean);
    function consultaCpf(cpf:string):boolean;
    function ValidaFormulario():boolean;
    function localizaTipoMovimento(idTipo:integer):boolean;

  public
    { Public declarations }
    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

var
  frmCadCupomSorteio: TfrmCadCupomSorteio;
  nrcupom:integer;
  idCartao:integer;
  FatorCusto : double;

implementation

uses uDmInsert, SqlExpr , uDmLocaliza, uPrincipal, uDmConsulta, uDmUpdate,
  uDmGlobal, uMensagens;

{$R *.dfm}


procedure TfrmCadCupomSorteio.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadCupomSorteio.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmGlobal.SQLConnecShopCard.StartTransaction(Trans);
end;

procedure TfrmCadCupomSorteio.CommitTransaction;
begin
  dmGlobal.SQLConnecShopCard.Commit(Trans);
end;

procedure TfrmCadCupomSorteio.RollbackTransaction;
begin
  dmGlobal.SQLConnecShopCard.Rollback(Trans);
  //raise Exception.Create('Erro no Rollback');
end;


function TfrmCadCupomSorteio.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if EvDBNumPontos.value > NumPontos.Value then
      frmMensagens.RichEdit1.Lines.Add('Saldo insuficiente para gerar cupom.');

   if strAlltrim(mecpf.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('CPF Inválido.');

   if NumCartao.value = 0 then
      frmMensagens.RichEdit1.Lines.Add('Cartão Inválido.');
 

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;


procedure TfrmCadCupomSorteio.BtnConfirmarClick(Sender: TObject);
var NrCupom:integer;
var NSorteio:integer;
var idCupom:integer;

var	Sucesso: Boolean;
begin

    if not ValidaFormulario then begin
       frmMensagens.showmodal;
       exit;
    end;

    if MessageDlg('Confirma a GERAÇÃO DO CUPOM para este sorteio ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
    exit;

    NSorteio := dbLkCbDescSorteio.KeyValue;
    NrCupom  := GeraNumeroCupom(NSorteio);

    StartTransaction;

try

    // gera o cupom para sorteio
    with dmInsert.sqlCupomSorteioIns do begin
      close;
      Params[0].Value := NSorteio;
      Params[1].Value := NrCupom;
      Params[2].Value := dbLkCbDescPremio.KeyValue;  //premio_referente
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
      Params[5].Value := EvDBNumPontos.Text;
      Params[6].Value := EvDBNumPontos.value * FatorCusto;      // Custo da Operação
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
    dmlocaliza.cdsLocalizaCartao.refresh;
    NumPontos.Text := dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsString;
    CarregaCuponsJaEmitidos();
    showmessage('Cadastro efetuado com sucesso !');
    ActiveControl := dbLkCbDescPremio;

    gpSorteio.Enabled := false;
    gbPremio.Enabled := false;
    gbPontosNecessarios.Enabled := false;
    gbLista.Enabled := false;

	end
	else begin
    RollbackTransaction;
		showmessage('Erro ao salvar cadastro !');
	end;

end; 


function TfrmCadCupomSorteio.GeraNumeroCupom(idSorteio:integer):integer;
var nrCupom:integer;
var qtdeNumeros:integer;
var numeroUnico:boolean;
begin

  with dmConsulta.cdsConsultaParametros do begin
     close;
     Params[0].Value := 'QTDE_NUMEROS_SORTEIO';
     open;
  end;

  qtdeNumeros := 0;

  // Pega a quantidade de números possíveis para o sorteio.
  if dmConsulta.cdsConsultaParametros.RecordCount > 0 then
    qtdeNumeros:= strtoint(dmConsulta.cdsConsultaParametrosVALOR.value);


  numeroUnico := false;
  nrcupom := 0;

  // Gera número até não existir igual cadastrado para este sorteio
  while not numeroUnico do
  begin

    Randomize;
    nrcupom := random(qtdeNumeros);

    with dmLocaliza.cdsLocalizaCupomSorteio do begin
     close;
     Params[0].Value := idSorteio;
     Params[1].Value := nrcupom;
     Params[2].Value := null;
     open;
    end;

    if dmLocaliza.cdsLocalizaCupomSorteio.RecordCount = 0 then
       numeroUnico:=true;
  end;

  result:= nrcupom;
end;

procedure TfrmCadCupomSorteio.CarregaCuponsJaEmitidos();
begin
try
   with dmLocaliza.cdsLocalizaCupomSorteio do begin
      close;
      Params[0].Value := null;           // id_sorteio
      Params[1].Value := null;           // n_cupom
      Params[2].Value := idCartao;       // id da tb_cartao
      open;
   end;

  except
    showmessage('Erro ao consultar cupons já emitidos.');
    exit;
  end;
end;



procedure TfrmCadCupomSorteio.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento da GERAÇÃO DO CUPOM para este sorteio ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadCupomSorteio.close;
end;


procedure TfrmCadCupomSorteio.reObsPremioEnter(Sender: TObject);
begin
   KeyPreview := false;
end;

procedure TfrmCadCupomSorteio.reObsPremioExit(Sender: TObject);
begin
   KeyPreview := true;
end;


function TfrmCadCupomSorteio.abreLocalizaSorteio():integer;
var i:integer;
begin
   with dmLocaliza.cdsLocalizaSorteio do begin
      close;
      params[0].Value := date;
      open;
   end;

   i := dmLocaliza.cdsLocalizaSorteio.RecordCount;
   if (i = 0) then
      showmessage('Não existe nenhum novo sorteio para acontecer !');

   result := i;

end;

procedure TfrmCadCupomSorteio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmConsulta.cdsConsultaParametros.Close;
    dmLocaliza.cdsLocalizaCupomSorteio.Close;
    dmLocaliza.cdsLocalizaSorteio.Close;
    dmConsulta.cdsConsultaPremio.Close;
end;


procedure TfrmCadCupomSorteio.dbLkCbDescSorteioClick(Sender: TObject);
begin
  if (abreLocalizaPremio(dbLkCbDescSorteio.KeyValue)) > 0 then begin

      gbPremio.Enabled := true;
      gbPontosNecessarios.Enabled := true;

    // inicia dblookupcombobox com o primeiro registro
    dbLkCbDescPremio.KeyValue:= dmConsulta.cdsConsultaPremioID.Value;
  end;
end;


function TfrmCadCupomSorteio.abreLocalizaPremio(idSorteio: integer):integer;
var i:integer;
begin

   //Consulta premios
   with dmConsulta.cdsConsultaPremio do begin
      close;
      params[0].value := idSorteio;
      open;
   end;

   i := dmConsulta.cdsConsultaPremio.RecordCount;
   if (i = 0) then
      showmessage('Não existe nenhum premio cadastrado para este sorteio !');

   result := i;
   
end;


procedure TfrmCadCupomSorteio.dbLkCbDescSorteioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (abreLocalizaPremio(dbLkCbDescSorteio.KeyValue)) > 0 then begin
      gbPremio.Enabled := true;
      gbPontosNecessarios.Enabled := true;

    // inicia dblookupcombobox com o primeiro registro
    dbLkCbDescPremio.KeyValue:= dmConsulta.cdsConsultaPremioID.Value;
  end;
end;

procedure TfrmCadCupomSorteio.dbLkCbDescSorteioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (abreLocalizaPremio(dbLkCbDescSorteio.KeyValue)) > 0 then begin

      gbPremio.Enabled := true;
      gbPontosNecessarios.Enabled := true;

    // inicia dblookupcombobox com o primeiro registro
    dbLkCbDescPremio.KeyValue:= dmConsulta.cdsConsultaPremioID.Value;
  end;
end;


procedure TfrmCadCupomSorteio.sbLocalizaCPFTitularClick(Sender: TObject);
begin

  try

   //Verifica se o CPF é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      exit;
   end;


   if consultaCpf(mecpf.Text) then begin

      edNome.text             := dmlocaliza.cdsLocalizaCpfTitularNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfTitularIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfTitularOE.value;
      NumCartao.Text          := '';
      NumPontos.Text          := '';


      if localizaCartao(meCpf.Text) then begin
         IdCartao       := dmlocaliza.cdsLocalizaCartaoID.value;
         NumCartao.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;
         NumPontos.Text := dmlocaliza.cdsLocalizaCartaoQTDE_PONTOS.AsString;


          if dmlocaliza.cdsLocalizaCartaoAtivo.value = 'N' then begin
              showmessage('O cartão associado a este CPF encontra-se INATIVO.');
              mecpf.SetFocus;
              exit;
          end;

          gpSorteio.Enabled := true;
          gbLista.Enabled := true;

          if abreLocalizaSorteio() > 0 then begin
               gbPremio.Enabled := true;

              // inicia dblookupcombobox com o primeiro registro
              dbLkCbDescSorteio.KeyValue:= dmLocaliza.cdsLocalizaSorteioID.Value;
              CarregaCuponsJaEmitidos;

              if (abreLocalizaPremio(dbLkCbDescSorteio.KeyValue)) > 0 then begin
                // inicia dblookupcombobox com o primeiro registro
                dbLkCbDescPremio.KeyValue:= dmConsulta.cdsConsultaPremioID.Value;
                ActiveControl := dbLkCbDescSorteio;
              end;
          end;


          if localizaTipoMovimento(2) then begin
             //edTipoMovimento.Text := dmConsulta.cdsConsTipoMovimentoDESCRICAO.value;
             FatorCusto := dmConsulta.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
             if FatorCusto = 1 then
                FatorCusto := 0
             else
                FatorCusto := dmConsulta.cdsConsTipoMovimentoFATOR_CUSTO.AsFloat;
          end;


          habilitabotao(true); 

      end
      else begin
        showmessage('Cliente não possui nenhum cartão associado !');
        ActiveControl := mecpf;
        habilitabotao(false);
      end;


   end
   else begin
      showmessage('CPF não cadastrado !');
      ActiveControl := mecpf;
      habilitabotao(false);
   end;
   

  except
    showmessage('Erro ao localizar CPF.');
    exit;
  end;

end;


function TfrmCadCupomSorteio.localizaTipoMovimento(idTipo:integer):boolean;
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


function TfrmCadCupomSorteio.consultaCPF(cpf:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCpfTitular do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpfTitular.recordcount > 0 then
      result := true;
end;



function TfrmCadCupomSorteio.localizaCartao(cpf:string):boolean;
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



procedure TfrmCadCupomSorteio.FormShow(Sender: TObject);
begin
  ActiveControl := meCpf;
end;

procedure TfrmCadCupomSorteio.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmCadCupomSorteio.HabilitaBotao(op:boolean);
begin
  btnConfirmar.enabled := op;
end;


end.
