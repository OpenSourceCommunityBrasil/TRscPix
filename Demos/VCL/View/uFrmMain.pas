{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Versão Original RSC SISTEMAS          }
{ Versão: 3.0.0                         }
{                                       }
{ Componente TscPix                     }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}
unit uFrmMain;
interface
uses
  Winapi.Windows, Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Samples.Spin, System.TypInfo,
  IniFiles,  System.UITypes, System.DateUtils,
  IdSSLOpenSSL,
  uRscPix.Variaveis, uRscPix.Tipos,
  uRscPix.Validations, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage,
  uRscPix.Classes,
  Vcl.ComCtrls,


  RscPix, uRsc.funcoes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask

  ;
type
  TFrmMain = class(TForm)
    gb_Config_Seg: TGroupBox;
    Label2: TLabel;
    edtCertificado: TLabeledEdit;
    edtSenhaCertificado: TLabeledEdit;
    edtClientID: TLabeledEdit;
    edtClientSecreat: TLabeledEdit;
    edtDeveloperKey: TLabeledEdit;
    edtChavePix: TLabeledEdit;
    CbbTipoChavePix: TComboBox;
    edtNomeRecebedore: TLabeledEdit;
    edtDuracaoMinutos: TSpinEdit;
    Label9: TLabel;
    Label1: TLabel;
    cbbTipoQRCode: TComboBox;
    btn_GerarCabranca: TButton;
    gb_Consulta_Periodo: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    dtp_Data_Inicial: TDateTimePicker;
    Button5: TButton;
    dtp_Data_Final: TDateTimePicker;
    dtp_Hora_Inicial: TDateTimePicker;
    dtp_Hora_Final: TDateTimePicker;
    grbxPSP: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    CbbPSP: TComboBox;
    CbbTipoAmbiente: TComboBox;
    gb_Consulta_Pix_TXID: TGroupBox;
    Button6: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button7: TButton;
    Button4: TButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    edtCidadeRecebedor: TLabeledEdit;
    btn_Cert: TSpeedButton;
    Open_Dialog: TOpenDialog;
    pnl_tela: TPanel;
    pnl_menu: TPanel;
    pnl_Configs: TPanel;
    pnl_Funcoes: TPanel;
    PnlBtn_Funcoes: TPanel;
    PnlBtn_Configs: TPanel;
    pnl_FuncCobranca: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    Panel6: TPanel;
    edtTXID: TEdit;
    SpeedButton1: TSpeedButton;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    edtValorPix: TEdit;
    Label11: TLabel;
    edtMsgPix: TEdit;
    pnl_CobToolsRet: TPanel;
    Panel7: TPanel;
    Label12: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    mmPayload: TMemo;
    Label13: TLabel;
    imgQRCODE: TImage;
    Panel10: TPanel;
    lblStatus: TLabel;
    Label15: TLabel;
    Panel11: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    edt_e2eid: TEdit;
    RscPix1: TRscPix;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1inforpagador: TStringField;
    FDMemTable1endtoebdid: TStringField;
    FDMemTable1txid: TStringField;
    FDMemTable1valor: TCurrencyField;
    FDMemTable1horario: TStringField;
    FDMemTable1nomePagador: TStringField;
    FDMemTable1cpfcnpjpagador: TStringField;
    btn_KeyCert: TSpeedButton;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    edt_DocPagador: TEdit;
    Label19: TLabel;
    edt_NomePagador: TEdit;
    Panel12: TPanel;
    SpeedButton2: TSpeedButton;
    edtTxIdDev: TEdit;
    Label20: TLabel;
    edtMsgPagador: TEdit;
    edt_PagPixs: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edt_QtdPagPixs: TEdit;
    Label23: TLabel;
    edt_ItensPagPixs: TEdit;
    Label24: TLabel;
    edt_TotalItensPagPixs: TEdit;
    Image1: TImage;
    Image2: TImage;
    lblVersaoComponente: TLabel;
    procedure btn_GerarCabrancaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


    procedure CriarConfigIni;
    procedure LerConfigIni;
    procedure GravarConfigIni;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btn_CertClick(Sender: TObject);
    { funções espeficaic}
    procedure PnlsBtnMouseLeave(Sender: TObject);
    procedure PnlsBtnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PnlBtn_ConfigsClick(Sender: TObject);
    procedure PnlBtn_FuncoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnImprQrCodeClick(Sender: TObject);
    procedure RscPix1CobGet(Sender: TObject; const RespCobGet: TRespCobGet;
      Erro: string);
    procedure RscPix1CobPut(Sender: TObject; const RespCobPut: TRespCobPut;
      Erro: string);
    procedure RscPix1Token(Sender: TObject; const Token: TToken; Erro: string);
    procedure RscPix1CobPatch(Sender: TObject;
      const RespCobPatch: TRespCobPatch; Erro: string);
    procedure RscPix1PixGet(Sender: TObject; const RespPixGet: TRespPixGet;
      Erro: string);
    procedure RscPix1PixPut(Sender: TObject; const RespPixPut: TRespPixPut;
      Erro: string);
    procedure btn_KeyCertClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edt_PagPixsKeyPress(Sender: TObject; var Key: Char);
    procedure RscPix1LocGet(Sender: TObject; const RespLocGet: TRespLocGet;
      Erro: string);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    cQrCode,
    cFantasia  : String;
    PathLogo: string;
    CurrentPsp:  TTipoPSP;

    procedure SetResetConfigPnlBtn(Sender: TObject);
    procedure SetConfigClick(Sender: TObject);
    procedure SetConfigTelaFunções;
    { Private declarations }
    procedure SetConfigPixObrig(Sender: TObject);
    procedure LimparDados;
    function SoNumOnKeyPress(var Key: Char): Char;
  public
    { Public declarations }
  end;
var
  FrmMain: TFrmMain;
  PathConfigIni : String;
implementation
{$R *.dfm}
function Selecionar_Diretorio( Titulo : String ; var Dir : String ) : Boolean ;
begin
result := False ;
with TFileOpenDialog.Create(nil) do
     try
       Title := Titulo ;
       Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem] ;
       OkButtonLabel := 'Selecionar';
       DefaultFolder := Dir;
       FileName := Dir;
       if Execute then
          begin
          Dir := FileName ;
          result := True ;
          end;
     finally
       Free;
     end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  GravarConfigIni;
  LerConfigIni;
  MessageDlg('Configurações Gravadas Com Sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

procedure TFrmMain.btnImprQrCodeClick(Sender: TObject);
var
  mImp  : TStringList;
begin
  mImp  := TStringList.Create;
  try
    //aplicando
    mImp.Clear;
    mImp.Add('</zera>');
    mImp.Add('</ce>');
    mImp.Add('<a><n>'+cFantasia+'</n></a>');
    mImp.Add('</ce>');
    mImp.Add('<qrcode>'+cQrCode+'</qrcode>');
    mImp.Add('</ce>');
    mImp.Add('<n><e><a>'+edtValorPix.Text+'</a></e></n>');
    mImp.Add('</fn>');
    mImp.Add('</ce>');
    mImp.Add('</corte_total>');
  finally
    mImp.Free;
  end;
end;

procedure TFrmMain.btn_CertClick(Sender: TObject);
begin
  Open_Dialog.DefaultExt := '*.pem' ;
  Open_Dialog.Filter := 'Arquivos pem|*.pem|Arquivos cer|*.cer' ;
  if Open_Dialog.Execute then
     begin
      edtCertificado.Text := Open_Dialog.FileName ;
     end;
end;

procedure TFrmMain.btn_GerarCabrancaClick(Sender: TObject);
begin
  SetConfigPixObrig(RscPix1);
  RscPix1.CriarCobranca(StrToFloatDef(edtValorPix.Text, 0), edtTXID.Text, edtMsgPix.Text);
end;

procedure TFrmMain.btn_KeyCertClick(Sender: TObject);
begin
  Open_Dialog.DefaultExt := '*.key' ;
  Open_Dialog.Filter := 'Arquivos key|*.key' ;
  if Open_Dialog.Execute then
     begin
      edtSenhaCertificado.Text := Open_Dialog.FileName ;
     end;
end;
procedure TFrmMain.Button2Click(Sender: TObject);
begin
    SetConfigPixObrig(RscPix1);
    RscPix1.ConsultarCobranca(edtTXID.Text);
end;
procedure TFrmMain.Button3Click(Sender: TObject);
begin
    SetConfigPixObrig(RscPix1);
    RscPix1.CancelarCobranca(edtTXID.Text);
end;
procedure TFrmMain.Button4Click(Sender: TObject);
begin
  if Trim(edt_E2eID.Text) = ''  then
    begin
      MessageDlg('Digite o campo endToEndId' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edt_E2eID.SetFocus ;
      Exit;
    end;
  if Trim(edtTxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtTxIdDev.SetFocus ;
      Exit;
    end;
  if Trim(edtValorPix.Text) = ''  then
    begin
      MessageDlg('Digite o campo Valor' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtValorPix.SetFocus ;
      Exit;
    end;
  SetConfigPixObrig(RscPix1);
  RscPix1.SolicitarDevolucaoPix(edt_e2eid.Text, edtTxIdDev.Text, StrToFloat(edtValorPix.Text));
end;


procedure TFrmMain.Button5Click(Sender: TObject);
begin
  SetConfigPixObrig(RscPix1);
  RscPix1.ConsultarListPixsRecebPeriodo(StrToDateTime(DateToStr(dtp_Data_Inicial.Date) + TimeToStr(dtp_Hora_Inicial.Time)) ,
                                        StrToDateTime(DateToStr(dtp_Data_Final.Date) + TimeToStr(dtp_Hora_Final.Time)), StrToIntDef(edt_PagPixs.Text, 0));
end;
procedure TFrmMain.Button6Click(Sender: TObject);
var
  valida: Boolean;
begin

  case CurrentPsp of
    pspSicredi: valida  :=  True ;
    pspBancoDoBrasil: valida  :=  True ;
    pspBradesco:  valida  :=  True ;
    pspSantander: valida  :=  False ;
    pspSicoob:  valida  :=  True ;
  end;

  if valida then
    begin
      if Trim(edt_E2eID.Text) = ''  then
        begin
          MessageDlg('Digite o campo E2eID' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
          edt_E2eID.SetFocus ;
          Exit;
        end;
    end;

  SetConfigPixObrig(RscPix1);
  RscPix1.ConsultarPixRecebido(edt_e2eid.Text);
end;
procedure TFrmMain.Button7Click(Sender: TObject);
begin
  if Trim(edt_E2eID.Text) = ''  then
    begin
      MessageDlg('Digite o campo E2eID' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edt_E2eID.SetFocus ;
      Exit;
    end;
  if Trim(edtTxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtTxIdDev.SetFocus ;
      Exit;
    end;
  SetConfigPixObrig(RscPix1);
  RscPix1.ConsultarDevolucaoPix(edt_e2eid.Text, edtTxIdDev.Text);
end;
procedure TFrmMain.SetResetConfigPnlBtn(Sender: TObject);
var
  P:  integer;
begin
  if Sender is TPanel then
    begin
      for P := 0 to Pred(TPanel(Sender).ControlCount) do
        begin
          if TPanel(Sender).Controls[P] is TPanel then
            begin
              TPanel(TPanel(Sender).Controls[P]).Tag    :=  0;
              TPanel(TPanel(Sender).Controls[P]).Color  :=  clMenuHighlight;
            end;
        end;
    end;

//  PnlBtn_Configs.Tag    :=  0;
//  PnlBtn_Configs.Color  :=  clMenuHighlight;
//
//  PnlBtn_Funcoes.Tag    :=  0;
//  PnlBtn_Funcoes.Color  :=  clMenuHighlight
end;
function TFrmMain.SoNumOnKeyPress(var Key: Char): Char;
begin
  {$IFDEF UNICODE}
  if CharInSet(Key, ['0'..'9', #8]) then
  {$ELSE}
  if Key in ['0'..'9'] then
  {$ENDIF}
    Result := Key
  else
    Result  :=  #0;
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  edtTXID.Text  :=  'COB'
                  + IntToStr(Random(9999))
                  + IntToStr(Random(999))
                  + 'RSC1996'
                  + IntToStr(Random(999))
                  + IntToStr(Random(9999))
                  + 'EZL1991';
end;
procedure TFrmMain.SpeedButton2Click(Sender: TObject);
begin
  edtTxIdDev.Text  :=  'DEV'
                  + IntToStr(Random(9999))
                  + IntToStr(Random(999))
                  + 'RSC1996'
                  + IntToStr(Random(999))
                  + IntToStr(Random(9999))
                  + 'EZL1991';
end;

Procedure TFrmMain.SetConfigClick(Sender: TObject);
begin
  TPanel(Sender).Color := clNavy;
  TPanel(Sender).Tag := 1;
end;

procedure TFrmMain.SetConfigPixObrig(Sender: TObject);
begin
  LimparDados;

  if FileExists(PathLogo) then
    imgQRCODE.Picture.LoadFromFile(PathLogo);

    TRscPix(Sender).TitularPix.NomeTitularConta             :=  edtNomeRecebedore.Text;
    TRscPix(Sender).TitularPix.CidadeTitularConta           :=  edtCidadeRecebedor.Text;
    TRscPix(Sender).Seguranca.CertFile                      :=  edtCertificado.Text;
    TRscPix(Sender).Seguranca.CertKeyFile                   :=  edtSenhaCertificado.Text;
    TRscPix(Sender).Seguranca.UseSSL                        :=  True;
    TRscPix(Sender).Seguranca.SSLVersions                   :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
    TRscPix(Sender).Seguranca.VerifyCert                    :=  True;
    TRscPix(Sender).Seguranca.SSLMethod                     :=  sslvSSLv3;
    TRscPix(Sender).Developer.Application_key               :=  edtDeveloperKey.Text;
    TRscPix(Sender).Developer.Client_ID                     :=  edtClientID.Text;
    TRscPix(Sender).Developer.Client_Secret                 :=  edtClientSecreat.Text;
    TRscPix(Sender).PSP.TipoPsp                             :=  TTipoPSP(CbbPSP.ItemIndex);
    TRscPix(Sender).PSP.TipoPspAmbiente                     :=  TTipoAmbiente(CbbTipoAmbiente.ItemIndex);
    TRscPix(Sender).TitularPix.TipoChavePix                 :=  TTipoChavePIX(CbbTipoChavePix.ItemIndex);
    TRscPix(Sender).TitularPix.ChavePIX                     :=  edtChavePix.Text;
    TRscPix(Sender).TitularPix.TipoQRCode                   :=  TTipoQrCode(cbbTipoQRCode.ItemIndex);
    TRscPix(Sender).TitularPix.DuracaoMinutos               :=  edtDuracaoMinutos.Value;
end;

procedure TFrmMain.SetConfigTelaFunções;
begin
  CurrentPsp := TTipoPSP(GetEnumValue(TypeInfo(TTipoPSP), CbbPSP.Items[CbbPSP.ItemIndex]));

  case CurrentPsp of
    pspSicredi:
      begin
        Button6.Enabled :=  True;
        edt_e2eid.Enabled           :=  True;
        Button3.Enabled             :=  True;
      end;

    pspBancoDoBrasil:
      begin
        Button6.Enabled :=  True;
        edt_e2eid.Enabled           :=  True;
        Button3.Enabled             :=  True;
      end;

    pspBradesco:
      begin
        Button6.Enabled :=  True;
        edt_e2eid.Enabled           :=  True;
        Button3.Enabled             :=  True;
      end;

    pspSantander:
      begin
        Button6.Enabled :=  False;
        edt_e2eid.Enabled           :=  False;
        Button3.Enabled             :=  False;
      end;

    pspSicoob:
      begin
        Button6.Enabled :=  True;
        edt_e2eid.Enabled           :=  True;
        Button3.Enabled             :=  True;
      end;
  end;
end;

procedure TFrmMain.CriarConfigIni;
var
  ConfigIni : TIniFile;
begin
  try
    if not FileExists(PathConfigIni) then
      begin
        ConfigIni := TIniFile.Create(PathConfigIni);
        try
          ConfigIni.WriteString('PIX', 'Certificado', '');
          ConfigIni.WriteString('PIX', 'Senha Certificado', '');
          ConfigIni.WriteString('PIX', 'Client ID', '');
          ConfigIni.WriteString('PIX', 'Client Secreat', '');
          ConfigIni.WriteString('PIX', 'Developer Application Key', '');
          ConfigIni.WriteString('PIX', 'Chave PIX', '');
          ConfigIni.WriteString('PIX', 'Tipo Chave PIX', '');
          ConfigIni.WriteString('PIX', 'Tipo QRCode', '');
          ConfigIni.WriteString('PIX', 'Cidade Recebedor', '');
          ConfigIni.WriteString('PIX', 'Nome Recebedor', '');
          ConfigIni.WriteString('PIX', 'PSP', '');
          ConfigIni.WriteString('PIX', 'Tipo Ambiente', '');
          ConfigIni.WriteString('IMPRESSORA', 'Modelo Impressora', '');
          ConfigIni.WriteString('IMPRESSORA', 'Porta Impressoara', '');
          ConfigIni.WriteString('IMPRESSORA', 'Cod Pag Impressora', '');
          ConfigIni.WriteString('IMPRESSORA', 'Espaço Entre Linhas', '');
          ConfigIni.WriteString('IMPRESSORA', 'Linhas a Pular', '');
          ConfigIni.WriteString('IMPRESSORA', 'Qtd Colunas', '');
        finally
          ConfigIni.Free;
        end;
      end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao Criar arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
end;
procedure TFrmMain.edt_PagPixsKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=  SoNumOnKeyPress(Key);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  Q:  TTipoQrCode;
  R:  TTipoChavePIX;
  S:  TTipoPSP;
  T:  TTipoAmbiente;
begin

  lblVersaoComponente.Caption :=  'Versão Componente: ' + RscPix1.Versao;


  PathLogo  :=  ExtractFilePath(ParamStr(0)) + 'imglogo.png';
  if not FileExists(PathLogo) then
    imgQRCODE.Picture.SaveToFile(PathLogo)
  else
    imgQRCODE.Picture.LoadFromFile(PathLogo);

  PathConfigIni :=  ExtractFilePath(ParamStr(0)) + 'Config.ini';
  CriarConfigIni;

  cbbTipoQRCode.Clear;

  For Q := Low(TTipoQrCode) to High(TTipoQrCode) do
     cbbTipoQRCode.Items.Add( GetEnumName(TypeInfo(TTipoQrCode), integer(Q)));

  if cbbTipoQRCode.Items.Count > 0 then
    cbbTipoQRCode.ItemIndex :=  0;

  CbbTipoChavePix.Clear;

  For R := Low(TTipoChavePIX) to High(TTipoChavePIX) do
     CbbTipoChavePix.Items.Add( GetEnumName(TypeInfo(TTipoChavePIX), integer(R)));

  if CbbTipoChavePix.Items.Count > 0 then
    CbbTipoChavePix.ItemIndex :=  0;

  CbbPSP.Clear;

  For S := Low(TTipoPSP) to High(TTipoPSP) do
     CbbPSP.Items.Add( GetEnumName(TypeInfo(TTipoPSP), integer(S)));

  if CbbPSP.Items.Count > 0 then
    CbbPSP.ItemIndex :=  0;

  CbbTipoAmbiente.Clear;

  For T := Low(TTipoAmbiente) to High(TTipoAmbiente) do
     CbbTipoAmbiente.Items.Add( GetEnumName(TypeInfo(TTipoAmbiente), integer(T)));

  if CbbTipoAmbiente.Items.Count > 0 then
    CbbTipoAmbiente.ItemIndex :=  0;

  LerConfigIni ;
  PnlBtn_ConfigsClick(PnlBtn_Configs);
  DBGrid1.Left  :=  306;
  DBGrid1.Top   :=  47;
  DBGrid1.Height:=  320;
  DBGrid1.Width :=  390;
  dtp_Data_Inicial.Date :=  Now;
  dtp_Data_Final.Date   :=  Now;
  dtp_Hora_Inicial.Time :=  Now;
  dtp_Hora_Final.Time   :=  IncHour(Now, 1);

end;
procedure TFrmMain.GravarConfigIni;
var
  ConfigIni : TIniFile;
begin
  try
    ConfigIni := TIniFile.Create(PathConfigIni);
    try
      ConfigIni.WriteString('PIX', 'Certificado', edtCertificado.Text);
      ConfigIni.WriteString('PIX', 'Senha Certificado', edtSenhaCertificado.Text);
      ConfigIni.WriteString('PIX', 'Client ID', edtClientID.Text);
      ConfigIni.WriteString('PIX', 'Client Secreat', edtClientSecreat.Text);
      ConfigIni.WriteString('PIX', 'Developer Application Key', edtDeveloperKey.Text);
      ConfigIni.WriteString('PIX', 'Chave PIX', edtChavePix.Text);
      ConfigIni.WriteInteger('PIX', 'Tipo Chave PIX', CbbTipoChavePix.ItemIndex);
      ConfigIni.WriteInteger('PIX', 'Tipo QRCode', cbbTipoQRCode.ItemIndex);
      ConfigIni.WriteString('PIX', 'Cidade Recebedor', edtCidadeRecebedor.Text);
      ConfigIni.WriteString('PIX', 'Nome Recebedor', edtNomeRecebedore.Text);
      ConfigIni.WriteInteger('PIX', 'PSP', CbbPSP.ItemIndex);
      ConfigIni.WriteInteger('PIX', 'Tipo Ambiente', CbbTipoAmbiente.ItemIndex);
    finally
      ConfigIni.Free;
    end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao gravar arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
end;
procedure TFrmMain.Image1Click(Sender: TObject);
begin
  ShellExecute(Handle,
               'open',
               'https://github.com/OpenSourceCommunityBrasil/TRscPix',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TFrmMain.Image2Click(Sender: TObject);
begin
  ShellExecute(Handle,
               'open',
               'https://trscpix.rscsistemas.com.br',
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

procedure TFrmMain.LerConfigIni;
var
  ConfigIni : TIniFile;
begin
  try
    ConfigIni := TIniFile.Create(PathConfigIni);
    try
      edtCertificado.Text       :=  ConfigIni.ReadString('PIX', 'Certificado', 'Dx');
      edtSenhaCertificado.Text  :=  ConfigIni.ReadString('PIX', 'Senha Certificado', '');
      edtClientID.Text          :=  ConfigIni.ReadString('PIX', 'Client ID', '');
      edtClientSecreat.Text     :=  ConfigIni.ReadString('PIX', 'Client Secreat', ''+
                                                                                  '');
      edtDeveloperKey.Text      :=  ConfigIni.ReadString('PIX', 'Developer Application Key', '');
      edtChavePix.Text          :=  ConfigIni.ReadString('PIX', 'Chave PIX', 'atenassoftwares');
      CbbTipoChavePix.ItemIndex :=  ConfigIni.ReadInteger('PIX', 'Tipo Chave PIX', 0);
      cbbTipoQRCode.ItemIndex   :=  ConfigIni.ReadInteger('PIX', 'Tipo QRCode', 0);
      edtCidadeRecebedor.Text   :=  ConfigIni.ReadString('PIX', 'Cidade Recebedor', 'Sumaré');
      edtNomeRecebedore.Text    :=  ConfigIni.ReadString('PIX', 'Nome Recebedor', 'Marcelo Ferreira');
      CbbPSP.ItemIndex          :=  ConfigIni.ReadInteger('PIX', 'PSP', 0);
      CbbTipoAmbiente.ItemIndex :=  ConfigIni.ReadInteger('PIX', 'Tipo Ambiente', 0);
    finally
      ConfigIni.Free;
    end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao ler arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
end;

procedure TFrmMain.LimparDados;
begin
  mmPayload.Lines.Clear;
  lblStatus.Caption :=  'Status:';
  Label15.Caption :=  'Valor Retornado: ';
end;

procedure TFrmMain.PnlBtn_ConfigsClick(Sender: TObject);
begin
  DBGrid1.Visible :=  False;
  pnl_Configs.BringToFront;
  SetResetConfigPnlBtn(pnl_menu);
  SetConfigClick(Sender);
end;
procedure TFrmMain.PnlBtn_FuncoesClick(Sender: TObject);
begin
  DBGrid1.Visible :=  False;
  pnl_Funcoes.BringToFront;
  SetResetConfigPnlBtn(pnl_menu);
  SetConfigClick(Sender);

  SetConfigTelaFunções;

end;
procedure TFrmMain.PnlsBtnMouseLeave(Sender: TObject);
begin
  if TPanel(Sender).Tag = 0 then
    TPanel(Sender).Color  :=  clMenuHighlight
  else
    TPanel(Sender).Color  :=  clNavy;
end;
procedure TFrmMain.PnlsBtnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  TPanel(Sender).Color  :=  clHotLight;
end;

procedure TFrmMain.RscPix1CobGet(Sender: TObject; const RespCobGet: TRespCobGet;
  Erro: string);
var
  cValor : String ;
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin
      lblStatus.Caption := 'Situação: ' +  RespCobGet.Status;
      if (RespCobGet.Status <> 'NAO_CRIADO') then
        begin
          if (RespCobGet.Status = 'CONCLUIDA') then
            begin
              edt_e2eid.Text        :=  RespCobGet.pix[0].endToEndId;
              edtValorPix.Text      :=  FloatToStr(RespCobGet.pix[0].valor);
              edtMsgPix.Text        :=  RespCobGet.solicitacaopagador;

              if RespCobGet.pix[0].pagador <> nil then
                begin
                  edt_NomePagador.Text  :=  RespCobGet.pix[0].pagador.nome;

                  if RespCobGet.pix[0].Pagador.cpf <> '' then
                    edt_DocPagador.Text   :=  RespCobGet.pix[0].Pagador.cpf
                  else
                    edt_DocPagador.Text   :=  RespCobGet.pix[0].Pagador.cnpj;
                end
              else
                begin
                  if RespCobGet.devedor <> nil then
                    begin
                      edt_NomePagador.Text  :=  RespCobGet.devedor.nome;

                      if RespCobGet.devedor.cpf <> '' then
                        edt_DocPagador.Text   :=  RespCobGet.devedor.cpf
                      else
                        edt_DocPagador.Text   :=  RespCobGet.devedor.cnpj;
                    end
                end;

              edtMsgPagador.Text    :=  RespCobGet.pix[0].infoPagador;
              cValor := FloatToStr(RespCobGet.pix[0].valor);
              Label15.Caption := 'Valor Pago: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));
            end;

            edtValorPix.Text      :=  ReplaceStr(RespCobGet.valor.original, '.', ',');
            edtMsgPix.Text        :=  RespCobGet.solicitacaopagador;


          if RespCobGet.status = 'ATIVA' then
            begin
              if RespCobGet.textoImagemQRcode <> '' then
                begin
                  mmPayload.Text  :=  RespCobGet.textoImagemQRcode;
                  QRCodeWin(imgQRCODE, RespCobGet.textoImagemQRcode);
                  cQrCode := RespCobGet.textoImagemQRcode;
                end
              else
                begin
                  if RespCobGet.pixCopiaECola <> '' then
                    begin
                      mmPayload.Text  :=  RespCobGet.pixCopiaECola;
                      QRCodeWin(imgQRCODE, RespCobGet.pixCopiaECola);
                      cQrCode := RespCobGet.pixCopiaECola;
                    end
                  else
                    begin
                      mmPayload.Text  :=  RespCobGet.location;
                      QRCodeWin(imgQRCODE, RespCobGet.location);
                      cQrCode := RespCobGet.location;
                    end;
                end;
            end;

        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;
procedure TFrmMain.RscPix1CobPatch(Sender: TObject;
  const RespCobPatch: TRespCobPatch; Erro: string);
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin
      lblStatus.Caption := 'Situação: ' +  RespCobPatch.Status;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Revisar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;
procedure TFrmMain.RscPix1CobPut(Sender: TObject; const RespCobPut: TRespCobPut;
  Erro: string);
var
  cValor : String ;
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin
      lblStatus.Caption := 'Situação: ' +  RespCobPut.Status;
      if (RespCobPut.Status <> 'NAO_CRIADO') then
        begin
          cValor := StringReplace(RespCobPut.valor.original, '.', ',', [rfReplaceAll]);
          Label15.Caption := 'Valor Retornado: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));

          if RespCobPut.textoImagemQRcode <> '' then
            begin
              mmPayload.Text  :=  RespCobPut.textoImagemQRcode;
              QRCodeWin(imgQRCODE, RespCobPut.textoImagemQRcode);
              cQrCode := RespCobPut.textoImagemQRcode;
            end
          else
            begin
              if RespCobPut.pixCopiaECola <> '' then
                begin
                  mmPayload.Text  :=  RespCobPut.pixCopiaECola;
                  QRCodeWin(imgQRCODE, RespCobPut.pixCopiaECola);
                  cQrCode := RespCobPut.pixCopiaECola;
                end
              else
                begin
                  mmPayload.Text  :=  RespCobPut.location;
                  QRCodeWin(imgQRCODE, RespCobPut.location);
                  cQrCode := RespCobPut.location;
                end;
            end;

//          if (RespCobPut.loc <> nil)  and (RespCobPut.pixCopiaECola = '') then
//            begin
//              TRscPix(Sender).GerarQRCodelocation(RespCobPut.loc.id);
//            end;
        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Criar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;
procedure TFrmMain.RscPix1LocGet(Sender: TObject; const RespLocGet: TRespLocGet;
  Erro: string);
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin

      if RespLocGet.qrcode <> '' then
        begin
          mmPayload.Text  :=  RespLocGet.qrcode;
          QRCodeWin(imgQRCODE, RespLocGet.qrcode);
          cQrCode := RespLocGet.qrcode;
        end;

    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar QrCode' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;

procedure TFrmMain.RscPix1PixGet(Sender: TObject; const RespPixGet: TRespPixGet;
  Erro: string);
var
  I:  integer;
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin
      if (RespPixGet.Status = 'DEVOLVIDO') then
        begin
          lblStatus.Caption := 'Situação: ' + RespPixGet.Status
                              + ' - motivo: '  + Trim(RespPixGet.motivo)
                              + ' - rtrId: ' + Trim(RespPixGet.rtrId)
                              + ' - valor: '  + FormatFloat('#0.00', RespPixGet.valor);
        end
      else
        begin
          lblStatus.Caption := 'Situação: ' +  'Não retorna Status somente dados';

          if  Length(RespPixGet.pix) = 0 then
            begin
              edtTXID.Text          :=  RespPixGet.txid;
              edtValorPix.Text      :=  FloatToStr(RespPixGet.valor);

              edtMsgPagador.Text     :=  RespPixGet.infoPagador;


//              edt_NomePagador.Text  :=  RespPixGet.Pagador.nome;
//              if RespPixGet.Pagador.cpf <> '' then
//                edt_DocPagador.Text   :=  RespPixGet.Pagador.cpf
//              else
//                edt_DocPagador.Text   :=  RespPixGet.Pagador.cnpj;


              if RespPixGet.pagador <> nil then
                begin
                  edt_NomePagador.Text  :=  RespPixGet.pagador.nome;

                  if RespPixGet.Pagador.cpf <> '' then
                    edt_DocPagador.Text   :=  RespPixGet.Pagador.cpf
                  else
                    edt_DocPagador.Text   :=  RespPixGet.Pagador.cnpj;
                end
              else
                begin
//                  if RespPixGet.devedor <> nil then
//                    begin
//                      edt_NomePagador.Text  :=  RespPixGet.devedor.nome;
//
//                      if RespPixGet.devedor.cpf <> '' then
//                        edt_DocPagador.Text   :=  RespPixGet.devedor.cpf
//                      else
//                        edt_DocPagador.Text   :=  RespPixGet.devedor.cnpj;
//                    end
                end;

            end
          else
            begin
              edt_PagPixs.Text            :=  IntToStr(RespPixGet.parametros.paginacao.paginaAtual);
              edt_QtdPagPixs.Text         :=  IntToStr(RespPixGet.parametros.paginacao.quantidadeDePaginas);
              edt_ItensPagPixs.Text       :=  IntToStr(RespPixGet.parametros.paginacao.itensPorPagina);
              edt_TotalItensPagPixs.Text  :=  IntToStr(RespPixGet.parametros.paginacao.quantidadeTotalDeItens);

              FDMemTable1.Close;
              FDMemTable1.Open;
              for i := Low(RespPixGet.pix) to High(RespPixGet.pix) do
                begin
                  FDMemTable1.Append;

                  if RespPixGet.pix[i].pagador <> nil then
                    begin
                      if RespPixGet.pix[i].pagador.cpf = EmptyStr then
                        FDMemTable1cpfcnpjpagador.AsString  :=  RespPixGet.pix[i].pagador.cnpj
                      else
                        FDMemTable1cpfcnpjpagador.AsString  :=  RespPixGet.pix[i].pagador.cpf;

                      FDMemTable1nomePagador.AsString   :=  RespPixGet.pix[i].pagador.nome;
                    end;



                  FDMemTable1inforpagador.AsString   :=  RespPixGet.pix[i].infoPagador;
                  FDMemTable1endtoebdid.AsString     :=  RespPixGet.pix[i].endToEndId;
                  FDMemTable1txid.AsString           :=  RespPixGet.pix[i].txid;
                  FDMemTable1valor.AsCurrency     :=  RespPixGet.pix[i].valor;
                  FDMemTable1horario.AsString        :=  RespPixGet.pix[i].horario;
                  FDMemTable1.Post;
                end;
              DBGrid1.Visible :=  True;
            end;
        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar PIX' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;
procedure TFrmMain.RscPix1PixPut(Sender: TObject; const RespPixPut: TRespPixPut;
  Erro: string);
begin
  DBGrid1.Visible :=  False;
  if Erro <> '' then
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Solcitar Devolução!' +  #13 +Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + RespPixPut.status;
      if (RespPixPut.Status = 'DEVOLVIDO') then
        begin
          lblStatus.Caption := 'Situação: ' + RespPixPut.Status
                              + ' - motivo: '  + Trim(RespPixPut.motivo)
                              + ' - rtrId: ' + Trim(RespPixPut.rtrId)
                              + ' - valor: '  + FormatFloat('#0.00', RespPixPut.valor);
        end
      else
        begin
          lblStatus.Caption := 'Situação: ' + RespPixPut.Status;
        end;
    end;
end;
procedure TFrmMain.RscPix1Token(Sender: TObject; const Token: TToken;
  Erro: string);
begin
  DBGrid1.Visible :=  False;
  if Erro <> '' then
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Obter Token!' +  #13 +Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
end;
end.
