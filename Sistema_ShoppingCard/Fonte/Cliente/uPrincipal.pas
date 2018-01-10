unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, jpeg, DB, DBCtrls, StdCtrls,
  dbcgrids, uBlobImageFB, DBClient, ELibFnc, AppEvnts, EWall;

type
  TfrmPrincipal = class(TForm)
    tmChamaStanfBy: TTimer;
    Image6: TImage;
    Label2: TLabel;
    pnLojasParticipantes: TPanel;
    pnSaldo: TPanel;
    pnExtrato: TPanel;
    pnEmitirCupomSorteio: TPanel;
    pnMaisProdutos: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    Image4: TImage;
    Label5: TLabel;
    lblQtde2: TLabel;
    lblQtde3: TLabel;
    lblQtde4: TLabel;
    Label6: TLabel;
    lblDisponivel3: TLabel;
    Label9: TLabel;
    lblDisponivel2: TLabel;
    Label11: TLabel;
    lblDisponivel4: TLabel;
    lblQtde1: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    lblDisponivel1: TLabel;
    TimeRefresh: TTimer;
    procedure FormShow(Sender: TObject);
    procedure pnLojasParticipantesMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnLojasParticipantesMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnSaldoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnSaldoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnExtratoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnExtratoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnEmitirCupomSorteioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnEmitirCupomSorteioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnLojasParticipantesClick(Sender: TObject);
    procedure pnExtratoClick(Sender: TObject);
    procedure pnSaldoClick(Sender: TObject);
    procedure tmChamaStanfByTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure pnMaisProdutosClick(Sender: TObject);
    procedure pnMaisProdutosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnMaisProdutosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnEmitirCupomSorteioClick(Sender: TObject);
    procedure TimeRefreshTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure DetalheProduto(idproduto:integer);

  public
    { Public declarations }
    gIdUsuarioSistema : integer;
    gUsuarioSistema   : String;
    gPerfilUsuario    : String;
    gIdShopping       : integer;
    gIdTerminal       : integer;
    gPathImagem       : String;
    gPathBase         : String;

    procedure CarregaProdutos;
  end; 

var
  frmPrincipal: TfrmPrincipal;



implementation

uses uDmCliente, uLojasParticipantes, uExtratoCartao, uSaldoCartao,
  uTelaStandBy, uConfirmaDigital, uDetalheProduto, uProdutos, uSorteios;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

    frmPrincipal.Height := 768;
    frmPrincipal.Width := 1024;
    label2.Width := 663;
    label2.Transparent := true;


    gIdUsuarioSistema := 0; // como não tem usuário logado, podemos deixar sempre com zero
    gUsuarioSistema := 'Auto-Atendimento';
    gPerfilUsuario := 'Perfil Auto-Atendimento';
    


    CarregaProdutos();

   // tmChamaStanfBy.Enabled := true;
end;

procedure TfrmPrincipal.CarregaProdutos;
var
  idProduto : integer;
  path : string;
  pontos : integer;
  disponivel :integer;
  i : integer;
begin

    with dmCliente.cdsProdutosPromocao do begin
        close;
        params[0].value := null;
        params[1].value := null;
        open;
    end;

    dmCliente.cdsProdutosPromocao.Filter := 'DESTAQUE=''' + 'S' + '''';
    dmCliente.cdsProdutosPromocao.Filtered := TRUE;
    

    if dmCliente.cdsProdutosPromocao.RecordCount > 0 then begin

       dmCliente.cdsProdutosPromocao.first;

       for i := 1 to 4 do begin
         path := dmCliente.cdsProdutosPromocao.FieldByName('PATH_IMAGEM').AsString;
         pontos := dmCliente.cdsProdutosPromocao.FieldByName('QTDE_PONTOS').value;
         disponivel := dmCliente.cdsProdutosPromocao.FieldByName('QTDE_PRODUTO').value -
                       dmCliente.cdsProdutosPromocao.FieldByName('QTDE_CUPOM_EMITIDO').value;

         idProduto := dmCliente.cdsProdutosPromocao.FieldByName('ID').value;
         TImage(FindComponent('Image' + Inttostr( i ) )).Picture.LoadFromFile(path);
         TImage(FindComponent('Image' + Inttostr( i ) )).Tag := idProduto;
         TLabel(FindComponent('lblQtde' + Inttostr( i ) )).Caption := inttostr(pontos);
         TLabel(FindComponent('lblDisponivel' + Inttostr( i ) )).Caption := inttostr(disponivel);

         dmCliente.cdsProdutosPromocao.next;
       end;
    end;

    dmCliente.cdsProdutosPromocao.Close;

end;



procedure TfrmPrincipal.pnLojasParticipantesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnLojasParticipantes do begin
      BevelOuter := bvLowered;
   end;
end;

procedure TfrmPrincipal.pnLojasParticipantesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnLojasParticipantes do begin
      BevelOuter := bvRaised;
   end;
end;

procedure TfrmPrincipal.pnSaldoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnSaldo do begin
      BevelOuter := bvLowered;
   end;
end;

procedure TfrmPrincipal.pnSaldoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnSaldo do begin
      BevelOuter := bvRaised;
   end;
end;

procedure TfrmPrincipal.pnExtratoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnExtrato do begin
      BevelOuter := bvRaised;
   end;
end;

procedure TfrmPrincipal.pnExtratoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnExtrato do begin
      BevelOuter := bvLowered;
   end;
end;

procedure TfrmPrincipal.pnEmitirCupomSorteioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnEmitirCupomSorteio do begin
      BevelOuter := bvLowered;
   end;
end;

procedure TfrmPrincipal.pnEmitirCupomSorteioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnEmitirCupomSorteio do begin
      BevelOuter := bvRaised;
   end;
end;

procedure TfrmPrincipal.pnLojasParticipantesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmLojasParticipantes,frmLojasParticipantes);
      frmLojasParticipantes.ShowModal;
   finally
      frmLojasParticipantes.free;
      frmLojasParticipantes := nil;
   end;
end;

procedure TfrmPrincipal.pnExtratoClick(Sender: TObject);
var cpf : string;
begin
   try
      Application.CreateForm(TfrmConfirmaDigital,frmConfirmaDigital);
      frmConfirmaDigital.ShowModal;
   finally

      if frmConfirmaDigital.DigitalConfirmada.Text = 'S' then begin
          cpf := frmConfirmaDigital.meCpf.Text;
          frmConfirmaDigital.free;
          frmConfirmaDigital := nil;

          try
            Application.CreateForm(TfrmExtratoCartao,frmExtratoCartao);
            frmExtratoCartao.cpf := cpf;
            frmExtratoCartao.ShowModal;
          finally
            frmExtratoCartao.free;
            frmExtratoCartao := nil;
          end;
      end;

   end;
end;

procedure TfrmPrincipal.pnSaldoClick(Sender: TObject);
var cpf : string;
begin
   try
      Application.CreateForm(TfrmConfirmaDigital,frmConfirmaDigital);
      frmConfirmaDigital.ShowModal;
   finally

      if frmConfirmaDigital.DigitalConfirmada.Text = 'S' then begin
          cpf := frmConfirmaDigital.meCpf.Text;
          frmConfirmaDigital.free;
          frmConfirmaDigital := nil;

          try
            Application.CreateForm(TfrmSaldoCartao,frmSaldoCartao);
            frmSaldoCartao.cpf := cpf;
            frmSaldoCartao.ShowModal;
          finally
            frmSaldoCartao.free;
            frmSaldoCartao := nil;
          end;
      end;

   end;
end;


procedure TfrmPrincipal.tmChamaStanfByTimer(Sender: TObject);
begin
   tmChamaStanfBy.Enabled := false;
   //Carrega Tela StandBy
   try
      Application.CreateForm(TfrmTelaStandBy,frmTelaStandBy);
      frmTelaStandBy.ShowModal;
   finally
      frmTelaStandBy.free;
      frmTelaStandBy := nil;
   end;
   //Ativa Chamada de tela de standBy
   tmChamaStanfBy.Enabled := true;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_F10 then
     application.Terminate;

end;

procedure TfrmPrincipal.Image1Click(Sender: TObject);
begin
   DetalheProduto(image1.tag);
end;

procedure TfrmPrincipal.DetalheProduto(idproduto:integer);
begin

  try
      Application.CreateForm(TfrmDetalheProduto,frmDetalheProduto);
      frmDetalheProduto.idProduto := idproduto;
      frmDetalheProduto.ShowModal;
   finally
      frmDetalheProduto.free;
      frmDetalheProduto := nil;
   end;

   CarregaProdutos();

end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin
  DetalheProduto(image2.tag);
end;

procedure TfrmPrincipal.Image3Click(Sender: TObject);
begin
  DetalheProduto(image3.tag);
end;

procedure TfrmPrincipal.Image4Click(Sender: TObject);
begin
  DetalheProduto(image4.tag);
end;

procedure TfrmPrincipal.pnMaisProdutosClick(Sender: TObject);
begin

  try
      Application.CreateForm(TfrmProdutos,frmProdutos);
      //frmDetalheProduto.idProduto := idproduto;
      frmProdutos.ShowModal;
   finally
      frmProdutos.free;
      frmProdutos := nil;
   end;

   CarregaProdutos();

end;

procedure TfrmPrincipal.pnMaisProdutosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnMaisProdutos do begin
      BevelOuter := bvLowered;
   end;
end;

procedure TfrmPrincipal.pnMaisProdutosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   with pnMaisProdutos do begin
      BevelOuter := bvRaised;
   end;
end;

procedure TfrmPrincipal.pnEmitirCupomSorteioClick(Sender: TObject);
begin

   try
      Application.CreateForm(TfrmSorteios,frmSorteios);
      frmSorteios.ShowModal;
   finally
      frmSorteios.free;
      frmSorteios := nil;
   end;

end;

procedure TfrmPrincipal.TimeRefreshTimer(Sender: TObject);
begin
    CarregaProdutos();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  TimeRefresh.Enabled := true;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TimeRefresh.Enabled := false;
end;

end.
