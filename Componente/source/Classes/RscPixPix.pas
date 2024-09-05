unit RscPixPix;

interface
  uses
    Classes
    , SysUtils
    , RscJSON
    , RscPixPessoas
    , RscPixParametro  
    , RscPixHorario
    , RscPixDevolucao
    ;

type

  TPix = class
  private
    Fhorario: string;
    Fvalor: Double;
    FendToEndID: String;
    FinfoPagador: string;
    Ftxid: String;
    Fchave: string;
    Fdevolucoes: TDevolucaoList;
    Fpagador: TPagador;

  public
    property endToEndId           : String                          read FendToEndID          write FendToEndID;
    property txid                 : String                          read Ftxid                write Ftxid;
    property valor                : Double                          read Fvalor               write Fvalor;
    property horario              : string                          read Fhorario             write Fhorario;
    property infoPagador          : string                          read FinfoPagador         write FinfoPagador;
    property chave                : string                          read Fchave               write Fchave;
    property devolucoes           : TDevolucaoList                  read Fdevolucoes          write Fdevolucoes;
    property pagador              : TPagador                        read Fpagador             write Fpagador;

    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

  end;

  TPixList = class
  private
    FList : TList;
    function GetRec(Index: integer): TPix;
    procedure PutRec(Index: integer; const Item: TPix);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Delete(Index : integer); overload;
    function Add(Item : TPix): integer; overload;
    procedure ClearList;
    property Items[Index: integer]: TPix read GetRec write PutRec; Default;
    property Count  : integer read GetCount;

    function NewItem: TPix;

  end;


  TPixRecebidoLista = class
  private
    Fparametros: TParametro;
    Fpix: TPixList;

  public

    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

    property parametros           : TParametro            read Fparametros          write Fparametros;
    property pix                  : TPixList                  read Fpix                 write Fpix;
  end;


implementation

{ TListaPixRecebidos }

constructor TPixRecebidoLista.Create;
begin
  Fpix        :=  TPixList.Create;
  Fparametros :=  TParametro.Create;
end;

destructor TPixRecebidoLista.Destroy;
begin
  Fpix.Free;
  Fparametros.Free;
  inherited;
end;

procedure TPixRecebidoLista.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  P : integer;
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

    if  RespJson.GetValue('pix') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('pix')).Count > 0 then
          begin
            for P :=  0 to TRscJSONArray(RespJson.GetValue('pix')).Count -1 do
              begin
                with Fpix.NewItem do
                  begin
                    LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('pix')).Items[P]).ToJson);
                  end;
              end;

          end;
      end;

  finally
    RespJson.Free;
  end;
end;

function TPixRecebidoLista.ToJson: string;
begin

end;

{ TPix }

constructor TPix.Create;
begin
  Fdevolucoes :=  TDevolucaoList.Create;
  Fpagador    :=  TPagador.Create;
end;

destructor TPix.Destroy;
begin
  Fdevolucoes.Free;
  Fpagador.Free;
  inherited;
end;

procedure TPix.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  P : integer;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    endToEndId    :=  RespJson.GetValue('endToEndId').AsString;
    TxId          :=  RespJson.GetValue('txid').AsString;

    if RespJson.GetValue('idEnvio').AsString <> '' then
      TxId        :=  RespJson.GetValue('idEnvio').AsString;

    valor         :=  RespJson.GetValue('valor').AsDouble;
    chave         :=  RespJson.GetValue('chave').AsString;
    horario       :=  RespJson.GetValue('horario').AsString;
    infoPagador   :=  RespJson.GetValue('infoPagador').AsString;

    if  RespJson.GetValue('pagador') <> nil then
      begin
        pagador.cpf   :=  TRscJSONobject(RespJson.GetValue('pagador')).GetValue('cpf').AsString;
        pagador.cnpj  :=  TRscJSONobject(RespJson.GetValue('pagador')).GetValue('cnpj').AsString;
        pagador.nome  :=  TRscJSONobject(RespJson.GetValue('pagador')).GetValue('nome').AsString;
      end;

    if  RespJson.GetValue('devolucoes') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('devolucoes')).Count > 0 then
          begin
            for P :=  0 to TRscJSONArray(RespJson.GetValue('devolucoes')).Count -1 do
              begin
                with Fdevolucoes.NewItem do
                  begin
                    LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('devolucoes')).Items[P]).ToJson);
                  end;
              end;
          end;
      end;
  finally
    RespJson.Free;
  end;
end;

function TPix.ToJson: string;
var
  RespJson        : TRscJSONobject;
  devolucoes      : TRscJSONArray;
  ObjDevolucoes   : TRscJSONobject;
  O : integer;
begin
  inherited;
  RespJson          :=  TRscJSONobject.create;
  try
    RespJson.AddPair('endToEndId', endToEndId);
    RespJson.AddPair('TxId', txid);
    RespJson.AddPair('valor',valor);
    RespJson.AddPair('chave', chave);
    RespJson.AddPair('horario', horario);
    RespJson.AddPair('infoPagador', infoPagador);

    devolucoes  :=  TRscJSONArray.Create;
    try
      for O := 0 to Self.devolucoes.Count - 1 do
        begin
          ObjDevolucoes :=  TRscJSON.LoadfromString(Self.devolucoes.items[O].ToJson) as TRscJSONobject;
          try

          finally
            devolucoes.add(ObjDevolucoes);
          end;
        end;
    finally
      RespJson.AddPair('devolucoes', devolucoes);
    end;

  finally
    Result  :=  RespJson.ToJson;
    RespJson.Free;
  end;
end;



{ TPixList }

function TPixList.Add(Item: TPix): integer;
var
  vItem : ^TPix;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TPixList.ClearList;
begin

end;

constructor TPixList.Create;
begin
  FList :=  TList.Create;
end;

procedure TPixList.Delete(Index: integer);
var
  vItem : TPix;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TPix(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TPixList.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TPixList.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TPixList.GetRec(Index: integer): TPix;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TPix(FList.Items[Index]^);
        end;
    end;
end;

function TPixList.NewItem: TPix;
var
  vItem : ^TPix;
begin
  Result  :=  TPix.Create;
  New(vItem);
  vItem^  :=  Result;
  FList.Add(vItem);
end;

procedure TPixList.PutRec(Index: integer; const Item: TPix);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TPix(FList.Items[Index]^) := Item;
        end;
    end;
end;

end.
