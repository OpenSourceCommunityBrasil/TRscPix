unit RscPix;

interface

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.SyncObjs,
  System.JSON, // ver se troca depois pelo RDW

  REST.Json,

  Winapi.Windows,

  IdHashMessageDigest,

  uDWResponseTranslator,
  ServerUtils,

  IdSSLOpenSSL

  ,uRscPix.Tipos
  ,uRscPix.Constantes
  ,uRscPix.Classes
  ,uRscPix.Variaveis
  ,uRscPix.Parametros
  ,uRscPix.funcoes
  ,uRscPix.Validations

  ;



type
  TRscPix = class(TComponent)
  protected
    FCertificado: TCertificado;
    FPIX: TPix;
    FDeveloper: TDeveloper;
    FPSP: TPSP;
    FPixCobranca: TPixCobranca;
    FToken: TToken;

  private

    DWCR_PIX: TDWClientREST;

    FInstanteGeradoToken: Cardinal;

    FRetorno: string;
    FResultado_Cod: Integer;
    Finfo_adicionais_Nome: String;
    Finfo_adicionais_Valor: String;
    FDevedor_Documento: String;
    FRecebidoTagPIX: Boolean;
    FResultado: TPix_Parametros;
    FDevedor_Nome: String;
    FDevedor_Documento_Tipo: TTipoPessoa;
    FPermiteCancelar: Boolean;
    FPermiteRevisar: Boolean;
    FDateConsutFinal: TDateTime;
    FDateConsutInicial: TDateTime;
    FOnGetStatusCobranca: TOnGetStatusCobranca;
    FResultadoErro: TRetornoErro;
    FResultadoErroPutToken: TRetornoErroPostToken;


    procedure SetDevedor_Documento(const Value: String);
    procedure SetDevedor_Documento_Tipo(const Value: TTipoPessoa);
    procedure SetDevedor_Nome(const Value: String);
    procedure Setinfo_adicionais_Nome(const Value: String);
    procedure Setinfo_adicionais_Valor(const Value: String);
    procedure SetRecebidoTagPIX(const Value: Boolean);
    procedure SetResultado(const Value: TPix_Parametros);
    procedure SetResultado_Cod(const Value: Integer);
    procedure SetRetorno(const Value: string);
    { Private declarations }

    Function GeraPayload:String;
    function GetValue(Id, Value: string): string;
    function GetUniquePayment: string;
    function GetMerchantAccountInformation: string;
    function GetAdditionalDataFieldTemplate: string;
    function GetCRC16(Payload: string): string;
    procedure SetPermiteCancelar(const Value: Boolean);
    procedure SetPermiteRevisar(const Value: Boolean);

    {========================================}
    procedure GetURLToken;
    procedure GetToToken;
    procedure SetDateConsutFinal(const Value: TDateTime);
    procedure SetDateConsutInicial(const Value: TDateTime);
    {========================================}

    {========================================}
    procedure InOnGetStatusCobranca(Sender : TObject; Const sStatus: String = '');
    procedure SetResultadoErro(const Value: TRetornoErro);
    procedure SetResultadoErroPutToken(const Value: TRetornoErroPostToken);
    procedure SetCertificado(const Value: TCertificado);
    procedure SetPIX(const Value: TPix);
    procedure SetDeveloper(const Value: TDeveloper);
    procedure SetPSP(const Value: TPSP);
    procedure SetPixCobranca(const Value: TPixCobranca);
    procedure SetToken(const Value: TToken);
    {========================================}

    {========================================}
    Function ValidaChavePix:  Boolean;
    {========================================}
  protected
    { Protected declarations }
  public
    { Public declarations }
  Constructor Create(AOwner   : TComponent);  Override;
  Destructor  Destroy;  Override;

  function GerarTXID: String;
  function GerarTXIDDEV: string;

  {========================================}
  procedure CriarCobranca;
  procedure RevisarCobranca(PixStatus : string);
  procedure ConsultarCobranca;
  procedure ConsultarListaPixsRecebidos;
  procedure ConsultarPixRecebido;
  procedure SolicitarDevolucaoPix;
  procedure ConsultarDevolucaoPix;
  {========================================}




    property Retorno                : string read FRetorno write SetRetorno;
    property Resultado_Cod          : Integer read FResultado_Cod write SetResultado_Cod;
    property Resultado              : TPix_Parametros read FResultado write SetResultado;
    property ResultadoErro          : TRetornoErro read FResultadoErro write SetResultadoErro;
    property ResultadoErroPutToken  : TRetornoErroPostToken read FResultadoErroPutToken write SetResultadoErroPutToken;

    property DateConsutInicial      : TDateTime read FDateConsutInicial write SetDateConsutInicial;
    property DateConsutFinal        : TDateTime read FDateConsutFinal write SetDateConsutFinal;

    property RecebidoTagPIX         : Boolean read FRecebidoTagPIX write SetRecebidoTagPIX;

    property PermiteRevisar         : Boolean read FPermiteRevisar write SetPermiteRevisar;
    property PermiteCancelar        : Boolean read FPermiteCancelar write SetPermiteCancelar;

    property Devedor_Nome           : String read FDevedor_Nome write SetDevedor_Nome;
    property Devedor_Documento      : String read FDevedor_Documento write SetDevedor_Documento;
    property Devedor_Documento_Tipo : TTipoPessoa read FDevedor_Documento_Tipo write SetDevedor_Documento_Tipo;

    property info_adicionais_Nome   : String read Finfo_adicionais_Nome write Setinfo_adicionais_Nome;
    property info_adicionais_Valor  : String read Finfo_adicionais_Valor write Setinfo_adicionais_Valor;


    property Token                  : TToken read FToken write SetToken;

  published
    { Published declarations }

    property Certificado                : TCertificado read FCertificado write SetCertificado;
    property PIX                        : TPix read FPIX write SetPIX;
    property PixCobranca                : TPixCobranca read FPixCobranca write SetPixCobranca;
    property Developer                  : TDeveloper read FDeveloper write SetDeveloper;
    property PSP                        : TPSP read FPSP write SetPSP;


    property OnOnGetStatusCobranca      : TOnGetStatusCobranca  read  FOnGetStatusCobranca write  FOnGetStatusCobranca;


  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Rsc', [TRscPix]);
end;

{ TPix }


procedure TRscPix.ConsultarCobranca;
var
  cURL    : string;
  nResp   : Integer;
  Stream  : TStringStream;
begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if PixCobranca.TXID = '' then
  begin
    Retorno := 'Campo do ID deve ser informado na transação.';
    InOnGetStatusCobranca(Self, Retorno);
    Exit;
  end;

  if Token.AcessToken = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    InOnGetStatusCobranca(Self, Retorno);
    Exit;
  end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := FPSP.URLAPI + '/cob/{txid}';
     cURL := StringReplace(cURL, '{txid}', PixCobranca.TXID, [rfReplaceAll]);

     if Developer.Application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     nResp := DWCR_PIX.Get(cURL,Nil,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto

          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);

          InOnGetStatusCobranca(Self, Resultado.status);
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);

         InOnGetStatusCobranca(Self, Retorno);
     end;

  finally
      Stream.Free;
  end;
end;

procedure TRscPix.ConsultarDevolucaoPix;
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if Token.AcessToken = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  if PixCobranca.E2eid = '' then
    begin
      Retorno := 'Erro endToEndId não Informado';
      Exit;
    end;

  if PixCobranca.TXIDDev = '' then
    begin
      Retorno := 'Erro ao TXIDDev Não Informado';
      Exit;
    end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := FPSP.URLAPI + '/pix/{e2eid}/devolucao/{id}';
     cURL := StringReplace(cURL, '{e2eid}', PixCobranca.E2eid, [rfReplaceAll]);
     cURL := StringReplace(cURL, '{id}', PixCobranca.TXIDDev, [rfReplaceAll]);

     if Developer.Application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     nResp := DWCR_PIX.Get(cURL,nil,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto
          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
         Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);
     end;

  finally
    Stream.Free;
  end;
end;

procedure TRscPix.ConsultarListaPixsRecebidos;
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
  JsonParams    : TJSONObject;
  RequestHeader : TStringList;
  JasonData     : TJSONObject;
begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if Token.AcessToken = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);
     RequestHeader  := TStringList.Create;

     {criando parametro de datas}
     JasonData  :=  TJSONObject.Create;
     JasonData.AddPair('inicio', FormatDateTime('yyyy-mm-dd hh:mm:ss -04:00', DateConsutInicial)); {Respeita RFC 3339}
     JasonData.AddPair('fim', FormatDateTime('yyyy-mm-dd hh:mm:ss -04:00', DateConsutFinal)); {Respeita RFC 3339}

     JsonParams := TJSONObject.Create;
     JsonParams.AddPair('parametros', JasonData);

     RequestHeader.Add(JsonParams.ToString);

     cURL := FPSP.URLAPI + '/pix';

     if Developer.Application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     nResp := DWCR_PIX.Get(cURL,nil,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);
          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
     end;

  finally
    Stream.Free;
    JsonParams.Free;
    RequestHeader.Free;
  end;
end;

procedure TRscPix.ConsultarPixRecebido;
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if Token.AcessToken = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := FPSP.URLAPI + '/pix/{e2eid}';
     cURL := StringReplace(cURL, '{e2eid}', PixCobranca.E2eid, [rfReplaceAll]);

     if Developer.Application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     nResp := DWCR_PIX.Get(cURL,nil,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto
          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
     end;

  finally
    Stream.Free;
  end;
end;

constructor TRscPix.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCertificado  :=  TCertificado.Create;
  FPIX          :=  TPix.Create;
  FDeveloper    :=  TDeveloper.Create;
  FPSP          :=  TPSP.Create;
  PixCobranca   :=  TPixCobranca.Create;
  Token         :=  TToken.Create;

  DWCR_PIX  :=  TDWClientREST.Create(Self);
  DWCR_PIX.ConnectTimeOut := 90000;
  DWCR_PIX.RequestTimeOut := 90000;


  Resultado_Cod := 0;

end;

procedure TRscPix.CriarCobranca;
var
  cURL         : string;
  cValor       : string;
  cdata        : string;

  borey        : string;

  JsonDevedor: TJsonObject;


   RequestBody : TStringList;

   nResp : Integer;

   Stream: TStringStream;

   JsonValor      : TJsonObject;
   JsonCalendario : TJsonObject;
   JsonEnviar     : TJSONObject;

   JSonInfoA      : TJSOnArray;
   JSonInfo       : TJSOnObject;

begin
  if not ValidaChavePix then
    exit;

  cValor := FormatFloat('#0.00',PixCobranca.Valor);

  if Pos(',', cValor) > 0 then
    cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);

  case PixCobranca.TipoQRCode of
    tqDinamico:
      begin
        if PixCobranca.TXID = '' then
          begin
            raise Exception.Create('Campo do TXID deve ser informado na transação.');
            Exit;
          end;

        GetURLToken;
        GetToToken;

        if Token.AcessToken = '' then
          begin
            raise Exception.Create('Erro ao Obter Acces Token:'  + #13#10 + Retorno);
            Exit;
          end;


        try
           Stream       := TStringStream.Create('', TEncoding.UTF8);
           RequestBody  := TStringList.Create;

           //Criando o Objeto Valor
           JsonValor := TJSONObject.Create;
           JsonValor.AddPair('original', cValor);

           //Criando o Objeto Calendario
           JsonCalendario := TJSONObject.Create;
           JsonCalendario.AddPair('expiracao', TJSONNumber.Create(PixCobranca.DuracaoMinutos * 60));//aqui é em segundo 3600 segundos = 1 h

           //Dados do Devedor
           if ((Devedor_Documento <> '') and (Devedor_Nome <> '')) then
           begin
              JsonDevedor := TJSONObject.Create;

              case Devedor_Documento_Tipo of
                pFisica   : JsonDevedor.AddPair('cpf', GetStrNumber(Devedor_Documento));
                pJuridica : JsonDevedor.AddPair('cnpj', GetStrNumber(Devedor_Documento));
              end;

              JsonDevedor.AddPair('nome', copy(TirarAcentoE(Devedor_Nome),1,200)); //<200
           end;

           //Info Adicionais - Não tenho necessidade de mais de uma informação, por isso vou deixar uma somente
           if ((info_adicionais_Nome <> '') and (info_adicionais_Valor <> '')) then
           begin
              JSonInfoA := TJSOnArray.Create;//Criando a Lista de Objetos
              JSonInfo  := TJSOnObject.Create;//Criando o Objeto

              JSonInfo.AddPair('nome',TirarAcentoE(info_adicionais_Nome));
              JSonInfo.AddPair('valor',TirarAcentoE(info_adicionais_Valor));

              JSonInfoA.AddElement(JSonInfo);//Adicionando o Objeto na Lista de Objetos
           end;

           //Montrando o Json a Enviar
           JsonEnviar := TJSOnObject.Create;//Criando o Objeto

           JsonEnviar.AddPair('calendario', JsonCalendario);
           if Assigned(JsonDevedor) then
              JsonEnviar.AddPair('devedor', JsonDevedor);
           JsonEnviar.AddPair('valor', JsonValor);

           JsonEnviar.AddPair('chave', PIX.ChavePix);

           JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(PixCobranca.Mensagem));

           if Assigned(JSonInfoA) then
              JsonEnviar.AddPair('info_adicionais', JSonInfoA);


           cdata := JsonEnviar.ToString;

           cURL := FPSP.URLApi + FPSP.EndPoint_Cob + 'rsc';
           cURL := StringReplace(cURL, '{txid}', PixCobranca.TXID, [rfReplaceAll]);

           if Developer.Application_key <> '' then
              cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;

           DWCR_PIX.ContentType  := 'application/json';
           DWCR_PIX.UseSSL       := True;
           DWCR_PIX.SSLVersions  := [sslvSSLv23];

           DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
           TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

           //body
           RequestBody.Add(JsonEnviar.ToString);//JSON

           Retorno := JsonEnviar.ToString;

           //exit;

           nResp := DWCR_PIX.Put(cURL,requestBody,Stream,false);

           borey := DWCR_PIX.DefaultCustomHeader.ToString;

          if ((nResp = 200) or (nResp = 201)) then
            begin
                Resultado_Cod := 200;
                Retorno := UTF8ToWideString(Stream.DataString);

                Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);

                if Resultado.textoImagemQRcode = '' then
                   Resultado.textoImagemQRcode := GeraPayload;

            end
          else
            begin
              Retorno       := UTF8ToWideString(Stream.DataString);
              ResultadoErro := TJson.JsonToObject<TRetornoErro>(Retorno);

              Resultado_Cod := 400;
            end;

        finally
          Stream.Free;
          RequestBody.Free;

          if Assigned(JsonEnviar) then
            JsonEnviar.Free;
        end;
      end;
    tqEstatico:
      begin
        Stream       := TStringStream.Create(JsonQRCodeStatico, TEncoding.UTF8);

        Retorno := UTF8ToWideString(Stream.DataString);

        Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);

        Resultado.txid  :=  PixCobranca.TXID;
        Resultado.chave :=  PIX.ChavePix;
        Resultado.valor  := StrToFloatDef(cValor, 0);
          borey := DWCR_PIX.DefaultCustomHeader.ToString;


        if Resultado.textoImagemQRcode = '' then
           Resultado.textoImagemQRcode := GeraPayload;

        Resultado_Cod := 200;
        Exit;
      end;
  end;
end;

destructor TRscPix.Destroy;
begin
  FCertificado.Free;
  FPIX.Free;
  FDeveloper.Free;
  FPSP.Free;
  PixCobranca.Free;
  Token.Free;

  if Assigned(FResultado) then
    begin
      FResultado.calendario.Free;
      FResultado.Recebedor.Free;
      FResultado.Free;
    end;

  if Assigned(FResultadoErro) then
    begin
      FResultadoErro.Free;
    end;




  DWCR_PIX.Free;
  inherited;
end;

function TRscPix.GeraPayload: String;
var
  Payload, cRecebedor, cValor : String;
begin


  case PixCobranca.TipoQRCode of
    tqDinamico: ;
    tqEstatico:
      begin
        cValor := FormatFloat('#0.00',PixCobranca.Valor);

        if Pos(',', cValor) > 0 then
          cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);

        Payload := GetValue(ID_PAYLOAD_FORMAT_INDICATOR,'01') +
    //               GetUniquePayment() +
                   GetMerchantAccountInformation() +
                   GetValue(ID_MERCHANT_CATEGORY_CODE,'0000') +
                   GetValue(ID_TRANSACTION_CURRENCY,'986') +
                   IfThen(lENGTH(cValor) > 0, GetValue(ID_TRANSACTION_AMOUNT, cValor), '') +
                   GetValue(ID_COUNTRY_CODE,'BR') +
                   GetValue(ID_MERCHANT_NAME,FPIX.NomeTitularConta) +
                   GetValue(ID_MERCHANT_CITY, FPIX.CidadeTitularConta) +
                   GetAdditionalDataFieldTemplate();
      end;
  end;

    Result := Payload + GetCRC16(Payload);
end;

function TRscPix.GerarTXID: String;
var
  Uid: TGuid;
  sFPixTXID : string;
begin
    CreateGUID(Uid);

    sFPixTXID := Uid.ToString;

    if Length(sFPixTXID) < 26 then
        StrZero(sFPixTXID, 26);

    sFPixTXID := MD5(sFPixTXID);

    Result  :=  sFPixTXID;
end;

function TRscPix.GerarTXIDDEV: string;
var
  Uid: TGuid;
  sTXIDDEV : string;
begin
    CreateGUID(Uid);

    sTXIDDEV := Uid.ToString;

    if Length(sTXIDDEV) < 26 then
        StrZero(sTXIDDEV, 26);

    sTXIDDEV := MD5(sTXIDDEV);

    Result  :=  sTXIDDEV;
end;

function TRscPix.GetAdditionalDataFieldTemplate: string;
var
  sTxId: string;
begin
  //TXID
  sTxId := GetValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID, PixCobranca.TXID);//fTxid
  //RETORNA O VALOR COMPLETO
  Result := GetValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE, sTxId);
end;

function TRscPix.GetCRC16(Payload: string): string;
begin
  //ADICIONA DADOS GERAIS NO PAYLOAD
  Payload := Payload + ID_CRC16 + '04';
  Result := ID_CRC16 + '04' + Inttohex(CRC16CCITT(Payload), 4);
end;

function TRscPix.GetMerchantAccountInformation: string;
var
  Gui: string;
  Key: string;
  Description: string;
  Url: string;
begin
  //DOMÍNIO DO BANCO
  Gui := GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_GUI,'br.gov.bcb.pix');
  //CHAVE PIX
  Key := IfThen(Length(FPIX.ChavePix) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_KEY, FPIX.ChavePix), '');

  case PixCobranca.TipoQRCode of
    tqDinamico:
      begin
        //DESCRIÇÃO DO PAGAMENTO
        Description := IfThen(Length(PixCobranca.Mensagem) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION, PixCobranca.Mensagem), '');

        //URL DO QR CODE DINÂMICO
        Url := IfThen(Length(Resultado.location) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_URL, Resultado.location), '');

        //VALOR COMPLETO DA CONTA
        Result  := GetValue(ID_MERCHANT_ACCOUNT_INFORMATION, Gui + Key + Description + Url);
      end;
    tqEstatico:
      begin
        //VALOR COMPLETO DA CONTA
        Result  := GetValue(ID_MERCHANT_ACCOUNT_INFORMATION, Gui + Key);
      end;
  end;
end;

procedure TRscPix.GetToToken;
var
  JsonResponse: TJSONObject;
  Stream: TStringStream;
  nResp : Integer;
  RequestBody : TStringList;
begin
  try
    RequestBody := TStringList.Create;

    Stream := TStringStream.Create('', TEncoding.UTF8);


    DWCR_PIX.ContentType      := 'application/x-www-form-urlencoded';

    DWCR_PIX.UseSSL       :=  True;
    DWCR_PIX.SSLMethod    :=  sslvSSLv23;
    DWCR_PIX.SSLVersions  :=  [sslvSSLv23];

    DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwOAuth;
    TRDWAuthOAuth(DWCR_PIX.AuthenticationOptions.OptionParams).ClientID      := FDeveloper.Client_ID;
    TRDWAuthOAuth(DWCR_PIX.AuthenticationOptions.OptionParams).ClientSecret  := FDeveloper.Client_Secret;

    fInstanteGeradoToken := GetTickCount;//pegando a hora que gerou o token

    case FPSP.TipoPsp of
      pspSicredi      : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');

                        end;
      pspBancoDoBrasil: begin //SAND BOX - OK
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');

                        end;
      pspSantander    : begin  //sANDbOX - OK
                            DWCR_PIX.Accept           := '*/*';
                            DWCR_PIX.AcceptEncoding   := 'gzip, deflate, br';
                            DWCR_PIX.ContentEncoding  := '';

                            FPSP.URLToken := FPSP.URLToken+'{param}';
                            FPSP.URLToken := StringReplace(FPSP.URLToken, '{param}', '?grant_type=client_credentials', [rfReplaceAll]);

                            RequestBody.Add('client_id='+FDeveloper.Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper.Client_Secret);

                        end;
      pspSicoob       : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('client_id='+FDeveloper.Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper.Client_Secret);
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');

                        end;
      pspBradesco     : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('Authorization = Basic '  {+ encodeBase64(client_id:client_secret)});
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');
                        end;
    end;

    DWCR_PIX.CertMode :=  sslmClient;
    DWCR_PIX.CertFile :=  Certificado.DiretorioCertificado;
    DWCR_PIX.HostCert :=  FPSP.UrlHostCert;
    DWCR_PIX.PortCert :=  443;//PADRAO
    DWCR_PIX.KeyFile  :=  Certificado.DiretorioCertificadoSenha;

//                            DWCR_PIX.CertMode := sslmClient;
//                            DWCR_PIX.CertFile := Certificado_Nome;
//                            DWCR_PIX.HostCert :=  FHostCert;
//                            DWCR_PIX.PortCert := 443;//PADRAO
//                            DWCR_PIX.KeyFile  := Certificado_Senha;



    try
      nResp := DWCR_PIX.Post(FPSP.URLToken,requestBody,Stream,false,False);
    Except on E:exception do
      begin
        Token.AcessToken    := '';
        Token.TokenType     := '';
        Token.Expires_in    := 0;
        Retorno :=  e.Message;
        Exit;
      end;
    end;

    if nResp = 200 then
      begin
        Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto

        JsonResponse := TJSONObject.ParseJsonValue(UTF8ToWideString(Stream.DataString)) as TJSONObject;

        Token.AcessToken    := JsonResponse.GetValue<string>('access_token');
        Token.TokenType     := JsonResponse.GetValue<string>('token_type');
        Token.Expires_in    := JsonResponse.GetValue<Integer>('expires_in');
      end
    else
      begin
        Retorno := UTF8ToWideString(Stream.DataString);
//        ResultadoErroPutToken := TJson.JsonToObject<TRetornoErroPostToken>(Retorno);
      end;

  finally
    Stream.Free;
    JsonResponse.Free;
    RequestBody.Free
  end;
end;

function TRscPix.GetUniquePayment: string;
begin
  Result := GetValue(ID_POINT_OF_INITIATION_METHOD,'12');
end;

procedure TRscPix.GetURLToken;
begin
  if FPSP.URLToken = '' then
    FPSP.URLToken := 'URL do Token deve ser informada.';
end;

function TRscPix.GetValue(Id, Value: string): string;
var Size:  Integer;
begin
  if Length(Value) < 2 then
    Value := StrZero(Value, 2);
  Size := Length(Value);

  Result := Id + IfThen(Size < 10, StrZero(Size.ToString, 2), Size.ToString) + Value;
end;

procedure TRscPix.InOnGetStatusCobranca(Sender: TObject; const sStatus: String);
begin
  if Assigned(FOnGetStatusCobranca) then
     FOnGetStatusCobranca(Sender, sStatus);
end;

procedure TRscPix.RevisarCobranca(PixStatus : string);
var
  cURL         : string;
  cValor       : string;
  cdata        : string;

  JsonDevedor: TJsonObject;

  RequestBody : TStringList;

  nResp : Integer;

  Stream: TStringStream;

  JsonValor      : TJsonObject;
  JsonCalendario : TJsonObject;
  JsonEnviar     : TJSONObject;

  JSonInfoA      : TJSOnArray;
  JSonInfo       : TJSOnObject;

begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if PixCobranca.TXID = '' then
  begin
    Retorno := 'Campo do ID deve ser informado na transação.';
    Exit;
  end;
  if PixStatus = '' then
  begin
    Retorno := 'Informe o Status para Alteração.';
    Exit;
  end;

  if Token.AcessToken = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  if ((PermiteRevisar = False) and (PixStatus = 'ATIVA')) then//Revisar - Atualizar
  begin
    Resultado_Cod := 00;
    Retorno := 'Este Banco não permite Atualizar a Cobrança!';
    Exit;
  end;

  if ((PermiteCancelar = False) and (PixStatus <> 'ATIVA')) then//Revisar - Atualizar
  begin
    Resultado_Cod := 00;
    Retorno := 'Este Banco não permite Cancelar a Cobrança!';
    Exit;
  end;


  cValor := FormatFloat('#0.00',PixCobranca.Valor);

  if Pos(',', cValor) > 0 then
    cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);
     RequestBody  := TStringList.Create;

     //Criando o Objeto Valor
     JsonValor := TJSONObject.Create;
     JsonValor.AddPair('original', cValor);

     //Criando o Objeto Calendario
     JsonCalendario := TJSONObject.Create;
     JsonCalendario.AddPair('expiracao', TJSONNumber.Create(PixCobranca.DuracaoMinutos * 60));//1800 30 minutos-86400 igual a 24 horas, aqui é em segundo 3600 segundos = 1 h

     //Dados do Devedor
     if ((Devedor_Documento <> '') and (Devedor_Nome <> '')) then
     begin
        JsonDevedor := TJSONObject.Create;

        case Devedor_Documento_Tipo of
          pFisica   : JsonDevedor.AddPair('cpf', GetStrNumber(Devedor_Documento));
          pJuridica : JsonDevedor.AddPair('cnpj', GetStrNumber(Devedor_Documento));
        end;

        JsonDevedor.AddPair('nome', TirarAcentoE(Devedor_Nome));
     end;

     //Info Adicionais - Não tenho necessidade de mais de uma informação, por isso vou deixar uma somente
     if ((info_adicionais_Nome <> '') and (info_adicionais_Valor <> '')) then
     begin
        JSonInfoA := TJSOnArray.Create;//Criando a Lista de Objetos
        JSonInfo  := TJSOnObject.Create;//Criando o Objeto

        JSonInfo.AddPair('nome',TirarAcentoE(info_adicionais_Nome));
        JSonInfo.AddPair('valor',TirarAcentoE(info_adicionais_Valor));

        JSonInfoA.AddElement(JSonInfo);//Adicionando o Objeto na Lista de Objetos
     end;

     //Montrando o Json a Enviar
     JsonEnviar := TJSOnObject.Create;//Criando o Objeto

     JsonEnviar.AddPair('status', PixStatus);
     JsonEnviar.AddPair('chave', FPIX.ChavePix);
     JsonEnviar.AddPair('calendario', JsonCalendario);
     if Assigned(JsonDevedor) then
        JsonEnviar.AddPair('devedor', JsonDevedor);
     JsonEnviar.AddPair('valor', JsonValor);
     JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(PixCobranca.Mensagem));

     if Assigned(JSonInfoA) then
        JsonEnviar.AddPair('info_adicionais', JSonInfoA);


     cdata := JsonEnviar.ToString;

     cURL := FPSP.URLApi + '/cob/{txid}';
     cURL := StringReplace(cURL, '{txid}', PixCobranca.TXID, [rfReplaceAll]);

     if FDeveloper.Application_key <> '' then
        cURL := cURL + '?gw-dev-app-key=' + FDeveloper.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     //body
     RequestBody.Add(JsonEnviar.ToString);//JSON

     fRetorno := JsonEnviar.ToString;

     nResp := DWCR_PIX.Patch(cURL,requestBody,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto

          Resultado := TJson.JsonToObject<TPix_Parametros>(fRetorno);
          if Resultado.textoImagemQRcode = '' then//gerar CMV
             Resultado.textoImagemQRcode := GeraPayload;
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
     end;

  finally

    if Assigned(JsonValor) then
        JsonValor.Free;

     if Assigned(JsonCalendario) then
        JsonCalendario.Free;

     if Assigned(JSonInfo) then
        JSonInfo.Free;

     if Assigned(JsonDevedor) then
        JsonDevedor.Free;

      Stream.Free;
  end;
end;

procedure TRscPix.SetCertificado(const Value: TCertificado);
begin
  FCertificado := Value;
end;

procedure TRscPix.SetDateConsutFinal(const Value: TDateTime);
begin
  FDateConsutFinal := Value;
end;

procedure TRscPix.SetDateConsutInicial(const Value: TDateTime);
begin
  FDateConsutInicial := Value;
end;

procedure TRscPix.SetDevedor_Documento(const Value: String);
begin
  FDevedor_Documento := Value;
end;

procedure TRscPix.SetDevedor_Documento_Tipo(const Value: TTipoPessoa);
begin
  FDevedor_Documento_Tipo := Value;

  case Value of
    pFisica:
      begin

      end;
    pJuridica:
      begin

      end;
  end;
end;

procedure TRscPix.SetDevedor_Nome(const Value: String);
begin
  FDevedor_Nome := Value;
end;

procedure TRscPix.SetDeveloper(const Value: TDeveloper);
begin
  FDeveloper := Value;
end;

procedure TRscPix.Setinfo_adicionais_Nome(const Value: String);
begin
  Finfo_adicionais_Nome := Value;
end;

procedure TRscPix.Setinfo_adicionais_Valor(const Value: String);
begin
  Finfo_adicionais_Valor := Value;
end;

procedure TRscPix.SetPermiteCancelar(const Value: Boolean);
begin
  FPermiteCancelar := Value;
end;

procedure TRscPix.SetPermiteRevisar(const Value: Boolean);
begin
  FPermiteRevisar := Value;
end;

procedure TRscPix.SetPIX(const Value: TPix);
begin
  FPIX := Value;
end;


procedure TRscPix.SetPixCobranca(const Value: TPixCobranca);
begin
  FPixCobranca := Value;
end;


procedure TRscPix.SetPSP(const Value: TPSP);
begin
  FPSP := Value;
end;

procedure TRscPix.SetRecebidoTagPIX(const Value: Boolean);
begin
  FRecebidoTagPIX := Value;
end;

procedure TRscPix.SetResultado(const Value: TPix_Parametros);
begin
  FResultado := Value;
end;

procedure TRscPix.SetResultadoErro(const Value: TRetornoErro);
begin
  FResultadoErro := Value;
end;

procedure TRscPix.SetResultadoErroPutToken(const Value: TRetornoErroPostToken);
begin
  FResultadoErroPutToken := Value;
end;

procedure TRscPix.SetResultado_Cod(const Value: Integer);
begin
  FResultado_Cod := Value;
end;

procedure TRscPix.SetRetorno(const Value: string);
begin
  FRetorno := Value;
end;

procedure TRscPix.SetToken(const Value: TToken);
begin
  FToken := Value;
end;

procedure TRscPix.SolicitarDevolucaoPix;
var
  cURL          : string;
  cValor        : string;
  nResp         : Integer;
  Stream        : TStringStream;
  JasonValor    : TJSONObject;
  RequestBody   : TStringList;
begin
  if not ValidaChavePix then
    exit;

  GetURLToken;
  GetToToken;

  if Token.AcessToken = '' then
    begin
      Retorno := 'Erro ao Obter Acces Token';
      Exit;
    end;

  if PixCobranca.E2eid = '' then
    begin
      Retorno := 'Erro endToEndId não Informado';
      Exit;
    end;

  if PixCobranca.TXIDDev = '' then
    begin
      Retorno := 'Erro ao TXIDDev Não Informado';
      Exit;
    end;

  if PixCobranca.Valor <= 0 then
    begin
      Retorno := 'Erro Valor Não Informado ou Inválido';
      Exit;
    end;


  cValor := FormatFloat('#0.00',PixCobranca.Valor);

  if Pos(',', cValor) > 0 then
    cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);


  try
    JasonValor  :=  TJSONObject.Create;
    JasonValor.AddPair('valor',  cValor);

    RequestBody := TStringList.Create;
    RequestBody.clear;

    RequestBody.Add(JasonValor.ToString);

     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := FPSP.URLAPI + '/pix/{e2eid}/devolucao/{id}';
     cURL := StringReplace(cURL, '{e2eid}', PixCobranca.E2eid, [rfReplaceAll]);
     cURL := StringReplace(cURL, '{id}', PixCobranca.TXIDDev, [rfReplaceAll]);

     if FDeveloper.Application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + FDeveloper.Application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

     nResp := DWCR_PIX.Put(cURL,RequestBody,Stream,false);

     if nResp = 200 then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto
          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);
     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
     end;

  finally
    RequestBody.Free;
    JasonValor.Free;
    Stream.Free;
  end;
end;


function TRscPix.ValidaChavePix: Boolean;
begin
  Result  :=  False;

  case PIX.TipoChavePix of
    tcCPF:
      begin
        if IsCPF(PIX.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada não é um CFP válido.');
          end;
      end;
    tcCNPJ:
      begin
        if IsCNPJ(PIX.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada não é um CNPJ válido.');
          end;
      end;
    tcTelefone:
      begin
        if IsCelular(PIX.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada não é um Nº de TELEFONE válido.');
          end;
      end;
    tcEmail:
      begin
        if IsEMail(PIX.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada não é um E-MAIL válido.');
          end;
      end;
    tcAleatoria:
      begin
        Result  :=  True;
      end;
  end;
end;

end.
