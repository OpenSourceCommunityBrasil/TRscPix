unit RscPixInformacoesAdicionais;

interface
  uses
    Classes
    , SysUtils
    , RscJSON
    ;

type

  TInformacoesAdicionais = class
  private
      Fnome    : String;
      Fvalor   : String;
  public
      property nome  : String read Fnome  write Fnome;
      property valor : String read Fvalor write Fvalor;

    function ToJson: string;
    procedure LoadJson(sJson: string);

  end;

  TListInformacoesAdicionais = class
  private
    FList : TList;
    function GetRec(Index: integer): TInformacoesAdicionais;
    procedure PutRec(Index: integer; const Item: TInformacoesAdicionais);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy;override;

    procedure Delete(Index : integer); overload;
    function Add(Item : TInformacoesAdicionais): integer; overload;
    procedure ClearList;
    property Items[Index: integer]: TInformacoesAdicionais read GetRec write PutRec; Default;
    property Count  : integer read GetCount;
  end;

implementation

{ TObjetcList }

function TListInformacoesAdicionais.Add(Item: TInformacoesAdicionais): integer;
var
  vItem : ^TInformacoesAdicionais;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TListInformacoesAdicionais.ClearList;
var
  I: Integer;
begin
  for I := Count - 1 Downto 0 do
    Delete(I);

  FList.Clear;
end;

constructor TListInformacoesAdicionais.Create;
begin
  FList :=  TList.Create;
end;

procedure TListInformacoesAdicionais.Delete(Index: integer);
var
  vItem : TInformacoesAdicionais;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TInformacoesAdicionais(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TListInformacoesAdicionais.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TListInformacoesAdicionais.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TListInformacoesAdicionais.GetRec(Index: integer): TInformacoesAdicionais;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TInformacoesAdicionais(FList.Items[Index]^);
        end;
    end;
end;

procedure TListInformacoesAdicionais.PutRec(Index: integer;
  const Item: TInformacoesAdicionais);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TInformacoesAdicionais(FList.Items[Index]^) := Item;
        end;
    end;
end;

{ TInformacoesAdicionais }

procedure TInformacoesAdicionais.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
begin
  inherited;
  RespJson          :=  TRscJSON.LoadfromString(sJson) as TRscJSONobject;
  try
    Fnome   :=  RespJson.GetValue('nome').AsString;
    Fvalor  :=  RespJson.GetValue('valor').AsString;
  finally
    RespJson.Free;
  end;
end;

function TInformacoesAdicionais.ToJson: string;
begin

end;

end.
