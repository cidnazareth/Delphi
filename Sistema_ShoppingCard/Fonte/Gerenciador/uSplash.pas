unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ComCtrls, StdCtrls, ExtCtrls, EGauge, Mask, EChkCPF, ELibFnc;

type
  TFrmSplash = class(TForm)
    pnLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edSenha: TEdit;
    btnLogin: TButton;
    Bevel1: TBevel;
    lblAlterarSenha: TLabel;
    pnSenha: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    btnAlterarSenha: TButton;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edSenhaAtual: TEdit;
    Label9: TLabel;
    edNovaSenha: TEdit;
    btnCancelar: TButton;
    meCpf: TMaskEdit;
    meCpf2: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    lblVersao: TStaticText;
    btnSair: TButton;
    procedure lblAlterarSenhaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarSenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure meCpf2KeyPress(Sender: TObject; var Key: Char);
    procedure edSenhaAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLoginKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function localizaCpfUsuario(cpf: string): boolean;
    Function GetVersion: String;
    function AlteraSenha(cpf:string; senha:string):boolean;
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

uses uDmLocaliza, uDmGlobal, uPrincipal, uDmUpdate;

{$R *.dfm}

procedure TFrmSplash.lblAlterarSenhaClick(Sender: TObject);
begin
  pnSenha.BringToFront;
  mecpf2.Text := mecpf.Text;
  activecontrol := mecpf2;
end;

procedure TFrmSplash.btnCancelarClick(Sender: TObject);
begin
  pnLogin.BringToFront;
  Activecontrol := mecpf;
end;

function TFrmSplash.localizaCpfUsuario(cpf: string): boolean;
begin
   with dmlocaliza.cdsLocalizaUsuario do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;

   if dmlocaliza.cdsLocalizaUsuario.recordcount > 0 then
      result := true;

end;

procedure TFrmSplash.btnLoginClick(Sender: TObject);
var
  SenhaAtual : String;
begin

   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido.');
      meCpf.setfocus;
      exit;
   end;

   if localizaCpfUsuario(meCpf.Text) then begin
      SenhaAtual := dmGlobal.Decrypt(dmlocaliza.cdsLocalizaUsuarioSENHA.value);
      if SenhaAtual = edsenha.text then begin
         frmPrincipal.gIdUsuarioSistema := dmlocaliza.cdsLocalizaUsuarioID.value;
         frmPrincipal.gUsuarioSistema := dmlocaliza.cdsLocalizaUsuarioNOME.value;
         frmPrincipal.gPerfilUsuario := dmlocaliza.cdsLocalizaUsuarioPERFIL.value;
         frmPrincipal.gIdShopping := 1;

         frmPrincipal.Visible := true;
         frmSplash.hide;


         dmlocaliza.cdsLocalizaUsuario.Close;
         exit;
      end
      else begin
        showmessage('Senha Inválida.');
        edsenha.SetFocus;
        exit;
      end
   end
   else begin
      showmessage('Usuário não localizado.');
      mecpf.SetFocus;
      exit
   end;

end;

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
  lblversao.Caption := 'Versão: ' +  GetVersion;
  pnsenha.SendToBack;
end;


Function TFrmSplash.GetVersion: String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;


procedure TFrmSplash.btnSairClick(Sender: TObject);
begin
  FrmSplash.Close;
end;


function TFrmSplash.AlteraSenha(cpf:string; senha:string):boolean;
begin
try

   with dmUpdate.sqlSenhaUpd do begin
      close;
      params[0].value := cpf;
      params[1].value := dmGlobal.Encrypt(senha);
      ExecSql();
   end;

   result := true;

except
  result := false;
end;

end;



procedure TFrmSplash.btnAlterarSenhaClick(Sender: TObject);
var
  SenhaAtual:string;
begin

   //Verifica se Cpf é válido
   CheckCpf.CPF := meCpf2.Text;
   if (CheckCpf.Valid = false) or (meCpf2.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido.');
      meCpf2.setfocus;
      exit;
   end;

   if localizaCpfUsuario(meCpf2.Text) then begin
      SenhaAtual := dmGlobal.Decrypt(dmlocaliza.cdsLocalizaUsuarioSENHA.value);
      if SenhaAtual = strAlltrim(edSenhaAtual.text) then begin
         if AlteraSenha(mecpf2.Text, strAlltrim(edNovaSenha.Text)) then begin
            showmessage('Senha alterada com sucesso.');
            edNovaSenha.Clear;
            edsenhaatual.Clear;
            mecpf2.Clear;
            pnLogin.BringToFront;
            mecpf.SetFocus;
         end
         else begin
            showmessage('Ocorreu um erro ao alterar a senha. Informe aos responsáveis pelo sistema.');
            mecpf2.SetFocus;
         end;
      end
      else begin
        showmessage('Senha atual é inválida.');
        edSenhaAtual.SetFocus;
        exit
      end;
   end
   else begin
      showmessage('Usuário não localizado.');
      mecpf.SetFocus;
      exit
   end;
end;

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;


procedure TFrmSplash.meCpfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TFrmSplash.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.meCpf2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.edSenhaAtualKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.edNovaSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.btnAlterarSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.btnLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmSplash.btnSairKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then  begin
     Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
