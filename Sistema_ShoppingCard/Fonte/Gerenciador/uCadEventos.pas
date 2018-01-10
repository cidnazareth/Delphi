unit uCadEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, EDateEd, ExtCtrls, ENumEd, ELibFnc,
  jpeg;

type
  TfrmCadEventos = class(TForm)
    Panel1: TPanel;
    gpOperacao: TGroupBox;
    rbDebitoPonto: TRadioButton;
    rbCreditoPonto: TRadioButton;
    GroupBox1: TGroupBox;
    neQtdePontos: TEvNumEdit;
    GroupBox2: TGroupBox;
    edDescEvento: TEdit;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    GroupBox3: TGroupBox;
    Bevel1: TBevel;
    rbPeriodoNao: TRadioButton;
    rbPeriodoSim: TRadioButton;
    gbPeriodo: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    dtPeriodoInicio: TEvDateEdit;
    dtPeriodoFim: TEvDateEdit;
    GroupBox4: TGroupBox;
    rbAtivaNao: TRadioButton;
    rbAtivaSim: TRadioButton;
    Label20: TLabel;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure rbPeriodoNaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edDescEventoExit(Sender: TObject);

  private
    { Private declarations }
    procedure LimpaCadastro();
  public
    { Public declarations }
  end;

var
  frmCadEventos: TfrmCadEventos;

implementation

uses uDmInsert, uPrincipal;

{$R *.dfm}

procedure TfrmCadEventos.BtnSairClick(Sender: TObject);
begin

    if MessageDlg('Confirma fechamento do CADASTRO DE EVENTOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

    frmCadEventos.close;    

end;

procedure TfrmCadEventos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadEventos.BtnConfirmarClick(Sender: TObject);
var
   opPonto,AtivoPeriodo,Ativo : string[1];
begin
   if MessageDlg('Confirma INCLUSÃO DO EVENTO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   //Operação de Crédito Ou débito
   if rbDebitoPonto.Checked then
      opPonto := 'D'
   else if rbCreditoPonto.Checked then
      opPonto := 'C';
   //Periodo do evendo
   if rbPeriodoNao.Checked then
      AtivoPeriodo := 'N'
   else if rbAtivaSim.Checked then
      AtivoPeriodo := 'S';
   //Evento Ativo ou não
   if rbAtivaSim.Checked then
      Ativo := 'S'
   else if rbAtivaNao.Checked then
      Ativo := 'N';

   try
     // with dmInsert.sqlEventoIns do begin
     //    close;
     //    params[0].value := strAllTrim(edDescEvento.text);
     //    params[1].value := neQtdePontos.Value;
     //    params[2].value := opPonto;
     //    params[3].value := AtivoPeriodo;
     //    params[4].value := dtPeriodoInicio.DateValue;
     //    params[5].value := dtPeriodoFim.DateValue;
     //    params[6].value := Ativo;
     //    params[7].value := frmPrincipal.gIdUsuarioSistema;
     //    execsql;
     // end;
      showmessage('Cadastro efetuado com sucesso !');
      LimpaCadastro;
      ActiveControl := edDescEvento;
   except
      showmessage('Erro ao efetuar cadastro !');
   end;

end;

procedure TfrmCadEventos.LimpaCadastro;
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
   //limpa MascEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TMaskEdit then  begin
         TMaskEdit(Components[i]).Clear;
      end;
   //Limpa Imagens
   for i := 0 to ComponentCount -1 do
      if Components[i] is TImage then  begin
         TImage(Components[i]).Picture:= nil;
      end;
end;
procedure TfrmCadEventos.rbPeriodoNaoClick(Sender: TObject);
begin
   if (rbPeriodoNao.Checked) then begin
      gbPeriodo.Enabled := false;
      dtPeriodoInicio.DateValue := date;
      dtPeriodoFim.DateValue := date;
   end
   else begin
      gbPeriodo.Enabled := true;
      ActiveControl := dtPeriodoInicio;
   end;
end;

procedure TfrmCadEventos.FormShow(Sender: TObject);
begin
   dtPeriodoInicio.DateValue := date;
   dtPeriodoFim.DateValue    := date;
end;

procedure TfrmCadEventos.edDescEventoExit(Sender: TObject);
begin

  //Cid
  If BtnSair.Focused then
    exit
  else
  begin

    if trim(edDescEvento.text) = '' then begin
      Showmessage('Informe a descrição do evento.');
      edDescEvento.SetFocus;
    end;
  end;

end;

end.




