unit RscPixDevolucao;

interface

  uses
    Classes
    , SysUtils
    , RscJSON
    , RscPixHorario
    ;

type

  TDevolucao = class
  private
    Fstatus: string;
    Fid: string;
    FrtrId: string;
    Fvalor: string;
    Fhorario: THorario;
    Fmotivo: string;
    Fnatureza: string;
    Fdescricao: string;
  public
    property status: string read Fstatus write Fstatus;
    property id: string read Fid write Fid;
    property rtrId: string read FrtrId write FrtrId;
    property valor: string read Fvalor write Fvalor;
    property horario: THorario read Fhorario write Fhorario;
    property motivo: string read Fmotivo write Fmotivo;
    property natureza: string read Fnatureza write Fnatureza;
    property descricao: string read Fdescricao write Fdescricao;

    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

  end;

type  

  TDevolucaoList = class
  private
    FList : TList;
    function GetRec(Index: integer): TDevolucao;
    procedure PutRec(Index: integer; const Item: TDevolucao);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Delete(Index : integer); overload;
    function Add(Item : TDevolucao): integer; overload;
    procedure ClearList;
    property Items[Index: integer]: TDevolucao read GetRec write PutRec; Default;
    property Count  : integer read GetCount;

    function NewItem: TDevolucao;

  end;
implementation

{ TDevolucao }

constructor TDevolucao.Create;
begin
  Fhorario  :=  THorario.Create;
end;

destructor TDevolucao.Destroy;
begin
  Fhorario.Free;
  inherited;
end;

procedure TDevolucao.LoadJson(sJson: string);
var
  RespJson  : TRscJSONobject;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    status  :=  RespJson.GetValue('status').AsString;
    id      :=  RespJson.GetValue('id').AsString;
    rtrId   :=  RespJson.GetValue('rtrId').AsString;
    valor   :=  RespJson.GetValue('valor').AsString;
    motivo  :=  RespJson.GetValue('motivo').AsString;
    natureza  :=  RespJson.GetValue('natureza').AsString;
    descricao  :=  RespJson.GetValue('descricao').AsString;

    if RespJson.GetValue('horario') <> nil then
      begin
        horario.solicitacao :=  TRscJSONobject(RespJson.GetValue('horario')).GetValue('solicitacao').AsString;
        horario.liquidacao  :=  TRscJSONobject(RespJson.GetValue('horario')).GetValue('liquidacao').AsString;
      end;
  finally
    RespJson.Free;
  end;
end;

function TDevolucao.ToJson: string;
var
  RespJson    : TRscJSONobject;
  HorarioJson : TRscJSONobject;
begin
  RespJson  :=  TRscJSONobject.Create;
  try
    RespJson.AddPair('status', status);
    RespJson.AddPair('id', id);
    RespJson.AddPair('rtrId', rtrId);
    RespJson.AddPair('valor', valor);
    RespJson.AddPair('motivo', motivo);

    HorarioJson :=  TRscJSONobject.Create;
    HorarioJson.AddPair('solicitacao', horario.solicitacao);
    HorarioJson.AddPair('liquidacao', horario.liquidacao);

    RespJson.AddPair('horario', HorarioJson);
  finally
    Result :=  RespJson.ToJson;
    RespJson.Free;
  end;
end;

{ TDevolucaoList }

function TDevolucaoList.Add(Item: TDevolucao): integer;
var
  vItem : ^TDevolucao;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TDevolucaoList.ClearList;
var
  I: Integer;
begin
  for I := Count - 1 Downto 0 do
    Delete(I);

  FList.Clear;
end;

constructor TDevolucaoList.Create;
begin
  FList :=  TList.Create;
end;

procedure TDevolucaoList.Delete(Index: integer);
var
  vItem : TDevolucao;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TDevolucao(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TDevolucaoList.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TDevolucaoList.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TDevolucaoList.GetRec(Index: integer): TDevolucao;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TDevolucao(FList.Items[Index]^);
        end;
    end;
end;

function TDevolucaoList.NewItem: TDevolucao;
var
  vItem : ^TDevolucao;
begin
  Result  :=  TDevolucao.Create;
  New(vItem);
  vItem^  :=  Result;
  FList.Add(vItem);
end;

procedure TDevolucaoList.PutRec(Index: integer; const Item: TDevolucao);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TDevolucao(FList.Items[Index]^) := Item;
        end;
    end;
end;

end.


