unit uProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, dbcgrids, jpeg, ExtCtrls, DB;

type
  TfrmProdutos = class(TForm)
    imgfundo: TImage;
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    dsProduto: TDataSource;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    dbImgProduto: TImage;
    TimeClose: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;Index: Integer);
    procedure DBCtrlGrid1Exit(Sender: TObject);
    procedure DBCtrlGrid1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DBCtrlGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBCtrlGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject;  var Action: TCloseAction);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbImgProdutoClick(Sender: TObject);

  private
    { Private declarations }
    gY : integer;
    gMoveDedo : Boolean;

    procedure ZeraApplication();
    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure CarregaProdutos;
    procedure DetalheProduto(idproduto:integer);


  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses uDmCliente, uLojasParticipantes, uDetalheProduto;

{$R *.dfm}

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
    frmProdutos.Height := 768;
    frmProdutos.Width := 1024;
    CarregaProdutos();
end;

procedure TfrmProdutos.CarregaProdutos;
begin

    with dmCliente.cdsProdutosPromocao do begin
        close;
        params[0].value := null;
        params[1].value := null;
        open;
    end;

    dmCliente.cdsProdutosPromocao.Filtered := false;


end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZeraApplication();
    dmCliente.cdsProdutosPromocao.close;
end;

procedure TfrmProdutos.Button1Click(Sender: TObject);
begin
  frmProdutos.close;
end;

procedure TfrmProdutos.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  dbImgProduto.Picture.LoadFromFile(dmCliente.cdsProdutosPromocaoPATH_IMAGEM.value);
end;

procedure TfrmProdutos.DBCtrlGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if gMoveDedo then Begin
      if y > gY then
         //SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_PAGEUP, 0) //Move Pagina para cima
         SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_LINEUP, 0)  //Move Linha para cima
      else if y < gY then
         //SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_PAGEDOWN, 0); //Move Pagina para baixo
         SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_LINEDOWN, 0); //Move Linha para baixo
   end;
end;

procedure TfrmProdutos.DBCtrlGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gY := y;
   gMoveDedo := true;
end;

procedure TfrmProdutos.DBCtrlGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gMoveDedo := false;
end;

procedure TfrmProdutos.DBCtrlGrid1Exit(Sender: TObject);
begin
   gMoveDedo := false;
end;

procedure TfrmProdutos.TimeCloseTimer(Sender: TObject);
begin
    frmProdutos.Close;
end;

procedure TfrmProdutos.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;

procedure TfrmProdutos.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmProdutos.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmProdutos.DetalheProduto(idproduto:integer);
begin
  try
      TimeClose.Enabled := false;
      ZeraApplication();
      

      Application.CreateForm(TfrmDetalheProduto,frmDetalheProduto);
      frmDetalheProduto.idProduto := idproduto;
      frmDetalheProduto.ShowModal;
   finally
      frmDetalheProduto.free;
      frmDetalheProduto := nil;
   end;


   Application.OnIdle := LigaTimer;
   Application.OnMessage := DesligaTimer;
   CarregaProdutos();


end;

procedure TfrmProdutos.dbImgProdutoClick(Sender: TObject);
begin
   DetalheProduto(dmCliente.cdsProdutosPromocaoID.value);
end;



end.
