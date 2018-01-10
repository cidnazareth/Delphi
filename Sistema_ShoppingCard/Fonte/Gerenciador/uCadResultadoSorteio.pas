unit uCadResultadoSorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, EDateEd, StdCtrls, ENumEd, Buttons, ELibFnc, DB,
  DBCtrls, EChkCGC, ComCtrls, EDBDate, Grids, DBGrids, jpeg;

type
  TfrmCadResultadoSorteio = class(TForm)
    gbCadastro: TGroupBox;
    Label2: TLabel;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    gpDep: TGroupBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    EvDBDateEdit1: TEvDBDateEdit;
    EvDBDateEdit2: TEvDBDateEdit;
    EvDBDataSorteio: TEvDBDateEdit;
    DBRichEdit1: TDBRichEdit;
    gbCpfDependente: TGroupBox;
    Label3: TLabel;
    dsLocalizaSorteio: TDataSource;
    dbLkCbDescSorteio: TDBLookupComboBox;
    Label20: TLabel;
    edPremio1: TEdit;
    edPremio2: TEdit;
    edPremio3: TEdit;
    edPremio4: TEdit;
    edPremio5: TEdit;
    edDescricao1: TEdit;
    edDescricao2: TEdit;
    edDescricao3: TEdit;
    edDescricao4: TEdit;
    edDescricao5: TEdit;
    EvNumero1: TEvNumEdit;
    EvNumero2: TEvNumEdit;
    EvNumero3: TEvNumEdit;
    EvNumero4: TEvNumEdit;
    EvNumero5: TEvNumEdit;
    Label4: TLabel;
    EvNumSorteio: TEvNumEdit;
    Label1: TLabel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure reObsPremioEnter(Sender: TObject);
    procedure reObsPremioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbLkCbDescSorteioClick(Sender: TObject);
    procedure dbLkCbDescSorteioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbLkCbDescSorteioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    procedure LimpaCadastro();
    procedure abreLocalizaSorteio();
    procedure carregaPremios(idSorteio: integer);
    function  RetornarTedit(i:integer):TEdit;
    procedure carregaResultadoSorteio(idSorteio: integer);
    procedure HabilitaNumeroSorteado(i:integer);
    procedure HabilitaBotao(op:boolean);
  public
    { Public declarations }
  end;

var
  frmCadResultadoSorteio: TfrmCadResultadoSorteio;
  Vacao : string;

implementation

uses uDmInsert, SqlExpr , uDmLocaliza, uPrincipal, uDmConsulta, uDmUpdate;

{$R *.dfm}


procedure TfrmCadResultadoSorteio.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadResultadoSorteio.BtnConfirmarClick(Sender: TObject);
begin

  try

			if Vacao = 'I' then begin

        if MessageDlg('Confirma INCLUSÃO DO RESULTADO DO SORTEIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
        exit;


        with dmInsert.sqlResultadoSorteioIns do begin
         close;
         Params[0].Value := dbLkCbDescSorteio.KeyValue;
         Params[1].Value := evNumSorteio.Value;
         Params[2].Value := evNumero1.Value;
         Params[3].Value := evNumero2.Value;
         Params[4].Value := evNumero3.Value;
         Params[5].Value := evNumero4.Value;
         Params[6].Value := evNumero5.Value;
         Params[7].Value := frmprincipal.gIdUsuarioSistema;
         ExecSQL;
        end;

        showmessage('Cadastrado efetuado com sucesso !');

      end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO RESULTADO DO SORTEIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;


        with dmUpdate.sqlResultadoSorteioUpd do begin
         close;
         Params[0].Value := dbLkCbDescSorteio.KeyValue;
         Params[1].Value := evNumSorteio.Value;
         Params[2].Value := evNumero1.Value;
         Params[3].Value := evNumero2.Value;
         Params[4].Value := evNumero3.Value;
         Params[5].Value := evNumero4.Value;
         Params[6].Value := evNumero5.Value;
         ExecSQL;
        end;

        showmessage('Cadastrado alterado com sucesso !');
        Vacao := 'I'

      end;

      LimpaCadastro();
      ActiveControl := dbLkCbDescSorteio;

  except
     showmessage('Erro ao salvar cadastro !');
     exit;
  end;
end;

procedure TfrmCadResultadoSorteio.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE RESULTADO DE SORTEIOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadResultadoSorteio.close;
end;

procedure TfrmCadResultadoSorteio.LimpaCadastro;
begin
  evnumsorteio.Clear;
  edDescricao1.Clear;
  edDescricao2.Clear;
  edDescricao3.Clear;
  edDescricao4.Clear;
  edDescricao5.Clear;
  evNumero1.Clear;
  evNumero2.Clear;
  evNumero3.Clear;
  evNumero4.Clear;
  evNumero5.Clear;
  EvNumSorteio.Enabled:=false;
  evNumero1.enabled:=false;
  evNumero2.enabled:=false;
  evNumero3.enabled:=false;
  evNumero4.enabled:=false;
  evNumero5.enabled:=false;
  EvNumSorteio.Enabled:=false;
end;

procedure TfrmCadResultadoSorteio.reObsPremioEnter(Sender: TObject);
begin
   KeyPreview := false;
end;

procedure TfrmCadResultadoSorteio.reObsPremioExit(Sender: TObject);
begin
   KeyPreview := true;
end;


procedure TfrmCadResultadoSorteio.abreLocalizaSorteio();
begin
   with dmLocaliza.cdsLocalizaSorteio do begin
      close;
      params[0].Value := date;
      open;
   end;
   // inicia dblookupcombobox com o primeiro registro
   dbLkCbDescSorteio.KeyValue:= dmLocaliza.cdsLocalizaSorteioID.Value;
end;

procedure TfrmCadResultadoSorteio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmLocaliza.cdsLocalizaSorteio.Close;
    dmConsulta.cdsConsultaResultadoSorteio.Close;
    dmConsulta.cdsConsultaPremio.Close;
end;

procedure TfrmCadResultadoSorteio.FormShow(Sender: TObject);
begin
   abreLocalizaSorteio();
   carregaPremios(dbLkCbDescSorteio.KeyValue);
   carregaResultadoSorteio(dbLkCbDescSorteio.KeyValue);
   Vacao := 'I';
end;


procedure TfrmCadResultadoSorteio.dbLkCbDescSorteioClick(Sender: TObject);
begin
  carregaPremios(dbLkCbDescSorteio.KeyValue);
  carregaResultadoSorteio(dbLkCbDescSorteio.KeyValue);
end;


procedure TfrmCadResultadoSorteio.carregaResultadoSorteio(idSorteio: integer);
begin

  Vacao := 'I';

   //Consulta resultado do sorteio
     with dmConsulta.cdsConsultaResultadoSorteio do begin
        close;
        params[0].value := idSorteio;
        open;
     end;


     if dmConsulta.cdsConsultaResultadoSorteio.RecordCount > 0 then
     begin
       Vacao := 'A';

       EvNumSorteio.text := dmConsulta.cdsConsultaResultadoSorteioN_SORTEIO.text;
       EvNumero1.text    := dmConsulta.cdsConsultaResultadoSorteioCDSDesigner01_PREMIO.text;
       EvNumero2.text    := dmConsulta.cdsConsultaResultadoSorteioCDSDesigner02_PREMIO.text;
       EvNumero3.text    := dmConsulta.cdsConsultaResultadoSorteioCDSDesigner03_PREMIO.text;
       EvNumero4.text    := dmConsulta.cdsConsultaResultadoSorteioCDSDesigner04_PREMIO.text;
       EvNumero5.text    := dmConsulta.cdsConsultaResultadoSorteioCDSDesigner05_PREMIO.text;
     end;

end;

procedure TfrmCadResultadoSorteio.HabilitaNumeroSorteado(i:integer);
begin

    //aproveito para habilitar também o número do sorteio
    EvNumSorteio.Enabled := true;

    case i of
      1:evNumero1.enabled:=true;
      2:evNumero2.enabled:=true;
      3:evNumero3.enabled:=true;
      4:evNumero4.enabled:=true;
      5:evNumero5.enabled:=true;
    end;
end;



procedure TfrmCadResultadoSorteio.carregaPremios(idSorteio: integer);
var i : integer;
begin

   //Consulta premios
     with dmConsulta.cdsConsultaPremio do begin
        close;
        params[0].value := idSorteio;
        open;
     end;


     LimpaCadastro();

      i := 1;
      dmConsulta.cdsConsultaPremio.First;

      // A função RetornarTedit retorna o campo correto para receber o valor do banco de dados
      while not dmConsulta.cdsConsultaPremio.Eof do
      begin
          (RetornarTedit(i) as TEdit).Text := dmConsulta.cdsConsultaPremioDESC_PREMIO.Value;
           dmConsulta.cdsConsultaPremio.Next;

           if date >= EvDBDataSorteio.DateValue then begin
               HabilitaNumeroSorteado(i);
               HabilitaBotao(true);
           end;

          i := i + 1;
      end;

end;

function TfrmCadResultadoSorteio.RetornarTedit(i:integer):TEdit;
begin
    case i of
      1:result:=edDescricao1;
      2:result:=edDescricao2;
      3:result:=edDescricao3;
      4:result:=edDescricao4;
      5:result:=edDescricao5;
    else
      result:=nil;
    end;
end;  


procedure TfrmCadResultadoSorteio.dbLkCbDescSorteioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  carregaPremios(dbLkCbDescSorteio.KeyValue);
  carregaResultadoSorteio(dbLkCbDescSorteio.KeyValue);
end;

procedure TfrmCadResultadoSorteio.dbLkCbDescSorteioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  carregaPremios(dbLkCbDescSorteio.KeyValue);
  carregaResultadoSorteio(dbLkCbDescSorteio.KeyValue);
end;

procedure TfrmCadResultadoSorteio.habilitaBotao(op: boolean);
begin
     btnconfirmar.Enabled := op;
end;

end.
