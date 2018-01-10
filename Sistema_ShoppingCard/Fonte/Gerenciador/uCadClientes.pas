unit uCadClientes;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EChkCPF, StdCtrls, Buttons, ENumEd, DBCtrls, Mask, EDateEd, 
  ELibFnc, jpeg, ExtCtrls;

type
  TfrmCadClientes = class(TForm)
    Label20: TLabel;
    gbFiliacao: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    edNomeMae: TEdit;
    edNomePai: TEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    gbEndereco: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    meCep: TMaskEdit;
    edRua: TEdit;
    edBairro: TEdit;
    gbContado: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    meTelCelular01: TMaskEdit;
    meTelCelular02: TMaskEdit;
    meTelResidencial: TMaskEdit;
    meTelTerceiro: TMaskEdit;
    neRamal: TEvNumEdit;
    edParentesco: TEdit;
    edEmail: TEdit;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpf: TMaskEdit;
    BtnSair: TBitBtn;
    BtnConfirmar: TBitBtn;
    CheckCpf: TEvCheckCPF;
    edUF: TEdit;
    edCidade: TEdit;
    Image1: TImage;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
    procedure habilitaCadastro(op:boolean);
    procedure carregaTelaVinculaCartaoTitular(cpf:string);
    function localizaCpfTitular(cpf: string): boolean;
    procedure LimpaCadastro;
    function ValidaFormulario():boolean;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

  Vacao : String;

implementation

uses uDmInsert, SqlExpr, uVincularCartaoCliente, uDmLocaliza, uPrincipal,
  uDmUpdate, uMensagens, uDmGlobal;

{$R *.dfm}

procedure TfrmCadClientes.BtnConfirmarClick(Sender: TObject);
begin
   try

      if not ValidaFormulario then begin
        frmMensagens.showmodal;
        exit;
      end;

			if Vacao = 'I' then begin 

         if MessageDlg('Confirma INCLUSÃO DO CLIENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;


				with dmInsert.sqlClienteIns do begin
					close;
					Params[0].Value := strAlltrim(meCpf.Text);
          Params[1].Value := null;
					Params[2].Value := strAlltrim(edNome.Text);
					Params[3].Value := dmglobal.iif(dtNascimento.datevalue=-693594,null, dtnascimento.DateValue);
					Params[4].Value := strAlltrim(edIdentidade.Text);
					Params[5].Value := strAlltrim(edOe.Text);
					Params[6].Value := strAlltrim(edNomeMae.Text);
					Params[7].Value := strAlltrim(edNomePai.Text);
					Params[8].Value := meCep.Text;
					Params[9].Value := strAlltrim(edRua.Text);
					Params[10].Value := strAlltrim(edBairro.Text);
					Params[11].Value := strAlltrim(edCidade.Text);
					Params[12].Value := strAlltrim(edUf.Text);
					Params[13].Value := meTelCelular01.Text;
					Params[14].Value := meTelCelular02.Text;
					Params[15].Value := meTelResidencial.Text;
					Params[16].Value := meTelTerceiro.Text;
					Params[17].Value := neRamal.Text;
					Params[18].Value := strAlltrim(edParentesco.Text);
					Params[19].Value := strAlltrim(edEmail.Text);
					Params[20].Value := frmPrincipal.gIdUsuarioSistema;
					execsql();
				end;

				if MessageDlg('Cadastro realizado com sucesso. Deseja Vincular um CARTÃO a esse CLIENTE ?',mtconfirmation, [mbno, mbyes], 0) = mrYes then begin
					carregaTelaVinculaCartaoTitular(meCpf.Text);
				end
				else begin
					showmessage('Cadastro efetuado com sucesso !');
				end;
			end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO CLIENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;

				with dmUpdate.sqlClienteUpd do begin
					close;
					Params[0].Value := strAlltrim(meCpf.Text);
					Params[1].Value := strAlltrim(edNome.Text);
					Params[2].Value := dmglobal.iif(dtNascimento.datevalue=-693594,null, dtnascimento.DateValue);
					Params[3].Value := strAlltrim(edIdentidade.Text);
					Params[4].Value := strAlltrim(edOe.Text);
					Params[5].Value := strAlltrim(edNomeMae.Text);
					Params[6].Value := strAlltrim(edNomePai.Text);
					Params[7].Value := meCep.Text;
					Params[8].Value := strAlltrim(edRua.Text);
					Params[9].Value := strAlltrim(edBairro.Text);
					Params[10].Value := strAlltrim(edCidade.Text);
					Params[11].Value := strAlltrim(edUf.Text);
					Params[12].Value := meTelCelular01.Text;
					Params[13].Value := meTelCelular02.Text;
					Params[14].Value := meTelResidencial.Text;
					Params[15].Value := meTelTerceiro.Text;
					Params[16].Value := neRamal.Text;
					Params[17].Value := strAlltrim(edParentesco.Text);
					Params[18].Value := strAlltrim(edEmail.Text);
					execsql();
				end;

				showmessage('Cadastro alterado com sucesso !');

			end;

      LimpaCadastro();

   except
      showmessage('Erro ao salvar o cadastro !');
      exit;
   end;
end;

procedure TfrmCadClientes.BtnSairClick(Sender: TObject);
begin

    if MessageDlg('Confirma fechamento do CADASTRO DE CLIENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

    frmCadClientes.close; 
end;

procedure TfrmCadClientes.sbLocalizaCPFTitularClick(Sender: TObject);
begin

   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin // Cid;
      showmessage('CPF Inválido !');
      habilitaCadastro(false);
      exit;
   end;

   habilitaCadastro(true);

   Vacao := 'I';

   //Localiza Cpf Titular
   if localizaCpfTitular(meCpf.Text) then begin

      Vacao := 'A';

      //Carrega dados do titular
      edNome.text           := dmlocaliza.cdsLocalizaCpfTitularNOME.value;
      dtNascimento.DateValue := dmglobal.iif(dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value);
      edIdentidade.text     := dmlocaliza.cdsLocalizaCpfTitularIDENTIDADE.value;
      edOe.text             := dmlocaliza.cdsLocalizaCpfTitularOE.value;
      edNomeMae.text        := dmlocaliza.cdsLocalizaCpfTitularNOME_MAE.value;
      edNomePai.text        := dmlocaliza.cdsLocalizaCpfTitularNOME_PAI.value;
      meCep.text            := dmlocaliza.cdsLocalizaCpfTitularCEP.Value;
      edUF.text             := dmlocaliza.cdsLocalizaCpfTitularUF.value;
      edRua.text            := dmlocaliza.cdsLocalizaCpfTitularLOGRADOURO.value;
      edCidade.text         := dmlocaliza.cdsLocalizaCpfTitularCIDADE.value;
      edBairro.text         := dmlocaliza.cdsLocalizaCpfTitularBAIRRO.Value;
      meTelCelular01.text   := dmlocaliza.cdsLocalizaCpfTitularTEL_CELULAR_01.value;
      meTelCelular02.text   := dmlocaliza.cdsLocalizaCpfTitularTEL_CELULAR_02.value;
      meTelResidencial.text := dmlocaliza.cdsLocalizaCpfTitularTEL_RESIDENCIA.value;
      meTelTerceiro.text    := dmlocaliza.cdsLocalizaCpfTitularTEL_TERCEIRO.value;
      neRamal.text          := dmlocaliza.cdsLocalizaCpfTitularRAMAL_TERCEIRO.value;
      edParentesco.text     := dmlocaliza.cdsLocalizaCpfTitularPARENTESCO_TERCEIRO.value;
      edEmail.text          := dmlocaliza.cdsLocalizaCpfTitularEMAIL.value;
   end;
end;

function TfrmCadClientes.localizaCpfTitular(cpf: string): boolean;
begin
   with dmlocaliza.cdsLocalizaCpfTitular do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;

   if dmlocaliza.cdsLocalizaCpfTitular.recordcount > 0 then begin
      if dmlocaliza.cdsLocalizaCpfTitularCPF_TITULAR.Value = '' then  // indica que o cpf é do titular
        result := true;
   end;

end;

procedure TfrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;

procedure TfrmCadClientes.habilitaCadastro(op: boolean);
begin
   if op = True then begin
      gbTitular.Enabled    := true;
      gbFiliacao.Enabled   := true;
      gbEndereco.Enabled   := true;
      gbContado.Enabled    := true;
      BtnConfirmar.Enabled := true;
      ActiveControl        := edNome;
   end
   else begin
      gbTitular.Enabled    := false;
      gbFiliacao.Enabled   := false;
      gbEndereco.Enabled   := false;
      gbContado.Enabled    := false;
      BtnConfirmar.Enabled := false;
      ActiveControl        := meCpf;
   end;
end;

procedure TfrmCadClientes.meCpfKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmCadClientes.carregaTelaVinculaCartaoTitular(cpf: string);
begin
   try
      Application.CreateForm(TfrmVincularCartaoCliente,frmVincularCartaoCliente);
      frmVincularCartaoCliente.meCpf.text := cpf;
      frmVincularCartaoCliente.sbLocalizaCPFTitular.Click;
      frmVincularCartaoCliente.ShowModal;
   finally
      frmVincularCartaoCliente.free;
      frmVincularCartaoCliente := nil;
   end;
end;

procedure TfrmCadClientes.edNomeExit(Sender: TObject);
begin

  //Cid
  If BtnSair.Focused then
    exit
  else
  begin
    if trim(edNome.text) = '' then begin
      Showmessage('Informe o nome do cliente.');
      edNome.SetFocus;
    end;
  end;

end;

procedure TfrmCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaCpfTitular.Close;
end;

procedure TfrmCadClientes.LimpaCadastro;
var
   i : integer;
begin
   //Limpa edits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEdit then  begin
         TEdit(Components[i]).Text := '';
      end;
      
   //Limpa Numedits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvNumEdit then  begin
         TEvNumEdit(Components[i]).Value := 0;
      end;

   //Limpa DateEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvDateEdit then  begin
         TEvDateEdit(Components[i]).Datetext := '00/00/0000';
      end;

   //limpa MascEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TMaskEdit then  begin
         TMaskEdit(Components[i]).Clear;
      end;

   //Limpa dbEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TDBEdit then  begin
         TDBEdit(Components[i]).Clear;
      end;
end;

function TfrmCadClientes.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edNome.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('Nome do cliente deve ser preenchido.');

   if strAlltrim(edemail.Text) <> '' then begin
      if not dmGlobal.IsValidEmail(edemail.Text) then
        frmMensagens.RichEdit1.Lines.Add('E-mail inválido.');
   end;

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;

end.
