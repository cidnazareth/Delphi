unit uCadSorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Mask, EDateEd, ELibFnc, Grids,
  DBGrids, DB, jpeg, ExtCtrls;

type
  TfrmCadSorteio = class(TForm)
    GroupBox2: TGroupBox;
    edDescSorteio: TEdit;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    dtInicio: TEvDateEdit;
    dtFim: TEvDateEdit;
    GroupBox1: TGroupBox;
    dtSorteio: TEvDateEdit;
    GroupBox3: TGroupBox;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    Label3: TLabel;
    reObsSorteio: TRichEdit;
    Label20: TLabel;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    dsSorteio: TDataSource;
    Image1: TImage;
    procedure reObsSorteioEnter(Sender: TObject);
    procedure reObsSorteioExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCadastro();
    procedure CarregaSorteios();
    function ValidaFormulario():boolean;
  public
    { Public declarations }
  end;

var
  frmCadSorteio: TfrmCadSorteio;
  Vacao : string ;
  id : integer;

implementation

uses uDmInsert, uPrincipal, uDmLocaliza, uDmConsulta, uDmUpdate,
  uMensagens;

{$R *.dfm}

procedure TfrmCadSorteio.reObsSorteioEnter(Sender: TObject);
begin
   KeyPreview := false;
end;

procedure TfrmCadSorteio.reObsSorteioExit(Sender: TObject);
begin
   KeyPreview := true;
end;

procedure TfrmCadSorteio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadSorteio.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE SORTEIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadSorteio.Close;
end;

procedure TfrmCadSorteio.BtnConfirmarClick(Sender: TObject);
begin

   if not ValidaFormulario then begin
      frmMensagens.showmodal;
      exit;
   end;

   try
			if Vacao = 'I' then begin

        if MessageDlg('Confirma INCLUSÃO DO SORTEIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
        exit;


        with dmInsert.sqlSorteioIns do begin
          close;
          params[0].value := frmPrincipal.gIdShopping;
          params[1].value := stralltrim(edDescSorteio.text);
          params[2].value := dtInicio.datevalue;
          params[3].value := dtFim.datevalue;
          params[4].value := dtSorteio.datevalue;
          params[5].value := reObsSorteio.Text;
          params[6].value := frmPrincipal.gIdUsuarioSistema;
          execsql;
        end;

        showmessage('Cadastro efetuado com sucesso !');

      end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO SORTEIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;

 			  with dmUpdate.sqlSorteioUpd do begin
				 close;
          Params[0].Value := ID;
          params[1].value := stralltrim(edDescSorteio.text);
          params[2].value := dtInicio.datevalue;
          params[3].value := dtFim.datevalue;
          params[4].value := dtSorteio.datevalue;
          params[5].value := reObsSorteio.Text;
          execsql;
			  end;

			  showmessage('Cadastrado alterado com sucesso !');

      end;

      dsSorteio.DataSet.Refresh;
      LimpaCadastro();
      Vacao := 'I'


   except
      showmessage('Erro ao efetuar cadastro !');
   end;

end;

procedure TfrmCadSorteio.LimpaCadastro;
var
   i : integer;
begin
   //Limpa edits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEdit then  begin
         TEdit(Components[i]).Text := '';
      end;
   //limpa MascEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TMaskEdit then  begin
         TMaskEdit(Components[i]).Clear;
      end;
   //Limpa obs
   for i := 0 to ComponentCount -1 do
      if Components[i] is TRichEdit then  begin
         TRichEdit(Components[i]).Clear;
      end;
   //Limpa DateEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvDateEdit then  begin
         TEvDateEdit(Components[i]).DateText := '00/00/0000';
      end;
end;

procedure TfrmCadSorteio.FormShow(Sender: TObject);
begin
   CarregaSorteios();
   Vacao := 'I';
end;

procedure TfrmCadSorteio.CarregaSorteios();
begin
   with dmLocaliza.cdsLocalizaSorteio do begin
      close;
      params[0].value := null;
      open;
   end;

end;

procedure TfrmCadSorteio.DBGrid2DblClick(Sender: TObject);
begin
   Vacao := 'A';
   id :=  dmLocaliza.cdsLocalizaSorteioID.Value;
   edDescSorteio.Text := dmLocaliza.cdsLocalizaSorteioDESC_SORTEIO.Value;
   dtInicio.datevalue := dmLocaliza.cdsLocalizaSorteioDT_INICIO.Value;
   dtfim.datevalue := dmLocaliza.cdsLocalizaSorteioDT_FIM.Value;
   dtSorteio.datevalue := dmLocaliza.cdsLocalizaSorteioDT_SORTEIO.Value;
   reObsSorteio.Text := dmLocaliza.cdsLocalizaSorteioOBS_SORTEIO.Value;
end;

function TfrmCadSorteio.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edDescSorteio.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('A descrição do sorteio deve ser preenchido.');

   if dtInicio.datevalue = -693594 then
      frmMensagens.RichEdit1.Lines.Add('Data inicial do período de aquisição deve ser preenchida.');

   if dtfim.datevalue = -693594 then
      frmMensagens.RichEdit1.Lines.Add('Data final do período de aquisição deve ser preenchida.');

   if dtSorteio.datevalue = -693594 then
      frmMensagens.RichEdit1.Lines.Add('Data do sorteio deve ser preenchida.'); 

   if dtfim.datevalue <= dtInicio.datevalue  then
      frmMensagens.RichEdit1.Lines.Add('Data final menor ou igual a data inicial.');

   if dtSorteio.datevalue <= dtfim.datevalue  then
      frmMensagens.RichEdit1.Lines.Add('Data do sorteio deve ser maior que data final.'); 


   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;

end.
