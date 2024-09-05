unit RscPixCob;

interface

  uses
    Classes
    , SysUtils
    , RscJSON
    , RscPixUtils
    , RscPixParametro
    , RscPixCalendario
    , RscPixPessoas
    , RscPixValor
    , RscPixLoc
    , RscPixInformacoesAdicionais

    , RscPixPix

    ;

type

  TCob = class
  private
    Fcalendario: TCalendarioCob;
    Ftxid: String;
    Frevisao: Integer;
    Floc: TLoc;
    Flocation: String;
    Fstatus: String;
    Fdevedor: TPagador;
    Fvalor: TValor;
    Fchave: String;
    Fsolicitacaopagador: String;
    FpixCopiaECola: string;
    FinfoAdicionais: TListInformacoesAdicionais;
    Frecebedor: TRecebedor;
    Fpix: TPixList;
  public
    property calendario           : TCalendarioCob                  read Fcalendario          write Fcalendario;
    property txid                 : String                          read Ftxid                write Ftxid;
    property revisao              : Integer                         read Frevisao             write Frevisao;
    property status               : String                          read Fstatus              write Fstatus;
    property loc                  : TLoc                            read Floc                 write Floc;
    property location             : String                          read Flocation            write Flocation;
    property devedor              : TPagador                        read Fdevedor             write Fdevedor;
    property valor                : TValor                          read Fvalor               write Fvalor;
    property chave                : String                          read Fchave               write Fchave;
    property solicitacaoPagador   : String                          read Fsolicitacaopagador  write Fsolicitacaopagador;
    property pixCopiaECola        : string                          read FpixCopiaECola       write FpixCopiaECola;
    property infoAdicionais       : TListInformacoesAdicionais      read FinfoAdicionais      write FinfoAdicionais;
    property recebedor            : TRecebedor                      read Frecebedor           write Frecebedor;
    property pix                  : TPixList                        read Fpix                 write Fpix;

    Constructor Create;
    destructor Destroy;override;

    function ToJson: string;
    procedure LoadJson(sJson: string);

  end;

  TCobList = class
  private
    FList : TList;
    function GetRec(Index: integer): TCob;
    procedure PutRec(Index: integer; const Item: TCob);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Delete(Index : integer); overload;
    function Add(Item : TCob): integer; overload;
    procedure ClearList;
    function NewItem: TCob;

    property Items[Index: integer]: TCob read GetRec write PutRec; Default;
    property Count  : integer read GetCount;
  end;

  TCobListar = class
  private
    Fparametros: TParametro;
    Fcobs: TCobList;
  public
    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

    property parametros : TParametro  read Fparametros  write Fparametros;
    property cobs       : TCobList      read Fcobs    write Fcobs;
  end;

implementation

{ TCob }

constructor TCob.Create;
begin
  Fcalendario         :=  TCalendarioCob.Create;
  Fvalor              :=  TValor.Create;
  Fdevedor            :=  TPagador.Create;
  Floc                :=  TLoc.Create;
  Frecebedor          :=  TRecebedor.Create;
  FinfoAdicionais     :=  TListInformacoesAdicionais.Create;
  Fpix                :=  TPixList.Create;
end;

destructor TCob.Destroy;
begin
  Fcalendario.Free;
  Fvalor.Free;
  Fdevedor.Free;
  Floc.Free;
  Frecebedor.Free;
  FinfoAdicionais.Free;
  Fpix.Free;
  inherited;
end;

procedure TCob.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  W: integer;
  vInfoAdicionais : TInformacoesAdicionais;
  vPix : TPix;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    if RespJson.GetValue('calendario') <> nil then
      begin
        Fcalendario.criacao    :=  TRscJSONobject(RespJson.GetValue('calendario')).GetValue('criacao').AsString;
        Fcalendario.expiracao  :=  TRscJSONobject(RespJson.GetValue('calendario')).GetValue('expiracao').AsInteger;
      end;

    Ftxid     :=  RespJson.GetValue('txid').AsString;
    Frevisao  :=  RespJson.GetValue('revisao').AsInteger;

    if RespJson.GetValue('loc') <> nil then
      begin
        Floc.id       :=  TRscJSONobject(RespJson.GetValue('loc')).GetValue('id').AsInteger;
        Floc.location :=  TRscJSONobject(RespJson.GetValue('loc')).GetValue('location').AsString;
        Floc.tipoCob  :=  TRscJSONobject(RespJson.GetValue('loc')).GetValue('tipoCob').AsString;
      end;

    Flocation :=  RespJson.GetValue('location').AsString;
    Fstatus   :=  RespJson.GetValue('status').AsString;

    if RespJson.GetValue('devedor') <> nil then
      begin
        Fdevedor.cpf :=  TRscJSONobject(RespJson.GetValue('devedor')).GetValue('cpf').AsString;
        Fdevedor.cnpj :=  TRscJSONobject(RespJson.GetValue('devedor')).GetValue('cnpj').AsString;
        Fdevedor.nome :=  TRscJSONobject(RespJson.GetValue('devedor')).GetValue('nome').AsString;
      end;

    if RespJson.GetValue('valor') <> nil then
      begin
        Fvalor.original :=  TRscJSONobject(RespJson.GetValue('valor')).GetValue('original').AsString;
      end;

    Fchave              :=  RespJson.GetValue('chave').AsString;
    FsolicitacaoPagador :=  RespJson.GetValue('solicitacaoPagador').AsString;
    FpixCopiaECola      :=  RespJson.GetValue('pixCopiaECola').AsString;

    if RespJson.GetValue('recebedor') <> nil then
      begin
        Frecebedor.cpf        :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('cpf').AsString;
        Frecebedor.cnpj       :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('cnpj').AsString;
        Frecebedor.nome       :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('nome').AsString;
        Frecebedor.logradouro :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('logradouro').AsString;
        Frecebedor.cidade     :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('cidade').AsString;
        Frecebedor.uf         :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('uf').AsString;
        Frecebedor.cep        :=  TRscJSONobject(RespJson.GetValue('recebedor')).GetValue('cep').AsString;
      end;

    if  RespJson.GetValue('infoAdicionais') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('infoAdicionais')).Count > 0 then
          begin
            for W :=  0 to TRscJSONArray(RespJson.GetValue('infoAdicionais')).Count -1 do
              begin
                vInfoAdicionais :=  TInformacoesAdicionais.Create;
                try
                  vInfoAdicionais.LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('infoAdicionais')).Items[W]).toJson);
                finally
                  FinfoAdicionais.Add(vInfoAdicionais);
                end;
              end;
          end;
      end;

    if  RespJson.GetValue('pix') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('pix')).Count > 0 then
          begin
            for W :=  0 to TRscJSONArray(RespJson.GetValue('pix')).Count -1 do
              begin
                vPix := TPix.Create;
                try
                  vPix.LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('pix')).Items[W]).toJson);
                finally
                  Fpix.Add(vPix);
                end;
              end;
          end;
      end;

  finally
    RespJson.Free;
  end;
end;

function TCob.ToJson: string;
begin

end;

{ TCobList }

function TCobList.Add(Item: TCob): integer;
var
  vItem : ^TCob;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TCobList.ClearList;
var
  I: Integer;
begin
  for I := Count - 1 Downto 0 do
    Delete(I);

  FList.Clear;
end;

constructor TCobList.Create;
begin
  FList :=  TList.Create;
end;

procedure TCobList.Delete(Index: integer);
var
  vItem : TCob;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TCob(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TCobList.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TCobList.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TCobList.GetRec(Index: integer): TCob;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TCob(FList.Items[Index]^);
        end;
    end;
end;

function TCobList.NewItem: TCob;
var
  vItem : ^TCob;
begin
  Result  :=  TCob.Create;
  New(vItem);
  vItem^  :=  Result;
  FList.Add(vItem);
end;

procedure TCobList.PutRec(Index: integer; const Item: TCob);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TCob(FList.Items[Index]^) := Item;
        end;
    end;
end;

{ TCobListar }

constructor TCobListar.Create;
begin
  Fparametros :=  TParametro.Create;
  Fcobs       :=  TCobList.Create;
end;

destructor TCobListar.Destroy;
begin
  Fparametros.Free;
  Fcobs.Free;
  inherited;
end;

procedure TCobListar.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  W               : integer;
  vCob           : TCob;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    if  RespJson.GetValue('parametros') <> nil then
      begin
        Fparametros.inicio  :=  TRscJSONobject(RespJson.GetValue('parametros')).GetValue('inicio').AsString;
        Fparametros.fim     :=  TRscJSONobject(RespJson.GetValue('parametros')).GetValue('fim').AsString;

        if  TRscJSONobject(RespJson.GetValue('parametros')).GetValue('paginacao') <> nil then
          begin
            Fparametros.paginacao.paginaAtual :=
              TRscJSONobject(TRscJSONobject(RespJson.GetValue('parametros')).GetValue('paginacao')).GetValue('paginaAtual').AsInteger;
            Fparametros.paginacao.itensPorPagina :=
              TRscJSONobject(TRscJSONobject(RespJson.GetValue('parametros')).GetValue('paginacao')).GetValue('itensPorPagina').AsInteger;
            Fparametros.paginacao.quantidadeDePaginas :=
              TRscJSONobject(TRscJSONobject(RespJson.GetValue('parametros')).GetValue('paginacao')).GetValue('quantidadeDePaginas').AsInteger;
            Fparametros.paginacao.quantidadeTotalDeItens :=
              TRscJSONobject(TRscJSONobject(RespJson.GetValue('parametros')).GetValue('paginacao')).GetValue('quantidadeTotalDeItens').AsInteger;
          end;
      end;

    if  RespJson.GetValue('cobs') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('cobs')).Count > 0 then
          begin
            for W :=  0 to TRscJSONArray(RespJson.GetValue('cobs')).Count -1 do
              begin
                vCob  :=  TCob.create;
                try
                  vCob.LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('cobs')).Items[W]).toJson);
                finally
                  Fcobs.Add(vCob);
                end;
              end;
          end;
      end;

  finally
    RespJson.Free;
  end;
end;

function TCobListar.ToJson: string;
begin

end;

end.

