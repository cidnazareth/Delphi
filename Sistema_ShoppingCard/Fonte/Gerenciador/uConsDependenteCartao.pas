unit uConsDependenteCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, EChkCPF, StdCtrls, Mask, Buttons, ExtCtrls, DB,
  jpeg;

type
  TfrmConsDependenteCartao = class(TForm)
    BtnSair: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnExportaExcel: TBitBtn;
    Label20: TLabel;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpf: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    dsConsdependente: TDataSource;
    dsTitular: TDataSource;
    Panel2: TPanel;
    LbQtdeDependentes: TLabel;
    DBGrid2: TDBGrid;
    Image1: TImage;
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function localizaCpfDep(cpf:variant): boolean;
    procedure carregaListaTitulares(cpf:string);

  public
    { Public declarations }
    qtdeDependentes : integer;
  end;

var
  frmConsDependenteCartao: TfrmConsDependenteCartao;

implementation

uses uDmConsulta, uDmLocaliza;

{$R *.dfm}

procedure TfrmConsDependenteCartao.sbLocalizaCPFTitularClick(
  Sender: TObject);
begin
   //Verifica Validade do CPF
   CheckCpf.CPF := meCpf.Text;
   if CheckCpf.Valid = false then begin
      showmessage('CPF Inválido !');
      exit;
   end;


   //Localiza Cpf dependente e carrega dados do titular
   if localizaCpfDep(meCpf.Text) then begin
      qtdeDependentes := dmlocaliza.cdsLocalizaCpfDep.Recordcount;
      LbQtdeDependentes.Caption := inttostr(qtdeDependentes);
      ActiveControl := DBGrid1;

      carregaListaTitulares(meCpf.Text);
   end   
   else begin
      showmessage('CPF dependente não cadastrado !');
      meCpf.setfocus();
      exit;
   end;

end;

procedure TfrmConsDependenteCartao.carregaListaTitulares(cpf:string);
begin
   with dmlocaliza.cdsLocalizaTitPorDep do begin
      close;
      params[0].value := cpf;
      open;
   end;   
end;


function TfrmConsDependenteCartao.localizaCpfDep(cpf:variant): boolean;
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


procedure TfrmConsDependenteCartao.BitBtn1Click(Sender: TObject);
begin
   localizaCpfDep(null);

   qtdeDependentes := dmlocaliza.cdsLocalizaCpfDep.RecordCount;
   LbQtdeDependentes.Caption := inttostr(qtdeDependentes);
   ActiveControl := DBGrid1;
end;

procedure TfrmConsDependenteCartao.BtnSairClick(Sender: TObject);
begin
   frmConsDependenteCartao.Close;
end;

procedure TfrmConsDependenteCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmlocaliza.cdsLocalizaCpfDep.Close;
   dmlocaliza.cdsLocalizaTitPorDep.Close;
end;

procedure TfrmConsDependenteCartao.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmConsDependenteCartao.DBGrid1DblClick(Sender: TObject);
begin
   carregaListaTitulares(dmlocaliza.cdsLocalizaCpfDepCPF.value);
end;

procedure TfrmConsDependenteCartao.DBGrid1Enter(Sender: TObject);
begin
   DBGrid1.OnDblClick(DBGrid1);
end;

procedure TfrmConsDependenteCartao.FormShow(Sender: TObject);
begin
  ActiveControl := mecpf;
end;

end.
