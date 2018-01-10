unit uCadDependente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ENumEd, StdCtrls, Buttons, Grids, DBGrids, EDateEd, DBCtrls,
  Mask, ComCtrls, DB, DBClient, EChkCPF, ELibFnc, EDBDate, EDBNum, jpeg,
  ExtCtrls;

type
  TfrmCadDependente = class(TForm)
    pcDependente: TPageControl;
    TabSheet1: TTabSheet;
    gbEnderecoDep: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    meCepDep: TMaskEdit;
    edRuaDep: TEdit;
    edBairroDep: TEdit;
    gpDep: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edNomeDep: TEdit;
    dtNascimentoDep: TEvDateEdit;
    edIdentidadeDep: TEdit;
    edOeDep: TEdit;
    gbListaDep: TGroupBox;
    DBGrid1: TDBGrid;
    gbContatoDep: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    meTelCelular01Dep: TMaskEdit;
    meTelCelular02Dep: TMaskEdit;
    meTelResidencialDep: TMaskEdit;
    meTelTerceiroDep: TMaskEdit;
    neRamalDep: TEvNumEdit;
    edParentescoDep: TEdit;
    edEmailDep: TEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    gbNumCartaoTitular: TGroupBox;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpfTitular: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    dsListaDependente: TDataSource;
    CheckCpfDep: TEvCheckCPF;
    gbCpfDependente: TGroupBox;
    meCpfDep: TMaskEdit;
    sbLocalizaCPFDep: TSpeedButton;
    BtnSair: TBitBtn;
    BtnConfirmar: TBitBtn;
    edUFDep: TEdit;
    edCidadeDep: TEdit;
    Label20: TLabel;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    neNumCartaoTitular: TEvNumEdit;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure meCpfTitularKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocalizaCPFDepClick(Sender: TObject);
    procedure meCpfDepKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure limpaCadastroTotalDependente(op:boolean);
    procedure habilitaCadastroDep(op:boolean);
    procedure habilitaCpfDep(op:boolean);
    function  localizaCpfTitular(cpf:string): boolean;
    procedure carregaTelaVinculaCartaoDependente(cpf:String);
    function localizaCartao(cpf:string):boolean;
    procedure carregaListaDependentes(cpfTitular: string);
    procedure CarregaDependente();
    function localizaCpfDep(cpf:string): boolean;
    function ValidaFormulario():boolean;
  public
    { Public declarations }
  end;

var
  frmCadDependente: TfrmCadDependente;
  Vacao : string;

implementation

uses uDmLocaliza, uDmInsert, SqlExpr, uPrincipal,
  uVincularCartaoDependente, uDmConsulta, uDmUpdate, uMensagens, udmGlobal;

{$R *.dfm}


procedure TfrmCadDependente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;


procedure TfrmCadDependente.limpaCadastroTotalDependente(op:boolean);
begin
  if op then
    meCpfDep.Clear;

   edNomeDep.Clear;
   dtNascimentoDep.Clear;
   edIdentidadeDep.Clear;
   edOeDep.Clear;
   meCepDep.Clear;
   edUfDep.Clear;
   edRuaDep.Clear;
   edCidadeDep.Clear;
   edBairroDep.Clear;
   meTelCelular01Dep.Clear;
   meTelCelular02Dep.Clear;
   meTelResidencialDep.Clear;
   meTelTerceiroDep.Clear;
   neRamalDep.Clear;
   edParentescoDep.Clear;
   edEmailDep.Clear;
end;



procedure TfrmCadDependente.sbLocalizaCPFTitularClick(Sender: TObject);
begin
   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpfTitular.Text;
   if CheckCpf.Valid = false then begin
      showmessage('CPF Inválido !');
      habilitaCpfDep(false);
      exit;
   end;

   Vacao := 'I';

   //Localiza Cpf Titular e carrega dados dos dependentes
   if localizaCpfTitular(meCpfTitular.Text) then begin

      //Carrega dados do titular
      edNome.text             := dmlocaliza.cdsLocalizaCpfTitularNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfTitularIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfTitularOE.value;
      neNumCartaoTitular.Text := '';

      if localizaCartao(meCpfTitular.Text) then
         neNumCartaoTitular.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;

      carregaListaDependentes(meCpfTitular.Text)
   end   
   else begin
      showmessage('CPF titular não cadastrado !');
      meCpfTitular.setfocus();
      exit;
   end;  

   habilitaCadastroDep(true);

   habilitaCpfDep(true);
   meCpfDep.setfocus();

end;


procedure TfrmCadDependente.carregaListaDependentes(cpfTitular: string);
begin

    limpaCadastroTotalDependente(true);

   //Consulta dependentes e preenche grid
   with dmLocaliza.cdsLocalizaDepPorTitular do begin
      close;
      params[0].value := cpfTitular;
      open;
   end;

end;


procedure TfrmCadDependente.meCpfTitularKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmCadDependente.habilitaCadastroDep(op: boolean);
begin
   if op = True then begin
      pcDependente.Enabled := true;
      ActiveControl        := edNomeDep;
      BtnConfirmar.Enabled := true;
   end
   else begin
      pcDependente.Enabled := false;
      ActiveControl        := meCpfDep;
      BtnConfirmar.Enabled := false;
   end;

    dbgrid1.Enabled := true;    

end;

procedure TfrmCadDependente.sbLocalizaCPFDepClick(Sender: TObject);
begin

  Vacao := 'I';

  try

    //Verifica se o Cpf do Dependente é o mesmo que o titular
    if (meCpfDep.Text = meCpfTitular.Text) then begin
       showmessage('O CPF do Dependente não pode ser igual ao CPF do Titular !');
       ActiveControl := meCpfDep;
       exit;
    end;

    //Verifica Validade do CPF
    CheckCpfDep.CPF := meCpfTitular.Text;
    if (CheckCpfDep.Valid = false) or (meCpfTitular.text = '   .   .   -  ') then begin
       habilitaCadastroDep(false);
       showmessage('CPF Inválido !');
       exit;
    end;

    //Verifica se o Cpf já foi Cadastrado
    if localizaCpfDep(meCpfDep.text) then
       CarregaDependente()
    else begin
       limpaCadastroTotalDependente(false);
       edNomeDep.setfocus;
    end;

    habilitaCadastroDep(true);

   except
      showmessage('Ocorreu um erro na procedure sbLocalizaCPFDepClick !');
   end;
end;


function TfrmCadDependente.localizaCpfDep(cpf:string): boolean;
begin
   with dmlocaliza.cdsLocalizaCpfDep do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpfDep.recordcount > 0 then
      result := true

end;

procedure TfrmCadDependente.CarregaDependente;
begin
  try

    Vacao := 'A';

    edNomeDep.text             :=dmlocaliza.cdsLocalizaCpfDepNOME.value;
    dtNascimentoDep.DateValue  :=dmlocaliza.cdsLocalizaCpfDepDT_NASCIMENTO.value;
    edIdentidadeDep.text       :=dmlocaliza.cdsLocalizaCpfDepIDENTIDADE.value;
    edOeDep.text               :=dmlocaliza.cdsLocalizaCpfDepOE.value;
    meCepDep.Text              :=dmlocaliza.cdsLocalizaCpfDepCEP.value;
    edRuaDep.Text              :=dmlocaliza.cdsLocalizaCpfDepLOGRADOURO.value;
    edBairroDep.Text           :=dmlocaliza.cdsLocalizaCpfDepBAIRRO.value;
    edCidadeDep.Text           :=dmlocaliza.cdsLocalizaCpfDepCIDADE.value;
    edUfDep.Text               :=dmlocaliza.cdsLocalizaCpfDepUF.value;
    meTelCelular01Dep.text     :=dmlocaliza.cdsLocalizaCpfDepTEL_CELULAR_01.value;
    meTelCelular02Dep.text     :=dmlocaliza.cdsLocalizaCpfDepTEL_CELULAR_02.value;
    meTelResidencialDep.text   :=dmlocaliza.cdsLocalizaCpfDepTEL_RESIDENCIA.value;
    meTelTerceiroDep.text      :=dmlocaliza.cdsLocalizaCpfDepTEL_TERCEIRO.value;
    neRamalDep.text            :=dmlocaliza.cdsLocalizaCpfDepRAMAL_TERCEIRO.value;
    edParentescoDep.text       :=dmlocaliza.cdsLocalizaCpfDepPARENTESCO_TERCEIRO.value;
    edEmailDep.text            :=dmlocaliza.cdsLocalizaCpfDepEMAIL.value;

   except
      showmessage('Ocorreu um erro inesperado !');
   end;
end;


procedure TfrmCadDependente.meCpfDepKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFDep.Click;
   end;
end;

procedure TfrmCadDependente.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE DEPENDENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadDependente.Close;
end;

procedure TfrmCadDependente.BtnConfirmarClick(Sender: TObject);
begin

   try

      if not ValidaFormulario then begin
        frmMensagens.showmodal;
        exit;
      end; 


			if Vacao = 'I' then begin

        if MessageDlg('Confirma INCLUSÃO DO DEPENDENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
        exit;

				with dmInsert.sqlClienteIns do begin
					close;
					Params[0].Value := meCpfDep.text;  
          Params[1].Value := meCpfTitular.Text;
					Params[2].Value := strAlltrim(edNomeDep.Text);
					Params[3].Value := dmglobal.iif(dtNascimentoDep.datevalue=-693594,null, dtnascimentoDep.DateValue);
					Params[4].Value := strAlltrim(edIdentidadeDep.Text);
					Params[5].Value := strAlltrim(edOeDep.Text);
					Params[6].Value := null;
					Params[7].Value := null;
					Params[8].Value := stralltrim(meCepDep.Text);
					Params[9].Value := strAlltrim(edRuaDep.Text);
					Params[10].Value := strAlltrim(edBairroDep.Text);
					Params[11].Value := strAlltrim(edCidadeDep.Text);
					Params[12].Value := strAlltrim(edUfDep.Text);
					Params[13].Value := meTelCelular01Dep.Text;
					Params[14].Value := meTelCelular02Dep.Text;
					Params[15].Value := meTelResidencialDep.Text;
					Params[16].Value := meTelTerceiroDep.Text;
					Params[17].Value := neRamalDep.Text;
					Params[18].Value := strAlltrim(edParentescoDep.Text);
					Params[19].Value := strAlltrim(edEmailDep.Text);
					Params[20].Value := frmPrincipal.gIdUsuarioSistema;
					execsql();
				end;

        showmessage('Cadastrado efetuado com sucesso !');

        if MessageDlg('Deseja vincular CARTÃO AO DEPENDENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrYes then
            carregaTelaVinculaCartaoDependente(meCpfTitular.Text);

      end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO DEPENDENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;


 			  with dmUpdate.sqlClienteUpd do begin
				 close;
            Params[0].Value  := meCpfDep.Text;
            Params[1].Value  := stralltrim(edNomeDep.Text);
            Params[2].Value  := dmglobal.iif(dtNascimentoDep.datevalue=-693594,null, dtnascimentoDep.DateValue);
            Params[3].Value  := stralltrim(edIdentidadeDep.Text);
            Params[4].Value  := stralltrim(edOeDep.Text);
            Params[5].Value  := null;
					  Params[6].Value  := null;
            Params[7].Value  := stralltrim(meCepDep.Text);
            Params[8].Value  := stralltrim(edRuaDep.Text);
            Params[9].Value  := stralltrim(edBairroDep.Text);
            Params[10].Value := stralltrim(edCidadeDep.Text);
            Params[11].Value := stralltrim(edUfDep.Text);
            Params[12].Value := stralltrim(meTelCelular01Dep.Text);
            Params[13].Value := stralltrim(meTelCelular02Dep.Text);
            Params[14].Value := stralltrim(meTelResidencialDep.Text);
            Params[15].Value := stralltrim(meTelTerceiroDep.Text);
            Params[16].Value := neRamalDep.Text;
            Params[17].Value := stralltrim(edParentescoDep.Text);
            Params[18].Value := stralltrim(edEmailDep.Text);
 				 ExecSQL;
			  end;

			  showmessage('Cadastrado alterado com sucesso !');
        Vacao := 'I'

      end;

      dsListaDependente.DataSet.Refresh;
      limpaCadastroTotalDependente(true);


   except
      Showmessage('Erro ao salvar cadastro !');
      exit;
   end;


end;

function TfrmCadDependente.localizaCpfTitular(cpf:string): boolean;
begin
   with dmlocaliza.cdsLocalizaCpfTitular do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpfTitular.recordcount > 0 then begin
      if dmlocaliza.cdsLocalizaCpfTitularCPF_TITULAR.Value = '' then   // indica que o cpf é do titular
         result := true;
   end;

end;

function TfrmCadDependente.localizaCartao(cpf:string):boolean;
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


procedure TfrmCadDependente.habilitaCpfDep(op: boolean);
begin
   if op = True then begin
      gbCpfDependente.Enabled := true;
      ActiveControl := meCpfDep;
   end
   else begin
      gbCpfDependente.Enabled := false;
      ActiveControl := meCpfTitular;
   end;
end;

procedure TfrmCadDependente.carregaTelaVinculaCartaoDependente(
  cpf: String);
begin
   try
      Application.CreateForm(TfrmVincularCartaoDependente,frmVincularCartaoDependente);
      frmVincularCartaoDependente.meCpfTitular.text := cpf;
      frmVincularCartaoDependente.sbLocalizaCPFTitular.Click;
      frmVincularCartaoDependente.ShowModal;
   finally
      frmVincularCartaoDependente.free;
      frmVincularCartaoDependente := nil;
   end;
end;

procedure TfrmCadDependente.DBGrid1DblClick(Sender: TObject);
begin
  try


    Vacao := 'A';

    meCpfDep.text              :=dmLocaliza.cdsLocalizaDepPorTitularCPF.Value;
    edNomeDep.text             :=dmLocaliza.cdsLocalizaDepPorTitularNOME.value;
    dtNascimentoDep.DateValue  :=dmglobal.iif(dmLocaliza.cdsLocalizaDepPorTitularDT_NASCIMENTO.value=0,-693594,dmLocaliza.cdsLocalizaDepPorTitularDT_NASCIMENTO.value);
    edIdentidadeDep.text       :=dmLocaliza.cdsLocalizaDepPorTitularIDENTIDADE.value;
    edOeDep.text               :=dmLocaliza.cdsLocalizaDepPorTitularOE.value;
    meCepDep.Text              :=dmLocaliza.cdsLocalizaDepPorTitularCEP.value;
    edRuaDep.Text              :=dmLocaliza.cdsLocalizaDepPorTitularLOGRADOURO.value;
    edBairroDep.Text           :=dmLocaliza.cdsLocalizaDepPorTitularBAIRRO.value;
    edCidadeDep.Text           :=dmLocaliza.cdsLocalizaDepPorTitularCIDADE.value;
    edUfDep.Text               :=dmLocaliza.cdsLocalizaDepPorTitularUF.value;
    meTelCelular01Dep.text     :=dmLocaliza.cdsLocalizaDepPorTitularTEL_CELULAR_01.value;
    meTelCelular02Dep.text     :=dmLocaliza.cdsLocalizaDepPorTitularTEL_CELULAR_02.value;
    meTelResidencialDep.text   :=dmLocaliza.cdsLocalizaDepPorTitularTEL_RESIDENCIA.value;
    meTelTerceiroDep.text      :=dmLocaliza.cdsLocalizaDepPorTitularTEL_TERCEIRO.value;
    neRamalDep.text            :=dmLocaliza.cdsLocalizaDepPorTitularRAMAL_TERCEIRO.value;
    edParentescoDep.text       :=dmLocaliza.cdsLocalizaDepPorTitularPARENTESCO_TERCEIRO.value;
    edEmailDep.text            :=dmLocaliza.cdsLocalizaDepPorTitularEMAIL.value;

   except
      showmessage('Ocorreu um erro inesperado !');
   end;
end;

procedure TfrmCadDependente.FormShow(Sender: TObject);
begin
   limpaCadastroTotalDependente(true);
end;

procedure TfrmCadDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmLocaliza.cdsLocalizaCpfTitular.Close;
  dmlocaliza.cdsLocalizaCpfDep.Close;
  dmlocaliza.cdsLocalizaCartao.Close;
  dmLocaliza.cdsLocalizaDepPorTitular.Close;
end;


function TfrmCadDependente.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edNomeDep.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('Nome do dependente deve ser preenchido.');

   if dtNascimentoDep.datevalue = -693594 then
      frmMensagens.RichEdit1.Lines.Add('Data de nascimento deve ser preenchida.');


   if strAlltrim(edEmailDep.Text) <> '' then begin
      if not dmGlobal.IsValidEmail(edEmailDep.Text) then
        frmMensagens.RichEdit1.Lines.Add('E-mail inválido.');
   end;

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;

end.
