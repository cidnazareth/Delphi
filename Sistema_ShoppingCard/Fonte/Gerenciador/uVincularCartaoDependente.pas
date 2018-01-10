unit uVincularCartaoDependente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ENumEd, EChkCPF, EDateEd, StdCtrls, Mask, Buttons, DB, DBClient,
  Grids, DBGrids, EDBNum, EDBDate, DBCtrls, jpeg, ExtCtrls;

type
  TfrmVincularCartaoDependente = class(TForm)
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpfTitular: TMaskEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    CheckCpf: TEvCheckCPF;
    gbNumCartaoTitular: TGroupBox;
    gbLista: TGroupBox;
    DBGrid1: TDBGrid;
    dsListaDependente: TDataSource;
    BtnSair: TBitBtn;
    Label20: TLabel;
    Label1: TLabel;
    neNumCartaoTitular: TEvNumEdit;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meCpfTitularKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBneNumCartaoTitularExit(Sender: TObject);
  private
    { Private declarations }
    function localizaCpfTitular(cpf:string): boolean;
    function localizaCartao(cpf:string): boolean;
    procedure carregaListaDependentes(cpf:string);
    procedure habilitaLista(op: boolean);
  public
    { Public declarations }
  end;

var
  frmVincularCartaoDependente: TfrmVincularCartaoDependente;

implementation

uses uDmLocaliza, uInformeNumCartaoDependente, uDmConsulta, uDmGlobal;

{$R *.dfm}

procedure TfrmVincularCartaoDependente.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do VINCULO DO CARTÃO DO DEPENDENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmVincularCartaoDependente.close;
end;



procedure TfrmVincularCartaoDependente.sbLocalizaCPFTitularClick(Sender: TObject);
begin
   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpfTitular.Text;
   if CheckCpf.Valid = false then begin
      showmessage('CPF Inválido !');
      exit;
   end;

   //Localiza Cpf Titular
   if localizaCpfTitular(meCpfTitular.Text) then begin

        //Carrega dados do titular
      edNome.text             := dmlocaliza.cdsLocalizaCpfTitularNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfTitularIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfTitularOE.value;
      neNumCartaoTitular.Text := '';


      if localizaCartao(meCpfTitular.Text) then
         neNumCartaoTitular.Text :=  dmlocaliza.cdsLocalizaCartaoCARTAO.asstring;    

      carregaListaDependentes(meCpfTitular.Text);
   end   
   else
      showmessage('CPF não localizado !');
       
end;

function TfrmVincularCartaoDependente.localizaCartao(cpf:string): boolean;
begin
   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result := false;

   neNumCartaoTitular.Text := '';
   
   if dmlocaliza.cdsLocalizaCartao.recordcount > 0 then begin
      neNumCartaoTitular.Text :=  dmlocaliza.cdsLocalizaCartaoCARTAO.asstring;
      result := true;
   end;

end;



function TfrmVincularCartaoDependente.localizaCpfTitular(cpf: string): boolean;
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

procedure TfrmVincularCartaoDependente.carregaListaDependentes(cpf: string);
begin
   //Consulta dependentes sem cartão
   with dmLocaliza.cdsLocalizaDepSemCartao do begin
      close;
      Params[0].Value := cpf;
      open;
   end;

   if dmLocaliza.cdsLocalizaDepSemCartao.recordcount > 0 then
      habilitaLista(true)
   else
      habilitaLista(false);

end;


procedure TfrmVincularCartaoDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmLocaliza.cdsLocalizaCpfTitular.Close;
   dmLocaliza.cdsLocalizaDepSemCartao.Close;
   dmlocaliza.cdsLocalizaCartao.Close;   
end;

procedure TfrmVincularCartaoDependente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmVincularCartaoDependente.meCpfTitularKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmVincularCartaoDependente.DBGrid1DblClick(Sender: TObject);
begin

if dsListaDependente.DataSet.RecordCount = 0 then begin
    showmessage('Não existem dependentes sem cartão vinculado para este CPF !');
    exit;
end;


   try
      Application.CreateForm(TfrmInformeNumCartaoDependente,frmInformeNumCartaoDependente);
      frmInformeNumCartaoDependente.ShowModal;
   finally
      frmInformeNumCartaoDependente.free;
      frmInformeNumCartaoDependente := nil;

      dsListaDependente.DataSet.Refresh;

   end;
end;

procedure TfrmVincularCartaoDependente.DBneNumCartaoTitularExit(
  Sender: TObject);
begin

 //Cid
  If BtnSair.Focused then
    exit
  else
  begin

    if trim(neNumCartaoTitular.text) = '' then begin
      Showmessage('Informe o número do cartão.');
      neNumCartaoTitular.SetFocus;
    end;
  end;

end;

procedure TfrmVincularCartaoDependente.habilitaLista(op: boolean);
begin
   if op = True then
      gbLista.Enabled := true
   else
     gbLista.Enabled  := false;
end;

end.
