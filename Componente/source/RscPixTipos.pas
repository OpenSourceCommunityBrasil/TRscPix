unit RscPixTipos;

interface

type

  TTipoPSP  = (
                  pspSicredi
                , pspBancoDoBrasil
                , pspBradesco
                , pspSantander
                , pspSicoob
                , pspEfi
                , pspPagSeguro
                , pspItau
                , pspInter
                , pspBanRiSul
              );

  TTipoChavePIX = (
                      tcCPF
                    , tcCNPJ
                    , tcTelefone
                    , tcEmail
                    , tcAleatoria
                  );

  TTipoAmbiente = (
                      taSandBox
                    , taHomologacao
                    , taProducao
                  );

  TTipoCobranca =
                  (
                    tcbCob
                    , tcbCobV
                  );

implementation

end.
