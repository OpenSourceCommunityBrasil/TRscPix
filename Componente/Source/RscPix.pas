unit RscPix;

interface

uses
  SysUtils
  , Classes
  
  , IdHTTP
  , IdGlobal
  , IdSSLOpenSSL

  , RscJSON

  , RscPixToken
  , RscPixCalendario
  , RscPixValor
  , RscPixInformacoesAdicionais
  , RscPixDevolucao
  , RscPixPessoas
  , RscPixEndPoint

  , RscPixRequesteListar

  , RscPixCob
  , RscPixPix
  , RscPixLoc
  , RscPixWebhook

  , RscPixAutenticar
  , RscPixCertificado
  , RscPixTitular
  , RscPixPSP

  , RscPixUtils
  , RscPixTipos

  ;

type

  TInfo_Adicionais = class(TInformacoesAdicionais)
  end;
  //
  TRespCobPut = class(TCob)
  end;

  TRespCobPatch = class(TCob)
  end;

  TRespCobGet = class(TCob)
  end;

  TRespCobListar = class(TCobListar)
  end;

  //
  TRespPixGetEndToEndId = class(TPix)
  end;

  TRespPixListaRecebidos = class(TPixRecebidoLista)
  end;

  TRespPixPut = class(TPix)
  end;

  TRespPixPutSD = class(TDevolucao) //solicitar devolução
  end;

  //
  TRespLocPost = class(TLocGet)
  end;

  TRespLocGet = class(TLocGet)
  end;

  TRespLocGetIdQrcode = class(TLocIdQrcode)
  end;

  TRespLocDelete = class(TLocGet)
  end;

  TRespLocList = class(TLocListar)
  end;

  TRespWebhookListar = class(TWebHookListar)
  end;

  TRespWebhookGet = class(TWebHook)
  end;

  TRespWebhookPutDelete = class(TWebHookPutDelete)
  end;

type

  TNotificaToken        = procedure(Sender : TObject; Const Token: TToken = nil; Erro: String = '')  of object;

  TNotificaCobPut       = procedure(Sender : TObject; Const Response: TRespCobPut = nil; Erro: String = '')  of object;
  TNotificaCobPatch     = procedure(Sender : TObject; Const Response: TRespCobPatch = nil; Erro: String = '')  of object;
  TNotificaCobGet       = procedure(Sender : TObject; Const Response: TRespCobGet = nil; Erro: String = '')  of object;
  TNotificaCobGetListar = procedure(Sender : TObject; Const Responser: TRespCobListar = nil; Erro: String = '')  of object;

  TNotificaPixEndToEndId  = procedure(Sender : TObject; Const Response: TRespPixGetEndToEndId = nil; Erro: String = '')  of object;
  TNotificaPixPut         = procedure(Sender : TObject; Const Response: TRespPixPut = nil; Erro: String = '')  of object;
  TNotificaPixListaRecebidos  = procedure(Sender : TObject; Const Response: TRespPixListaRecebidos = nil; Erro: String = '')  of object;
  TNotificaPixPutSD         = procedure(Sender : TObject; Const Response: TRespPixPutSD = nil; Erro: String = '')  of object;

  TNotificaLocPost      = procedure(Sender : TObject; Const Response: TRespLocPost = nil; Erro: String = '')  of object;
  TNotificaLocGet       = procedure(Sender : TObject; Const Response: TRespLocGet = nil; Erro: String = '')  of object;
  TNotificaLocIdQrcode  = procedure(Sender : TObject; Const Response: TRespLocGetIdQrcode = nil; Erro: String = '')  of object;
  TNotificaLocDelete    = procedure(Sender : TObject; Const Response: TRespLocDelete = nil; Erro: String = '')  of object;
  TNotificaLocList      = procedure(Sender : TObject; Const Response: TRespLocList = nil; Erro: String = '')  of object;

  TNotificaWebhookListar  = procedure(Sender : TObject; Const Response: TRespWebhookListar = nil; Erro: String = '')  of object;
  TNotificaWebhookGet     = procedure(Sender : TObject; Const Response: TRespWebhookGet = nil; Erro: String = '')  of object;
  TNotificaWebhookPut     = procedure(Sender : TObject; Const Response: TRespWebhookPutDelete = nil; Erro: String = '')  of object;
  TNotificaWebhookDelete  = procedure(Sender : TObject; Const Response: TRespWebhookPutDelete = nil; Erro: String = '')  of object;

type
  TRscPix = class(TComponent)
  private
    FAutenticar: TAutenticar;
    FCertificado: TCertificado;
    FPSP: TPSP;
    FTitular: TTitular;
    FToken: TToken;
    FOnToken: TNotificaToken;
    FOnCobPut: TNotificaCobPut;
    FOnCobGet: TNotificaCobGet;
    FOnCobPatch: TNotificaCobPatch;
    FOnLocDelete: TNotificaLocDelete;
    FOnLocGet: TNotificaLocGet;
    FOnLocPost: TNotificaLocPost;
    { Private declarations }

    FConsultarlocIdQrCode : string;
    FOnPixListaRecebidos: TNotificaPixListaRecebidos;
    FOnLocList: TNotificaLocList;
    FOnLocGetIdQrCode: TNotificaLocIdQrcode;
    FOnWebhookListar: TNotificaWebhookListar;
    FOnWebhookGet: TNotificaWebhookGet;
    FOnWebhookPut: TNotificaWebhookPut;
    FOnWebhookDelete: TNotificaWebhookDelete;
    FOnCobGetListar: TNotificaCobGetListar;
    FOnPixGetEndToEndId: TNotificaPixEndToEndId;
    FOnPixPutDevolucao: TNotificaPixPutSD;

    function GetVersao: string;
  protected
    { Protected declarations }
    {token}
    procedure InOnToken(Sender : TObject; Const Token: TToken = nil; Erro: String = '');
    {cob}
    procedure InOnCobPut(Sender : TObject; Const Response: TRespCobPut = nil; Erro: String = '');
    procedure InOnCobGet(Sender : TObject; Const Response: TRespCobGet = nil; Erro: String = '');
    procedure InOnCobGetListar(Sender : TObject; Const Response: TRespCobListar = nil; Erro: String = '');
    procedure InOnCobPatch(Sender : TObject; Const Response: TRespCobPatch = nil; Erro: String = '');
    {loc}
    procedure InOnLocPost(Sender : TObject; Const Response: TRespLocPost = nil; Erro: String = '');
    procedure InOnLocGetId(Sender : TObject; Const Response: TRespLocGet = nil; Erro: String = '');
    procedure InOnLocGetIdQrCode(Sender : TObject; Const Response: TRespLocGetIdQrcode = nil; Erro: String = '');
    procedure InOnLocDelete(Sender : TObject; Const Response: TRespLocDelete = nil; Erro: String = '');
    procedure InOnLocConsultarList(Sender : TObject; Const Response: TRespLocList = nil; Erro: String = '');
    {Pix}
    procedure InOnPixGetEndToEndId(Sender : TObject; Const Response: TRespPixGetEndToEndId = nil; Erro: String = '');
    procedure InOnPixPutSD(Sender : TObject; Const Response: TRespPixPutSD = nil; Erro: String = '');
    procedure InOnPixListaRecebidos(Sender : TObject; Const Response: TRespPixListaRecebidos = nil; Erro: String = '');
    {Webhook}
    procedure InOnWebhookListar(Sender : TObject; Const Response: TRespWebhookListar = nil; Erro: String = '');
    procedure InOnWebhookGet(Sender : TObject; Const Response: TRespWebhookGet = nil; Erro: String = '');
    procedure InOnWebhookPut(Sender : TObject; Const Response: TRespWebhookPutDelete = nil; Erro: String = '');
    procedure InOnWebhookDelete(Sender : TObject; Const Response: TRespWebhookPutDelete = nil; Erro: String = '');


    Function ValidaChavePix(out sErro: string):  Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    {token}
    procedure NovoToken;
    {Cob}
    procedure CobCriar(dValor: Double; sTXID: string; sMensagem: string = '');
    procedure CobTxId(sTXID: string);
    procedure CobListar(
                        dtData_Hora_Inicial: TDateTime;
                        dtData_Hora_Final: TDateTime;
                        iPagIndex: integer = 0;
                        iQtdItensPag: integer = 100;
                        cpf: string = '';
                        cnpj: string = '';
                        status: string = '';
                        locationPresente: boolean = False
                       );
    procedure CobCancelar(sTXID: string);
    {Pix}
    procedure PixEndToEndId(endToEndId: string);
    procedure PixListar(
                        dtData_Hora_Inicial: TDateTime;
                        dtData_Hora_Final: TDateTime;
                        txid: string = '';
                        txIdPresente: Boolean = False;
                        devolucaoPresente: Boolean = False;
                        cpf: string = '';
                        cnpj: string = '';
                        iPagIndex: integer = -1;
                        iQtdItensPag: integer = 0
                       );
    procedure PixDevolucaoSolicitar(sEndToEndId, sTXIDDev: string; dValor: Double);
    procedure PixDevolucaoConsultar(sEndToEndId, sTXIDDev: string);
    {loc}
    procedure LocationCriar(const TipoCobranca: TTipoCobranca);
    procedure LocationListarCadastrados(
                                        dtData_Hora_Inicial: TDateTime;
                                        dtData_Hora_Final: TDateTime;
                                        txIdPresente: Boolean = True;
                                        tipoCob: TTipoCobranca = tcbCob;
                                        iPagIndex: integer = 0;
                                        iQtdItensPag: integer = 100
                                       );

    procedure LocationId(locId: integer);
    procedure LocationIdToQrCode(locId: integer);
    procedure LocationDesvincularTxId(locId: integer);
    {WebHook}
    procedure WebhookListarCadastrados(
                                        dtData_Hora_Inicial: TDateTime;
                                        dtData_Hora_Final: TDateTime;
                                        iPagIndex: integer = 0;
                                        iQtdItensPag: integer = 100
                                      );
    procedure WebhookConfigurar(const webhookUrl: string);
    procedure WebhookConsultar;
    procedure WebhookDesvincular;
    { Public declarations }
    property Token                  : TToken read FToken write FToken;
  published
    { Published declarations }
    property Versao                       : string        read GetVersao;
    property Certificado                  : TCertificado  read FCertificado write FCertificado;
    property Titular                      : TTitular      read FTitular     write FTitular;
    property Autenticar                   : TAutenticar   read FAutenticar  write FAutenticar;
    property PSP                          : TPSP          read FPSP         write FPSP;

    {token}
    property OnToken                      : TNotificaToken        read  FOnToken             write  FOnToken;
    {Cob}
    property OnCobCriar                   : TNotificaCobPut       read  FOnCobPut            write  FOnCobPut;
    property OnCobTxId                    : TNotificaCobGet       read  FOnCobGet            write  FOnCobGet;
    property OnCobListar                  : TNotificaCobGetListar       read  FOnCobGetListar            write  FOnCobGetListar;
    property OnCobCancelar                : TNotificaCobPatch     read  FOnCobPatch          write  FOnCobPatch;
    {Loc}
    property OnLocationCriar              : TNotificaLocPost      read  FOnLocPost           write  FOnLocPost;
    property OnLocationId                 : TNotificaLocGet       read  FOnLocGet            write  FOnLocGet;
    property OnLocationIdtoQrCode         : TNotificaLocIdQrcode  read  FOnLocGetIdQrCode    write  FOnLocGetIdQrCode;
    property OnLocationListarCadastrados  : TNotificaLocList      read  FOnLocList           write  FOnLocList;
    property OnLocationDesvincularTxId    : TNotificaLocDelete    read  FOnLocDelete         write  FOnLocDelete;
    {Pix}
    property OnPixGetEndToEndId           : TNotificaPixEndToEndId       read  FOnPixGetEndToEndId            write  FOnPixGetEndToEndId;
    property OnPixDevolucao               : TNotificaPixPutSD       read  FOnPixPutDevolucao            write  FOnPixPutDevolucao;
    property OnPixListaRecebidos          : TNotificaPixListaRecebidos read  FOnPixListaRecebidos  write  FOnPixListaRecebidos;
    {Webhook}
    property OnWebhookListar              : TNotificaWebhookListar  read FOnWebhookListar write FOnWebhookListar;
    property OnWebhookGet                 : TNotificaWebhookGet     read FOnWebhookGet    write FOnWebhookGet;
    property OnWebhookPut                 : TNotificaWebhookPut     read FOnWebhookPut    write FOnWebhookPut;
    property OnWebhookDelete              : TNotificaWebhookDelete  read FOnWebhookDelete write FOnWebhookDelete;

  end;



implementation



{ TRscPix }

constructor TRscPix.Create(AOwner: TComponent);
begin
  inherited;
  FAutenticar   :=  TAutenticar.Create;
  FCertificado  :=  TCertificado.Create;
  FPSP          :=  TPSP.Create;
  FTitular      :=  TTitular.Create;
  FToken        :=  TToken.Create;
end;

destructor TRscPix.Destroy;
begin
  FAutenticar.Free;
  FCertificado.Free;
  FPSP.Free;
  FTitular.Free;
  FToken.Free;
  
  inherited;
end;

function TRscPix.GetVersao: string;
begin
  Result  :=  '3.0';
end;

procedure TRscPix.InOnToken(Sender: TObject; const Token: TToken;
  Erro: String);
begin
  if Assigned(FOnToken) then
     FOnToken(Sender, Token, Erro);
end;

procedure TRscPix.InOnCobPut(Sender: TObject;
  const Response: TRespCobPut; Erro: String);
begin
  if Assigned(FOnCobPut) then
     FOnCobPut(Sender, Response, Erro);
end;

procedure TRscPix.InOnCobGet(Sender: TObject;
  const Response: TRespCobGet; Erro: String);
begin
  if Assigned(FOnCobGet) then
     FOnCobGet(Sender, Response, Erro);
end;

procedure TRscPix.InOnCobGetListar(Sender: TObject;
  const Response: TRespCobListar; Erro: String);
begin
  if Assigned(FOnCobGetListar) then
     FOnCobGetListar(Sender, Response, Erro);
end;

procedure TRscPix.InOnCobPatch(Sender: TObject;
  const Response: TRespCobPatch; Erro: String);
begin
  if Assigned(FOnCobPatch) then
     FOnCobPatch(Sender, Response, Erro);
end;

procedure TRscPix.InOnLocConsultarList(Sender: TObject;
  const Response: TRespLocList; Erro: String);
begin
  if Assigned(FOnLocList) then
     FOnLocList(Sender, Response, Erro);
end;

procedure TRscPix.InOnLocDelete(Sender: TObject;
  const Response: TRespLocDelete; Erro: String);
begin
  if Assigned(FOnLocDelete) then
     FOnLocDelete(Sender, Response, Erro);
end;

procedure TRscPix.InOnLocGetId(Sender: TObject;
  const Response: TRespLocGet; Erro: String);
begin
  if Assigned(FOnLocGet) then
     FOnLocGet(Sender, Response, Erro);
end;

procedure TRscPix.InOnLocGetIdQrCode(Sender: TObject;
  const Response: TRespLocGetIdQrcode; Erro: String);
begin
  if Assigned(Response) then
    FConsultarlocIdQrCode :=  Response.qrcode;
  if Assigned(FOnLocGetIdQrCode) then
     FOnLocGetIdQrCode(Sender, Response, Erro);
end;

procedure TRscPix.InOnLocPost(Sender: TObject;
  const Response: TRespLocPost; Erro: String);
begin
  if Assigned(FOnLocPost) then
     FOnLocPost(Sender, Response, Erro);
end;

procedure TRscPix.InOnPixGetEndToEndId(Sender: TObject;
  const Response: TRespPixGetEndToEndId; Erro: String);
begin
  if Assigned(FOnPixGetEndToEndId) then
     FOnPixGetEndToEndId(Sender, Response, Erro);
end;

procedure TRscPix.InOnPixListaRecebidos(Sender: TObject;
  const Response: TRespPixListaRecebidos; Erro: String);
begin
  if Assigned(FOnPixListaRecebidos) then
     FOnPixListaRecebidos(Sender, Response, Erro);
end;

procedure TRscPix.InOnPixPutSD(Sender: TObject; const Response: TRespPixPutSD;
  Erro: String);
begin
  if Assigned(FOnPixPutDevolucao) then
     FOnPixPutDevolucao(Sender, Response, Erro);
end;

procedure TRscPix.InOnWebhookListar(Sender: TObject;
  const Response: TRespWebhookListar; Erro: String);
begin
  if Assigned(FOnWebhookListar) then
     FOnWebhookListar(Sender, Response, Erro);
end;

procedure TRscPix.InOnWebhookGet(Sender: TObject;
  const Response: TRespWebhookGet; Erro: String);
begin
  if Assigned(FOnWebhookGet) then
     FOnWebhookGet(Sender, Response, Erro);
end;

procedure TRscPix.InOnWebhookPut(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: String);
begin
  if Assigned(FOnWebhookPut) then
     FOnWebhookPut(Sender, Response, Erro);
end;

procedure TRscPix.InOnWebhookDelete(Sender: TObject;
  const Response: TRespWebhookPutDelete; Erro: String);
begin
  if Assigned(FOnWebhookDelete) then
     FOnWebhookDelete(Sender, Response, Erro);
end;

function TRscPix.ValidaChavePix(out sErro: string): Boolean;
begin
  Result  :=  False;
  case FTitular.TipoChavePix of
    tcCPF:
      begin
        if IsCPF(FTitular.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            sErro :=  'A Chave Pix informada: '  + FTitular.ChavePix + ' não é um CFP válido.';
          end;
      end;
    tcCNPJ:
      begin
        if IsCNPJ(FTitular.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            sErro :=  'A Chave Pix informada: '  + FTitular.ChavePix + ' não é um CNPJ válido.';
          end;
      end;
    tcTelefone:
      begin
        if IsCelular(FTitular.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            sErro :=  'A Chave Pix informada: '  + FTitular.ChavePix + ' não é um Nº de TELEFONE válido.'
                                    + #13
                                    + 'Informe o Nº como no Ex: +5544988887777';
          end;
      end;
    tcEmail:
      begin
        if IsEMail(FTitular.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            sErro :=  'A Chave Pix informada: '  + FTitular.ChavePix + ' não é um E-MAIL válido.';
          end;
      end;
    tcAleatoria:
      begin
        Result  :=  True;
      end;
  end;
end;

procedure TRscPix.NovoToken;
var
  StrmBody      : TStringStream ;
  StrlHeader    : TStringList ;
  vIdHTTP       : TIdHTTP;
  SSLHandler    : TIdSSLIOHandlerSocketOpenSSL;
begin
  StrlHeader  :=  TStringList.Create;
  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/x-www-form-urlencoded';
      vIdHTTP.Request.Username            :=  FAutenticar.Client_ID;
      vIdHTTP.Request.Password            :=  FAutenticar.Client_Secret;
      vIdHTTP.Request.BasicAuthentication :=  True;

      case FPSP.Psp of
        pspSicredi:
          begin
            vIdHTTP.Request.AcceptEncoding :=  '';
          end;
        pspBancoDoBrasil:
          begin
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('scope=cob.read cob.write cobv.write cobv.read lotecobv.write lotecobv.read pix.read pix.write webhookread webhook.write payloadlocation.write payloadlocation.read');
          end;
        pspBradesco:
          begin
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('scope=cob.read cob.write pix.read pix.write');
          end;
        pspSantander:
          begin
            vIdHTTP.Request.Accept  :=  '*/*';
            vIdHTTP.Request.AcceptEncoding  :=  'gzip, deflate, br';
            vIdHTTP.Request.ContentEncoding :=  '';
            vIdHTTP.Request.BasicAuthentication :=  False;

            StrlHeader.Add('client_id='+FAutenticar.Client_ID);
            StrlHeader.Add('client_secret='+FAutenticar.Client_Secret);
          end;
        pspSicoob:
          begin
            vIdHTTP.Request.BasicAuthentication :=  False;
            SSLHandler.Host := 'https://auth.sicoob.com.br';

            StrlHeader.Add('client_id='+FAutenticar.Client_ID);
            StrlHeader.Add('client_secret='+FAutenticar.Client_Secret);
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('scope=cob.read cob.write pix.read pix.write');

          end;
        pspEfi:
          begin
            StrlHeader.Add('grant_type=client_credentials');
          end;
        pspPagSeguro:
          begin
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('scope=cob.read cob.write pix.read pix.write');
          end;
        pspItau:
          begin
            vIdHTTP.Request.BasicAuthentication :=  False;
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('client_id='+FAutenticar.Client_ID);
            StrlHeader.Add('client_secret='+FAutenticar.Client_Secret);
          end;
        pspInter:
          begin
            vIdHTTP.Request.BasicAuthentication :=  False;
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('client_id='+FAutenticar.Client_ID);
            StrlHeader.Add('client_secret='+FAutenticar.Client_Secret);
            StrlHeader.Add('scope=cob.read cob.write pix.read pix.write');
          end;
        pspBanRiSul:
          begin
            StrlHeader.Add('grant_type=client_credentials');
            StrlHeader.Add('scope=cob.read+cob.write+pix.read+pix.write+cobv.read+cobv.write+payloadlocation.read+payloadlocation.write+webhook.read+webhook.write');
          end;
      end;

      try
        case FPSP.Psp of
          pspSantander: vIdHTTP.Post(FPSP.UrlToken+'?grant_type=client_credentials', StrlHeader, StrmBody);
        else
          vIdHTTP.Post(FPSP.UrlToken, StrlHeader, StrmBody);
        end;

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Token.LoadJson(StrmBody.DataString);
              InOnToken(Self, Token, '');
            end;
        else
          InOnToken(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) and (E.ErrorCode <> 0) Then
              Begin
                InOnToken(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnToken(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnToken(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    StrlHeader.Free;
  end;
end;

procedure TRscPix.CobCriar(dValor: Double; sTXID, sMensagem: string);
var
  StrmBody        : TStringStream;
  RequestStrm     : TStringStream;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  ResultCobPut    : TRespCobPut;
  MsgErro         : string;
  sUrl            : string;
  sReqJson        : string;

  JsonValor      : TRscJSONobject;
  JsonCalendario : TRscJSONobject;
  JsonEnviar     : TRscJSONobject;
begin
  FConsultarlocIdQrCode :=  '';
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnCobPut(Self, nil, MsgErro);
      Exit;
    end;
  if  dValor <= 0 then
    begin
      InOnCobPut(Self, nil, 'Valor Informado é inválido');
      Exit;
    end;

  if  (Length(sMensagem) > 140) then
    begin
      InOnCobPut(Self, nil, 'O Texto da Mensagem deve ter até 140 caracteres!');
      Exit;
    end;

  if  sTXID = '' then
    begin
      InOnCobPut(Self, nil, 'O TXID deve ser informado!');
      Exit;
    end;

  if  (Length(sTXID) < 26) or (Length(sTXID) > 38) then
    begin
      InOnCobPut(Self, nil, 'O TXID deve ter entre 26 á 38 caracteres!');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnCobPut(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  JsonValor       := TRscJSONobject.Create;
  JsonCalendario  := TRscJSONobject.Create;
  JsonEnviar      := TRscJSONobject.Create;
  try
    JsonValor.AddPair('original', StringReplace(FormatFloat('#0.00', dValor),',','.',[rfReplaceAll]));
    JsonCalendario.AddPair('expiracao', Titular.DuracaoMinutos * 60); // aqui é em segundo 3600 segundos = 1 h

    JsonEnviar.AddPair('calendario', JsonCalendario);
    JsonEnviar.AddPair('valor', JsonValor);
    JsonEnviar.AddPair('chave', Titular.ChavePix);

    case FPSP.Psp of
      pspSicredi,
      pspBancoDoBrasil,
      pspBradesco,
      pspSantander,
      pspSicoob,
      pspEfi,
      pspPagSeguro,
      pspItau,
      pspInter: JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(sMensagem));
      pspBanRiSul: ;
    end;

    sReqJson  :=  JsonEnviar.ToJson;

  finally
    JsonEnviar.Free;
  end;

  RequestStrm :=  TStringStream.Create(sReqJson);
  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            vIdHTTP.Request.AcceptEncoding      :=  'gzip, deflate, br';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            vIdHTTP.Request.Accept              :=  'application/json';
          end;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.CobPut;
      sUrl := StringReplace(sUrl, '{txid}', sTXID , [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Put(sUrl, RequestStrm, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              ResultCobPut  :=  TRespCobPut.Create;
              try
                ResultCobPut.LoadJson(StrmBody.DataString);
                InOnCobPut(Self, ResultCobPut, '');
              finally
                ResultCobPut.Free;
              end;

            end;
        else
          InOnCobPut(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnCobPut(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnCobPut(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnCobPut(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    RequestStrm.Free;
  end;
end;

procedure TRscPix.CobTxId(sTXID: string);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  RespCobGet    : TRespCobGet;
  MsgErro         : string;
  sUrl            : string;
begin
  FConsultarlocIdQrCode :=  '';
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnCobGet(Self, nil, MsgErro);
      Exit;
    end;

  if  sTXID = '' then
    begin
      InOnCobGet(Self, nil, 'O TXID deve ser informado!');
      Exit;
    end;

  if  (Length(sTXID) < 26) or (Length(sTXID) > 38) then
    begin
      InOnCobGet(Self, nil, 'O TXID deve ter entre 26 á 38 caracteres!');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnCobGet(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.CobGet;
      sUrl := StringReplace(sUrl, '{txid}', sTXID , [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Get(sUrl, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              RespCobGet:=  TRespCobGet.Create;
              try
                RespCobGet.LoadJson(StrmBody.DataString);
                InOnCobGet(Self, RespCobGet, '');
              finally
                RespCobGet.Free;
              end;

            end;
        else
          InOnCobGet(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnCobGet(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnCobGet(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnCobGet(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.CobListar(dtData_Hora_Inicial,
  dtData_Hora_Final: TDateTime; iPagIndex, iQtdItensPag: integer; cpf, cnpj,
  status: string; locationPresente: boolean);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MyPixListRebPer     : TRequesteListar;
  vResponse    : TRespCobListar;
  MsgErro         : string;
  sUrl            : string;
begin
  FConsultarlocIdQrCode :=  '';
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnCobGetListar(Self, nil, MsgErro);
      Exit;
    end;

  MyPixListRebPer := TRequesteListar.Create;
  try
    try
      MyPixListRebPer.PSP           :=  FPSP.Psp;
      MyPixListRebPer.Data_Hora_Ini :=  dtData_Hora_Inicial;
      MyPixListRebPer.Data_Hora_Fim :=  dtData_Hora_Final;
      MyPixListRebPer.Index_Pag     :=  iPagIndex;

    except on E: Exception do
      begin
        InOnPixListaRecebidos(Self, nil, e.Message);
        Exit;
      end;
    end;

    if  Token.AccessToken = '' then
      begin
        InOnCobGetListar(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
        Exit;
      end;

    StrmBody    :=  TStringStream.Create('');
    vIdHTTP     := TIdHTTP.Create(nil);
    SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      try
        SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
        SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
        SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
        SSLHandler.SSLOptions.RootCertFile      :=  '';
        SSLHandler.Host                         := FPSP.UrlHostCert;
        SSLHandler.Port                         := 443;
        SSLHandler.SSLOptions.Mode              := sslmClient;
        SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

        vIdHTTP.IOHandler := SSLHandler;
        vIdHTTP.Request.CustomHeaders.Clear;
        vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
        vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
        vIdHTTP.Request.ContentEncoding     :=  '';
        vIdHTTP.Request.AcceptEncoding      :=  '';
        vIdHTTP.Request.Accept              :=  '*/*';
        vIdHTTP.ConnectTimeout              :=  20000;

        vIdHTTP.Request.BasicAuthentication :=  False;
        vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

        sUrl := FPSP.URLAPI + FPSP.EndPoints.CobGetS +
            '?inicio=' + MyPixListRebPer.Data_Hora_Ini_ToStr  +
            '&fim='    + MyPixListRebPer.Data_Hora_Fim_ToStr;

        if MyPixListRebPer.Index_Pag > 0 then
          sUrl := sUrl + '&paginaAtual=' + IntToStr(MyPixListRebPer.Index_Pag);

        if (iQtdItensPag > 0) and (iQtdItensPag <= 100) then
          sUrl := sUrl + '&itensPorPagina=' + IntToStr(iQtdItensPag);

        if (cpf <> '') then
          sUrl := sUrl + '&cpf=' + Trim(cpf);

        if (cnpj <> '') then
          sUrl := sUrl + '&cnpj=' + Trim(cnpj);

        if (status <> '') then
          sUrl := sUrl + '&status=' + Trim(status);

        case FPSP.Psp of
          pspSicredi:;
          pspBancoDoBrasil:
            begin
              if locationPresente then
                sUrl := sUrl + '&locationPresente=true'
              else
                sUrl := sUrl + '&locationPresente=false';

              if FAutenticar.Application_key <> '' then
                sUrl := sUrl + '&gw-dev-app-key=' + FAutenticar.Application_key;
            end;
          pspSantander:;
          pspBradesco,
          pspSicoob:
            begin
              vIdHTTP.Request.ContentType         :=  'application/json';
              //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
            end;
          pspEfi:
            begin
              vIdHTTP.Request.ContentType         :=  'application/json';
            end;
          pspPagSeguro:;
          pspItau:;
          pspInter:;
          pspBanRiSul:;
        end;


        try
          vIdHTTP.Get(sUrl, StrmBody);

          case vIdHTTP.ResponseCode of
            200, 201:
              begin
                vResponse:=  TRespCobListar.Create;
                try
                  vResponse.LoadJson(StrmBody.DataString);
                  InOnCobGetListar(Self, vResponse, '');
                finally
                  vResponse.Free;
                end;

              end;
          else
            InOnCobGetListar(Self, nil, StrmBody.DataString);
          end;
        Except
          On E: EIdHTTPProtocolException Do
            Begin
              If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
                Begin
                  InOnCobGetListar(Self, nil, E.ErrorMessage);
                End;
            End;

          on E: Exception do
            begin
              InOnCobGetListar(Self, nil, E.Message);
            end;
        end;

      except on E: Exception do
        begin
          InOnCobGetListar(Self, nil, E.Message);
        end;
      end;
    finally
      vIdHTTP.Free;
      SSLHandler.Free;
      StrmBody.Free;
    end;
  finally
    MyPixListRebPer.Free;
  end;
end;

procedure TRscPix.CobCancelar(sTXID: string);
var
  StrmBody        : TStringStream;
  RequestStrm     : TStringStream;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  JsonEnviar      : TRscJSONobject;

  RespCobPatch    : TRespCobPatch;
  MsgErro         : string;
  sUrl            : string;
  sReqJson        : string;
begin
  FConsultarlocIdQrCode :=  '';
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnCobPatch(Self, nil, MsgErro);
      Exit;
    end;

  if  sTXID = '' then
    begin
      InOnCobPatch(Self, nil, 'O TXID deve ser informado!');
      Exit;
    end;

  if  (Length(sTXID) < 26) or (Length(sTXID) > 38) then
    begin
      InOnCobPatch(Self, nil, 'O TXID deve ter entre 26 á 38 caracteres!');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnCobPatch(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  JsonEnviar  :=  TRscJSONobject.Create;
  try                                   
    JsonEnviar.AddPair('status', 'REMOVIDA_PELO_USUARIO_RECEBEDOR');
    sReqJson  :=  JsonEnviar.ToJson;
  finally
    JsonEnviar.Free;
  end;

  RequestStrm :=  TStringStream.Create(sReqJson);
  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     :=  TIdHTTP.Create(nil);
  SSLHandler  :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            vIdHTTP.Request.AcceptEncoding      :=  'gzip, deflate, br';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.CobPatch;
      sUrl  := StringReplace(sUrl, '{txid}', sTXID , [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Patch(sUrl, RequestStrm,  StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              RespCobPatch:=  TRespCobPatch.Create;
              try
                RespCobPatch.LoadJson(StrmBody.DataString);
                InOnCobPatch(Self, RespCobPatch, '');
              finally
                RespCobPatch.Free;
              end;

            end;
        else
          InOnCobPatch(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnCobPatch(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnCobPatch(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnCobPatch(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
    RequestStrm.Free;
  end;
end;

procedure TRscPix.PixEndToEndId(endToEndId: string);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  vResponse      : TRespPixGetEndToEndId;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnPixGetEndToEndId(Self, nil, MsgErro);
      Exit;
    end;

  if  (Length(endToEndId) <= 0) then
    begin
      InOnPixGetEndToEndId(Self, nil, 'O endToEndId não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnPixGetEndToEndId(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.PixGetCP;
      sUrl := StringReplace(sUrl, '{e2eid}', endToEndId, [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Get(sUrl, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse:=  TRespPixGetEndToEndId.Create;
              try
                vResponse.LoadJson(StrmBody.DataString);
                InOnPixGetEndToEndId(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnPixGetEndToEndId(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnPixGetEndToEndId(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnPixGetEndToEndId(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnPixGetEndToEndId(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.PixDevolucaoSolicitar(sEndToEndId, sTXIDDev: string;
  dValor: Double);
var
  RequestStream : TStringStream ;
  JasonValor    : TRscJSONobject;
  vResponse     : TRespPixPutSD;

  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MsgErro         : string;
  sUrl            : string;
  sResponse       : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnPixPutSD(Self, nil, MsgErro);
      Exit;
    end;

  if  (Length(sEndToEndId) <= 0) then
    begin
      InOnPixPutSD(Self, nil, 'O endToEndId não informado ou inválido');
      Exit;
    end;


  if  (Length(sTXIDDev) <= 0) then
    begin
      InOnPixPutSD(Self, nil, 'O sTXIDDev não informado ou inválido');
      Exit;
    end;

  if  (dValor <= 0) then
    begin
      InOnPixPutSD(Self, nil, 'O dValor não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnPixPutSD(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  JasonValor  :=  TRscJSONobject.Create;
  JasonValor.AddPair('valor', StringReplace(FormatFloat('#0.00', dValor),',','.',[rfReplaceAll]));

  RequestStream   :=  TStringStream.Create(JasonValor.ToJson);
  RequestStream.Position := 0;

  vIdHTTP         :=  TIdHTTP.Create(nil);
  SSLHandler      :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi: vIdHTTP.Request.ContentType         :=  'application/json';
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.PixPut;
      sUrl := StringReplace(sUrl, '{e2eid}', sEndToEndId, [rfReplaceAll]);
      sUrl := StringReplace(sUrl, '{id}', sTXIDDev, [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        sResponse  :=  vIdHTTP.Put(sUrl, RequestStream);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse  :=  TRespPixPutSD.Create;
              try
                vResponse.LoadJson(sResponse);
                InOnPixPutSD(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnPixPutSD(Self, nil, sResponse);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) Then
              Begin
                InOnPixPutSD(Self, nil, E.ErrorMessage);
              End
            else
              begin
                InOnPixPutSD(Self, nil, E.Message);
              end;
          End;

        on E: Exception do
          begin
            InOnPixPutSD(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnPixPutSD(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    RequestStream.Free;
    JasonValor.Free;
  end;

end;

procedure TRscPix.PixDevolucaoConsultar(sEndToEndId, sTXIDDev: string);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  vResponse  : TRespPixPutSD;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnPixPutSD(Self, nil, MsgErro);
      Exit;
    end;

  if  (Length(sEndToEndId) <= 0) then
    begin
      InOnPixPutSD(Self, nil, 'O endToEndId não informado ou inválido');
      Exit;
    end;


  if  (Length(sTXIDDev) <= 0) then
    begin
      InOnPixPutSD(Self, nil, 'O sTXIDDev não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnPixPutSD(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

       sUrl := FPSP.URLAPI  + FPSP.EndPoints.PixGetCD;

       sUrl := StringReplace(sUrl, '{e2eid}', sEndToEndId, [rfReplaceAll]);
       sUrl := StringReplace(sUrl, '{id}', sTXIDDev, [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Get(sUrl, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse  := TRespPixPutSD.create;
              try
                vResponse.LoadJson(StrmBody.DataString);
                InOnPixPutSD(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnPixPutSD(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) Then
              Begin
                InOnPixPutSD(Self, nil, E.ErrorMessage);
              End
            else
              begin
                InOnPixPutSD(Self, nil, E.Message);
              end;
          End;

        on E: Exception do
          begin
            InOnPixPutSD(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnPixPutSD(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.PixListar(
                        dtData_Hora_Inicial: TDateTime;
                        dtData_Hora_Final: TDateTime;
                        txid: string;
                        txIdPresente: Boolean;
                        devolucaoPresente: Boolean;
                        cpf: string;
                        cnpj: string;
                        iPagIndex: integer;
                        iQtdItensPag: integer
                       );
var
  StrmResponse        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MyPixListRebPer     : TRequesteListar;
  RespListaRecebidos      : TRespPixListaRecebidos;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnPixListaRecebidos(Self, nil, MsgErro);
      Exit;
    end;

  MyPixListRebPer := TRequesteListar.Create;
  try
    try
      MyPixListRebPer.PSP           :=  FPSP.Psp;
      MyPixListRebPer.Data_Hora_Ini :=  dtData_Hora_Inicial;
      MyPixListRebPer.Data_Hora_Fim :=  dtData_Hora_Final;
      MyPixListRebPer.Index_Pag     :=  iPagIndex;

    except on E: Exception do
      begin
        InOnPixListaRecebidos(Self, nil, e.Message);
        Exit;
      end;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnPixListaRecebidos(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmResponse    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
//            vIdHTTP.Request.AcceptEncoding      :=  'gzip, deflate, br';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl := FPSP.URLAPI + FPSP.EndPoints.PixGetCPR +
          '?inicio=' + MyPixListRebPer.Data_Hora_Ini_ToStr  +
          '&fim='    + MyPixListRebPer.Data_Hora_Fim_ToStr;

      if Trim(txid) <> '' then
        sUrl := sUrl + '&txid=' + Trim(txid);

      if txIdPresente then
        sUrl := sUrl + '&txIdPresente=true';

      if devolucaoPresente then
        sUrl := sUrl + '&devolucaoPresente=true';

      if Trim(cpf) <> '' then
        sUrl := sUrl + '&cpf=' + Trim(cpf);

      if Trim(cnpj) <> '' then
        sUrl := sUrl + '&cnpj=' + Trim(cnpj);

      if MyPixListRebPer.Index_Pag > 0 then
        sUrl := sUrl + '&paginaAtual=' + IntToStr(MyPixListRebPer.Index_Pag);

      if (iQtdItensPag > 0) and (iQtdItensPag <= 100) then
        sUrl := sUrl + '&itensPorPagina=' + IntToStr(iQtdItensPag)
      else
        begin
          if (iQtdItensPag > 100)  then
            sUrl := sUrl + '&itensPorPagina=' + IntToStr(100);
        end;

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '&gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Get(sUrl, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              RespListaRecebidos  :=  TRespPixListaRecebidos.Create;
              try
                RespListaRecebidos.LoadJson(StrmResponse.DataString);
                InOnPixListaRecebidos(Self, RespListaRecebidos, '');
              finally
                RespListaRecebidos.Free;
              end;

            end;
        else
          InOnPixListaRecebidos(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnPixListaRecebidos(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnPixListaRecebidos(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnPixListaRecebidos(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
  end;
  finally
    MyPixListRebPer.Free;
  end;
end;

procedure TRscPix.LocationCriar(const TipoCobranca: TTipoCobranca);
var
  StrmResponse    : TStringStream ;
  RequestStrm     : TStringStream;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  sReqJson        : string;
  JsonEnviar     : TRscJSONobject;

  Response        : TRespLocPost;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnLocPost(Self, nil, MsgErro);
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnLocPost(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  JsonEnviar      := TRscJSONobject.Create;
  try
    case TipoCobranca of
      tcbCob: JsonEnviar.AddPair('tipoCob', 'cob');
      tcbCobV: JsonEnviar.AddPair('tipoCob', 'cobv');
    end;

    sReqJson  :=  JsonEnviar.ToJson;

  finally
    JsonEnviar.Free;
  end;

  RequestStrm :=  TStringStream.Create(sReqJson);
  StrmResponse:=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl := FPSP.URLAPI + FPSP.EndPoints.LocPost;

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:
          begin
            if FAutenticar.Application_key <> '' then
              sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspSantander:;
        pspBanRiSul,
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            vIdHTTP.Request.AcceptEncoding      :=  'gzip, deflate, br';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
      end;

      try
        vIdHTTP.Post(sUrl, RequestStrm, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              Response  :=  TRespLocPost.Create;
              try
                Response.LoadJson(StrmResponse.DataString);
                InOnLocPost(Self, Response, '');
              finally
                Response.Free;
              end;

            end;
        else
          InOnLocPost(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) and (E.ErrorCode <> 0) Then
              Begin
                InOnLocPost(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnLocPost(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnLocPost(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
    RequestStrm.Free;
  end;
end;

procedure TRscPix.LocationListarCadastrados(dtData_Hora_Inicial,
  dtData_Hora_Final: TDateTime; txIdPresente: Boolean; tipoCob: TTipoCobranca;
  iPagIndex, iQtdItensPag: integer);
var
  StrmResponse        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MyPixListRebPer : TRequesteListar;
  RespLocGet      : TRespLocList;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnLocConsultarList(Self, nil, MsgErro);
      Exit;
    end;

  MyPixListRebPer := TRequesteListar.Create;
  try
    try
      MyPixListRebPer.PSP           :=  FPSP.Psp;
      MyPixListRebPer.Data_Hora_Ini :=  dtData_Hora_Inicial;
      MyPixListRebPer.Data_Hora_Fim :=  dtData_Hora_Final;
      MyPixListRebPer.Index_Pag     :=  iPagIndex;

    except on E: Exception do
      begin
        InOnLocConsultarList(Self, nil, e.Message);
        Exit;
      end;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnLocConsultarList(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmResponse    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl := FPSP.URLAPI + FPSP.EndPoints.LocGet +
          '?inicio=' + MyPixListRebPer.Data_Hora_Ini_ToStr  +
          '&fim='    + MyPixListRebPer.Data_Hora_Fim_ToStr;

      if MyPixListRebPer.Index_Pag > 0 then
        sUrl := sUrl + '&paginaAtual=' + IntToStr(MyPixListRebPer.Index_Pag);

      if (iQtdItensPag > 0) and (iQtdItensPag <= 100) then
        sUrl := sUrl + '&itensPorPagina=' + IntToStr(iQtdItensPag);

      if txIdPresente then
        sUrl := sUrl + '&txIdPresente=true'
      else
        sUrl := sUrl + '&txIdPresente=false';

      case tipoCob of
        tcbCob  : sUrl := sUrl + '&tipoCob=cob';
        tcbCobV : sUrl := sUrl + '&tipoCob=cobv';
      end;

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:
          begin
            if FAutenticar.Application_key <> '' then
              sUrl := sUrl + '&gw-dev-app-key=' + FAutenticar.Application_key;
          end;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      try
        vIdHTTP.Get(sUrl, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              RespLocGet:=  TRespLocList.Create;
              try
                RespLocGet.LoadJson(StrmResponse.DataString);
                InOnLocConsultarList(Self, RespLocGet, '');
              finally
                RespLocGet.Free;
              end;

            end;
        else
          InOnLocConsultarList(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnLocConsultarList(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnLocConsultarList(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnLocConsultarList(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
  end;
  finally
    MyPixListRebPer.Free;
  end;
end;

procedure TRscPix.LocationId(locId: integer);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  ResultLocGet    : TRespLocGet;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnLocGetId(Self, nil, MsgErro);
      Exit;
    end;

  if  (locId <= 0) then
    begin
      InOnLocGetId(Self, nil, 'O locId não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnLocGetId(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            vIdHTTP.Request.AcceptEncoding      :=  'gzip, deflate, br';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.LocGetId;
      sUrl := StringReplace(sUrl, '{locId}', IntToStr(locId), [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        vIdHTTP.Get(sUrl, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              ResultLocGet:=  TRespLocGet.Create;
              try
                ResultLocGet.LoadJson(StrmBody.DataString);
                InOnLocGetId(Self, ResultLocGet, '');
              finally
                ResultLocGet.Free;
              end;

            end;
        else
          InOnLocGetId(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnLocGetId(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnLocGetId(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnLocGetId(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.LocationIdToQrCode(locId: integer);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  ResultLocGet    : TRespLocGetIdQrcode;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnLocGetIdQrCode(Self, nil, MsgErro);
      Exit;
    end;

  if  (locId <= 0) then
    begin
      InOnLocGetIdQrCode(Self, nil, 'O locId não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnLocGetIdQrCode(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.LocGetIdQrcode;
      sUrl := StringReplace(sUrl, '{locId}', IntToStr(locId), [rfReplaceAll]);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:
          begin
            sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.LocGetId;
            sUrl := StringReplace(sUrl, '{locId}', IntToStr(locId), [rfReplaceAll]);

            if FAutenticar.Application_key <> '' then
              sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;
          end;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      try
        vIdHTTP.Get(sUrl, StrmBody);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              ResultLocGet:=  TRespLocGetIdQrcode.Create;
              try
                ResultLocGet.LoadJson(StrmBody.DataString);
                InOnLocGetIdQrCode(Self, ResultLocGet, '');
              finally
                ResultLocGet.Free;
              end;

            end;
        else
          InOnLocGetIdQrCode(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnLocGetIdQrCode(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnLocGetIdQrCode(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnLocGetIdQrCode(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.LocationDesvincularTxId(locId: integer);
var
  StrmBody        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  vResponse       : TRespLocDelete;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnLocDelete(Self, nil, MsgErro);
      Exit;
    end;

  if  (locId <= 0) then
    begin
      InOnLocDelete(Self, nil, 'O locId não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnLocDelete(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmBody    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.LocDelete;
      sUrl := StringReplace(sUrl, '{locId}', IntToStr(locId), [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        case FPSP.Psp of
          pspSicredi,
          pspBancoDoBrasil,
          pspSantander,
          pspBradesco,
          pspSicoob,
          pspPagSeguro,
          pspItau,
          pspInter,
          pspBanRiSul,
          pspEfi:
            begin
              vIdHTTP.Delete(sUrl, StrmBody);
            end;
        end;

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse :=  TRespLocDelete.Create;
              try
                vResponse.LoadJson(StrmBody.DataString);
                InOnLocDelete(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnLocDelete(Self, nil, StrmBody.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnLocDelete(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnLocDelete(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnLocDelete(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmBody.Free;
  end;
end;

procedure TRscPix.WebhookListarCadastrados(dtData_Hora_Inicial,
  dtData_Hora_Final: TDateTime; iPagIndex, iQtdItensPag: integer);
var
  StrmResponse        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MyPixListRebPer : TRequesteListar;
  vResponse        : TRespWebhookListar;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnWebhookListar(Self, nil, MsgErro);
      Exit;
    end;

  MyPixListRebPer := TRequesteListar.Create;
  try
    try
      MyPixListRebPer.PSP           :=  FPSP.Psp;
      MyPixListRebPer.Data_Hora_Ini :=  dtData_Hora_Inicial;
      MyPixListRebPer.Data_Hora_Fim :=  dtData_Hora_Final;
      MyPixListRebPer.Index_Pag     :=  iPagIndex;

    except on E: Exception do
      begin
        InOnWebhookListar(Self, nil, e.Message);
        Exit;
      end;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnWebhookListar(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmResponse    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl := FPSP.URLAPI + FPSP.EndPoints.WebhookGetCWC +
          '?inicio=' + MyPixListRebPer.Data_Hora_Ini_ToStr  +
          '&fim='    + MyPixListRebPer.Data_Hora_Fim_ToStr;

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:
          begin
            if MyPixListRebPer.Index_Pag > 0 then
              sUrl := sUrl + '&paginaAtual=' + IntToStr(MyPixListRebPer.Index_Pag);

            if (iQtdItensPag > 0) and (iQtdItensPag <= 100) then
              sUrl := sUrl + '&itensPorPagina=' + IntToStr(iQtdItensPag);

            if FAutenticar.Application_key <> '' then
              sUrl := sUrl + '&gw-dev-app-key=' + FAutenticar.Application_key;
          end;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      try
        vIdHTTP.Get(sUrl, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse :=  TRespWebhookListar.Create;
              try
                vResponse.LoadJson(StrmResponse.DataString);
                InOnWebhookListar(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnWebhookListar(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnWebhookListar(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnWebhookListar(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnWebhookListar(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
  end;
  finally
    MyPixListRebPer.Free;
  end;
end;

procedure TRscPix.WebhookConfigurar(const webhookUrl: string);
var
  RequestStream : TStringStream ;
  vJsonEnviar    : TRscJSONobject;
  vResponse     : TRespWebhookPutDelete;

  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  MsgErro         : string;
  sUrl            : string;
  sResponse       : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnWebhookPut(Self, nil, MsgErro);
      Exit;
    end;

  if  (Length(webhookUrl) <= 0) then
    begin
      InOnWebhookPut(Self, nil, 'O webhookUrl não informado ou inválido');
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnWebhookPut(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  vJsonEnviar  :=  TRscJSONobject.Create;
  vJsonEnviar.AddPair('webhookUrl', Trim(webhookUrl));

  RequestStream   :=  TStringStream.Create(vJsonEnviar.ToJson);
  RequestStream.Position := 0;

  vIdHTTP         :=  TIdHTTP.Create(nil);
  SSLHandler      :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspBanRiSul,
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
      end;

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.WebhookPut;
      sUrl := StringReplace(sUrl, '{chave}', Trim(Titular.ChavePix), [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      try
        sResponse  :=  vIdHTTP.Put(sUrl, RequestStream);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse :=  TRespWebhookPutDelete.Create;
              try
                vResponse.response  :=  'Webhook para notificações acerca de Pix recebidos associados a um txid. Cadastrado com sucesso';
                InOnWebhookPut(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnWebhookPut(Self, nil, sResponse);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnWebhookPut(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnWebhookPut(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnWebhookPut(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    RequestStream.Free;
    vJsonEnviar.Free;
  end;
end;

procedure TRscPix.WebhookConsultar;
var
  StrmResponse        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  vResponse        : TRespWebhookGet;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnWebhookGet(Self, nil, MsgErro);
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnWebhookGet(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmResponse    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.WebhookGet;
      sUrl := StringReplace(sUrl, '{chave}', Trim(Titular.ChavePix), [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      try
        vIdHTTP.Get(sUrl, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201:
            begin
              vResponse :=  TRespWebhookGet.Create;
              try
                vResponse.LoadJson(StrmResponse.DataString);
                InOnWebhookGet(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnWebhookGet(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnWebhookGet(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnWebhookGet(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnWebhookGet(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
  end;
end;

procedure TRscPix.WebhookDesvincular;
var
  StrmResponse        : TStringStream ;
  vIdHTTP         : TIdHTTP;
  SSLHandler      : TIdSSLIOHandlerSocketOpenSSL;

  vResponse        : TRespWebhookPutDelete;
  MsgErro         : string;
  sUrl            : string;
begin
  if  not ValidaChavePix(MsgErro)  then
    begin
      InOnWebhookDelete(Self, nil, MsgErro);
      Exit;
    end;

  if  Token.AccessToken = '' then
    begin
      InOnWebhookDelete(Self, nil, 'AccessToken não informado: Use o evento -NovoToken para solicitar um novo token ao psp');
      Exit;
    end;

  StrmResponse    :=  TStringStream.Create('');
  vIdHTTP     := TIdHTTP.Create(nil);
  SSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      SSLHandler.SSLOptions.SSLVersions       :=  [sslvTLSv1_2];
      SSLHandler.SSLOptions.CertFile          :=  FCertificado.CertFile;
      SSLHandler.SSLOptions.KeyFile           :=  FCertificado.CertKeyFile;
      SSLHandler.SSLOptions.RootCertFile      :=  '';
      SSLHandler.Host                         := FPSP.UrlHostCert;
      SSLHandler.Port                         := 443;
      SSLHandler.SSLOptions.Mode              := sslmClient;
      SSLHandler.SSLOptions.Method            := sslvTLSv1_2;

      vIdHTTP.IOHandler := SSLHandler;
      vIdHTTP.Request.CustomHeaders.Clear;
      vIdHTTP.Request.ContentType         :=  'application/json; application/x-www-form-urlencoded; charset=UTF-8;';
      vIdHTTP.Request.UserAgent           :=  'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Maxthon; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)';
      vIdHTTP.Request.ContentEncoding     :=  '';
      vIdHTTP.Request.AcceptEncoding      :=  '';
      vIdHTTP.Request.Accept              :=  '*/*';
      vIdHTTP.ConnectTimeout              :=  20000;

      vIdHTTP.Request.BasicAuthentication :=  False;
      vIdHTTP.Request.CustomHeaders.AddValue('Authorization','Bearer ' + FToken.AccessToken);

      sUrl  :=  FPSP.UrlApi + FPSP.EndPoints.WebhookGet;
      sUrl := StringReplace(sUrl, '{chave}', Trim(Titular.ChavePix), [rfReplaceAll]);

     if FAutenticar.Application_key <> '' then
        sUrl := sUrl + '?gw-dev-app-key=' + FAutenticar.Application_key;

      case FPSP.Psp of
        pspSicredi:;
        pspBancoDoBrasil:;
        pspSantander:;
        pspBradesco,
        pspSicoob:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
            //vIdHTTP.Request.AcceptEncoding      :=  ' '; VERIFICAR NECESSIDADE DESSE AQUI
          end;
        pspEfi:
          begin
            vIdHTTP.Request.ContentType         :=  'application/json';
          end;
        pspPagSeguro:;
        pspItau:;
        pspInter:;
        pspBanRiSul:;
      end;

      try
        vIdHTTP.Delete(sUrl, StrmResponse);

        case vIdHTTP.ResponseCode of
          200, 201, 204:
            begin
              vResponse :=  TRespWebhookPutDelete.Create;
              try
                vResponse.response  :=  'Webhook para notificações Pix foi cancelado com sucesso';
                InOnWebhookDelete(Self, vResponse, '');
              finally
                vResponse.Free;
              end;

            end;
        else
          InOnWebhookDelete(Self, nil, StrmResponse.DataString);
        end;
      Except
        On E: EIdHTTPProtocolException Do
          Begin
            If (Length(E.ErrorMessage) > 0) or (E.ErrorCode <> 0) Then
              Begin
                InOnWebhookDelete(Self, nil, E.ErrorMessage);
              End;
          End;

        on E: Exception do
          begin
            InOnWebhookDelete(Self, nil, E.Message);
          end;
      end;

    except on E: Exception do
      begin
        InOnWebhookDelete(Self, nil, E.Message);
      end;
    end;
  finally
    vIdHTTP.Free;
    SSLHandler.Free;
    StrmResponse.Free;
  end;
end;

end.
