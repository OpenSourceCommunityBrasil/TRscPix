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

  ,uRscPix.Variaveis
  ,uRscPix.Parametros
  ,uRscPix.funcoes
  ,RscPix.Validations

  ;

type
  TRscPix = class(TComponent)
  private

    DWCR_PIX: TDWClientREST;

    FURLApi       : string;
    FHostCert     : string;
    FURLToken     : String;

    FCob          : String;

    FInstanteGeradoToken: Cardinal;

    FRetorno: string;
    FResultado_Cod: Integer;
    FPIXMensagem: String;
    Finfo_adicionais_Nome: String;
    Finfo_adicionais_Valor: String;
    FDevedor_Documento: String;
    FRecebidoTagPIX: Boolean;
    FResultado: TPix_Parametros;
    FDevedor_Nome: String;
    FDevedor_Documento_Tipo: TPessoa;
    FDeveloper_Client_ID: String;
    FDeveloper_Client_Secret: String;
    FPermiteCancelar: Boolean;
    FChavePixTipo: TTipoChavePIX;
    FCertificado_Senha: String;
    FChavePIX: String;
    FPSP: TPSP;
    FCertificado_Nome: String;
    FPermiteRevisar: Boolean;
    FDeveloper_application_key: String;
    FPspAmbiente: TTipoAmbiente;
    FPIXValor: Currency;
    FRecebedorCidade: String;
    FCNPJRecebedor: String;
    FPixTXID: String;
    FScope: string;
    FExpires_in: Integer;
    FAcess_token: string;
    FToken_type: string;
    FPixDuracaoMin: integer;
    FPixTipoQRCode: TTipoQrCode;
    FRecebedorNome: string;
    FPixE2eid: string;
    procedure SetDevedor_Documento(const Value: String);
    procedure SetDevedor_Documento_Tipo(const Value: TPessoa);
    procedure SetDevedor_Nome(const Value: String);
    procedure Setinfo_adicionais_Nome(const Value: String);
    procedure Setinfo_adicionais_Valor(const Value: String);
    procedure SetPIXMensagem(const Value: String);
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
    procedure SetCertificado_Nome(const Value: String);
    procedure SetCertificado_Senha(const Value: String);
    procedure SetChavePIX(const Value: String);
    procedure SetDeveloper_Client_ID(const Value: String);
    procedure SetDeveloper_Client_Secret(const Value: String);
    procedure SetCNPJRecebedor(const Value: String);
    procedure SetDeveloper_application_key(const Value: String);
    procedure SetPermiteCancelar(const Value: Boolean);
    procedure SetPermiteRevisar(const Value: Boolean);
    procedure SetRecebedorCidade(const Value: String);
    procedure SetPIXValor(const Value: Currency);
    procedure SetPSP(const Value: TPSP);
    procedure SetPspAmbiente(const Value: TTipoAmbiente);
    procedure SetChavePixTipo(const Value: TTipoChavePIX);
    procedure SetPixTXID(const Value: String);

    {========================================}
    function GerarTXID: String;
    procedure GetURLToken;
    procedure GetToToken;
    procedure SetAcess_token(const Value: string);
    procedure SetExpires_in(const Value: Integer);
    procedure SetScope(const Value: string);
    procedure SetToken_type(const Value: string);
    procedure SetPixDuracaoMin(const Value: integer);
    procedure SetPixTipoQRCode(const Value: TTipoQrCode);
    procedure SetRecebedorNome(const Value: string);
    procedure SetPixE2eid(const Value: string);
    {========================================}
  protected
    { Protected declarations }
  public
    { Public declarations }
  Constructor Create(AOwner   : TComponent);  Override;
  Destructor  Destroy;  Override;

  {========================================}
  procedure CriarCobranca;
  procedure RevisarCobranca(cTXID,cStatus:String);
  procedure ConsultarCobranca(TXID:String);
  procedure ConsultarListaPixsRecebidos(DtIni: TDateTime; DtFim: TDateTime; sTXID: string = ''; sCPF: string = ''; sCNPJ: string = '');
  procedure ConsultarPixRecebido(e2eid:String);
  procedure SolicitarDevolucaoPix(e2eid, TxIDDev:String);
  procedure ConsultarDevolucaoPix(e2eid, TxIDDev:String);
  {========================================}


    property Acess_token            : string read FAcess_token write SetAcess_token;

    property Retorno                : string read FRetorno write SetRetorno;
    property Resultado_Cod          : Integer read FResultado_Cod write SetResultado_Cod;
    property Resultado              : TPix_Parametros read FResultado write SetResultado;

    property Expires_in             : Integer read FExpires_in write SetExpires_in;
    property Token_type             : string read FToken_type write SetToken_type;
    property Scope                  : string read FScope write SetScope;

    property PixMensagem            : String read FPIXMensagem write SetPIXMensagem;
    property PixValor               : Currency read FPIXValor write SetPIXValor;
    property PixDuracaoMin          : integer read FPixDuracaoMin write SetPixDuracaoMin Default 30;
    property PixTipoQRCode          : TTipoQrCode read FPixTipoQRCode write SetPixTipoQRCode;
    property PixTXID                : String read FPixTXID write SetPixTXID;
    property PixE2eid               : string read FPixE2eid write SetPixE2eid;

    property RecebidoTagPIX         : Boolean read FRecebidoTagPIX write SetRecebidoTagPIX;

    property PermiteRevisar         : Boolean read FPermiteRevisar write SetPermiteRevisar;
    property PermiteCancelar        : Boolean read FPermiteCancelar write SetPermiteCancelar;

    property Devedor_Nome           : String read FDevedor_Nome write SetDevedor_Nome;
    property Devedor_Documento      : String read FDevedor_Documento write SetDevedor_Documento;
    property Devedor_Documento_Tipo : TPessoa read FDevedor_Documento_Tipo write SetDevedor_Documento_Tipo;

    property info_adicionais_Nome   : String read Finfo_adicionais_Nome write Setinfo_adicionais_Nome;
    property info_adicionais_Valor  : String read Finfo_adicionais_Valor write Setinfo_adicionais_Valor;

  published
    { Published declarations }

    property ChavePIX                   : String read FChavePIX write SetChavePIX;
    property ChavePixTipo               : TTipoChavePIX read FChavePixTipo write SetChavePixTipo;

    property Certificado_Nome           : String read FCertificado_Nome write SetCertificado_Nome;
    property Certificado_Senha          : String read FCertificado_Senha write SetCertificado_Senha;

    property Developer_application_key  : String read FDeveloper_application_key write SetDeveloper_application_key;
    property Developer_Client_ID        : String read FDeveloper_Client_ID write SetDeveloper_Client_ID;
    property Developer_Client_Secret    : String read FDeveloper_Client_Secret write SetDeveloper_Client_Secret;

    property RecebedorNome              : string read FRecebedorNome write SetRecebedorNome;
    property RecebedorCidade            : String read FRecebedorCidade write SetRecebedorCidade;

    property Psp                        : TPSP read FPSP write SetPSP;
    property PspAmbiente                : TTipoAmbiente read FPspAmbiente write SetPspAmbiente;

    property CNPJRecebedor              : String read FCNPJRecebedor write SetCNPJRecebedor; {Ver o que fazer com esse cara}


  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Rsc', [TRscPix]);
end;

{ TPix }


procedure TRscPix.ConsultarCobranca(TXID: String);
var
  cURL    : string;
  nResp   : Integer;
  Stream  : TStringStream;
begin
  GetURLToken;
  GetToToken;

  if TXId = '' then
  begin
    Retorno := 'Campo do ID deve ser informado na transação.';
    Exit;
  end;

  if fAcess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := fURLAPI + '/cob/{txid}';
     cURL := StringReplace(cURL, '{txid}', TXId, [rfReplaceAll]);

     if Developer_application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

     nResp := DWCR_PIX.Get(cURL,Nil,Stream,false);

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

procedure TRscPix.ConsultarDevolucaoPix(e2eid, TxIDDev: String);
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
begin
  GetURLToken;
  GetToToken;

  if fAcess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

    TxIDDev :=  IntToStr(Random(123456));

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := fURLAPI + '/pix/{e2eid}/devolucao/{id}';
     cURL := StringReplace(cURL, '{e2eid}', e2eid, [rfReplaceAll]);
     cURL := StringReplace(cURL, '{id}', TxIDDev, [rfReplaceAll]);

     if Developer_application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

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

procedure TRscPix.ConsultarListaPixsRecebidos(DtIni: TDateTime; DtFim: TDateTime; sTXID: string = ''; sCPF: string = ''; sCNPJ: string = '');
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
  JsonParams    : TJSONObject;
  RequestHeader : TStringList;
  JasonData     : TJSONObject;
begin
  GetURLToken;
  GetToToken;

  if fAcess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  try
    sTXID   := 'eoYL9bJFneAWWQcqu8gkPyUXFFoXFUHBzkW';
    sCPF    :=  '';
    sCNPJ   :=  '';


     Stream       := TStringStream.Create('', TEncoding.UTF8);
     RequestHeader  := TStringList.Create;

     {criando parametro de datas}
     JasonData  :=  TJSONObject.Create;
     JasonData.AddPair('inicio', FormatDateTime('yyyy-mm-dd hh:mm:ss -04:00', DtIni)); {Respeita RFC 3339}
     JasonData.AddPair('fim', FormatDateTime('yyyy-mm-dd hh:mm:ss -04:00', DtFim)); {Respeita RFC 3339}

     JsonParams := TJSONObject.Create;
     JsonParams.AddPair('parametros', JasonData);

     RequestHeader.Add(JsonParams.ToString);

     cURL := fURLAPI + '/pix';

     if Developer_application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

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

procedure TRscPix.ConsultarPixRecebido(e2eid: String);
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
begin
  GetURLToken;
  GetToToken;

  if fAcess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := fURLAPI + '/pix/{e2eid}';
     cURL := StringReplace(cURL, '{e2eid}', e2eid, [rfReplaceAll]);

     if Developer_application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

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

  DWCR_PIX  :=  TDWClientREST.Create(Self);
  DWCR_PIX.ConnectTimeOut := 90000;
  DWCR_PIX.RequestTimeOut := 90000;

  PixValor  := 0;

  //Inicializando as variaveis
  FURLToken     := '';
  fAcess_token  := '';
  FChavePIX     := '';
  FDeveloper_Client_ID    := '';
  FDeveloper_Client_Secret:= '';
  FPixTXID         := '';

  fCertificado_Nome := '';
  fCertificado_Senha:= '';

  Resultado_Cod := 0;

end;

procedure TRscPix.CriarCobranca;
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
  PixTXID  :=  GerarTXID;

  cValor := FormatFloat('#0.00',PIXValor);

  if Pos(',', cValor) > 0 then
    cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);

  case PixTipoQRCode of
    tqDinamico: ;
    tqEstatico:
      begin
        try

        finally

        end;
        Stream       := TStringStream.Create(JsonQRCodeStatico, TEncoding.UTF8);

        Retorno := UTF8ToWideString(Stream.DataString);

        Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);

        Resultado.txid  :=  PixTXID;
        Resultado.chave :=  ChavePIX;
        Resultado.valor  := StrToFloatDef(cValor, 0);


        if Resultado.textoImagemQRcode = '' then
           Resultado.textoImagemQRcode := GeraPayload;

        Resultado_Cod := 200;
        Exit;
      end;
  end;

  GetURLToken;
  GetToToken;


  if PixTXID = '' then
    begin
      Retorno := 'Campo do ID deve ser informado na transação.';
      Exit;
    end;

  if Acess_token = '' then
    begin
      Retorno := 'Erro ao Obter Acces Token'  + #13#10 + FURLToken;
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
     JsonCalendario.AddPair('expiracao', TJSONNumber.Create(PixDuracaoMin * 60));//aqui é em segundo 3600 segundos = 1 h

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

     JsonEnviar.AddPair('chave', ChavePIX);

     JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(PIXMensagem));

     if Assigned(JSonInfoA) then
        JsonEnviar.AddPair('info_adicionais', JSonInfoA);


     cdata := JsonEnviar.ToString;

     cURL := FURLApi + FCob;
     cURL := StringReplace(cURL, '{txid}', PixTXID, [rfReplaceAll]);

     if Developer_application_key <> '' then
        cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvSSLv23];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

     //body
     RequestBody.Add(JsonEnviar.ToString);//JSON

     Retorno := JsonEnviar.ToString;

     //exit;

     nResp := DWCR_PIX.Put(cURL,requestBody,Stream,false);

     if ((nResp = 200) or (nResp = 201)) then
     begin
          Resultado_Cod := 200;
          Retorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto

          Resultado := TJson.JsonToObject<TPix_Parametros>(Retorno);

          if Resultado.textoImagemQRcode = '' then
             Resultado.textoImagemQRcode := GeraPayload;

     end
     else
     begin
         Resultado_Cod := 400;
         Retorno := UTF8ToWideString(Stream.DataString);
     end;

  finally
    Stream.Free;
    RequestBody.Free;

    if Assigned(JsonEnviar) then
      JsonEnviar.Free;
//
//    if Assigned(JsonValor) then
//        JsonValor.Free;
//
//    if Assigned(JsonCalendario) then
//        JsonCalendario.Free;
//
//    if Assigned(JsonDevedor) then
//        JsonDevedor.Free;
//
//    if Assigned(JSonInfo) then
//        JSonInfo.Free;
//
//    if Assigned(JSonInfoA) then
//      JSonInfoA.Free;
  end;
end;

destructor TRscPix.Destroy;
begin
  if Assigned(FResultado) then
    begin
//      FResultado.valor.Free;
      FResultado.calendario.Free;
      FResultado.Recebedor.Free;
      FResultado.Free;
    end;


  DWCR_PIX.Free;
  inherited;
end;

function TRscPix.GeraPayload: String;
var
  Payload, cRecebedor, cValor : String;
begin


  case PixTipoQRCode of
    tqDinamico: ;
    tqEstatico:
      begin
        cValor := FormatFloat('#0.00',PIXValor);

        if Pos(',', cValor) > 0 then
          cValor := StringReplace(cValor, ',', '.', [rfReplaceAll]);

        Payload := GetValue(ID_PAYLOAD_FORMAT_INDICATOR,'01') +
    //               GetUniquePayment() +
                   GetMerchantAccountInformation() +
                   GetValue(ID_MERCHANT_CATEGORY_CODE,'0000') +
                   GetValue(ID_TRANSACTION_CURRENCY,'986') +
                   IfThen(lENGTH(cValor) > 0, GetValue(ID_TRANSACTION_AMOUNT, cValor), '') +
                   GetValue(ID_COUNTRY_CODE,'BR') +
                   GetValue(ID_MERCHANT_NAME,RecebedorNome) +
                   GetValue(ID_MERCHANT_CITY, RecebedorCidade) +
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

function TRscPix.GetAdditionalDataFieldTemplate: string;
var
  sTxId: string;
begin
  //TXID
  sTxId := GetValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID, PixTXID);//fTxid
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
  Key := IfThen(Length(ChavePIX) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_KEY, ChavePIX), '');

  case PixTipoQRCode of
    tqDinamico:
      begin
        //DESCRIÇÃO DO PAGAMENTO
        Description := IfThen(Length(PixMensagem) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION, PixMensagem), '');

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

    DWCR_PIX.UseSSL       := True;
//    DWCR_PIX.VerifyCert   := True;
    DWCR_PIX.SSLVersions  := [sslvSSLv23];
//    DWCR_PIX.SSLMethod    :=  sslvSSLv2;

    DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwOAuth;
    TRDWAuthOAuth(DWCR_PIX.AuthenticationOptions.OptionParams).ClientID      := FDeveloper_Client_ID;
    TRDWAuthOAuth(DWCR_PIX.AuthenticationOptions.OptionParams).ClientSecret  := FDeveloper_Client_Secret;

    fInstanteGeradoToken := GetTickCount;//pegando a hora que gerou o token


    case FPSP of
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

                            FURLToken := FURLToken+'{param}';
                            FURLToken := StringReplace(FURLToken, '{param}', '?grant_type=client_credentials', [rfReplaceAll]);

                            RequestBody.Add('client_id='+FDeveloper_Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper_Client_Secret);

                            //fCertificado_Nome := 'D:\PIX DOCUMENTOS\0-Certificado_GiGa\giga.pem';
                            //fCertificado_Senha:= 'D:\PIX DOCUMENTOS\0-Certificado_GiGa\giga_dec.key';


                            DWCR_PIX.CertMode := sslmClient;
                            DWCR_PIX.CertFile := Certificado_Nome;
                            DWCR_PIX.HostCert := 'https://trust-pix-h.santander.com.br';
                            DWCR_PIX.PortCert := 443;//PADRAO
                            DWCR_PIX.KeyFile  := Certificado_Senha;

                        end;
      pspSicoob       : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('client_id='+FDeveloper_Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper_Client_Secret);
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');


                        end;
      pspBradesco     : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('Authorization = Basic '  {+ encodeBase64(client_id:client_secret)});
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');


                        end;
    end;



    try
      nResp := DWCR_PIX.Post(FURLToken,requestBody,Stream,false,False);
    Except
        Acess_token  := '';
        Token_type   := '';
        Expires_in   := 0;;
        Exit;
    end;

    if nResp = 200 then
    begin
        fRetorno := UTF8ToWideString(Stream.DataString);//para poder analisar se esta correto

        JsonResponse := TJSONObject.ParseJsonValue(UTF8ToWideString(Stream.DataString)) as TJSONObject;

        Acess_token  := JsonResponse.GetValue<string>('access_token');
        Token_type   := JsonResponse.GetValue<string>('token_type');
        Expires_in   := JsonResponse.GetValue<Integer>('expires_in');
    end
    else
       Retorno := UTF8ToWideString(Stream.DataString);

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
  if FPspAmbiente = taSandBox then
  begin
    case FPSP of
                        {============================================}
      pspSicredi      : begin
                          FURLToken       := 'https://api-pix-h.sicredi.com.br/oauth/token';  //pode ser diferente a URL do TOKEN para URL de consumo API
                          FURLAPI         := '';

                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken     := '';
                          FURLAPI       := '';
                          FCob          := '/cobqrcode/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken       := 'https://pix.santander.com.br/sandbox/oauth/token';
                          FURLAPI         := 'https://pix.santander.com.br/api/v1/sandbox';
                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := True;

                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken       := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI         := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := True;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken     := '';
                          FURLAPI       := '';
                          FCob          := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
    end;
  end
  else if FPspAmbiente = taHomologacao then
  begin
    case FPSP of
                        {============================================}
      pspSicredi      : begin
                          FURLToken       := 'https://api-pix-h.sicredi.com.br/oauth/token';  //pode ser diferente a URL do TOKEN para URL de consumo API
                          FURLAPI         := 'https://api-pix-h.sicredi.com.br/v2';
                          FHostCert       := 'https://api-pix-h.sicredi.com.br';

                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspBancoDoBrasil: begin
                          FURLToken     := 'https://oauth.hm.bb.com.br/oauth/token';
                          FURLAPI       := 'https://api.hm.bb.com.br/pix/v1';
                          FCob          := '/cobqrcode/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspSantander:     begin
                          FURLToken       := 'https://trust-pix-h.santander.com.br/oauth/token';
                          FURLAPI         := 'https://trust-pix-h.santander.com.br/api/v1';
                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := True;

                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspSicoob:        begin
                          FURLToken       := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI         := 'https://api-homol.sicoob.com.br/cooperado/pix/api/v2';
                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := True;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken     := 'https://qrpix-h.bradesco.com.br/auth/server/oauth/token';
                          FURLAPI       := '';
                          FCob          := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
    end;
  end
  else if FPspAmbiente = taProducao then
  begin
    case FPSP of
                        {============================================}
      pspSicredi      : begin
                          FURLToken     := 'https://api-pix.sicredi.com.br/v2/oauth/token';
                          FURLAPI       := 'https://api-pix.sicredi.com.br';
                          FHostCert     := 'https://api-pix.sicredi.com.br';

                          FCob          := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {===========================================}
      pspBancoDoBrasil: begin
                          FURLToken     := '';
                          FURLAPI       := '';
                          FCob          := '/cobqrcode/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspSantander    : begin
                          FURLToken       := 'https://trust-pix.santander.com.br/oauth/token';
                          FURLAPI         := 'https://trust-pix.santander.com.br/api/v1';

                          FCob          := '/cob/{txid}';
                          fRecebidoTagPIX := True;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
       pspSicoob:       begin
                          FURLToken       := 'https://api-homol.sicoob.com.br/cooperado/pix/token';
                          FURLAPI         := 'https://apis.sisbr.com.br/cooperado/pix/api/v2/';
                          FCob            := '/cob/{txid}';
                          fRecebidoTagPIX := True;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
      pspBradesco     : begin
                          FURLToken     := '';
                          FURLAPI       := '';
                          FCob          := '/cob/{txid}';
                          fRecebidoTagPIX := False;
                          fPermiteRevisar := False;
                          fPermiteCancelar  := False;
                        end;
                        {============================================}
    end;
  end;

  if FURLToken = '' then
    FURLToken := 'URL do Token deve ser informada.';
end;

function TRscPix.GetValue(Id, Value: string): string;
var Size:  Integer;
begin
  if Length(Value) < 2 then
    Value := StrZero(Value, 2);
  Size := Length(Value);

  Result := Id + IfThen(Size < 10, StrZero(Size.ToString, 2), Size.ToString) + Value;
end;

procedure TRscPix.RevisarCobranca(cTXID, cStatus: String);
var
  cURL         : string;
  cValor       : string;
  cdata        : string;

//  DataToSend    : TStringStream;
//  sRetorno       : TStringStream;

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
  GetURLToken;
  GetToToken;

  if cTXId = '' then
  begin
    Retorno := 'Campo do ID deve ser informado na transação.';
    Exit;
  end;
  if cStatus = '' then
  begin
    Retorno := 'Informe o Status para Alteração.';
    Exit;
  end;

  if Acess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

  if ((PermiteRevisar = False) and (cStatus = 'ATIVA')) then//Revisar - Atualizar
  begin
    Resultado_Cod := 00;
    Retorno := 'Este Banco não permite Atualizar a Cobrança!';
    Exit;
  end;

  if ((PermiteCancelar = False) and (cStatus <> 'ATIVA')) then//Revisar - Atualizar
  begin
    Resultado_Cod := 00;
    Retorno := 'Este Banco não permite Cancelar a Cobrança!';
    Exit;
  end;


  cValor := FormatFloat('#0.00',PIXValor);

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
     JsonCalendario.AddPair('expiracao', TJSONNumber.Create(1800));//1800 30 minutos-86400 igual a 24 horas, aqui é em segundo 3600 segundos = 1 h

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

     JsonEnviar.AddPair('status', cStatus);
     JsonEnviar.AddPair('chave', ChavePIX);
     JsonEnviar.AddPair('calendario', JsonCalendario);
     if Assigned(JsonDevedor) then
        JsonEnviar.AddPair('devedor', JsonDevedor);
     JsonEnviar.AddPair('valor', JsonValor);
     JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(PIXMensagem));

     if Assigned(JSonInfoA) then
        JsonEnviar.AddPair('info_adicionais', JSonInfoA);


     cdata := JsonEnviar.ToString;

     cURL := FURLApi + '/cob/{txid}';
     cURL := StringReplace(cURL, '{txid}', cTXId, [rfReplaceAll]);

     if Developer_application_key <> '' then
        cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

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

procedure TRscPix.SetAcess_token(const Value: string);
begin
  FAcess_token := Value;
end;

procedure TRscPix.SetCertificado_Nome(const Value: String);
begin
  FCertificado_Nome := Value;
end;

procedure TRscPix.SetCertificado_Senha(const Value: String);
begin
  FCertificado_Senha := Value;
end;

procedure TRscPix.SetChavePIX(const Value: String);
begin
  case ChavePixTipo of
    tcCPF:
      begin
        if IsCPF(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave informada não é um CFP válido.');
          end;
      end;
    tcCNPJ:
      begin
        if IsCNPJ(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave informada não é um CNPJ válido.');
          end;
      end;
    tcTelefone:
      begin
        if IsCelular(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave informada não é um Nº de TELEFONE válido.');
          end;
      end;
    tcEmail:
      begin
        if IsEMail(Value) then
          begin
            FChavePIX := Value;
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave informada não é um E-MAIL válido.');
          end;
      end;
    tcAleatoria:
      begin
        FChavePIX := Value;
      end;
  end;
end;

procedure TRscPix.SetDeveloper_Client_ID(const Value: String);
begin
  FDeveloper_Client_ID := Value;
end;

procedure TRscPix.SetDeveloper_Client_Secret(const Value: String);
begin
  FDeveloper_Client_Secret := Value;
end;

procedure TRscPix.SetCNPJRecebedor(const Value: String);
begin
  FCNPJRecebedor := Value;
end;

procedure TRscPix.SetDevedor_Documento(const Value: String);
begin
  FDevedor_Documento := Value;
end;

procedure TRscPix.SetDevedor_Documento_Tipo(const Value: TPessoa);
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

procedure TRscPix.SetDeveloper_application_key(const Value: String);
begin
  FDeveloper_application_key := Value;
end;

procedure TRscPix.SetExpires_in(const Value: Integer);
begin
  FExpires_in := Value;
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

procedure TRscPix.SetRecebedorCidade(const Value: String);
begin
  FRecebedorCidade := Value;
end;

procedure TRscPix.SetPixDuracaoMin(const Value: integer);
begin
  FPixDuracaoMin := Value;
end;

procedure TRscPix.SetPixE2eid(const Value: string);
begin
  FPixE2eid := Value;
end;

procedure TRscPix.SetPIXMensagem(const Value: String);
begin
  FPIXMensagem := Value;
end;

procedure TRscPix.SetRecebedorNome(const Value: string);
begin
  FRecebedorNome := Value;
end;

procedure TRscPix.SetPixTipoQRCode(const Value: TTipoQrCode);
begin
  FPixTipoQRCode := Value;

  case value of
    tqDinamico:
      begin
        case PSP of
          pspSicredi: ;
          pspBancoDoBrasil:
            begin
              case PspAmbiente of
                taSandBox: ;
                taHomologacao:
                  begin
                    ChavePIX  :=  '28779295827';
                    ChavePixTipo  :=  tcCPF;
                  end;
                taProducao: ;
              end;
            end;
          pspBradesco: ;
          pspSantander: ;
          pspSicoob: ;
        end;
      end;
    tqEstatico:
      begin
        case PSP of
          pspSicredi: ;
          pspBancoDoBrasil:
            begin
              case PspAmbiente of
                taSandBox: ;
                taHomologacao:
                  begin
                    ChavePIX  :=  '01110826257'; {chave pix cpf Roniery}
                    ChavePixTipo  :=  tcCPF;
                  end;
                taProducao: ;
              end;
            end;
          pspBradesco: ;
          pspSantander: ;
          pspSicoob: ;
        end;
      end;
  end;

end;

procedure TRscPix.SetPIXValor(const Value: Currency);
begin
  FPIXValor := Value;
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

procedure TRscPix.SetResultado_Cod(const Value: Integer);
begin
  FResultado_Cod := Value;
end;

procedure TRscPix.SetRetorno(const Value: string);
begin
  FRetorno := Value;
end;

procedure TRscPix.SetScope(const Value: string);
begin
  FScope := Value;
end;

procedure TRscPix.SetPspAmbiente(const Value: TTipoAmbiente);
begin
  FPspAmbiente := Value;
end;

procedure TRscPix.SetChavePixTipo(const Value: TTipoChavePIX);
begin
  FChavePixTipo := Value;

  if ChavePIX <> EmptyStr then
    ChavePIX  :=  ChavePIX;
end;

procedure TRscPix.SetToken_type(const Value: string);
begin
  FToken_type := Value;
end;

procedure TRscPix.SolicitarDevolucaoPix(e2eid, TxIDDev: String);
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
begin
  GetURLToken;
  GetToToken;

  if fAcess_token = '' then
  begin
    Retorno := 'Erro ao Obter Acces Token';
    Exit;
  end;

    TxIDDev :=  IntToStr(Random(123456));

  try
     Stream       := TStringStream.Create('', TEncoding.UTF8);

     cURL := fURLAPI + '/pix/{e2eid}/devolucao/{id}';
     cURL := StringReplace(cURL, '{e2eid}', e2eid, [rfReplaceAll]);
     cURL := StringReplace(cURL, '{id}', TxIDDev, [rfReplaceAll]);

     if Developer_application_key <> '' then
         cURL := cURL + '?gw-dev-app-key=' + Developer_application_key;

     DWCR_PIX.ContentType  := 'application/json';
     DWCR_PIX.UseSSL       := True;
     DWCR_PIX.SSLVersions  := [sslvTLSv1_2];

     DWCR_PIX.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
     TRDWAuthOptionBearerClient(DWCR_PIX.AuthenticationOptions.OptionParams).Token := Acess_token;

     nResp := DWCR_PIX.Put(cURL,nil,Stream,false);

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

procedure TRscPix.SetPixTXID(const Value: String);
begin
    FPixTXID := Value;
end;


end.
