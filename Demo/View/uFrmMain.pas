unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PIX_Tela, Vcl.ExtCtrls,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  uDWAbout, uDWResponseTranslator, Vcl.Buttons, Vcl.Samples.Spin, System.TypInfo, ACBrPosPrinter,
  ACBrBase, configuraserial, IniFiles,  System.UITypes,

  uRscPix.Variaveis, uRscPix.Tipos,
  uRscPix.Validations, ACBrSocket, ACBrPicpay, RscPix, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, uRESTDWBase, uRscPix.Classes


  ;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    cbbTipoQRCode: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    pnlLeft: TPanel;
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
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtCertificado: TLabeledEdit;
    edtSenhaCertificado: TLabeledEdit;
    edtClientID: TLabeledEdit;
    edtClientSecreat: TLabeledEdit;
    edtDeveloperKey: TLabeledEdit;
    edtChavePix: TLabeledEdit;
    CbbTipoChavePix: TComboBox;
    edtNomeRecebedore: TLabeledEdit;
    grbxPSP: TGroupBox;
    CbbPSP: TComboBox;
    CbbTipoAmbiente: TComboBox;
    Label3: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Label8: TLabel;
    btnDoar: TButton;
    Panel3: TPanel;
    grbxPix: TGroupBox;
    edtCidadeRecebedor: TLabeledEdit;
    edtMsgPix: TLabeledEdit;
    edtValorPix: TLabeledEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtTXID: TLabeledEdit;
    edtPayload: TLabeledEdit;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button4: TButton;
    edtEndToEndId: TLabeledEdit;
    ACBrPosPrinter1: TACBrPosPrinter;
    edtTxIdDev: TLabeledEdit;
    edtDuracaoMinutos: TSpinEdit;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btTestarPosPrinterClick(Sender: TObject);
    procedure btProcuraImpressorasClick(Sender: TObject);
    procedure btSerialClick(Sender: TObject);


    procedure CriarConfigIni;
    procedure LerConfigIni;
    procedure GravarConfigIni;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDoarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcurarImpressora;
    procedure AdicionarLinhaImpressao(ALinha: AnsiString);
    procedure ConfigurarPosPrinter;
    procedure AtivarPosPrinter;
    procedure SetConfigTelaPix;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PathConfigIni : String;

implementation

{$R *.dfm}

procedure TForm1.AdicionarLinhaImpressao(ALinha: AnsiString);
begin
  if ACBrPosPrinter1.Ativo then
    ACBrPosPrinter1.Imprimir(ALinha);
end;

procedure TForm1.AtivarPosPrinter;
begin
  ConfigurarPosPrinter;
  if (ACBrPosPrinter1.Porta <> '') then
    ACBrPosPrinter1.Ativar
  else
    raise Exception.Create('Porta não definida');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  GravarConfigIni;
  LerConfigIni;
  MessageDlg('Configurações Gravadas Com Sucesso!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

procedure TForm1.btnDoarClick(Sender: TObject);
begin
  case Self.Width of
    654:
      begin
        Self.Width  :=  1060;
        btnDoar.Caption :=  'Esconder Contribuir';
      end;
    1060:
      begin
        Self.Width  :=  654;
        btnDoar.Caption :=  'Contribuir';
      end;
  end;
end;

procedure TForm1.btProcuraImpressorasClick(Sender: TObject);
begin
  ProcurarImpressora;
end;

procedure TForm1.btSerialClick(Sender: TObject);
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

procedure TForm1.btTestarPosPrinterClick(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.GerarPix;

        if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
        begin
          if frmPIX_Tela.RscPix1.Resultado.textoImagemQRcode <> '' then
          begin
            edtPayload.Text  :=  frmPIX_Tela.RscPix1.Resultado.textoImagemQRcode;
            edtTXID.Text := frmPIX_Tela.RscPix1.Resultado.txid;
          end
          else
          begin
            edtPayload.Text  :=  frmPIX_Tela.RscPix1.Resultado.location;
            edtTXID.Text := frmPIX_Tela.RscPix1.Resultado.txid;
          end;

          frmPIX_Tela.ShowModal;
        end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.ConsultaPixPorTXID(True);

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.AtualizarPix('REMOVIDA_PELO_USUARIO_RECEBEDOR');

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.SolicitarDevolucaoPixRecebido(True);

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try

    SetConfigTelaPix;

    frmPIX_Tela.ConsultaListaPixPorPeriodo(True);

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.ConsultarPixRecebido(True);

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  frmPIX_Tela := TfrmPIX_Tela.Create(nil);
  try
    SetConfigTelaPix;

    frmPIX_Tela.ConsultarDevolucaoPixRecebido(True);

    if frmPIX_Tela.RscPix1.Resultado_Cod = 200 then
    begin
      frmPIX_Tela.ShowModal;
    end;
  finally
    frmPIX_Tela.Free;
  end;
end;

procedure TForm1.SetConfigTelaPix;
begin
    {configurar impressora}
    frmPIX_Tela.ACBrPosPrinterPIX.Desativar;
    frmPIX_Tela.ACBrPosPrinterPIX.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
    frmPIX_Tela.ACBrPosPrinterPIX.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
    frmPIX_Tela.ACBrPosPrinterPIX.Porta := cbxPorta.Text;
    frmPIX_Tela.ACBrPosPrinterPIX.ColunasFonteNormal := seColunas.Value;
    frmPIX_Tela.ACBrPosPrinterPIX.LinhasEntreCupons := seLinhasPular.Value;
    frmPIX_Tela.ACBrPosPrinterPIX.EspacoEntreLinhas := seEspLinhas.Value;
    {======================}
    {Configurar PIX}
    frmPIX_Tela.RscPix1.Certificado.DiretorioCertificado        :=  edtCertificado.Text;
    frmPIX_Tela.RscPix1.Certificado.DiretorioCertificadoSenha   :=  edtSenhaCertificado.Text;

    frmPIX_Tela.RscPix1.PIX.ChavePIX                  :=  edtChavePix.Text;
    frmPIX_Tela.RscPix1.PIX.TipoChavePix              :=  TTipoChavePIX(CbbTipoChavePix.ItemIndex);
    frmPIX_Tela.RscPix1.PIX.NomeTitularConta          :=  edtNomeRecebedore.Text;
    frmPIX_Tela.RscPix1.PIX.CidadeTitularConta        :=  edtCidadeRecebedor.Text;

    frmPIX_Tela.RscPix1.Psp.TipoPsp                   :=  TTipoPSP(CbbPSP.ItemIndex);
    frmPIX_Tela.RscPix1.PSP.TipoPspAmbiente           :=  TTipoAmbiente(CbbTipoAmbiente.ItemIndex);

    frmPIX_Tela.RscPix1.Developer.Application_key     :=  edtDeveloperKey.Text;
    frmPIX_Tela.RscPix1.Developer.Client_ID           :=  edtClientID.Text;
    frmPIX_Tela.RscPix1.Developer.Client_Secret       :=  edtClientSecreat.Text;

    frmPIX_Tela.RscPix1.PixCobranca.Valor             :=  StrToFloatDef(edtValorPix.Text, 0);
    frmPIX_Tela.RscPix1.PixCobranca.TXID              :=  edtTXID.Text;
    frmPIX_Tela.RscPix1.PixCobranca.E2eid             :=  edtEndToEndId.Text;
    frmPIX_Tela.RscPix1.PixCobranca.TXIDDev           :=  edtTxIdDev.Text;
    frmPIX_Tela.RscPix1.PixCobranca.TipoQRCode        :=  TTipoQrCode(cbbTipoQRCode.ItemIndex);
    frmPIX_Tela.RscPix1.PixCobranca.DuracaoMinutos    :=  edtDuracaoMinutos.Value;

end;

procedure TForm1.ConfigurarPosPrinter;
begin
  ACBrPosPrinter1.Desativar;
  ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
  ACBrPosPrinter1.Porta := cbxPorta.Text;
  ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
  ACBrPosPrinter1.LinhasEntreCupons := seLinhasPular.Value;
  ACBrPosPrinter1.EspacoEntreLinhas := seEspLinhas.Value;
end;

procedure TForm1.CriarConfigIni;
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

procedure TForm1.FormCreate(Sender: TObject);
var
  O:  TACBrPosPrinterModelo;
  P:  TACBrPosPaginaCodigo;
  Q:  TTipoQrCode;
  R:  TTipoChavePIX;
  S:  TTipoPSP;
  T:  TTipoAmbiente;
begin
  Self.Width  :=  654;

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
     CbbPSP.Items.Add( GetEnumName(TypeInfo(TPSP), integer(S)));
  if CbbPSP.Items.Count > 0 then
    CbbPSP.ItemIndex :=  0;

  CbbTipoAmbiente.Clear;
  For T := Low(TTipoAmbiente) to High(TTipoAmbiente) do
     CbbTipoAmbiente.Items.Add( GetEnumName(TypeInfo(TTipoAmbiente), integer(T)));
  if CbbTipoAmbiente.Items.Count > 0 then
    CbbTipoAmbiente.ItemIndex :=  0;

  ProcurarImpressora;

  LerConfigIni;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  btnDoar.Click;
end;

procedure TForm1.GravarConfigIni;
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

procedure TForm1.LerConfigIni;
var
  ConfigIni : TIniFile;
begin
  try
    ConfigIni := TIniFile.Create(PathConfigIni);
    try
      edtCertificado.Text       :=  ConfigIni.ReadString('PIX', 'Certificado', '');
      edtSenhaCertificado.Text  :=  ConfigIni.ReadString('PIX', 'Senha Certificado', '');
      edtClientID.Text          :=  ConfigIni.ReadString('PIX', 'Client ID', '');
      edtClientSecreat.Text     :=  ConfigIni.ReadString('PIX', 'Client Secreat', '');
      edtDeveloperKey.Text      :=  ConfigIni.ReadString('PIX', 'Developer Application Key', '');
      edtChavePix.Text          :=  ConfigIni.ReadString('PIX', 'Chave PIX', '');
      CbbTipoChavePix.ItemIndex :=  ConfigIni.ReadInteger('PIX', 'Tipo Chave PIX', 0);
      cbbTipoQRCode.ItemIndex   :=  ConfigIni.ReadInteger('PIX', 'Tipo QRCode', 0);
      edtCidadeRecebedor.Text   :=  ConfigIni.ReadString('PIX', 'Cidade Recebedor', '');
      edtNomeRecebedore.Text    :=  ConfigIni.ReadString('PIX', 'Nome Recebedor', '');
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

procedure TForm1.ProcurarImpressora;
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

end.
