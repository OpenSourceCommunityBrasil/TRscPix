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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Samples.Spin, System.TypInfo, ACBrPosPrinter,
  ACBrBase, configuraserial, IniFiles,  System.UITypes, System.DateUtils,

  IdSSLOpenSSL,

  uRscPix.Variaveis, uRscPix.Tipos,
  uRscPix.Validations, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage,
  uRscPix.Classes,
  Vcl.ComCtrls,


  RscPix, uRscPix.funcoes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client


  ;

type
  TFrmMain = class(TForm)
    ACBrPosPrinter1: TACBrPosPrinter;
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
    gbConfigImpressora: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label7: TLabel;
    Label29: TLabel;
    btSerial: TSpeedButton;
    btProcuraImpressoras: TSpeedButton;
    seLinhasPular: TSpinEdit;
    seEspLinhas: TSpinEdit;
    seColunas: TSpinEdit;
    cbxModeloPosPrinter: TComboBox;
    cbxPorta: TComboBox;
    cbxPagCodigo: TComboBox;
    btTestarPosPrinter: TBitBtn;
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
    btnImprQrCode: TBitBtn;
    Label13: TLabel;
    imgQRCODE: TImage;
    Panel10: TPanel;
    lblStatus: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btn_SimulaPgto: TButton;
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
    procedure btn_GerarCabrancaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btTestarPosPrinterClick(Sender: TObject);
    procedure btProcuraImpressorasClick(Sender: TObject);
    procedure btSerialClick(Sender: TObject);


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
    procedure btn_SimulaPgtoClick(Sender: TObject);
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
  private

    bRecebido  : Boolean;
    cQrCode,
    cFantasia  : String;


    procedure SetResetConfigPnlBtn(Sender: TObject);
    procedure SetConfigClick(Sender: TObject);
    { Private declarations }
    procedure ProcurarImpressora;
    procedure AdicionarLinhaImpressao(ALinha: AnsiString);
    procedure ConfigurarPosPrinter;
    procedure AtivarPosPrinter;

    procedure SetConfigPixObrig(Sender: TObject);

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





procedure TFrmMain.AdicionarLinhaImpressao(ALinha: AnsiString);
begin
if ACBrPosPrinter1.Ativo then
   ACBrPosPrinter1.Imprimir(ALinha);
end;


procedure TFrmMain.AtivarPosPrinter;
begin
ConfigurarPosPrinter;
if (ACBrPosPrinter1.Porta <> '') then
    ACBrPosPrinter1.Ativar
    else
    raise Exception.Create('Porta não definida');
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
  try
    if (ACBrPosPrinter1.Porta <> '') then
      ACBrPosPrinter1.Ativar
    else
      raise Exception.Create('Porta não definida');

    ACBrPosPrinter1.CortaPapel    := True;
    ACBrPosPrinter1.TraduzirTags  := True;

    //Configurando o QrCOde
    ACBrPosPrinter1.configqrcode.Tipo               := 2;
    ACBrPosPrinter1.configqrcode.LarguraModulo      := 6;//4;
    ACBrPosPrinter1.configqrcode.ErrorLevel         := 0;

    //aplicando
    mImp  := TStringList.Create;
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
    ACBrPosPrinter1.Ativar;
    ACBrPosPrinter1.Buffer.Text := mImp.Text;
    ACBrPosPrinter1.Imprimir;

  finally
    ACBrPosPrinter1.Desativar;
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

procedure TFrmMain.btProcuraImpressorasClick(Sender: TObject);
begin
  ProcurarImpressora;
end;

procedure TFrmMain.btSerialClick(Sender: TObject);
var
  frConfiguraSerial: TfrConfiguraSerial;
begin
  frConfiguraSerial := TfrConfiguraSerial.Create(self);
  try
    frConfiguraSerial.Device.Porta        := ACBrPosPrinter1.Device.Porta ;
    frConfiguraSerial.cmbPortaSerial.Text := cbxPorta.Text ;
    frConfiguraSerial.Device.ParamsString := ACBrPosPrinter1.Device.ParamsString ;

    if frConfiguraSerial.ShowModal = mrOk then
    begin
      cbxPorta.Text := frConfiguraSerial.cmbPortaSerial.Text ;
      ACBrPosPrinter1.Device.ParamsString := frConfiguraSerial.Device.ParamsString ;
    end ;
  finally
    FreeAndNil( frConfiguraSerial ) ;
  end ;
end;

procedure TFrmMain.btTestarPosPrinterClick(Sender: TObject);
var
  SL: TStringList;
begin
  try
    AtivarPosPrinter;

    SL := TStringList.Create;
    try
      SL.Add('</zera>');
      SL.Add('</linha_dupla>');
      SL.Add('FONTE NORMAL: '+IntToStr(ACBrPosPrinter1.ColunasFonteNormal)+' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8', ACBrPosPrinter1.ColunasFonteNormal));
      SL.Add('<e>EXPANDIDO: '+IntToStr(ACBrPosPrinter1.ColunasFonteExpandida)+' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8', ACBrPosPrinter1.ColunasFonteExpandida));
      SL.Add('</e><c>CONDENSADO: '+IntToStr(ACBrPosPrinter1.ColunasFonteCondensada)+' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8', ACBrPosPrinter1.ColunasFonteCondensada));
      SL.Add('</c><n>FONTE NEGRITO</N>');
      SL.Add('<in>FONTE INVERTIDA</in>');
      SL.Add('<S>FONTE SUBLINHADA</s>');
      SL.Add('<i>FONTE ITALICO</i>');
      SL.Add('FONTE NORMAL');
      SL.Add('');
      SL.Add('TESTE DE ACENTOS. ÁÉÍÓÚáéíóú');
      SL.Add('');
      SL.Add('</corte_total>');

      AdicionarLinhaImpressao(AnsiString(SL.Text));
    finally
       SL.Free;
    end;
  except
    On E: Exception do
    begin
      MessageDlg('Falha ao ativar a Impressora' + sLineBreak + E.Message, mtError, [mbOK], 0);
    end;
  end
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

procedure TFrmMain.btn_SimulaPgtoClick(Sender: TObject);
begin
  SetConfigPixObrig(RscPix1);
  RscPix1.SimularPagamentoPix(mmPayload.Text);
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
    SetConfigPixObrig(RscPix1);
    RscPix1.ConsultarCobranca(edtTXID.Text);
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
    SetConfigPixObrig(RscPix1);
    RscPix1.CancelarCobranca('REMOVIDA_PELO_USUARIO_RECEBEDOR', StrToFloatDef(edtValorPix.Text, 0), edtTXID.Text, edtMsgPix.Text);
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
                                        StrToDateTime(DateToStr(dtp_Data_Final.Date) + TimeToStr(dtp_Hora_Final.Time)), 0);

end;





procedure TFrmMain.Button6Click(Sender: TObject);
begin
  if Trim(edt_E2eID.Text) = ''  then
    begin
      MessageDlg('Digite o campo E2eID' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edt_E2eID.SetFocus ;
      Exit;
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
    TRscPix(Sender).TitularPix.NomeTitularConta                    :=  edtNomeRecebedore.Text;
    TRscPix(Sender).TitularPix.CidadeTitularConta                  :=  edtCidadeRecebedor.Text;

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

    TRscPix(Sender).TitularPix.TipoChavePix                        :=  TTipoChavePIX(CbbTipoChavePix.ItemIndex);
    TRscPix(Sender).TitularPix.ChavePIX                            :=  edtChavePix.Text;
    TRscPix(Sender).TitularPix.TipoQRCode                          :=  TTipoQrCode(cbbTipoQRCode.ItemIndex);
    TRscPix(Sender).TitularPix.DuracaoMinutos                      :=  edtDuracaoMinutos.Value;

end;

procedure TFrmMain.ConfigurarPosPrinter;
begin
  ACBrPosPrinter1.Desativar;
  ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
  ACBrPosPrinter1.Porta := cbxPorta.Text;
  ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
  ACBrPosPrinter1.LinhasEntreCupons := seLinhasPular.Value;
  ACBrPosPrinter1.EspacoEntreLinhas := seEspLinhas.Value;
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

procedure TFrmMain.FormCreate(Sender: TObject);
var
  O:  TACBrPosPrinterModelo;
  P:  TACBrPosPaginaCodigo;
  Q:  TTipoQrCode;
  R:  TTipoChavePIX;
  S:  TTipoPSP;
  T:  TTipoAmbiente;
begin

  PathConfigIni :=  ExtractFilePath(ParamStr(0)) + 'Config.ini';
  CriarConfigIni;

  cbxModeloPosPrinter.Items.Clear ;
  For O := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
     cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(O) ) ) ;

  cbxPagCodigo.Items.Clear ;
  For P := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
     cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(P) ) ) ;

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

  ProcurarImpressora ;

  LerConfigIni ;

  PnlBtn_ConfigsClick(PnlBtn_Configs);

  DBGrid1.Left  :=  306;
  DBGrid1.Top   :=  47;
  DBGrid1.Height:=  230;
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

      ConfigIni.WriteInteger('IMPRESSORA', 'Modelo Impressora', cbxModeloPosPrinter.ItemIndex);
      ConfigIni.WriteInteger('IMPRESSORA', 'Porta Impressoara', cbxPorta.ItemIndex);
      ConfigIni.WriteInteger('IMPRESSORA', 'Cod Pag Impressora', cbxPagCodigo.ItemIndex);
      ConfigIni.WriteInteger('IMPRESSORA', 'Espaço Entre Linhas', seEspLinhas.Value);
      ConfigIni.WriteInteger('IMPRESSORA', 'Linhas a Pular', seLinhasPular.Value);
      ConfigIni.WriteInteger('IMPRESSORA', 'Qtd Colunas', seColunas.Value);
    finally
      ConfigIni.Free;
    end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao gravar arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
end;

procedure TFrmMain.LerConfigIni;
var
  ConfigIni : TIniFile;
begin
  try
    ConfigIni := TIniFile.Create(PathConfigIni);
    try
      edtCertificado.Text       :=  ConfigIni.ReadString('PIX', 'Certificado', 'D:\Projetos\DBSistema\Exe\DBPdvEx\Utilitarios\CertificadoDigital\Certificado_Atenas_2022.pfx');
      edtSenhaCertificado.Text  :=  ConfigIni.ReadString('PIX', 'Senha Certificado', '586270');
      edtClientID.Text          :=  ConfigIni.ReadString('PIX', 'Client ID', 'eyJpZCI6IjVkIiwiY29kaWdvUHVibGljYWRvciI6MCwiY29kaWdvU29mdHdhcmUiOjI5MTgyLCJzZXF1ZW5jaWFsSW5zdGFsYWNhbyI6MX0');
      edtClientSecreat.Text     :=  ConfigIni.ReadString('PIX', 'Client Secreat', 'eyJpZCI6ImM4YzAwOTAtYjUyNS00N2RjLWE2ZGEtZGI1YmQ0OWRmYWQ3NDZiYjI2YTQtOCIsImNvZGlnb1B1YmxpY2Fkb3Ii'+
                                                                                  'OjAsImNvZGlnb1NvZnR3YXJlIjoyOTE4Miwic2VxdWVuY2lhbEluc3RhbGFjYW8iOjEsInNlcXVlbmNpYWxDcmVkZW5jaWFsIjoxLCJhbWJpZW50ZSI6ImhvbW9sb2dhY2FvIiwiaWF0IjoxNjQ0MDY5ODYzODU2fQ');
      edtDeveloperKey.Text      :=  ConfigIni.ReadString('PIX', 'Developer Application Key', 'd27b07790affab401368e17dc0050e56b9b1a5b8');
      edtChavePix.Text          :=  ConfigIni.ReadString('PIX', 'Chave PIX', 'atenassoftwares');
      CbbTipoChavePix.ItemIndex :=  ConfigIni.ReadInteger('PIX', 'Tipo Chave PIX', 0);
      cbbTipoQRCode.ItemIndex   :=  ConfigIni.ReadInteger('PIX', 'Tipo QRCode', 0);
      edtCidadeRecebedor.Text   :=  ConfigIni.ReadString('PIX', 'Cidade Recebedor', 'Sumaré');
      edtNomeRecebedore.Text    :=  ConfigIni.ReadString('PIX', 'Nome Recebedor', 'Marcelo Ferreira');
      CbbPSP.ItemIndex          :=  ConfigIni.ReadInteger('PIX', 'PSP', 0);
      CbbTipoAmbiente.ItemIndex :=  ConfigIni.ReadInteger('PIX', 'Tipo Ambiente', 0);

      cbxModeloPosPrinter.ItemIndex :=  ConfigIni.ReadInteger('IMPRESSORA', 'Modelo Impressora', 1);
      cbxPorta.ItemIndex            :=  ConfigIni.ReadInteger('IMPRESSORA', 'Porta Impressoara', 1);
      cbxPagCodigo.ItemIndex        :=  ConfigIni.ReadInteger('IMPRESSORA', 'Cod Pag Impressora', 0);
      seEspLinhas.Value             :=  ConfigIni.ReadInteger('IMPRESSORA', 'Espaço Entre Linhas', 0);
      seLinhasPular.Value           :=  ConfigIni.ReadInteger('IMPRESSORA', 'Linhas a Pular', 0);
      seColunas.Value               :=  ConfigIni.ReadInteger('IMPRESSORA', 'Qtd Colunas', 40);
    finally
      ConfigIni.Free;
    end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao ler arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    end;
  end;
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

procedure TFrmMain.ProcurarImpressora;
begin
  cbxPorta.Items.Clear;
  ACBrPosPrinter1.Device.AcharPortasSeriais( cbxPorta.Items );
  {$IfDef MSWINDOWS}
  ACBrPosPrinter1.Device.AcharPortasUSB( cbxPorta.Items );
  {$EndIf}
  ACBrPosPrinter1.Device.AcharPortasRAW( cbxPorta.Items );

  cbxPorta.Items.Add('TCP:192.168.0.31:9100') ;

  {$IfNDef MSWINDOWS}
   cbxPorta.Items.Add('/dev/ttyS0') ;
   cbxPorta.Items.Add('/dev/ttyUSB0') ;
   cbxPorta.Items.Add('/tmp/ecf.txt') ;
  {$Else}
   cbxPorta.Items.Add('\\localhost\Epson') ;
   cbxPorta.Items.Add('c:\temp\ecf.txt') ;
  {$EndIf}
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
              edtTXID.Text          :=  RespCobGet.pix[0].txid;
              edt_e2eid.Text        :=  RespCobGet.pix[0].endToEndId;
              edtValorPix.Text      :=  FloatToStr(RespCobGet.pix[0].valor);
              edtMsgPix.Text        :=  RespCobGet.solicitacaopagador;
              edt_NomePagador.Text  :=  RespCobGet.pix[0].pagador.nome;

              if RespCobGet.pix[0].Pagador.cpf <> '' then
                edt_DocPagador.Text   :=  RespCobGet.pix[0].Pagador.cpf
              else
                edt_DocPagador.Text   :=  RespCobGet.pix[0].Pagador.cnpj;

                edtMsgPagador.Text    :=  RespCobGet.pix[0].infoPagador;

              cValor := FloatToStr(RespCobGet.pix[0].valor);
              Label15.Caption := 'Valor Pago: R$ '+FormatFLoat('#0.00',StrToCurr(cValor));
            end
          else
            begin

            end;


          if RespCobGet.textoImagemQRcode <> '' then
            begin
              mmPayload.Text  :=  RespCobGet.textoImagemQRcode;
              QRCodeWin(imgQRCODE, RespCobGet.textoImagemQRcode);
              cQrCode := RespCobGet.textoImagemQRcode;
            end
          else
            begin
              mmPayload.Text  :=  RespCobGet.location;
              QRCodeWin(imgQRCODE, RespCobGet.location);
              cQrCode := RespCobGet.location;
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
var
  cValor : String ;
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
              mmPayload.Text  :=  RespCobPut.location;
              QRCodeWin(imgQRCODE, RespCobPut.location);
              cQrCode := RespCobPut.location;
            end;
        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Criar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
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
              edt_NomePagador.Text  :=  RespPixGet.Pagador.nome;
              edtMsgPagador.Text     :=  RespPixGet.infoPagador;

              if RespPixGet.Pagador.cpf <> '' then
                edt_DocPagador.Text   :=  RespPixGet.Pagador.cpf
              else
                edt_DocPagador.Text   :=  RespPixGet.Pagador.cnpj;

            end
          else
            begin
              FDMemTable1.Close;
              FDMemTable1.Open;
              for i := Low(RespPixGet.pix) to High(RespPixGet.pix) do
                begin
                  FDMemTable1.Append;
                  if RespPixGet.pix[i].pagador.cpf = EmptyStr then
                    FDMemTable1cpfcnpjpagador.Value  :=  RespPixGet.pix[i].pagador.cnpj
                  else
                    FDMemTable1cpfcnpjpagador.Value  :=  RespPixGet.pix[i].pagador.cpf;
                  FDMemTable1nomePagador.Value   :=  RespPixGet.pix[i].pagador.nome;
                  FDMemTable1inforpagador.Value   :=  RespPixGet.pix[i].infoPagador;
                  FDMemTable1endtoebdid.Value     :=  RespPixGet.pix[i].endToEndId;
                  FDMemTable1txid.Value           :=  RespPixGet.pix[i].txid;
                  FDMemTable1valor.AsCurrency     :=  RespPixGet.pix[i].valor;
                  FDMemTable1horario.Value        :=  RespPixGet.pix[i].horario;
                  FDMemTable1.Post;
                end;
              DBGrid1.Visible :=  True;
            end;
        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Revisar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
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
