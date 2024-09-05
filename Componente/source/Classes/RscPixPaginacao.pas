unit RscPixPaginacao;

interface

type

  TPaginacao = class
  private
      FquantidadeTotalDeItens: integer;
      FquantidadeDePaginas: integer;
      FpaginaAtual: integer;
      FitensPorPagina: integer;
    public
      property paginaAtual            : integer read FpaginaAtual             write FpaginaAtual;
      property itensPorPagina         : integer read FitensPorPagina          write FitensPorPagina;
      property quantidadeDePaginas    : integer read FquantidadeDePaginas     write FquantidadeDePaginas;
      property quantidadeTotalDeItens : integer read FquantidadeTotalDeItens  write FquantidadeTotalDeItens;
  end;

implementation

end.
