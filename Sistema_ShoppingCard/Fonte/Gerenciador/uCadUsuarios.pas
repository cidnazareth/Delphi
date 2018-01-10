unit uCadUsuarios;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EChkCPF, StdCtrls, Buttons, ENumEd, DBCtrls, Mask, EDateEd, 
  ELibFnc, jpeg, ExtCtrls, Grids, DBGrids, DB;

type
  TfrmCadUsuarios = class(TForm)
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
    Label19: TLabel;
    meTelCelular01: TMaskEdit;
    meTelCelular02: TMaskEdit;
    meTelResidencial: TMaskEdit;
    edEmail: TEdit;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFUsuario: TSpeedButton;
    meCpf: TMaskEdit;
    BtnSair: TBitBtn;
    BtnConfirmar: TBitBtn;
    CheckCpf: TEvCheckCPF;
    edUF: TEdit;
    edCidade: TEdit;
    Image1: TImage;
    gbListaDep: TGroupBox;
    DBGrid1: TDBGrid;
    dsUsuarios: TDataSource;
    gbPerfil: TGroupBox;
    DBLookupPerfil: TDBLookupComboBox;
    dsPerfil: TDataSource;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCPFUsuarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);


  private
    { Private declarations }
    procedure habilitaCadastro(op:boolean);
    function localizaCpfUsuario(cpf: string): boolean;
    procedure LimpaCadastro;
    function ValidaFormulario():boolean;
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;
  Vacao : String;

implementation

uses uDmInsert, SqlExpr, uVincularCartaoCliente, uDmLocaliza, uPrincipal,
  uDmUpdate, uMensagens, uDmGlobal, uDmConsulta;

{$R *.dfm}
  
procedure TfrmCadUsuarios.BtnConfirmarClick(Sender: TObject);
var
  senhaProvisoria : string;
begin
   try

      if not ValidaFormulario then begin
        frmMensagens.showmodal;
        exit;
      end;

			if Vacao = 'I' then begin 

				if MessageDlg('Confirma INCLUSÃO DO USUÁRIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
				exit;

        //senha inicial será o cpf (só numeros)
        senhaProvisoria := StringReplace(meCpf.Text, '.', '', [rfReplaceAll, rfIgnoreCase]);
        senhaProvisoria := StringReplace(senhaProvisoria, '-', '', [rfReplaceAll, rfIgnoreCase]);

				with dmInsert.sqlUsuarioIns do begin
					close;
					Params[0].Value := meCpf.Text;
					Params[1].Value := strAlltrim(edNome.Text);
					Params[2].Value := dmglobal.iif(dtNascimento.datevalue=-693594,null, dtnascimento.DateValue);
					Params[3].Value := strAlltrim(edIdentidade.Text);
					Params[4].Value := strAlltrim(edOe.Text);
					Params[5].Value := strAlltrim(edNomeMae.Text);
					Params[6].Value := strAlltrim(edNomePai.Text);
					Params[7].Value := strAlltrim(meCep.Text);
					Params[8].Value := strAlltrim(edRua.Text);
					Params[9].Value := strAlltrim(edBairro.Text);
					Params[10].Value := strAlltrim(edCidade.Text);
					Params[11].Value := strAlltrim(edUf.Text);
					Params[12].Value := strAlltrim(meTelCelular01.Text);
					Params[13].Value := strAlltrim(meTelCelular02.Text);
					Params[14].Value := strAlltrim(meTelResidencial.Text);
					Params[15].Value := strAlltrim(edEmail.Text);
					Params[16].Value := frmPrincipal.gIdUsuarioSistema;
          Params[17].Value := dmGlobal.Encrypt(senhaProvisoria);
          Params[18].Value := DBLookupPerfil.KeyValue;

					execsql();
				end;
				showmessage('Cadastro efetuado com sucesso !');
			end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO USUÁRIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;

				with dmUpdate.sqlUsuarioUpd do begin
					close;
					Params[0].Value := strAlltrim(meCpf.Text);
					Params[1].Value := strAlltrim(edNome.Text);
					Params[2].Value := dmglobal.iif(dtNascimento.datevalue=-693594,null, dtnascimento.DateValue);
					Params[3].Value := strAlltrim(edIdentidade.Text);
					Params[4].Value := strAlltrim(edOe.Text);
					Params[5].Value := strAlltrim(edNomeMae.Text);
					Params[6].Value := strAlltrim(edNomePai.Text);
					Params[7].Value := strAlltrim(meCep.Text);
					Params[8].Value := strAlltrim(edRua.Text);
					Params[9].Value := strAlltrim(edBairro.Text);
					Params[10].Value := strAlltrim(edCidade.Text);
					Params[11].Value := strAlltrim(edUf.Text);
					Params[12].Value := strAlltrim(meTelCelular01.Text);
					Params[13].Value := strAlltrim(meTelCelular02.Text);
					Params[14].Value := strAlltrim(meTelResidencial.Text);
					Params[15].Value := strAlltrim(edEmail.Text);
          Params[16].Value := DBLookupPerfil.KeyValue;
					execsql();
				end;

				showmessage('Cadastro alterado com sucesso !');

			end;

      LimpaCadastro();

      dsUsuarios.DataSet.Refresh;

 // except
    //on E: Exception do
      //ShowMessage(e.Message);

       
   except
      showmessage('Erro ao salvar o cadastro !');
      exit;
   end;
end;

procedure TfrmCadUsuarios.BtnSairClick(Sender: TObject);
begin

    if MessageDlg('Confirma fechamento do CADASTRO DE USUÁRIOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

    frmCadUsuarios.close; 
end;

procedure TfrmCadUsuarios.sbLocalizaCPFUsuarioClick(Sender: TObject);
begin

   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      habilitaCadastro(false);
      exit;
   end;

   habilitaCadastro(true);

   Vacao := 'I';

   //Localiza Cpf Titular
   if localizaCpfUsuario(meCpf.Text) then begin

      Vacao := 'A';

      //Carrega dados do titular
      edNome.text           := dmlocaliza.cdsLocalizaUsuarioNOME.value;
      dtNascimento.DateValue:= dmglobal.iif(dmlocaliza.cdsLocalizaUsuarioDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaUsuarioDT_NASCIMENTO.value);
      edIdentidade.text     := dmlocaliza.cdsLocalizaUsuarioIDENTIDADE.value;
      edOe.text             := dmlocaliza.cdsLocalizaUsuarioOE.value;

      DBLookupPerfil.KeyValue := dmlocaliza.cdsLocalizaUsuarioID_PERFIL.value;

      edNomeMae.text        := dmlocaliza.cdsLocalizaUsuarioNOME_MAE.value;
      edNomePai.text        := dmlocaliza.cdsLocalizaUsuarioNOME_PAI.value;
      meCep.text            := dmlocaliza.cdsLocalizaUsuarioCEP.Value;
      edUF.text             := dmlocaliza.cdsLocalizaUsuarioUF.value;
      edRua.text            := dmlocaliza.cdsLocalizaUsuarioLOGRADOURO.value;
      edCidade.text         := dmlocaliza.cdsLocalizaUsuarioCIDADE.value;
      edBairro.text         := dmlocaliza.cdsLocalizaUsuarioBAIRRO.Value;
      meTelCelular01.text   := dmlocaliza.cdsLocalizaUsuarioTEL_CELULAR_01.value;
      meTelCelular02.text   := dmlocaliza.cdsLocalizaUsuarioTEL_CELULAR_02.value;
      meTelResidencial.text := dmlocaliza.cdsLocalizaUsuarioTEL_RESIDENCIA.value;
      edEmail.text          := dmlocaliza.cdsLocalizaUsuarioEMAIL.value;
   end;
end;

function TfrmCadUsuarios.localizaCpfUsuario(cpf: string): boolean;
begin
   with dmlocaliza.cdsLocalizaUsuario do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;

   if dmlocaliza.cdsLocalizaUsuario.recordcount > 0 then
      result := true;

end;

procedure TfrmCadUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;

procedure TfrmCadUsuarios.habilitaCadastro(op: boolean);
begin

   gbTitular.Enabled    := op;
   gbFiliacao.Enabled   := op;
   gbEndereco.Enabled   := op;
   gbContado.Enabled    := op;
   gbPerfil.Enabled     := op;
   BtnConfirmar.Enabled := op;

   if op then
      ActiveControl := edNome
   else
      ActiveControl := meCpf

end;

procedure TfrmCadUsuarios.meCpfKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFUsuario.Click;
   end;
end;


procedure TfrmCadUsuarios.edNomeExit(Sender: TObject);
begin

  If BtnSair.Focused then
    exit
  else
  begin
    if trim(edNome.text) = '' then begin
      Showmessage('Informe o nome do usuário.');
      edNome.SetFocus;
    end;
  end;

end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaUsuario.Close;
  dmConsulta.cdsConsultaUsuario.close;
  dmConsulta.cdsConsultaPerfil.close;
end;

procedure TfrmCadUsuarios.LimpaCadastro;
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

function TfrmCadUsuarios.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edNome.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('Nome do usuário deve ser preenchido.');

   if DBLookupPerfil.KeyValue <=0 then
      frmMensagens.RichEdit1.Lines.Add('O perfil do usuário deve ser selecionado.');

   if strAlltrim(edemail.Text) <> '' then begin
      if not dmGlobal.IsValidEmail(edemail.Text) then
        frmMensagens.RichEdit1.Lines.Add('E-mail inválido.');
   end;

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  dmConsulta.cdsConsultaUsuario.Open;
  dmConsulta.cdsConsultaPerfil.Open;
end;

procedure TfrmCadUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  mecpf.Text := dmConsulta.cdsConsultaUsuarioCPF.value;
  sbLocalizaCPFUsuario.Click;
end;


end.
