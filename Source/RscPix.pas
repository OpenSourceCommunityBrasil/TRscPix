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
{ Faça uma  doação:                     }
{ Pix - Email: ronierys2@hotmail.com    }
{ Banco: NuBank                         }
{                                       }
{                                       }
{                                       }
{ Componente TRscPix                    }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}
unit RscPix;
interface
uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.SyncObjs,
  System.DateUtils,
  System.threading,
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
  ,uRscPix.ErrosToString,
  Vcl.Dialogs

  ;

type
  TRscPix = class(TComponent)
  protected
    FSeguranca: TSeguranca;
    FTitularPix: TTitularPix;
    FDeveloper: TDeveloper;
    FPSP: TPSP;
    FToken: TToken;
  private
    FInstanteGeradoToken: Cardinal;
    FRetorno: string;
    Finfo_adicionais_Nome: String;
    Finfo_adicionais_Valor: String;
    FDevedor_Documento: String;
    FDevedor_Nome: String;
    FDevedor_Documento_Tipo: TTipoPessoa;
    {notifica}
    FOnCobGet: TNotificaCobGet;
    FOnToken: TNotificaToken;
    FOnCobPut: TNotificaCobPut;
    FOnCobPatch: TNotificaCobPatch;
    FOnPixPut: TNotificaPixPut;
    FOnPixGet: TNotificaPixGet;
    procedure SetDevedor_Documento(const Value: String);
    procedure SetDevedor_Documento_Tipo(const Value: TTipoPessoa);
    procedure SetDevedor_Nome(const Value: String);
    procedure Setinfo_adicionais_Nome(const Value: String);
    procedure Setinfo_adicionais_Valor(const Value: String);
    procedure SetRetorno(const Value: string);
    { Private declarations }
    Function GeraPayload(sValor: string = '0'; Msg: string = ''; TXID: string = ''; Location: string = ''):String;
    function GetValue(Id, Value: string): string;
    function GetUniquePayment(INITIATION_METHOD:  string = '12'): string;
    function GetMerchantAccountInformation(Msg: string = ''; Location: string = ''): string;
    function GetAdditionalDataFieldTemplate(TXID: string = ''): string;
    function GetCRC16(Payload: string): string;
    {========================================}
    procedure GetToToken ;
    {========================================}
    {========================================}
    procedure InOnCobGet(Sender : TObject; Const RespCobGet: TRespCobGet = nil; Erro: String = '');
    procedure InOnCobPut(Sender : TObject; Const RespCobPut: TRespCobPut = nil; Erro: String = '');
    procedure InOnCobPatch(Sender : TObject; Const RespCobPatch: TRespCobPatch = nil; Erro: String = '');
    procedure InOnToken(Sender : TObject; Const Token: TToken = nil; Erro: String = '');
    procedure InOnPixGet(Sender : TObject; Const RespPixGet: TRespPixGet = nil; Erro: String = '');
    procedure InOnPixPut(Sender : TObject; Const RespPixPut: TRespPixPut = nil; Erro: String = '');
    {-------------------------------------------------------------------------------}
    procedure SetCertificado(const Value: TSeguranca);
    procedure SetTitularPix(const Value: TTitularPix);
    procedure SetDeveloper(const Value: TDeveloper);
    procedure SetPSP(const Value: TPSP);
    procedure SetToken(const Value: TToken);
    {========================================}
    {========================================}
    Function ValidaChavePix:  Boolean;
    {========================================}
    procedure ConfigRestClient(Rest : TObject);

    {====}
    property Token                  : TToken read FToken write SetToken;
  protected
    { Protected declarations }
  public
    { Public declarations }
  Constructor Create(AOwner   : TComponent);  Override;
  Destructor  Destroy;  Override;
  function GerarTXID: String;
  function GerarTXIDDEV: string;
  {========================================}
  {COB - PUT}
  procedure CriarCobranca(cValor: Currency; sTXID: string; sMensagem: string = '');
  {COB - PATH}
  procedure CancelarCobranca(PixStatus : string; cValor: Currency; sTXID: string; sMensagem: string = '');
  {COB - GET}
  procedure ConsultarCobranca(sTXID: string);
  {PIX - PUT}
  procedure SolicitarDevolucaoPix(sEndToEndId, sTXIDDev: string; cValor: Currency);
  {PIX - GET}
  procedure ConsultarListPixsRecebPeriodo(dtData_Hora_Inicial, dtData_Hora_Final: TDateTime; iPagIndex: integer);
  procedure ConsultarPixRecebido(sE2eid: string);
  procedure ConsultarDevolucaoPix(sE2eid, sTXIDDev: string);
  {========================================}
  procedure SimularPagamentoPix(Payload:String);

    property Retorno                : string read FRetorno write SetRetorno;
    property Devedor_Nome           : String read FDevedor_Nome write SetDevedor_Nome;
    property Devedor_Documento      : String read FDevedor_Documento write SetDevedor_Documento;
    property Devedor_Documento_Tipo : TTipoPessoa read FDevedor_Documento_Tipo write SetDevedor_Documento_Tipo;
    property info_adicionais_Nome   : String read Finfo_adicionais_Nome write Setinfo_adicionais_Nome;
    property info_adicionais_Valor  : String read Finfo_adicionais_Valor write Setinfo_adicionais_Valor;
  published
    { Published declarations }
    property Seguranca                  : TSeguranca read FSeguranca write SetCertificado;
    property TitularPix                 : TTitularPix read FTitularPix write SetTitularPix;
    property Developer                  : TDeveloper read FDeveloper write SetDeveloper;
    property PSP                        : TPSP read FPSP write SetPSP;
    property OnCobGet                   : TNotificaCobGet       read  FOnCobGet            write  FOnCobGet;
    property OnCobPut                   : TNotificaCobPut       read  FOnCobPut            write  FOnCobPut;
    property OnCobPatch                 : TNotificaCobPatch     read  FOnCobPatch          write  FOnCobPatch;
    property OnToken                    : TNotificaToken        read  FOnToken             write  FOnToken;
    property OnPixGet                   : TNotificaPixGet       read  FOnPixGet            write  FOnPixGet;
    property OnPixPut                   : TNotificaPixPut       read  FOnPixPut            write  FOnPixPut;


  end;
procedure Register;
implementation
procedure Register;
begin
  RegisterComponents('Rsc', [TRscPix]);
end;
{ TPix }

procedure TRscPix.ConfigRestClient(Rest: TObject);
begin
  if TDWClientREST(Rest) <> nil then
    begin
      TDWClientREST(Rest).ConnectTimeOut  := 90000;
      TDWClientREST(Rest).RequestTimeOut  := 90000;
      TDWClientREST(Rest).UseSSL          :=  FSeguranca.UseSSL;
      TDWClientREST(Rest).VerifyCert      :=  FSeguranca.VerifyCert;
      TDWClientREST(Rest).SSLVersions     :=  FSeguranca.SSLVersions;
      TDWClientREST(Rest).SSLMethod       :=  FSeguranca.SSLMethod;
      TDWClientREST(Rest).CertMode        :=  sslmClient;
      TDWClientREST(Rest).CertFile        :=  Seguranca.CertFile;
      TDWClientREST(Rest).KeyFile         :=  FSeguranca.CertKeyFile;
      TDWClientREST(Rest).HostCert        :=  FPSP.UrlHostCert;
      TDWClientREST(Rest).PortCert        :=  443;//PADRAO
    end
  else
    begin
      raise Exception.Create('DWRestClient não criado');
    end;
end;
procedure TRscPix.ConsultarCobranca(sTXID: string);
var
  cURL        : String ;
  nResp       : Integer ;
  Stream      : TStringStream ;
  MyPixCob    : TPixCobranca;
  RespCobGet  :TRespCobGet;
  DWCR_CobConsult  :  TDWClientREST;
begin
  if not ValidaChavePix then
     exit;
    RespCobGet  :=  nil;
    MyPixCob := TPixCobranca.Create;
    try
      try
        MyPixCob.TXID         :=  sTXID;
      except on E: Exception do
        begin
          InOnCobGet(Self, nil, e.Message);
          Exit;
        end;
      end;
      try
        GetToToken;
      except on E: Exception do
        begin
          InOnCobGet(Self, nil, e.Message);
          Exit;
        end;
      end;
      Stream := TStringStream.Create('', TEncoding.UTF8);
      DWCR_CobConsult  :=  TDWClientREST.Create(nil);
      try
        ConfigRestClient(DWCR_CobConsult);

         cURL := FPSP.URLAPI + '/cob/{txid}';
         cURL := StringReplace(cURL, '{txid}', MyPixCob.TXID, [rfReplaceAll]);
         {verificar para outros bancos}
         if Developer.Application_key <> '' then
            cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;
         DWCR_CobConsult.ContentType  := 'application/json' ;
//         DWCR_CobConsult.UseSSL       := True ;
//         DWCR_CobConsult.SSLVersions  := [sslvTLSv1_2] ;
         DWCR_CobConsult.AuthenticationOptions.AuthorizationOption  := rdwAOBearer ;
         TRDWAuthOptionBearerClient(DWCR_CobConsult.AuthenticationOptions.OptionParams).Token := Token.AcessToken ;
        try
           nResp := DWCR_CobConsult.Get(cURL,Nil,Stream,false);
          case nResp of
            200:
              begin
               Retorno     := UTF8ToWideString(Stream.DataString);
               RespCobGet  := TJson.JsonToObject<TRespCobGet>(Retorno);
//               if RespCobGet.textoImagemQRcode = '' then
//                  RespCobGet.textoImagemQRcode := GeraPayload ;
               InOnCobGet(Self, RespCobGet, '');
              end;
          else
            raise Exception.Create(ErroCobGetPatchToString(nResp));
          end;
        Except
         on E:exception do
            begin
              InOnCobGet(Self, nil, e.Message);
            end;
        end;
      finally
          Stream.Free;
          DWCR_CobConsult.free;
      end;
    finally
      MyPixCob.DisposeOf;
      if Assigned(RespCobGet) then
        RespCobGet.DisposeOf;
    end;
end;

procedure TRscPix.ConsultarPixRecebido(sE2eid: string);
var
  cURL          : String ;
  nResp         : Integer ;
  Stream        : TStringStream ;
  RespPixGet  : TRespPixGet;
  DWRC_PixRec: TDWClientREST;
begin
  if not ValidaChavePix then
     exit;
  RespPixGet  :=  nil;
  try
    GetToToken;
  except on E: Exception do
    begin
      InOnPixGet(Self, nil, e.Message);
      Exit;
      Abort;
    end;
  end;
  DWRC_PixRec := TDWClientREST.Create(nil);
  Stream := TStringStream.Create('', TEncoding.UTF8) ;
  try
    ConfigRestClient(DWRC_PixRec);
    cURL := FPSP.URLAPI + '/pix/{e2eid}' ;
     cURL := StringReplace(cURL,'{e2eid}', sE2eid, [rfReplaceAll]) ;
    cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key ;
    DWRC_PixRec.ContentType  := 'application/json' ;
    DWRC_PixRec.AuthenticationOptions.AuthorizationOption  := rdwAOBearer ;
    TRDWAuthOptionBearerClient(DWRC_PixRec.AuthenticationOptions.OptionParams).Token := Token.AcessToken ;

    try
      nResp := DWRC_PixRec.Get(cURL,nil,Stream,false);
      case nResp of
        200:
          begin
           Retorno     := UTF8ToWideString(Stream.DataString);
           RespPixGet  := TJson.JsonToObject<TRespPixGet>(Retorno);
           InOnPixGet(Self, RespPixGet, '');
          end;
      else
        raise Exception.Create(ErroPixGetToString(nResp));
      end;
    Except
     on E:exception do
        begin
          InOnPixGet(Self, nil, e.Message);
        end;
    end;
  finally
   Stream.Free ;
   DWRC_PixRec.Free;
  end;
end;
procedure TRscPix.ConsultarListPixsRecebPeriodo(dtData_Hora_Inicial, dtData_Hora_Final: TDateTime; iPagIndex: integer);
var
  cURL    : String ;
  nResp   : Integer ;
  Stream  : TStringStream ;
  MyPixListRebPer     : TPix_ListPixsRecebPeriodo;
  RespPixGet  : TRespPixGet;
  DWRC_PixConPer  : TDWClientREST;
begin
  if not ValidaChavePix then
     exit;
  RespPixGet  :=  nil;
  MyPixListRebPer := TPix_ListPixsRecebPeriodo.Create;
  try
    try
      MyPixListRebPer.Data_Hora_Ini :=  dtData_Hora_Inicial;
      MyPixListRebPer.Data_Hora_Fim :=  dtData_Hora_Final;
      MyPixListRebPer.Index_Pag     :=  iPagIndex;
    except on E: Exception do
      begin
        InOnPixPut(Self, nil, e.Message);
        Exit;
      end;
    end;
    try
      GetToToken;
    except on E: Exception do
      begin
        InOnPixPut(Self, nil, e.Message);
        Exit;
        Abort;
      end;
    end;

    DWRC_PixConPer  := TDWClientREST.Create(nil);
    Stream := TStringStream.Create('', TEncoding.UTF8) ;
    try
      ConfigRestClient(DWRC_PixConPer);
      cURL := FPSP.URLAPI + '/'  +
            '?inicio=' + MyPixListRebPer.Data_Hora_Ini_ToStr  +
            '&fim='    + MyPixListRebPer.Data_Hora_Fim_ToStr  +
            '&paginaAtual=' + IntToStr(MyPixListRebPer.Index_Pag) +
            '&gw-dev-app-key=' + Developer.Application_key ;

      DWRC_PixConPer.ContentType  := 'application/json; charset=utf-8' ;
      DWRC_PixConPer.AuthenticationOptions.AuthorizationOption  := rdwAOBearer ;
      TRDWAuthOptionBearerClient(DWRC_PixConPer.AuthenticationOptions.OptionParams).Token :=  Token.AcessToken ;
      try
        nResp := DWRC_PixConPer.Get(cURL,nil,Stream,false) ;
        case nResp of
          200:
            begin
             Retorno     := UTF8ToWideString(Stream.DataString);
             RespPixGet  := TJson.JsonToObject<TRespPixGet>(Retorno);
             InOnPixGet(Self, RespPixGet, '');
            end;
        else
          raise Exception.Create(ErroPixGetToString(nResp));
        end;
      Except
       on E:exception do
          begin
            InOnPixGet(Self, nil, e.Message);
          end;
      end;
    finally
     Stream.Free ;
     DWRC_PixConPer.Free;
    end;
  finally
    MyPixListRebPer.Free;
  end;
end;
procedure TRscPix.ConsultarDevolucaoPix(sE2eid, sTXIDDev: string);
var
  cURL          : String;
  nResp         : Integer;
  Stream        : TStringStream;
  MyPixSDev     : TPIXSolicitaDevolocao;
  RespPixGet  : TRespPixGet;
  DWRC_PixConsDev  : TDWClientREST;
begin
  if not ValidaChavePix then
     exit;
  RespPixGet  :=  nil;
  MyPixSDev := TPIXSolicitaDevolocao.Create;
  try
    try
      MyPixSDev.TXIDDev   :=  sTXIDDev;
      MyPixSDev.endToEndId     :=  sE2eid;
    except on E: Exception do
      begin
        InOnPixGet(Self, nil, e.Message);
        Exit;
      end;
    end;
    try
      GetToToken;
    except on E: Exception do
      begin
        InOnPixGet(Self, nil, e.Message);
        Exit;
        Abort;
      end;
    end;
    DWRC_PixConsDev  := TDWClientREST.Create(nil);
    Stream       := TStringStream.Create('', TEncoding.UTF8);
    try
      ConfigRestClient(DWRC_PixConsDev);
       cURL := FPSP.URLAPI + '/pix/{e2eid}/devolucao/{id}';
         cURL := StringReplace(cURL, '{e2eid}', MyPixSDev.endToEndId, [rfReplaceAll]);
         cURL := StringReplace(cURL, '{id}', MyPixSDev.TXIDDev, [rfReplaceAll]);
       if Developer.Application_key <> '' then
          cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key;
       DWRC_PixConsDev.ContentType  := 'application/json';
//       DWRC_PixConsDev.UseSSL       := True;
//       DWRC_PixConsDev.SSLVersions  := [sslvTLSv1_2];
       DWRC_PixConsDev.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
       TRDWAuthOptionBearerClient(DWRC_PixConsDev.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

      try
        nResp := DWRC_PixConsDev.Get(cURL,nil,Stream,false);
        case nResp of
          200:
            begin
             Retorno     := UTF8ToWideString(Stream.DataString);
             RespPixGet  := TJson.JsonToObject<TRespPixGet>(Retorno);
             InOnPixGet(Self, RespPixGet, '');
            end;
        else
          raise Exception.Create(ErroPixGetToString(nResp));
        end;
      Except
       on E:exception do
          begin
            InOnPixGet(Self, nil, e.Message);
          end;
      end;
    finally
      Stream.Free;
      DWRC_PixConsDev.Free;
    end;
  finally
    MyPixSDev.Free;
  end;
end;
constructor TRscPix.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSeguranca              :=  TSeguranca.Create;
  FSeguranca.UseSSL       :=  True;
  FSeguranca.VerifyCert   :=  True;
  FSeguranca.SSLMethod    :=  sslvSSLv3;
  FSeguranca.SSLVersions  := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];
  FTitularPix          :=  TTitularPix.Create;
  FDeveloper    :=  TDeveloper.Create;
  FPSP          :=  TPSP.Create;
  Token         :=  TToken.Create;
end;
procedure TRscPix.CriarCobranca (cValor: Currency; sTXID, sMensagem: string);
var
  cURL           : String ;
  cdata          : String ;
  Json           : String ;
//  JsonDevedor    : TJsonObject ;
  RequestBody    : TStringList ;
  nResp          : Integer ;
  Stream         : TStringStream ;
  JsonValor      : TJsonObject ;
  JsonCalendario : TJsonObject ;
  JsonEnviar     : TJSONObject ;
//  JSonInfoA      : TJSOnArray ;
//  JSonInfo       : TJSOnObject ;
  MyPixCob       : TPixCobranca;
  ResultCobPut   : TRespCobPut;
  DWCR_CobCriar  :  TDWClientREST;
begin
  ResultCobPut  :=  nil;
  if not ValidaChavePix then
    begin
      InOnCobPut(Self, nil, 'Chave Invalida');
      exit;
    end;



    MyPixCob := TPixCobranca.Create;
    try
      try
        MyPixCob.Mensagem :=  sMensagem;
        MyPixCob.Valor    :=  cValor;
        MyPixCob.TXID     :=  sTXID;
      except on E: Exception do
        begin
          Exit;
        end;
      end;


       case FTitularPix.TipoQRCode of
       tqDinamico   : begin
                        try
                          GetToToken;
                        except on E: Exception do
                          begin
                            Exit;
                          end;
                        end;

                        DWCR_CobCriar  :=  TDWClientREST.Create(nil);
                        Stream       := TStringStream.Create('', TEncoding.UTF8);
                        RequestBody  := TStringList.Create ;
                        try


                           ConfigRestClient(DWCR_CobCriar);

                           //Criando o Objeto Valor
                           JsonValor := TJSONObject.Create;
                           JsonValor.AddPair('original', MyPixCob.ValorToString);

                           //Criando o Objeto Calendario
                           JsonCalendario := TJSONObject.Create;
                           JsonCalendario.AddPair('expiracao', TJSONNumber.Create(TitularPix.DuracaoMinutos * 60)); // aqui é em segundo 3600 segundos = 1 h


                           //Dados do Devedor
//                           if ((Devedor_Documento <> '') and (Devedor_Nome <> '')) then
//                              begin
//                                JsonDevedor := TJSONObject.Create;
//                                 case Devedor_Documento_Tipo of
//                                   pFisica   : JsonDevedor.AddPair('cpf', GetStrNumber(Devedor_Documento));
//                                   pJuridica : JsonDevedor.AddPair('cnpj', GetStrNumber(Devedor_Documento));
//                                 end;
//                                JsonDevedor.AddPair('nome', copy(TirarAcentoE(Devedor_Nome),1,200)); //<200
//                              end;

                           //Info Adicionais - Não tenho necessidade de mais de uma informação, por isso vou deixar uma somente
//                           if ((info_adicionais_Nome <> '') and (info_adicionais_Valor <> '')) then
//                              begin
//                                JSonInfoA := TJSOnArray.Create;//Criando a Lista de Objetos
//                                JSonInfo  := TJSOnObject.Create;//Criando o Objeto
//                                JSonInfo.AddPair('nome',TirarAcentoE(info_adicionais_Nome));
//                                JSonInfo.AddPair('valor',TirarAcentoE(info_adicionais_Valor));
//                                JSonInfoA.AddElement(JSonInfo);//Adicionando o Objeto na Lista de Objetos
//                              end;

                           //Montrando o Json a Enviar
                           JsonEnviar := TJSOnObject.Create;//Criando o Objeto
                           JsonEnviar.AddPair('calendario', JsonCalendario);

//                           if Assigned(JsonDevedor) then
//                              JsonEnviar.AddPair('devedor', JsonDevedor);

                           JsonEnviar.AddPair('valor', JsonValor);

                           JsonEnviar.AddPair('chave', TitularPix.ChavePix);
                           JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(MyPixCob.Mensagem));

//                           if Assigned(JSonInfoA) then
//                              JsonEnviar.AddPair('info_adicionais', JSonInfoA) ;

                           cdata := JsonEnviar.ToString ;

                           cURL := FPSP.URLApi + FPSP.EndPoint_Cob;
                           cURL := StringReplace(cURL, '{txid}', MyPixCob.TXID , [rfReplaceAll]);
                           cURL := cURL + '?gw-dev-app-key=' + Developer.Application_key ;

                           DWCR_CobCriar.Accept       := 'application/json' ;
                           DWCR_CobCriar.ContentType  := 'application/json' ;

                           DWCR_CobCriar.AuthenticationOptions.AuthorizationOption  := rdwAOBearer ;
                           TRDWAuthOptionBearerClient(DWCR_CobCriar.AuthenticationOptions.OptionParams).Token := Token.AcessToken ;

                           //body
                           RequestBody.Add(JsonEnviar.ToString) ;//JSON
                          try
                             nResp := DWCR_CobCriar.Put(cURL,RequestBody,Stream,false) ;

                            case nResp of
                              200:
                                begin
                                 Retorno       := UTF8ToWideString(Stream.DataString);
                                 ResultCobPut  := TJson.JsonToObject<TRespCobPut>(Retorno);

//                                 if ResultCobPut.textoImagemQRcode = '' then
//                                    ResultCobPut.textoImagemQRcode := GeraPayload ;

                                 InOnCobPut(Self, ResultCobPut, '');
                                end;
                            else
                              raise Exception.Create(ErroCobPostPutPatchToString(nResp));
                            end;
                          Except
                           on E:exception do
                              begin
                                InOnCobPut(Self, nil, e.Message);
                              end;
                          end;
                         finally
                          DWCR_CobCriar.Free;
                           Stream.Free ;
                           RequestBody.DisposeOf; ;
//                           if Assigned(JSonInfoA) then
//                              JSonInfoA.DisposeOf;
                           if Assigned(JsonEnviar) then
                              JsonEnviar.DisposeOf;
                         end;

                      end;
       tqEstatico   : begin
                         try
                           Stream                           :=  TStringStream.Create(JsonQRCodeStatico, TEncoding.UTF8) ;
                           Retorno                          :=  UTF8ToWideString(Stream.DataString);
                           ResultCobPut                     :=  TJson.JsonToObject<TRespCobPut>(Retorno);
                           ResultCobPut.solicitacaopagador  :=  MyPixCob.Mensagem;
                           ResultCobPut.txid                :=  MyPixCob.TXID;
                           ResultCobPut.chave               :=  TitularPix.ChavePix ;
                           ResultCobPut.valor.original      :=  MyPixCob.ValorToString;

                           if ResultCobPut.textoImagemQRcode = '' then
                              ResultCobPut.textoImagemQRcode := GeraPayload(MyPixCob.ValorToString, MyPixCob.Mensagem, MyPixCob.TXID ) ;

                           InOnCobPut(Self, ResultCobPut, '');
                         finally
                           Stream.Free ;
                         end;
                      end;
       end;


    finally
      MyPixCob.DisposeOf;
      if Assigned(ResultCobPut) then
        ResultCobPut.DisposeOf;
    end;
end;


destructor TRscPix.Destroy;
begin
  FSeguranca.DisposeOf;
  FTitularPix.DisposeOf;
  FDeveloper.DisposeOf;
  FPSP.DisposeOf;
  Token.DisposeOf;
//  DWCR_PIX.Free;
  inherited;
end;




function TRscPix.GeraPayload(sValor: string = '0'; Msg: string = ''; TXID: string = ''; Location: string = ''): String;
var
  Payload, cRecebedor : String;
begin
  case FTitularPix.TipoQRCode of
    tqDinamico: ;
    tqEstatico:
      begin
        if Pos(',', sValor) > 0 then
          sValor := StringReplace(sValor, ',', '.', [rfReplaceAll]);

        Payload := GetValue(ID_PAYLOAD_FORMAT_INDICATOR,'01') +
                   GetUniquePayment() +
                   GetMerchantAccountInformation(Msg, Location) +
                   GetValue(ID_MERCHANT_CATEGORY_CODE,'0000') +
                   GetValue(ID_TRANSACTION_CURRENCY,'986') +
                   IfThen(lENGTH(sValor) > 0, GetValue(ID_TRANSACTION_AMOUNT, sValor), '') +
                   GetValue(ID_COUNTRY_CODE,'BR') +
                   GetValue(ID_MERCHANT_NAME,FTitularPix.NomeTitularConta) +
                   GetValue(ID_MERCHANT_CITY, FTitularPix.CidadeTitularConta);// +
                   GetAdditionalDataFieldTemplate(TXID);
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

function TRscPix.GetAdditionalDataFieldTemplate(TXID: string = ''): string;
var
  sTxId: string;
begin
  //TXID
  sTxId := GetValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID, TXID);//fTxid
  //RETORNA O VALOR COMPLETO
  Result := GetValue(ID_ADDITIONAL_DATA_FIELD_TEMPLATE, sTxId);
end;

function TRscPix.GetCRC16(Payload: string): string;
begin
  //ADICIONA DADOS GERAIS NO PAYLOAD
  Payload := Payload + ID_CRC16 + '04';
  Result := ID_CRC16 + '04' + Inttohex(CRC16CCITT(Payload), 4);
end;

function TRscPix.GetMerchantAccountInformation(Msg: string = ''; Location: string = ''): string;
var
  Gui: string;
  Key: string;
  Description: string;
  Url: string;
begin
  //DOMÍNIO DO BANCO
  Gui := GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_GUI,'br.gov.bcb.pix');
  //CHAVE PIX
  Key := IfThen(Length(FTitularPix.ChavePix) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_KEY, FTitularPix.ChavePix), '');

  case FTitularPix.TipoQRCode of
    tqDinamico:
      begin
        //DESCRIÇÃO DO PAGAMENTO
//        Description := IfThen(Length(Msg) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION, Msg), '');

        //URL DO QR CODE DINÂMICO
//        Url := IfThen(Length(Location) > 0, GetValue(ID_MERCHANT_ACCOUNT_INFORMATION_URL, Location), '');

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

procedure TRscPix.GetToToken  ;
var
  JsonResponse : TJSONObject ;
  Stream       : TStringStream ;
  nResp        : Integer ;
  RequestBody  : TStringList ;
  DWCR_Token    : TDWClientREST;
begin
  DWCR_Token  :=  TDWClientREST.Create(nil);

  ConfigRestClient(DWCR_Token);

  RequestBody := TStringList.Create;
  JsonResponse  :=  TJSONObject.Create;
  try
    case FPSP.TipoPsp of
      pspSicredi      : begin
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');

                        end;
      pspBancoDoBrasil: begin //OK
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');
                            DWCR_Token.AuthenticationOptions.AuthorizationOption  := rdwOAuth;
                            TRDWAuthOAuth(DWCR_Token.AuthenticationOptions.OptionParams).ClientID      := FDeveloper.Client_ID;
                            TRDWAuthOAuth(DWCR_Token.AuthenticationOptions.OptionParams).ClientSecret  := FDeveloper.Client_Secret;
                        end;
      pspSantander    : begin  //sANDbOX - OK
                            DWCR_Token.Accept           := '*/*';
                            DWCR_Token.AcceptEncoding   := 'gzip, deflate, br';
                            DWCR_Token.ContentEncoding  := '';
                            DWCR_Token.AuthenticationOptions.AuthorizationOption  := rdwAONone;

                            FPSP.URLToken := FPSP.URLToken+'{param}';
                            FPSP.URLToken := StringReplace(FPSP.URLToken, '{param}', '?grant_type=client_credentials', [rfReplaceAll]);

                            RequestBody.Add('client_id='+FDeveloper.Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper.Client_Secret);

                        end;
      pspSicoob       : begin
                            DWCR_Token.AuthenticationOptions.AuthorizationOption  := rdwOAuth;
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('client_id='+FDeveloper.Client_ID);
                            RequestBody.Add('client_secret='+FDeveloper.Client_Secret);
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');

                        end;
      pspBradesco     : begin
                            DWCR_Token.AuthenticationOptions.AuthorizationOption  := rdwAONone;
                            RequestBody.Add('grant_type=client_credentials');
                            RequestBody.Add('Authorization = Basic '  {+ encodeBase64(client_id:client_secret)});
                            RequestBody.Add('scope=cob.read cob.write pix.read pix.write');
                        end;
    end;


//    DWCR_Token.UseSSL       :=  True;
//    DWCR_Token.SSLMethod    :=  Seguranca.SSLMethod;//  sslvSSLv3;
//    DWCR_Token.SSLVersions  :=  Seguranca.SSLVersions;//   [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2, sslvSSLv23];

    DWCR_Token.ContentType      := 'application/x-www-form-urlencoded';
//    DWCR_Token.CertMode :=  sslmClient;
//    DWCR_Token.CertFile :=  Seguranca.CertFile;
//    DWCR_Token.KeyFile  :=  FSeguranca.CertKeyFile;
//    DWCR_Token.HostCert :=  FPSP.UrlHostCert;
//    DWCR_Token.PortCert :=  443;//PADRAO


    Stream := TStringStream.Create('', TEncoding.UTF8);

    try
      nResp := DWCR_Token.Post(FPSP.URLToken,requestBody,Stream,false,False);
      case nResp of
        200:
          begin
            fInstanteGeradoToken := GetTickCount;//pegando a hora que gerou o token

            JsonResponse := TJSONObject.ParseJsonValue(UTF8ToWideString(Stream.DataString)) as TJSONObject;

            Token.AcessToken    := JsonResponse.GetValue<string>('access_token');
            Token.TokenType     := JsonResponse.GetValue<string>('token_type');
            Token.Expires_in    := JsonResponse.GetValue<Integer>('expires_in');

            InOnToken(Self, Token);
          end;
      else
        raise Exception.Create(ErroGeralToString(nResp));
      end;
    Except
     on E:exception do
        begin
          InOnToken(Self, nil, e.Message);
        end;
    end;

  finally
    DWCR_Token.Free;
    Stream.Free;
    if Assigned(JsonResponse) then
      JsonResponse.DisposeOf;
    RequestBody.Free
  end;
end;

function TRscPix.GetUniquePayment(INITIATION_METHOD:  string = '12'): string;
begin
  Result := GetValue(ID_POINT_OF_INITIATION_METHOD, INITIATION_METHOD);
end;

function TRscPix.GetValue(Id, Value: string): string;
var Size:  Integer;
begin
  if Length(Value) < 2 then
    Value := StrZero(Value, 2);
  Size := Length(Value);

  Result := Id + IfThen(Size < 10, StrZero(Size.ToString, 2), Size.ToString) + Value;
end;

procedure TRscPix.InOnCobGet(Sender : TObject; Const RespCobGet: TRespCobGet = nil;
  Erro: String = '');
begin
  if Assigned(FOnCobGet) then
     FOnCobGet(Sender, RespCobGet, Erro);
end;

procedure TRscPix.InOnCobPatch(Sender: TObject;
  const RespCobPatch: TRespCobPatch; Erro: String);
begin
  if Assigned(FOnCobPatch) then
     FOnCobPatch(Sender, RespCobPatch, Erro);
end;

procedure TRscPix.InOnCobPut(Sender: TObject; const RespCobPut: TRespCobPut;
  Erro: String);
begin
  if Assigned(FOnCobPut) then
     FOnCobPut(Sender, RespCobPut, Erro);
end;

procedure TRscPix.InOnPixGet(Sender: TObject; const RespPixGet: TRespPixGet;
  Erro: String);
begin
  if Assigned(FOnPixGet) then
     FOnPixGet(Sender, RespPixGet, Erro);
end;

procedure TRscPix.InOnPixPut(Sender: TObject; const RespPixPut: TRespPixPut;
  Erro: String);
begin
  if Assigned(FOnPixPut) then
     FOnPixPut(Sender, RespPixPut, Erro);
end;

procedure TRscPix.InOnToken(Sender: TObject; const Token: TToken; Erro: String);
begin
  if Assigned(FOnToken) then
     FOnToken(Sender, Token, Erro);
end;

procedure TRscPix.CancelarCobranca(PixStatus : string; cValor: Currency; sTXID: string; sMensagem: string = '');
var
  cURL         : string;
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
  MyPixCob       : TPixCobRevisa;
  RespCobPatch   : TRespCobPatch;
  DWCR_CobCancel: TDWClientREST;
begin
  if not ValidaChavePix then
     exit;
    RespCobPatch  :=  nil;
    MyPixCob := TPixCobRevisa.Create;
    try
      try
        MyPixCob.Mensagem     :=  sMensagem;
        MyPixCob.Valor        :=  cValor;
        MyPixCob.TXID         :=  sTXID;
        MyPixCob.StatusRevisa :=  PixStatus;
      except on E: Exception do
        begin
          InOnCobPatch(Self, nil, e.Message);
          Exit;
        end;
      end;

      try
        GetToToken;
      except on E: Exception do
        begin
          InOnCobPatch(Self, nil, e.Message);
          Exit;
        end;
      end;

      Stream       := TStringStream.Create('', TEncoding.UTF8);
      RequestBody  := TStringList.Create;
      DWCR_CobCancel  := TDWClientREST.Create(nil);
      try
        ConfigRestClient(DWCR_CobCancel);


         //Criando o Objeto Valor
         JsonValor := TJSONObject.Create;
         JsonValor.AddPair('original', MyPixCob.ValorToString);

         //Criando o Objeto Calendario
         JsonCalendario := TJSONObject.Create;
         JsonCalendario.AddPair('expiracao', TJSONNumber.Create(TitularPix.DuracaoMinutos * 60));//1800 30 minutos-86400 igual a 24 horas, aqui é em segundo 3600 segundos = 1 h

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

         JsonEnviar.AddPair('status', MyPixCob.StatusRevisa);
         JsonEnviar.AddPair('chave', FTitularPix.ChavePix);
         JsonEnviar.AddPair('calendario', JsonCalendario);
         if Assigned(JsonDevedor) then
            JsonEnviar.AddPair('devedor', JsonDevedor);
         JsonEnviar.AddPair('valor', JsonValor);
         JsonEnviar.AddPair('solicitacaoPagador', TirarAcentoE(MyPixCob.Mensagem));

         if Assigned(JSonInfoA) then
            JsonEnviar.AddPair('info_adicionais', JSonInfoA);


         cdata := JsonEnviar.ToString;

         cURL := FPSP.URLApi + '/cob/{txid}';
         cURL := StringReplace(cURL, '{txid}', MyPixCob.TXID, [rfReplaceAll]);

         {verificar essa parte para outros bancos}
         if FDeveloper.Application_key <> '' then
            cURL := cURL + '?gw-dev-app-key=' + FDeveloper.Application_key;

         DWCR_CobCancel.ContentType  := 'application/json';
         DWCR_CobCancel.UseSSL       := True;
         DWCR_CobCancel.SSLVersions  := [sslvTLSv1_2];

         DWCR_CobCancel.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
         TRDWAuthOptionBearerClient(DWCR_CobCancel.AuthenticationOptions.OptionParams).Token := Token.AcessToken;

         //body
         RequestBody.Add(JsonEnviar.ToString);//JSON

        try
           nResp := DWCR_CobCancel.Patch(cURL,requestBody,Stream,false);

          case nResp of
            200, 201:
              begin
                RespCobPatch  :=  TRespCobPatch.Create;
                RespCobPatch.status  :=  'Cobrança Removida Com Sucesso!';

//                if RespCobPatch.textoImagemQRcode = '' then
//                  RespCobPatch.textoImagemQRcode := GeraPayload ;

                InOnCobPatch(Self, RespCobPatch, '');
              end;
          else
            raise Exception.Create(ErroCobPostPutPatchToString(nResp));
          end;
        Except
         on E:exception do
            begin
              InOnCobPatch(Self, nil, e.Message);
            end;
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
          DWCR_CobCancel.Free;
      end;
    finally
      MyPixCob.DisposeOf;
      if Assigned(RespCobPatch) then
        RespCobPatch.DisposeOf;
    end;
end;

procedure TRscPix.SetCertificado(const Value: TSeguranca);
begin
  FSeguranca := Value;
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

procedure TRscPix.SetTitularPix(const Value: TTitularPix);
begin
  FTitularPix := Value;
end;

procedure TRscPix.SetPSP(const Value: TPSP);
begin
  FPSP := Value;
end;

procedure TRscPix.SetRetorno(const Value: string);
begin
  FRetorno := Value;
end;

procedure TRscPix.SetToken(const Value: TToken);
begin
  FToken := Value;
end;

procedure TRscPix.SimularPagamentoPix(Payload: String);
var
  DWClint : TDWClientREST;
  sUrl    : String;
  RequestBody  : TStringList ;
  nResp : integer;
  Stream      : TStringStream ;
  RespCobGet  :TRespCobGet;
begin

  if PSP.TipoPsp <> TTipoPSP.pspBancoDoBrasil then
    begin
      raise Exception.Create('A Simulação de pagamente esta disponivel apenas para o Banco do Brasil');
      Exit;
    end;

  RespCobGet  :=  nil;
  Stream := TStringStream.Create('', TEncoding.UTF8);
  RequestBody := TStringList.Create;
  DWClint := TDWClientREST.Create(nil);
  try
    sUrl  :=  'https://api.hm.bb.com.br/testes-portal-desenvolvedor/v1'
              + '/boletos-pix/pagar?'
              + 'gw-app-key=95cad3f03fd9013a9d15005056825665';

    DWClint.ContentType      := 'application/json';
    DWClint.UseSSL       :=  True;
    DWClint.SSLMethod    :=  sslvSSLv23;
    DWClint.SSLVersions  :=  [sslvSSLv23];

    RequestBody.Add('{"pix": "{'  + Payload + '}"}');


    try
       nResp := DWClint.Post(sUrl, RequestBody, Stream);

      case nResp of
        200:
          begin
           Retorno     := UTF8ToWideString(Stream.DataString);
           RespCobGet  := TJson.JsonToObject<TRespCobGet>(Retorno);

           if RespCobGet.textoImagemQRcode = '' then
              RespCobGet.textoImagemQRcode := GeraPayload ;

           InOnCobGet(Self, RespCobGet, '');
          end;
      else
        raise Exception.Create(ErroCobGetPatchToString(nResp));
      end;
    Except
     on E:exception do
        begin
          InOnCobGet(Self, nil, e.Message);
        end;
    end;
  finally
    DWClint.Free;
  end;

end;

procedure TRscPix.SolicitarDevolucaoPix(sEndToEndId, sTXIDDev: string; cValor: Currency);
var
  cURL          : string;
  nResp         : Integer;
  Stream        : TStringStream;
  JasonValor    : TJSONObject;
  RequestBody   : TStringList;
  MyPixSDev     : TPIXSolicitaDevolocao;
  ResultPixPut  : TRespPixPut;
  DWRC_PixSolDev: TDWClientREST;
begin
  if not ValidaChavePix then
     exit;

//  ResultPixPut  :=  nil;
  MyPixSDev := TPIXSolicitaDevolocao.Create;
  try
    try
      MyPixSDev.Valor       :=  cValor;
      MyPixSDev.TXIDDev     :=  sTXIDDev;
      MyPixSDev.endToEndId  :=  sEndToEndId;

      MyPixSDev.ValidaDaddos;
    except on E: Exception do
      begin
        InOnPixPut(Self, nil, e.Message);
        Exit;
      end;
    end;

    try
      GetToToken;
    except on E: Exception do
      begin
        InOnPixPut(Self, nil, e.Message);
        Exit;
        Abort;
      end;
    end;

    JasonValor  :=  TJSONObject.Create;
    RequestBody := TStringList.Create;
    Stream       := TStringStream.Create('', TEncoding.UTF8);
    DWRC_PixSolDev  := TDWClientREST.Create(nil);
    try
      ConfigRestClient(DWRC_PixSolDev);

      JasonValor.AddPair('valor',  MyPixSDev.ValorToString);
      RequestBody.clear;
      RequestBody.Add(JasonValor.ToString);

       cURL := FPSP.URLAPI + '/pix/{e2eid}/devolucao/{id}';
       cURL := StringReplace(cURL, '{e2eid}', MyPixSDev.endToEndId, [rfReplaceAll]);
       cURL := StringReplace(cURL, '{id}', MyPixSDev.TXIDDev, [rfReplaceAll]);

       {rever para outros bancos}
       if FDeveloper.Application_key <> '' then
           cURL := cURL + '?gw-dev-app-key=' + FDeveloper.Application_key;

       DWRC_PixSolDev.ContentType  := 'application/json';
       DWRC_PixSolDev.AuthenticationOptions.AuthorizationOption  := rdwAOBearer;
       TRDWAuthOptionBearerClient(DWRC_PixSolDev.AuthenticationOptions.OptionParams).Token := Token.AcessToken;


      try
        nResp := DWRC_PixSolDev.Put(cURL,RequestBody,Stream,false);

        case nResp of
          200:
            begin
             Retorno     := UTF8ToWideString(Stream.DataString);
             ResultPixPut  := TJson.JsonToObject<TRespPixPut>(Retorno);
             InOnPixPut(Self, ResultPixPut, '');
            end;
          201:
            begin
             Retorno     := UTF8ToWideString(Stream.DataString);
             ResultPixPut  := TJson.JsonToObject<TRespPixPut>(Retorno);
             InOnPixPut(Self, ResultPixPut, '');
            end;
        else
          raise Exception.Create(ErroPixPutToString(nResp));
        end;
      Except
       on E:exception do
          begin
            InOnPixPut(Self, nil, e.Message);
          end;
      end;
    finally
      RequestBody.Free;
      JasonValor.Free;
      Stream.Free;
    end;

  finally
    MyPixSDev.Free;
  end;
end;


function TRscPix.ValidaChavePix: Boolean;
begin
  Result  :=  False;

  case TitularPix.TipoChavePix of
    tcCPF:
      begin
        if IsCPF(TitularPix.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada: '  + TitularPix.ChavePix + ' não é um CFP válido.');
          end;
      end;
    tcCNPJ:
      begin
        if IsCNPJ(TitularPix.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada: '  + TitularPix.ChavePix + ' não é um CNPJ válido.');
          end;
      end;
    tcTelefone:
      begin
        if IsCelular(TitularPix.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada: '  + TitularPix.ChavePix + ' não é um Nº de TELEFONE válido.'
                                    + #13
                                    + 'Informe o Nº como no Ex: +5544988887777');
          end;
      end;
    tcEmail:
      begin
        if IsEMail(TitularPix.ChavePix) then
          begin
            Result  :=  True;
          end
        else
          begin
            raise Exception.Create('A Chave Pix informada: '  + TitularPix.ChavePix + ' não é um E-MAIL válido.');
          end;
      end;
    tcAleatoria:
      begin
        Result  :=  True;
      end;
  end;
end;

end.
