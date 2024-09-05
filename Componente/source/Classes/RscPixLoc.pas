unit RscPixLoc;

interface
  uses
    Classes
    , SysUtils
    , RscJSON
    , RscPixParametro
    ;


type

  TLoc = class
  private
    Fcriacao: string;
    Flocation: string;
    FtipoCob: string;
    Fid: integer;
    Ftxid: string;
  public
    function ToJson: string;
    procedure LoadJson(sJson: string); virtual;

    property id       : integer read Fid        write Fid;
    property location : string  read Flocation  write Flocation;
    property tipoCob  : string  read FtipoCob   write FtipoCob;
    property criacao  : string  read Fcriacao   write Fcriacao;
    property txid     : string  read Ftxid      write Ftxid;
  end;

  TLocGet = class(TLoc)
//  private
//
//    FimagemQrcode: string;
//    Fqrcode: string;
//  public
//    function ToJson: string;
//    procedure LoadJson(sJson: string); override;
//
////    property  qrcode        : string read Fqrcode       write Fqrcode;
////    property  imagemQrcode  : string read FimagemQrcode write FimagemQrcode;
//
//    property id;
//    property location;
//    property tipoCob;
//    property criacao;
//    property txid;
  end;

  TLocIdQrcode = class
  private
    FimagemQrcode: string;
    Fqrcode: string;
    FlinkVisualizacao: string;
  public
    function ToJson: string;
    procedure LoadJson(sJson: string);

    property  qrcode          : string read Fqrcode           write Fqrcode;
    property  imagemQrcode    : string read FimagemQrcode     write FimagemQrcode;
    property  linkVisualizacao: string read FlinkVisualizacao write FlinkVisualizacao;
  end;


  TLocList = class
  private
    FList : TList;
    function GetRec(Index: integer): TLoc;
    procedure PutRec(Index: integer; const Item: TLoc);
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Delete(Index : integer); overload;
    function Add(Item : TLoc): integer; overload;
    procedure ClearList;
    property Items[Index: integer]: TLoc read GetRec write PutRec; Default;
    property Count  : integer read GetCount;

    function NewItem: TLoc;
  end;

  TLocListar = class
  private
    Fparametros: TParametro;
    Floc: TLocList;
  public
    destructor Destroy;override;
    Constructor Create;

    function ToJson: string;
    procedure LoadJson(sJson: string);

    property parametros : TParametro  read Fparametros  write Fparametros;
    property loc        : TLocList          read Floc         write Floc;
  end;

implementation

{ TLoc }

procedure TLoc.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
begin
  RespJson          :=  TRscJSON.LoadFromString(sJson) as TRscJSONobject;
  try
      Fid       := RespJson.GetValue('id').AsInteger;
      Flocation := RespJson.GetValue('location').AsString;
      FtipoCob  := RespJson.GetValue('tipoCob').AsString;
      Fcriacao  := RespJson.GetValue('criacao').AsString;
      Ftxid     := RespJson.GetValue('txid').AsString;
  finally
    RespJson.Free;
  end;
end;

function TLoc.ToJson: string;
var
  aJson : TRscJSONobject;
begin
  aJson := TRscJSONobject.Create;
  try
    aJson.AddPair('id', Fid);
    aJson.AddPair('location', Flocation);
    aJson.AddPair('tipoCob', FtipoCob);
    aJson.AddPair('criacao', Fcriacao);
    aJson.AddPair('txid', Ftxid);
  finally
    Result  :=  aJson.ToJson;
    aJson.Free;
  end;
end;


{ TLocGet }

//procedure TLocGet.LoadJson(sJson: string);
//var
//  RespJson        : TRscJSONobject;
//begin
//  inherited;
//  RespJson          :=  TRscJSON.LoadFromString(sJson) as TRscJSONobject;
//  try
//    Ftxid         := RespJson.GetValue('txid').AsString;
//    FimagemQrcode := RespJson.GetValue('imagemQrcode').AsString;
//    Fqrcode       := RespJson.GetValue('qrcode').AsString;
//  finally
//    RespJson.Free;
//  end;
//end;
//
//function TLocGet.ToJson: string;
//var
//  aJson : TRscJSONobject;
//begin
//  aJson := TRscJSONobject.Create;
//  try
//    aJson.AddPair('id', Fid);
//    aJson.AddPair('location', Flocation);
//    aJson.AddPair('tipoCob', FtipoCob);
//    aJson.AddPair('criacao', Fcriacao);
//    aJson.AddPair('txid', Ftxid);
//    aJson.AddPair('imagemQrcode', FimagemQrcode);
//    aJson.AddPair('qrcode', Fqrcode);
//  finally
//    Result  :=  aJson.ToJson;
//    aJson.Free;
//  end;
//end;

{ TLocList }

function TLocList.Add(Item: TLoc): integer;
var
  vItem : ^TLoc;
begin
  New(vItem);
  vItem^  :=  Item;
  Result  :=  FList.Add(vItem);
end;

procedure TLocList.ClearList;
var
  I: Integer;
begin
  for I := Count - 1 Downto 0 do
    Delete(I);

  FList.Clear;
end;

constructor TLocList.Create;
begin
  FList :=  TList.Create;
end;

procedure TLocList.Delete(Index: integer);
var
  vItem : TLoc;
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          vItem :=  TLoc(FList.Items[Index]^);
          FreeAndNil(vItem);
          Dispose(FList.Items[Index]);
        end;
      FList.Delete(Index);
    end;
end;

destructor TLocList.Destroy;
begin
  ClearList;
  FList.Free;
  inherited;
end;

function TLocList.GetCount: integer;
begin
  Result  :=  FList.Count;
end;

function TLocList.GetRec(Index: integer): TLoc;
begin
  Result  :=  nil;
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          Result  :=  TLoc(FList.Items[Index]^);
        end;
    end;
end;

function TLocList.NewItem: TLoc;
var
  vItem : ^TLoc;
begin
  Result  :=  TLoc.Create;
  New(vItem);
  vItem^  :=  Result;
  FList.Add(vItem);
end;

procedure TLocList.PutRec(Index: integer; const Item: TLoc);
begin
  if (Index < Self.Count) and (Index > -1) then
    begin
      if Assigned(FList.Items[Index]) then
        begin
          TLoc(FList.Items[Index]^) := Item;
        end;
    end;
end;

{ TLocIdQrcode }

procedure TLocIdQrcode.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
begin
  RespJson          :=  TRscJSON.LoadFromString(sJson) as TRscJSONobject;
  try
    FlinkVisualizacao := RespJson.GetValue('linkVisualizacao').AsString;
    FimagemQrcode     := RespJson.GetValue('imagemQrcode').AsString;
    Fqrcode           := RespJson.GetValue('qrcode').AsString;
  finally
    RespJson.Free;
  end;
end;

function TLocIdQrcode.ToJson: string;
var
  aJson : TRscJSONobject;
begin
  aJson := TRscJSONobject.Create;
  try
    aJson.AddPair('qrcode', Fqrcode);
    aJson.AddPair('imagemQrcode', FimagemQrcode);
    aJson.AddPair('linkVisualizacao', FlinkVisualizacao);
  finally
    Result  :=  aJson.ToJson;
    aJson.Free;
  end;
end;


{ TLocListar }

constructor TLocListar.Create;
begin
  Fparametros :=  TParametro.Create;
  Floc        :=  TLocList.Create;
end;

destructor TLocListar.Destroy;
begin
  Fparametros.Free;
  Floc.Free;
  inherited;
end;

procedure TLocListar.LoadJson(sJson: string);
var
  RespJson        : TRscJSONobject;
  P : integer;
  vLoc : TLoc;
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

    if  RespJson.GetValue('loc') <> nil then
      begin
        if  TRscJSONArray(RespJson.GetValue('loc')).Count > 0 then
          begin
            for P :=  0 to TRscJSONArray(RespJson.GetValue('loc')).Count -1 do
              begin
                vLoc := TLoc.Create;
                try
                  vLoc.LoadJson(TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).ToJson);
                finally
                  Floc.Add(vLoc);
                end;

//                with Floc.NewItem do
//                  begin
//                    id        :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).GetValue('id').AsInteger;
//                    location  :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).GetValue('location').AsString;
//                    tipoCob   :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).GetValue('tipoCob').AsString;
//                    criacao   :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).GetValue('criacao').AsString;
//                    txid      :=  TRscJSONobject(TRscJSONArray(RespJson.GetValue('loc')).Items[P]).GetValue('txid').AsString;
//                  end;
              end;

          end;
      end;

  finally
    RespJson.Free;
  end;
end;

function TLocListar.ToJson: string;
begin

end;

end.
