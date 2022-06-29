unit Main;

interface

uses
  System.IniFiles,
  Windows, Messages, Variants, Classes, Graphics,
  Controls, Forms, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniImage,
  uniGUIBaseClasses, uniPanel, Vcl.Imaging.pngimage, uniPageControl,
  uniButton, uniEdit, uniGroupBox, uniMultiItem, uniComboBox,
  IdSSLOpenSSL, System.TypInfo, Vcl.Dialogs, uniFileUpload, System.SysUtils,
  uniMemo

  ,RscPix
  ,uRscPix.Tipos
  ,uRscPix.Classes
  ,uRsc.funcoes, System.StrUtils, unimFileUpload, uniDateTimePicker,
  uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client

  ;

type
  TMainForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    imgQRCODE: TUniImage;
    UniLabel1: TUniLabel;
    RscPix1: TRscPix;
    uPC: TUniPageControl;
    TbConfigs: TUniTabSheet;
    TbFuncoes: TUniTabSheet;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniPanel5: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    UniGroupBox2: TUniGroupBox;
    UniGroupBox3: TUniGroupBox;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    edtDeveloperKey: TUniEdit;
    edtClientID: TUniEdit;
    edtClientSecreat: TUniEdit;
    UniLabel5: TUniLabel;
    edtCertificado: TUniEdit;
    UniLabel6: TUniLabel;
    edtSenhaCertificado: TUniEdit;
    UniButton3: TUniButton;
    UniButton5: TUniButton;
    UniLabel7: TUniLabel;
    CbbTipoChavePix: TUniComboBox;
    UniLabel8: TUniLabel;
    edtChavePix: TUniEdit;
    UniLabel9: TUniLabel;
    edtNomeRecebedore: TUniEdit;
    edtCidadeRecebedor: TUniEdit;
    UniLabel10: TUniLabel;
    UniGroupBox4: TUniGroupBox;
    UniLabel11: TUniLabel;
    CbbPSP: TUniComboBox;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    CbbTipoAmbiente: TUniComboBox;
    cbbTipoQRCode: TUniComboBox;
    edtDuracaoMinutos: TUniNumberEdit;
    UniPanel6: TUniPanel;
    UniButton4: TUniButton;
    UniGroupBox5: TUniGroupBox;
    UniPanel7: TUniPanel;
    UniLabel15: TUniLabel;
    UniButton6: TUniButton;
    edtTXID: TUniEdit;
    UniButton7: TUniButton;
    UniLabel16: TUniLabel;
    edtValorPix: TUniEdit;
    UniLabel17: TUniLabel;
    edtMsgPix: TUniEdit;
    UniGroupBox6: TUniGroupBox;
    UniLabel19: TUniLabel;
    edt_NomePagador: TUniEdit;
    UniLabel20: TUniLabel;
    edtMsgPagador: TUniEdit;
    UniLabel18: TUniLabel;
    edt_DocPagador: TUniEdit;
    UniPanel8: TUniPanel;
    UniLabel21: TUniLabel;
    mmPayload: TUniMemo;
    UniPanel9: TUniPanel;
    lblStatus: TUniLabel;
    Label15: TUniLabel;
    lblErro: TUniLabel;
    UniButton8: TUniButton;
    UniButton9: TUniButton;
    UniFileUpload1: TUniFileUpload;
    UniGroupBox7: TUniGroupBox;
    UniLabel23: TUniLabel;
    edt_PagPixs: TUniEdit;
    dtp_Data_Inicial: TUniDateTimePicker;
    UniLabel22: TUniLabel;
    dtp_Data_Final: TUniDateTimePicker;
    UniLabel25: TUniLabel;
    edt_QtdPagPixs: TUniEdit;
    UniLabel26: TUniLabel;
    edt_ItensPagPixs: TUniEdit;
    UniLabel27: TUniLabel;
    edt_TotalItensPagPixs: TUniEdit;
    UniLabel28: TUniLabel;
    UniButton10: TUniButton;
    DBGrid1: TUniDBGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1nomePagador: TStringField;
    FDMemTable1cpfcnpjpagador: TStringField;
    FDMemTable1inforpagador: TStringField;
    FDMemTable1endtoebdid: TStringField;
    FDMemTable1txid: TStringField;
    FDMemTable1valor: TCurrencyField;
    FDMemTable1horario: TStringField;
    DataSource1: TDataSource;
    UniGroupBox8: TUniGroupBox;
    UniLabel24: TUniLabel;
    UniLabel29: TUniLabel;
    edt_E2eID: TUniEdit;
    UniButton11: TUniButton;
    UniPanel10: TUniPanel;
    UniLabel30: TUniLabel;
    edtTxIdDev: TUniEdit;
    UniButton12: TUniButton;
    UniButton13: TUniButton;
    UniButton14: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniButton7Click(Sender: TObject);
    procedure RscPix1CobPut(Sender: TObject; const RespCobPut: TRespCobPut;
      Erro: string);
    procedure UniButton9Click(Sender: TObject);
    procedure UniButton8Click(Sender: TObject);
    procedure RscPix1CobGet(Sender: TObject; const RespCobGet: TRespCobGet;
      Erro: string);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure UniButton10Click(Sender: TObject);
    procedure RscPix1PixGet(Sender: TObject; const RespPixGet: TRespPixGet;
      Erro: string);
    procedure UniButton11Click(Sender: TObject);
    procedure UniButton12Click(Sender: TObject);
    procedure UniButton13Click(Sender: TObject);
    procedure UniButton14Click(Sender: TObject);
    procedure RscPix1PixPut(Sender: TObject; const RespPixPut: TRespPixPut;
      Erro: string);
    procedure RscPix1Token(Sender: TObject; const Token: TToken; Erro: string);
    procedure RscPix1LocGet(Sender: TObject; const RespLocGet: TRespLocGet;
      Erro: string);
    procedure RscPix1CobPatch(Sender: TObject;
      const RespCobPatch: TRespCobPatch; Erro: string);
  private
    PathLogo: string;
    PathConfigIni : String;
    CurrentPsp:  TTipoPSP;
    { Private declarations }
    procedure ConfigTRscPix;

    procedure CriarConfigIni;
    procedure LerConfigIni;
    procedure GravarConfigIni;
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uniGUITypes, ServerModule;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ConfigTRscPix;
begin
  if FileExists(PathLogo) then
    imgQRCODE.Picture.LoadFromFile(PathLogo);

    RscPix1.TitularPix.NomeTitularConta             :=  edtNomeRecebedore.Text;
    RscPix1.TitularPix.CidadeTitularConta           :=  edtCidadeRecebedor.Text;
    RscPix1.Seguranca.CertFile                      :=  edtCertificado.Text;
    RscPix1.Seguranca.CertKeyFile                   :=  edtSenhaCertificado.Text;
    RscPix1.Seguranca.UseSSL                        :=  True;
    RscPix1.Seguranca.SSLVersions                   :=  [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
    RscPix1.Seguranca.VerifyCert                    :=  True;
    RscPix1.Seguranca.SSLMethod                     :=  sslvSSLv3;
    RscPix1.Developer.Application_key               :=  edtDeveloperKey.Text;
    RscPix1.Developer.Client_ID                     :=  edtClientID.Text;
    RscPix1.Developer.Client_Secret                 :=  edtClientSecreat.Text;
    RscPix1.PSP.TipoPsp                             :=  TTipoPSP(CbbPSP.ItemIndex);
    RscPix1.PSP.TipoPspAmbiente                     :=  TTipoAmbiente(CbbTipoAmbiente.ItemIndex);
    RscPix1.TitularPix.TipoChavePix                 :=  TTipoChavePIX(CbbTipoChavePix.ItemIndex);
    RscPix1.TitularPix.ChavePIX                     :=  edtChavePix.Text;
    RscPix1.TitularPix.TipoQRCode                   :=  TTipoQrCode(cbbTipoQRCode.ItemIndex);
    RscPix1.TitularPix.DuracaoMinutos               :=  StrToIntDef(edtDuracaoMinutos.Text, 5);
end;

procedure TMainForm.CriarConfigIni;
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
        finally
          ConfigIni.Free;
        end;
      end;
  Except on E:Exception do
    begin
      MessageDlg('Erro ao Criar arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError , [mbOK] );
    end;
  end;
end;

procedure TMainForm.GravarConfigIni;
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
      MessageDlg('Erro ao gravar arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [mbOK]);
    end;
  end;
end;

procedure TMainForm.LerConfigIni;
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
      MessageDlg('Erro ao ler arquivo de configuração: ' + E.ClassType.ClassName + #13#10  + E.Message, TMsgDlgType.mtError, [mbOK]);
    end;
  end;
end;

procedure TMainForm.RscPix1CobGet(Sender: TObject;
  const RespCobGet: TRespCobGet; Erro: string);
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
                end
              else
                begin
                  if RespCobGet.pixCopiaECola <> '' then
                    begin
                      mmPayload.Text  :=  RespCobGet.pixCopiaECola;
                      QRCodeWin(imgQRCODE, RespCobGet.pixCopiaECola);
                    end
                  else
                    begin
                      mmPayload.Text  :=  RespCobGet.location;
                      QRCodeWin(imgQRCODE, RespCobGet.location);
                    end;
                end;
            end;

        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
    end;
end;

procedure TMainForm.RscPix1CobPatch(Sender: TObject;
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
      MessageDlg('Erro ao Revisar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
    end;
end;

procedure TMainForm.RscPix1CobPut(Sender: TObject;
  const RespCobPut: TRespCobPut; Erro: string);
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
            end
          else
            begin
              if RespCobPut.pixCopiaECola <> '' then
                begin
                  mmPayload.Text  :=  RespCobPut.pixCopiaECola;
                  QRCodeWin(imgQRCODE, RespCobPut.pixCopiaECola);
                end
              else
                begin
                  mmPayload.Text  :=  RespCobPut.location;
                  QRCodeWin(imgQRCODE, RespCobPut.location);
                end;
            end;

          if (RespCobPut.loc <> nil)  and (RespCobPut.pixCopiaECola = '') then
            begin
              TRscPix(Sender).GerarQRCodelocation(RespCobPut.loc.id);
            end;
        end;
    end
  else
    begin
      lblErro.Caption  := 'Erro: '  + Erro;
      MessageDlg('Erro ao Criar Cobrança' + #13 + Erro, TMsgDlgType.mtError, [mbOK]);
    end;
end;

procedure TMainForm.RscPix1LocGet(Sender: TObject;
  const RespLocGet: TRespLocGet; Erro: string);
begin
  DBGrid1.Visible :=  False;
  if (Erro = '') then
    begin
      if RespLocGet.qrcode <> '' then
        begin
          mmPayload.Text  :=  RespLocGet.qrcode;
          QRCodeWin(imgQRCODE, RespLocGet.qrcode);
        end;
    end
  else
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Consultar QrCode' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
    end;
end;

procedure TMainForm.RscPix1PixGet(Sender: TObject;
  const RespPixGet: TRespPixGet; Erro: string);
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
      MessageDlg('Erro ao Consultar PIX' + #13 + Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
    end;

end;

procedure TMainForm.RscPix1PixPut(Sender: TObject;
  const RespPixPut: TRespPixPut; Erro: string);
begin
  DBGrid1.Visible :=  False;
  if Erro <> '' then
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Solcitar Devolução!' +  #13 +Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
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

procedure TMainForm.RscPix1Token(Sender: TObject; const Token: TToken;
  Erro: string);
begin
  DBGrid1.Visible :=  False;
  if Erro <> '' then
    begin
      lblStatus.Caption  := 'Situação: '  + Erro;
      MessageDlg('Erro ao Obter Token!' +  #13 +Erro, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
    end;
end;

procedure TMainForm.UniButton10Click(Sender: TObject);
begin
  ConfigTRscPix;
  RscPix1.ConsultarListPixsRecebPeriodo(StrToDateTime(DateToStr(dtp_Data_Inicial.DateTime) + TimeToStr(dtp_Data_Inicial.DateTime)) ,
                                        StrToDateTime(DateToStr(dtp_Data_Final.DateTime) + TimeToStr(dtp_Data_Final.DateTime)), StrToIntDef(edt_PagPixs.Text, 0));
end;

procedure TMainForm.UniButton11Click(Sender: TObject);
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
          MessageDlg('Digite o campo E2eID' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
          edt_E2eID.SetFocus ;
          Exit;
        end;
    end;

  ConfigTRscPix;
  RscPix1.ConsultarPixRecebido(edt_e2eid.Text);
end;

procedure TMainForm.UniButton12Click(Sender: TObject);
begin
  edtTxIdDev.Text  :=  'DEV'
                  + IntToStr(Random(9999))
                  + IntToStr(Random(999))
                  + 'RSC1996'
                  + IntToStr(Random(999))
                  + IntToStr(Random(9999))
                  + 'EZL1991';
end;

procedure TMainForm.UniButton13Click(Sender: TObject);
begin
  if Trim(edt_E2eID.Text) = ''  then
    begin
      MessageDlg('Digite o campo endToEndId' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
      edt_E2eID.SetFocus ;
      Exit;
    end;
  if Trim(edtTxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
      edtTxIdDev.SetFocus ;
      Exit;
    end;
  if Trim(edtValorPix.Text) = ''  then
    begin
      MessageDlg('Digite o campo Valor' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
      edtValorPix.SetFocus ;
      Exit;
    end;
  ConfigTRscPix;
  RscPix1.SolicitarDevolucaoPix(edt_e2eid.Text, edtTxIdDev.Text, StrToFloat(edtValorPix.Text));
end;

procedure TMainForm.UniButton14Click(Sender: TObject);
begin
  if Trim(edt_E2eID.Text) = ''  then
    begin
      MessageDlg('Digite o campo E2eID' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
      edt_E2eID.SetFocus ;
      Exit;
    end;
  if Trim(edtTxIdDev.Text) = ''  then
    begin
      MessageDlg('Digite o campo TxIdDev' , TMsgDlgType.mtError, [TMsgDlgBtn.mbOK]);
      edtTxIdDev.SetFocus ;
      Exit;
    end;
  ConfigTRscPix;
  RscPix1.ConsultarDevolucaoPix(edt_e2eid.Text, edtTxIdDev.Text);
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  uPC.ActivePage  :=  TbConfigs;
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  uPC.ActivePage  :=  TbFuncoes;
end;

procedure TMainForm.UniButton3Click(Sender: TObject);
begin
  UniFileUpload1.Filter := 'Arquivos pem|*.pem|Arquivos cer|*.cer|Arquivos crt|*.crt' ;

  UniFileUpload1.Execute;
end;

procedure TMainForm.UniButton4Click(Sender: TObject);
begin
  GravarConfigIni;
  LerConfigIni;
  MessageDlg('Configurações Gravadas Com Sucesso!', TMsgDlgType.mtInformation, [mbOK]);
end;

procedure TMainForm.UniButton5Click(Sender: TObject);
begin
  UniFileUpload1.Filter := 'Arquivos key|*.key' ;

  UniFileUpload1.Execute;
end;

procedure TMainForm.UniButton6Click(Sender: TObject);
begin
  edtTXID.Text  :=  'COB'
                  + IntToStr(Random(9999))
                  + IntToStr(Random(999))
                  + 'RSC1996'
                  + IntToStr(Random(999))
                  + IntToStr(Random(9999))
                  + 'EZL1991';
end;

procedure TMainForm.UniButton7Click(Sender: TObject);
begin
  ConfigTRscPix;
  RscPix1.CriarCobranca(StrToFloatDef(edtValorPix.Text, 0), edtTXID.Text, edtMsgPix.Text);
end;

procedure TMainForm.UniButton8Click(Sender: TObject);
begin
    ConfigTRscPix;
    RscPix1.CancelarCobranca(edtTXID.Text);
end;

procedure TMainForm.UniButton9Click(Sender: TObject);
begin
    ConfigTRscPix;
    RscPix1.ConsultarCobranca(edtTXID.Text);
end;

procedure TMainForm.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  FFolder, ext : string;
  Sr : TSearchRec;
begin

  FFolder := UniServerModule.FilesFolderPath;

  ext :=  ExtractFileExt(AStream.FileName);


  if (ext = '.pem') or  (ext = '.cer')  or  (ext = '.crt') then
    begin
      if FindFirst(FFolder+'*' + ext, faAnyFile, Sr) = 0 then
        begin
          repeat
            if Sr.Attr and faDirectory = 0 then
              DeleteFile(FFolder  +  Sr.Name);
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;

      if FindFirst(FFolder+'*' + ext, faAnyFile, Sr) = 0 then
        begin
          repeat
            if Sr.Attr and faDirectory = 0 then
              edtCertificado.Text :=  FFolder  +  Sr.Name;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;
    end;

  if (ext = '.key') then
    begin
      if FindFirst(FFolder+'*' + ext, faAnyFile, Sr) = 0 then
        begin
          repeat
            if Sr.Attr and faDirectory = 0 then
              DeleteFile(FFolder  +  Sr.Name);
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;

      if FindFirst(FFolder+'*' + ext, faAnyFile, Sr) = 0 then
        begin
          repeat
            if Sr.Attr and faDirectory = 0 then
              edtSenhaCertificado.Text :=  FFolder  +  Sr.Name;
          until FindNext(sr) <> 0;
          FindClose(sr);
        end;
    end;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
var
  Q:  TTipoQrCode;
  R:  TTipoChavePIX;
  S:  TTipoPSP;
  T:  TTipoAmbiente;
begin
  {$REGION 'Config Variaveis'}
  PathLogo  :=  ExtractFilePath(ParamStr(0)) + 'imglogo.png';
  PathConfigIni :=  ExtractFilePath(ParamStr(0)) + 'Config.ini';
  {$ENDREGION}

  {$REGION 'Config Logo Pix'}

  if not FileExists(PathLogo) then
    imgQRCODE.Picture.SaveToFile(PathLogo)
  else
    imgQRCODE.Picture.LoadFromFile(PathLogo);
  {$ENDREGION}

  CriarConfigIni;

  {$REGION 'Config Tipo Qrcode'}
  cbbTipoQRCode.Clear;

  For Q := Low(TTipoQrCode) to High(TTipoQrCode) do
     cbbTipoQRCode.Items.Add( GetEnumName(TypeInfo(TTipoQrCode), integer(Q)));

  if cbbTipoQRCode.Items.Count > 0 then
      cbbTipoQRCode.ItemIndex :=  0;
  {$ENDREGION}

  {$REGION 'Config Tipo Chave PIX'}
  CbbTipoChavePix.Clear;

  For R := Low(TTipoChavePIX) to High(TTipoChavePIX) do
     CbbTipoChavePix.Items.Add( GetEnumName(TypeInfo(TTipoChavePIX), integer(R)));

  if CbbTipoChavePix.Items.Count > 0 then
    CbbTipoChavePix.ItemIndex :=  0;
  {$ENDREGION}

  {$REGION 'Config PSP'}
  CbbPSP.Clear;

  For S := Low(TTipoPSP) to High(TTipoPSP) do
     CbbPSP.Items.Add( GetEnumName(TypeInfo(TTipoPSP), integer(S)));

  if CbbPSP.Items.Count > 0 then
    CbbPSP.ItemIndex :=  0;
  {$ENDREGION}

  {$REGION 'Config Ambiente'}
  CbbTipoAmbiente.Clear;

  For T := Low(TTipoAmbiente) to High(TTipoAmbiente) do
     CbbTipoAmbiente.Items.Add( GetEnumName(TypeInfo(TTipoAmbiente), integer(T)));

  if CbbTipoAmbiente.Items.Count > 0 then
    CbbTipoAmbiente.ItemIndex :=  0;
  {$ENDREGION}

  LerConfigIni;

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
