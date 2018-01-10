unit uLojasParticipantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dbcgrids, StdCtrls, Buttons, DB, DBCtrls, jpeg, ExtCtrls, Grids,
  DBGrids;

type
  TfrmLojasParticipantes = class(TForm)
    Image1: TImage;
    TimeClose: TTimer;
    dsloja: TDataSource;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Image3: TImage;
    Label2: TLabel;
    Label1: TLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBCtrlGrid1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DBCtrlGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBCtrlGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBCtrlGrid1Exit(Sender: TObject);

  private
    { Private declarations }
    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure ZeraApplication();
    procedure LoadRecords();

  public
    { Public declarations }
  end;

var
  frmLojasParticipantes: TfrmLojasParticipantes;
  gY : integer;
  gMoveDedo : Boolean;
  
implementation

uses uDmCliente;

{$R *.dfm}

procedure TfrmLojasParticipantes.btnVoltarClick(Sender: TObject);
begin
   frmLojasParticipantes.close;
end;

procedure TfrmLojasParticipantes.FormShow(Sender: TObject);
begin

    frmLojasParticipantes.Width := 1024;
    frmLojasParticipantes.Height := 768;

    //dmCliente.cdsLojas.FetchOnDemand := false;
    //dmCliente.cdsLojas.PacketRecords := 15;   // quantidade de registros por página


    with dmCliente.cdsLojas do begin
        close;
        params[0].value := null;
        open;
    end;

    //LoadRecords();

end;

procedure TfrmLojasParticipantes.LoadRecords();
var
  nome : string;
  i : integer;
begin
       i := 1;
       While not dmCliente.cdsLojas.Eof do begin

         nome := dmCliente.cdsLojas.FieldByName('NOME_FANTASIA').AsString;
         Tlabel(FindComponent('Label' + Inttostr( i ) )).Caption := nome;
         i := i + 1;

         dmCliente.cdsLojas.next;
       end;
end;


procedure TfrmLojasParticipantes.BitBtn1Click(Sender: TObject);
begin
  dmCliente.cdsLojas.GetNextPacket;
  dmCliente.cdsLojas.Last;
  dsloja.DataSet.Refresh;
end;



procedure TfrmLojasParticipantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ZeraApplication();
    dmCliente.cdsLojas.Close;
end;


procedure TfrmLojasParticipantes.TimeCloseTimer(Sender: TObject);
begin
    frmLojasParticipantes.Close;
end;

procedure TfrmLojasParticipantes.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;


procedure TfrmLojasParticipantes.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;


procedure TfrmLojasParticipantes.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmLojasParticipantes.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;



procedure TfrmLojasParticipantes.DBCtrlGrid1MouseMove(Sender: TObject;
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

procedure TfrmLojasParticipantes.DBCtrlGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gY := y;
   gMoveDedo := true;
end;

procedure TfrmLojasParticipantes.DBCtrlGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   gMoveDedo := false;
end;

procedure TfrmLojasParticipantes.DBCtrlGrid1Exit(Sender: TObject);
begin
   gMoveDedo := false;
end;

end.
