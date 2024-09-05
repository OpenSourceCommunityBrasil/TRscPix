unit RscPixWebhook;

interface

  uses
    Classes
    , SysUtils
    , RscJSON
    , RscPixParametro
    ;

type

  TWebHook = class
  private
    FwebhookUrl: string;
    Fchave: string;
    Fcriacao: string;
  public
    property webhookUrl: string read FwebhookUrl write FwebhookUrl;
    property chave: string read Fchave write Fchave;
    property criacao: string read Fcriacao write Fcriacao;

    function ToJson: string;
    procedure LoadJson(sJson: string);

  end;

  TWebHookList = class
  private
    FList : TList;
    function GetRec(Index: integer): TWebHook;
    procedure PutRec(Index: integer; const Item: TWebHook);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Delete(Index : integer); overload;
    function Add(Item : TWebHook): integer; overload;
    procedure ClearList;
    function NewItem: TWebHook;

    property Items[Index: integer]: TWebHook read GetRec write PutRec; Default;
    property Count  : integer read GetCount;
  end;

  TWebHookListar = class
  private
    Fparametros: TParametro;
    Fwebhooks: TWebHookList;
  public
    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

    property parametros : TParametro  read Fparametros  write Fparametros;
    property webhooks   : TWebHookList      read Fwebhooks    write Fwebhooks;
  end;

  TWebHookPutDelete = class
  private
    Fresponse: string;
  public
    property response: string read Fresponse write Fresponse;

  end;


implementation

{ TWebHookList }

function TWebHookList.Add(Item: TWebHook): integer;
var
  vItem : ^TWebHook;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TWebHookList.ClearList;
var
  I: Integer;
begin
  for I := Count - 1 Downto 0 do
    Delete(I);

  FList.Clear;
end;

constructor TWebHookList.Create;
begin
  FList :=  TList.Create;
end;

procedure TWebHookList.Delete(Index: integer);
var
  vItem : TWebHook;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TWebHook(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TWebHookList.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TWebHookList.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TWebHookList.GetRec(Index: integer): TWebHook;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TWebHook(FList.Items[Index]^);
        end;
    end;
end;

function TWebHookList.NewItem: TWebHook;
var
  vItem : ^TWebHook;
begin
  Result  :=  TWebHook.Create;
  New(vItem);
  vItem^  :=  Result;
  FList.Add(vItem);
end;

procedure TWebHookList.PutRec(Index: integer; const Item: TWebHook);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TWebHook(FList.Items[Index]^) := Item;
        end;
    end;
end;

{ TWebHookListar }

constructor TWebHookListar.Create;
begin
  Fparametros :=  TParametro.Create;
  Fwebhooks   :=  TWebHookList.Create;
end;

destructor TWebHookListar.Destroy;
begin
  Fparametros.Free;
  Fwebhooks.Free;
  inherited;
end;

procedure TWebHookListar.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  W : integer;
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

    if  RespJson.GetValue('webhooks') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('webhooks')).Count > 0 then
          begin
            for W :=  0 to TRscJSONArray(RespJson.GetValue('webhooks')).Count -1 do
              begin
                with Fwebhooks.NewItem do
                  begin
                    webhookUrl  :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('webhooks')).Items[W]).GetValue('webhookUrl').AsString;
                    chave       :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('webhooks')).Items[W]).GetValue('chave').AsString;
                    criacao     :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('webhooks')).Items[W]).GetValue('criacao').AsString;
                  end;
              end;

          end;
      end;

  finally
    RespJson.Free;
  end;
end;

function TWebHookListar.ToJson: string;
begin

end;

{ TWebHook }

procedure TWebHook.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    webhookUrl  :=  RespJson.GetValue('webhookUrl').AsString;
    chave       :=  RespJson.GetValue('chave').AsString;
    criacao     :=  RespJson.GetValue('criacao').AsString;
  finally
    RespJson.Free;
  end;
end;

function TWebHook.ToJson: string;
begin

end;

end.
