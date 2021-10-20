unit uRscPix.Variaveis;

interface

  uses
    System.Classes;






type

  TPSP          = (pspSicredi, pspBancoDoBrasil, pspBradesco,pspSantander,pspSicoob);
  TTipoChavePIX = (tcCPF, tcCNPJ, tcTelefone, tcEmail, tcAleatoria);
  TTipoQrCode   = (tqDinamico, tqEstatico);
  TTipoAmbiente = (taSandBox,taHomologacao,taProducao);
  TPessoa = (pFisica, pJuridica);





const
  ID_PAYLOAD_FORMAT_INDICATOR                 = '00';
  ID_POINT_OF_INITIATION_METHOD               = '01';
  ID_MERCHANT_ACCOUNT_INFORMATION             = '26';
  ID_MERCHANT_ACCOUNT_INFORMATION_GUI         = '00';
  ID_MERCHANT_ACCOUNT_INFORMATION_KEY         = '01';
  ID_MERCHANT_ACCOUNT_INFORMATION_DESCRIPTION = '02';
  ID_MERCHANT_ACCOUNT_INFORMATION_URL         = '25';
  ID_MERCHANT_CATEGORY_CODE                   = '52';
  ID_TRANSACTION_CURRENCY                     = '53';
  ID_TRANSACTION_AMOUNT                       = '54';
  ID_COUNTRY_CODE                             = '58';
  ID_MERCHANT_NAME                            = '59';
  ID_MERCHANT_CITY                            = '60';
  ID_ADDITIONAL_DATA_FIELD_TEMPLATE           = '62';
  ID_ADDITIONAL_DATA_FIELD_TEMPLATE_TXID      = '05';
  ID_CRC16                                    = '63';





var
  JsonQRCodeStatico : string = '{'
                              + ' "status": "ATIVA",'
                              + ' "calendario": {'
                              + '		"criacao": "",'
                              + '		"expiracao": ""'
                              + '	},'
                              + ''
                              + '	"location": "",'
                              + '	"textoImagemQRcode": "",'
                              + '	"txid": "",'
                              + '	"revisao": 0,'
                              + ''
                              + '	"valor": {'
                              + '		"original": ""'
                              + '	},'
                              + '	"chave": "",'
                              + ''
                              + '	"solicitacaoPagador": ""'
                              + '}';

//  JsonQRCodeStatico : string = '{'
//                              + ' "status": "ATIVA",'
//                              + ' "calendario": {'
//                              + '		"criacao": "2021-10-17T17:12:59.76-03:00",'
//                              + '		"expiracao": "86400"'
//                              + '	},'
//                              + ''
//                              + '	"location": "qrcodepix-h.bb.com.br/pix/v2/60d38a40-7f95-4b13-96e4-5b6cb2e89237",'
//                              + '	"textoImagemQRcode": "0",'
//                              + '	"txid": "1A0C16A1F91174B21829761C00E23544",'
//                              + '	"revisao": 0,'
//                              + ''
//                              + '	"valor": {'
//                              + '		"original": "0"'
//                              + '	},'
//                              + '	"chave": "28779295827",'
//                              + ''
//                              + '	"solicitacaoPagador": "0"'
//                              + '}';




implementation

end.
