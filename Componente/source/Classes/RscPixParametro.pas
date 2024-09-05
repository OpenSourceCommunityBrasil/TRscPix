unit RscPixParametro;

interface
  uses
    RscPixPaginacao;

type

  TParametro = class
  private
    Ffim: string;
    Finicio: string;
    Fpaginacao: TPaginacao;
  public
    property inicio   : string          read Finicio    write Finicio;
    property fim      : string          read Ffim       write Ffim;
    property paginacao: TPaginacao      read Fpaginacao write Fpaginacao;

    Constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TParametrosListaPixs }

constructor TParametro.Create;
begin
  Fpaginacao  :=  TPaginacao.Create;
end;

destructor TParametro.Destroy;
begin
  Fpaginacao.Free;
  inherited;
end;

end.
