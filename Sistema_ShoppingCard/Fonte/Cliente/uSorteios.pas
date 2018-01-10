unit uSorteios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, dbcgrids, jpeg, ExtCtrls, DB;

type
  TfrmSorteios = class(TForm)
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
    dsSorteio: TDataSource;
    Image3: TImage;
    Label5: TLabel;
    Label6: TLabel;
    dbImgPremio: TImage;
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
    procedure dbImgPremioClick(Sender: TObject);

  private
    { Private declarations }
    gY : integer;
    gMoveDedo : Boolean;

    procedure ZeraApplication();
    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure CarregaPremios();
    procedure DetalhePremio(idpremio:integer);


  public
    { Public declarations }
  end;

var
  frmSorteios: TfrmSorteios;

implementation

uses uDmCliente, uDetalheProduto, uDetalhePremio;

{$R *.dfm}

procedure TfrmSorteios.FormShow(Sender: TObject);
begin
    frmSorteios.Height := 768;
    frmSorteios.Width := 1024;
    CarregaPremios();
end;

procedure TfrmSorteios.CarregaPremios;
begin
    with dmCliente.cdsPremioSorteio do begin
        close;
        open;
    end;
end;

procedure TfrmSorteios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZeraApplication();
    dmCliente.cdsPremioSorteio.close; 
end;

procedure TfrmSorteios.Button1Click(Sender: TObject);
begin
  frmSorteios.close;
end;

procedure TfrmSorteios.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  dbImgPremio.Picture.LoadFromFile(dmCliente.cdsPremioSorteioPATH_IMAGEM.value);
end;

procedure TfrmSorteios.DBCtrlGrid1MouseMove(Sender: TObject;
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

procedure TfrmSorteios.DBCtrlGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gY := y;
   gMoveDedo := true;
end;

procedure TfrmSorteios.DBCtrlGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gMoveDedo := false;
end;

procedure TfrmSorteios.DBCtrlGrid1Exit(Sender: TObject);
begin
   gMoveDedo := false;
end;

procedure TfrmSorteios.TimeCloseTimer(Sender: TObject);
begin
    frmSorteios.Close;
end;

procedure TfrmSorteios.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmSorteios.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;

procedure TfrmSorteios.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmSorteios.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmSorteios.DetalhePremio(idpremio:integer);
begin
  try
      TimeClose.Enabled := false;
      ZeraApplication();      

      Application.CreateForm(TfrmDetalhePremio,frmDetalhePremio);
      frmDetalhePremio.idpremio := idpremio;
      frmDetalhePremio.ShowModal;
   finally
      frmDetalhePremio.free;
      frmDetalhePremio := nil;
   end;  

   Application.OnIdle := LigaTimer;
   Application.OnMessage := DesligaTimer;
   CarregaPremios();

end;

procedure TfrmSorteios.dbImgPremioClick(Sender: TObject);
begin
   DetalhePremio(dmCliente.cdsPremioSorteioID.value);
end;

end.
