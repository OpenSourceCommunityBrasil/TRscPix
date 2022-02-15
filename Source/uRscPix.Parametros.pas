unit uRscPix.Parametros;

interface

uses System.Generics.collections, uRscPix.Classes;

type

  TPIXParams = class
      private
          FendToEndId  : String;
          Ftxid        : String;
          Fvalor       : Currency;
          Fhorario     : String;
          Fpagador     : TPagador;
          FinfoPagador : string;
      public
          property endToEndId : String    read FendToEndId  write FendToEndId;
          property txid       : String    read Ftxid        write Ftxid;
          property valor      : Currency  read Fvalor       write Fvalor;
          property horario    : String    read Fhorario     write Fhorario;
          property pagador    : TPagador  read Fpagador     write Fpagador;
          property infoPagador: string    read FinfoPagador write FinfoPagador;

    destructor Destroy; override;
  end;





  TParametrosListaPixs = class
  private
    Ffim: string;
    Finicio: string;
  public
    property inicio : string read Finicio write Finicio;
    property fim    : string read Ffim    write Ffim;
  end;



  TPix_Parametros = class
  private
    Fchave              : String;
    Ftxid               : String;
    Fstatus             : String;
    Fcalendario         : Tcalendario;
    FRecebedor          : TRecebedor;
    Frevisao            : Integer;
    Flocation           : String;
    Fvalor              : TValor;
    Fsolicitacaopagador : String;
    Finfo_adicionais    : TArray<Tinfo_adicionais>;

    Finformacaopagador  : String;
    FDevolucao          : tArray<TDevolucao>;

    fdata_inicio_criacao: String;
    fdata_final_criacao : String;
    ftextoImagemQRcode  : String;

    FPIX                : tArray<TPIXParams>;
    fpagador            : TPagador;
    FHorario            : string;
    Fparametros         : TParametrosListaPixs;
    FendToEndID         : String;
    FinfoPagador:        string;

  public
    {Cob}
    property status             : String                    read Fstatus              write Fstatus;
    property calendario         : Tcalendario               read Fcalendario          write Fcalendario;
    property location           : String                    read Flocation            write Flocation;
    property textoImagemQRcode  : String                    read ftextoImagemQRcode   write ftextoImagemQRcode;
    property txid               : String                    read Ftxid                write Ftxid;
    property revisao            : Integer                   read Frevisao             write Frevisao;
    property valor              : TValor                    read Fvalor               write Fvalor;
    property chave              : String                    read Fchave               write Fchave;
    property solicitacaopagador : String                    read Fsolicitacaopagador  write Fsolicitacaopagador;






    property Recebedor          : TRecebedor                read FRecebedor           write FRecebedor;


    property info_adicionais    : TArray<Tinfo_adicionais>  read Finfo_adicionais     write Finfo_adicionais;

    property data_inicio_criacao: String                    read fdata_inicio_criacao write fdata_inicio_criacao;
    property data_final_criacao : String                    read fdata_final_criacao  write fdata_final_criacao;


    property pix    : TArray<TPIXParams>  read Fpix     write Fpix;

    property endToEndID         : String                    read FendToEndID          write FendToEndID;

    property Horario            : string                    read FHorario             write FHorario;
    property infoPagador        : string                    read FinfoPagador         write FinfoPagador;
    property Pagador            : TPagador                  read fpagador             write fpagador;

    property parametros : TParametrosListaPixs read Fparametros write Fparametros;

    destructor Destroy;override;

  end;


implementation

{ TPix_Entrada }

destructor TPix_Parametros.Destroy;
var Vinfo_adicionais : Tinfo_adicionais;
    Vdevolucao : TDevolucao;
    Vpix : TPIXParams;

begin

  for Vinfo_adicionais in Finfo_adicionais do
    Vinfo_adicionais.Free;

  for Vdevolucao in FDevolucao do
    Vdevolucao.Free;

  for Vpix in Fpix do
    Vpix.Free;

  if Assigned(Fparametros) then
    Fparametros.Free;

  if  Assigned(Fpagador) then
    Fpagador.Free;

  inherited;
end;



{ TPIX }

destructor TPIXParams.Destroy;
begin
  if  Assigned(Fpagador) then
    Fpagador.Free;
  inherited;
end;


end.
