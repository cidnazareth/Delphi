unit uConsTitularesCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, EChkCPF, StdCtrls, Mask, Buttons, ExtCtrls, DB,
  ImgList, jpeg;

type
  TfrmConsTitularesCartao = class(TForm)
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
    DBGrid2: TDBGrid;
    dsConsTitularCartaoCpf: TDataSource;
    dsConsDepCartaoCpfTitular: TDataSource;
    Panel2: TPanel;
    LbQtdeTitulares: TLabel;
    Panel4: TPanel;
    LbQtdeDependentes: TLabel;
    ImageList1: TImageList;
    Image1: TImage;
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure carregaListaDependentes(cpfTitular: string);
    function localizaCpfTitular(cpf:variant): boolean;

  public
    { Public declarations }
    qtdeTitulares,qtdeDependentes : integer;
  end;

var
  frmConsTitularesCartao: TfrmConsTitularesCartao;

implementation

uses uDmConsulta, uDmLocaliza;

{$R *.dfm}

procedure TfrmConsTitularesCartao.sbLocalizaCPFTitularClick(
  Sender: TObject);
begin
   //Verifica Validade do CPF
   CheckCpf.CPF := meCpf.Text;
   if CheckCpf.Valid = false then begin
      showmessage('CPF Inválido !');
      exit;
   end;


   //Localiza Cpf Titular e carrega dados dos dependentes
   if localizaCpfTitular(meCpf.Text) then begin

      qtdeTitulares := dmlocaliza.cdsLocalizaCpfTitular.RecordCount;
      LbQtdeTitulares.Caption := inttostr(qtdeTitulares);
      ActiveControl := DBGrid1;

      carregaListaDependentes(meCpf.Text);


   end   
   else begin
      showmessage('CPF titular não cadastrado !');
      meCpf.setfocus();
      exit;
   end;
end;

function TfrmConsTitularesCartao.localizaCpfTitular(cpf:variant): boolean;
begin
   with dmlocaliza.cdsLocalizaCpfTitular do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpfTitular.RecordCount > 0 then
      result := true;

end;


procedure TfrmConsTitularesCartao.carregaListaDependentes(cpfTitular: string);
begin

   //Consulta dependentes e preenche grid
   with dmLocaliza.cdsLocalizaDepPorTitular do begin
      close;
      params[0].value := cpfTitular;
      open;
   end;

end;

procedure TfrmConsTitularesCartao.BitBtn1Click(Sender: TObject);
begin
   localizaCpfTitular(null);

   qtdeTitulares := dmlocaliza.cdsLocalizaCpfTitular.RecordCount;
   LbQtdeTitulares.Caption := inttostr(qtdeTitulares);
   ActiveControl := DBGrid1;
end;

procedure TfrmConsTitularesCartao.BtnSairClick(Sender: TObject);
begin
   frmConsTitularesCartao.Close;
end;

procedure TfrmConsTitularesCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmlocaliza.cdsLocalizaCpfTitular.close;
   dmLocaliza.cdsLocalizaDepPorTitular.close;
end;

procedure TfrmConsTitularesCartao.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmConsTitularesCartao.DBGrid1DblClick(Sender: TObject);
begin

    carregaListaDependentes(dmlocaliza.cdsLocalizaCpfTitularCPF.asstring);

    qtdeDependentes := dmlocaliza.cdsLocalizaDepPorTitular.recordcount;
    LbQtdeDependentes.Caption := inttostr(qtdeDependentes);

end;

procedure TfrmConsTitularesCartao.DBGrid1Enter(Sender: TObject);
begin
   DBGrid1.OnDblClick(DBGrid1);
end;

procedure TfrmConsTitularesCartao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

if Column.Field = dmlocaliza.cdsLocalizaCpfTitularATIVO then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     ImageList1.Draw(TDBGrid(Sender).Canvas, Rect.Left +7,Rect.Top + 1, 1);

     if dmlocaliza.cdsLocalizaCpfTitularATIVO.Text = 'S' then // Cadastro está ativo
       ImageList1.Draw(TDBGrid(Sender).Canvas, Rect.Left +7,Rect.Top + 1, 0)
   end;

end;

procedure TfrmConsTitularesCartao.FormShow(Sender: TObject);
begin
  ActiveControl := mecpf;
end;

end.
