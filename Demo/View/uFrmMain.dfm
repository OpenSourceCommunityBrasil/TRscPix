object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'PIX - By: Roniery Santos Cardoso'
  ClientHeight = 492
  ClientWidth = 1004
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    1004
    492)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_tela: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 492
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnl_Funcoes: TPanel
      Left = 0
      Top = 41
      Width = 1004
      Height = 451
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnl_FuncCobranca: TPanel
        Left = 0
        Top = 0
        Width = 1004
        Height = 451
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 451
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 300
            Height = 77
            Align = alTop
            Caption = 'Configura'#231#245'es'
            Padding.Left = 5
            Padding.Top = 5
            Padding.Right = 5
            Padding.Bottom = 2
            TabOrder = 0
            object Panel3: TPanel
              Left = 7
              Top = 20
              Width = 286
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Panel4: TPanel
                AlignWithMargins = True
                Left = 149
                Top = 0
                Width = 137
                Height = 45
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label1: TLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 65
                  Height = 13
                  Align = alTop
                  Caption = 'Tipo QRCode'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object cbbTipoQRCode: TComboBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 19
                  Width = 131
                  Height = 21
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alClient
                  TabOrder = 0
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 144
                Height = 45
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object Label9: TLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 67
                  Height = 13
                  Align = alTop
                  Caption = 'Tempo Minuto'
                  Transparent = True
                end
                object edtDuracaoMinutos: TSpinEdit
                  AlignWithMargins = True
                  Left = 0
                  Top = 20
                  Width = 144
                  Height = 22
                  Margins.Left = 0
                  Margins.Top = 1
                  Margins.Right = 0
                  Margins.Bottom = 12
                  AutoSize = False
                  MaxValue = 999
                  MinValue = 1
                  TabOrder = 0
                  Value = 5
                end
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 77
            Width = 300
            Height = 138
            Align = alTop
            Caption = 'Dados'
            TabOrder = 1
            object Label8: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 15
              Width = 142
              Height = 13
              Margins.Left = 6
              Margins.Top = 0
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'TXID (De 26 a 35 Caracteres)'
            end
            object Label10: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 55
              Width = 24
              Height = 13
              Margins.Left = 6
              Margins.Top = 0
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Valor'
            end
            object Label11: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 92
              Width = 51
              Height = 13
              Margins.Left = 6
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Mensagem'
            end
            object Panel6: TPanel
              AlignWithMargins = True
              Left = 5
              Top = 28
              Width = 290
              Height = 27
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButton1: TSpeedButton
                AlignWithMargins = True
                Left = 212
                Top = 3
                Width = 75
                Height = 21
                Align = alRight
                Caption = 'Gerer TXID'
                OnClick = SpeedButton1Click
                ExplicitLeft = 270
                ExplicitTop = 0
                ExplicitHeight = 27
              end
              object edtTXID: TEdit
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 203
                Height = 21
                Align = alClient
                TabOrder = 0
              end
            end
            object edtValorPix: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 68
              Width = 290
              Height = 21
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 1
            end
            object edtMsgPix: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 108
              Width = 290
              Height = 21
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 2
              Text = 'Sem Deus o Homem N'#227'o '#233' Nada'
            end
          end
          object btn_GerarCabranca: TButton
            AlignWithMargins = True
            Left = 30
            Top = 363
            Width = 240
            Height = 34
            Margins.Left = 30
            Margins.Top = 0
            Margins.Right = 30
            Margins.Bottom = 10
            Align = alBottom
            Caption = 'Gerar Combran'#231'a'
            TabOrder = 2
            OnClick = btn_GerarCabrancaClick
          end
          object btn_SimulaPgto: TButton
            AlignWithMargins = True
            Left = 30
            Top = 407
            Width = 240
            Height = 34
            Margins.Left = 30
            Margins.Top = 0
            Margins.Right = 30
            Margins.Bottom = 10
            Align = alBottom
            Caption = 'Simular Pagamento'
            TabOrder = 3
            OnClick = btn_SimulaPgtoClick
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 215
            Width = 300
            Height = 136
            Align = alTop
            Caption = 'Pagador'
            TabOrder = 4
            object Label18: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 52
              Width = 48
              Height = 13
              Margins.Left = 6
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'CPF/CNPJ'
            end
            object Label19: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 15
              Width = 70
              Height = 13
              Margins.Left = 6
              Margins.Top = 0
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Nome Pagador'
            end
            object Label20: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 89
              Width = 94
              Height = 13
              Margins.Left = 6
              Margins.Right = 6
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Mensagem Pagador'
            end
            object edt_DocPagador: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 65
              Width = 290
              Height = 21
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 0
            end
            object edt_NomePagador: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 28
              Width = 290
              Height = 21
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 1
            end
            object edtMsgPagador: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 102
              Width = 290
              Height = 21
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              TabOrder = 2
            end
          end
        end
        object pnl_CobToolsRet: TPanel
          Left = 300
          Top = 0
          Width = 704
          Height = 451
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 404
            Height = 451
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblStatus: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 335
              Width = 41
              Height = 16
              Margins.Top = 10
              Align = alBottom
              Caption = 'Status:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label14: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 386
              Width = 83
              Height = 13
              Margins.Bottom = 5
              Align = alBottom
              Caption = 'Tempo Restante:'
            end
            object Label15: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 364
              Width = 102
              Height = 16
              Margins.Top = 10
              Align = alBottom
              Caption = 'Valor Retornado: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Panel7: TPanel
              Left = 0
              Top = 245
              Width = 404
              Height = 80
              Align = alBottom
              BevelOuter = bvNone
              Padding.Left = 10
              Padding.Right = 10
              Padding.Bottom = 10
              TabOrder = 0
              object Label12: TLabel
                AlignWithMargins = True
                Left = 10
                Top = 3
                Width = 100
                Height = 13
                Margins.Left = 0
                Margins.Right = 0
                Align = alTop
                Caption = 'Copiar Colar Payload'
              end
              object mmPayload: TMemo
                Left = 10
                Top = 19
                Width = 384
                Height = 51
                Align = alClient
                TabOrder = 0
              end
            end
            object Panel10: TPanel
              AlignWithMargins = True
              Left = 20
              Top = 407
              Width = 364
              Height = 34
              Margins.Left = 20
              Margins.Right = 20
              Margins.Bottom = 10
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object btnImprQrCode: TBitBtn
                Left = 264
                Top = 0
                Width = 100
                Height = 34
                Align = alRight
                Caption = 'Imprimir    '
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF8F8F8F8F8F8F8F8F8F8F8F8
                  F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FAFAFAFDFDFDFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDCECECEB58158B4
                  8056B48055B47F55B47F55B48055B48055B47F55B38056B48056B48056B58158
                  CECECEEDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFAAABAB7171716E6F6F5B5B
                  5B333333B18057F3DEC5F4DEC5F3DDC5F3DEC5F4DDC5F4DEC5F3DEC5F4DEC5F3
                  DDC5F3DEC7B27F573333335A5B5B6E6F6F7171719E9F9FFFFFFFFFFFFF686868
                  6162625E5F5F4849491B1B1BB38158F9EADAF8EADAF8EADAF8E9DAF8EADAF8EA
                  DAF9EADAF9E9D9F8EADAF8E9DAB381581B1B1B4849495E5F5F616262646565FF
                  FFFFFFFFFF8E8F8F878888838484636464232323B4845BFBF1E7FBF2E7FBF1E7
                  FBF1E7FBF1E8FBF1E8FBF1E7FBF1E7FBF1E7FBF1E7B4835B2323236364648384
                  848788888B8C8CFFFFFFFFFFFF9494958D8D8E89898A69696A272727B6875FFB
                  F2E7FBF1E7FBF1E7FBF2E7FBF1E8FBF1E8FBF2E7FBF1E8FBF1E7FBF1E8B6865E
                  27272769696A89898A8D8D8E919192FFFFFFFFFFFF9B9B9C9595969292937878
                  7943434429292A26262726262726262726262726262726262726262726262726
                  262726262729292A43434478787992929395959699999AFFFFFFFFFFFFA9A9AA
                  A4A4A5A3A3A49898998484857A7A7B7979797979797979797979797979797979
                  797979797979797979797979797A7A7B848485989899A3A3A4A4A4A5A7A7A8FF
                  FFFFFFFFFFBCBCBCB8B8B8B8B8B8B7B7B7B4B4B4B3B3B3B3B3B3B3B3B3B3B3B3
                  B3B3B3B3B3B3B3B3B30ACE220F8F1EB3B3B30ACE220F8F1EB4B4B4B7B7B7B8B8
                  B8B8B8B8BBBBBBFFFFFFFFFFFFCFCFCFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
                  CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
                  CCCCCCCCCCCCEAEAEAEAEAEACECECEFFFFFFFFFFFFDDDDDDDADADADADADADADA
                  DA3F3F3F3F3F3F3F3F3F3F3F3F3E3F3F3E3F3F3F3F3E3F3F3F3F3F3E3F3F3F3F
                  3F3F3E3F3F3F3F3F3E3F3FDADADAC4C4C4C4C4C5DCDCDCFFFFFFFFFFFFE0E0E0
                  DEDEDEDEDEDEDEDEDE494949626262747474909090B0B0B0CECECFE3E4E3EBEB
                  EBE0E0E0C7C8C7A8A8A88D8D8C7C7C7C494949DEDEDE8B8C8B8B8B8BE0E0E0FF
                  FFFFFFFFFFD0D0D0CDCDCDCDCDCDCDCDCD535454626262757574909090B0B0B0
                  CECECFE4E4E4EBEBEBE0E0E0C8C7C8A8A8A98C8D8D7C7C7C535354CDCDCDCDCD
                  CDCDCDCDCFCFCFFFFFFFFFFFFF9797977070707070706F6F6F5E5E5E5E5D5E5D
                  5D5D5E5E5E5E5E5E5E5E5E5E5E5E5E5D5D5E5E5E5E5E5D5E5D5E5E5E5E5E5E5E
                  5E5E5E6F6F6F7070707070708E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090
                  90777777CDA882F6EDE6F5EEE6F6EDE7F5EEE7F6EEE7F6EDE7F6EEE7F5EEE6F6
                  EDE7F5EEE6CDA782777777909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF8C8C8C7A7A7ACFAB86F4EDE5F4EDE6F4EDE5F4EDE5F5EDE5F4ED
                  E6F4EDE6F5EDE5F4EDE6F5EDE6CFAA867A7A7A8C8C8CFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A7C7B7CD1AD89F4ECE5F4ECE4F4ECE5
                  F4ECE5F4ECE5F4ECE4F4ECE5F4ECE4F4ECE4F4ECE4D1AD897C7B7C8A8A8AFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888887C7C7CD3B08CF3
                  EBE3F3EBE3F3EBE3F3EBE4F4EBE4F3ECE4F4ECE3F3EBE4F3EBE3F4EBE3D3B18C
                  7C7C7C888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393
                  937C7C7CD4B38FF1E9E0F2E9DFF2E9E0F2E9DFF2E8DFF2E9DFF2E9DFF1E9E0F2
                  E9E0F2E9DFD5B38F7C7C7C939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFF9F9F9868686D5B591EFE3D5F0E3D5F0E3D5EFE3D5EFE3D5EFE3
                  D5F0E3D6EFE3D5F0E3D6F0E3D5D6B691868686F9F9F9FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D9BA96EEDFCDEEDFCDEEDFCD
                  EEDFCDEEDFCDEEDECEEEDFCDEEDFCDEEDFCEEEDFCED9BB96F6F6F6FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBBC99DA
                  BA96DABA96DABA96DABA96DABA96DABA96DABA96DABA96DABA96DABA96DBBC99
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                TabOrder = 0
                OnClick = btnImprQrCodeClick
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 404
              Height = 245
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object Label13: TLabel
                AlignWithMargins = True
                Left = 5
                Top = 3
                Width = 54
                Height = 19
                Margins.Left = 5
                Margins.Right = 0
                Align = alTop
                Caption = 'QrCode'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object imgQRCODE: TImage
                AlignWithMargins = True
                Left = 3
                Top = 28
                Width = 398
                Height = 214
                Align = alClient
                Center = True
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000000BA0000
                  00BC0802000000403523BB000000017352474200AECE1CE90000000467414D41
                  0000B18F0BFC6105000000097048597300000EC300000EC301C76FA86400000B
                  574944415478DAEDDD4D6C54D715C0F11329AE3403A1A82393B1A192BD182FEC
                  858DF9102DE243A8B452DD45B3A8C2263B77D1ACC286AE60115665E3ACE8A25E
                  954DA22EC2864A4DAB081225454970CDC25E8C1774510AA965E4DAA6484C2572
                  98D38E9C99F771DFCCBDEF9E73EEFD8B0DC6C2EF5D7EBCAF79EFBE575EBC7801
                  B19859AF442E31F322975881229758812297588122976FB5DD6AAD6D6D767E3B
                  52AD8E54F6F85E284685CEE5D1B3A74B1BEBF8ABB9B5B91BCAEEEA95EA4875CF
                  91EF0DCFD60ECCD6867D2FB2CF02E5825B915BFFF83BFE4A2392D6DE5787CED4
                  0FBE39DE98D8B7DFF74A7828382EB839596CAEDE79FC70E7BFAD41FE9EC3B5E1
                  5F36A642DBD884C565B1B9F2FE83B501A1EC0ED15C993E16CEF14D285CF0D0E4
                  EAFD2F8BEE7A4CC2DDD3FCC4D485F186EF552CA320B8E0310A5A71FA234EBF3E
                  7A79FAF86B4343BED7D56DFAB92014E452C20F6AECDB7FFDC459DD62947329CD
                  0A853BA6EB3F38ABF8A449339792AD50BAC5A8E5E2C50AA5588C4E2E1EAD505A
                  C528E4E2DD0AA5528C362E4CAC50FAC4A8E2C2CA0AA54C8C1E2E0CAD509AC428
                  E1C2D60AA5468C062ECCAD503AC488E722C20AA5408C6C2E82AC50D2C508E622
                  CE0A255A8C542E42AD5072C588E422DA0A25548C3C2E0AAC5012C508E3A2C60A
                  254E8C242ECAAC50B2C488E1A2D20A25488C0C2E8AAD5052C408E0A2DE0A2542
                  0C772E8158A1F88B61CD25282B1473317CB9046885E22C86299760AD506CC570
                  E412B8158AA718765CA2954E0CC5F0E212AD74C54D0C232ED14A62ACC470E112
                  AD64C4470C0B2ED14A6E4CC4F8E712AD18C6418C672ED14AA1BC8BF1C9656175
                  F983076BBE7EBAD050CC8DD3E77D4D9EE87F67D41B4D9D4DF3220F3EA3A9C4EA
                  95EA91DA81C6BEFDB821D93B34E4FD90A513472E5DA11BDC0885E006955C189F
                  38531F653BF3AA002E146E723E78D0B43B2B2E9F0ED7862F8C35CED40FFA5E90
                  9CC470A108CDE2DAAAEF05B1166E512E4ECEF0874209E342B99B53B9E4DE1C6F
                  CC37A604CDAD2A920BB43733EFAD2ECB3D09C7139CCBD3C7A46C543A49E542E1
                  A10CA2F1BD1485F37EF9A4EFCAE0B2B0BADC34DB718C56F68C54AA7B87BE8343
                  69F8328F122670B75B212BF4A2A59DD673936F3E5D3FE89AA0732E7D5FB7A537
                  07CD1D1ACB7523488CA1155CA33B8F1F7EF2F53F5DFCE583E4968B956BFC266F
                  0E122126F79F73F08B05AEC538E462F7F3A0DC577A301793FB0F89FB9D77EF7F
                  F1F8D97F5CFFA04172C5C5C56787F54AF5DAD1931903C1564CEE3FE16273C5E2
                  C52477629C7071F73973EE40301493BBCC2E86CB9118FB5C5CDF93204B8C172B
                  863FBA8F2C7329E7FE1529623C5A315C80A2D9E452E6BD4EFCC578B762B81885
                  B2C6A5FCFBE2388B6162C57061CCB3C3C5D73D943CC5B0B262B8488659E0E2F7
                  7E5B6E62185A315C309306E5C2E1DE6C3E62D85A315CBCDC06E2C2C18AE14094
                  2086B915C385CCAE7F2E1C56BED040381523C28AE1A266D427173E2B5F68201C
                  891164C57081D3EA870BB7952F3410D6C588B362B8D88915E6C273E50B0D8445
                  3142AD182E7C6FC5B8705EF9420361458C682B86ABD055012EFC57BED0400C28
                  468115C315D99D2917292B5F6820FA16A3C64A67750C9FBB36E2226BE5BB06C2
                  BA186556A8C6BEFDD74F9CCD7DE2299F8BF78F7607CCAE189556A8C3B5E1DF9E
                  389BFD3D395C9A5B9B6FFFF5B6F4C7926D89516C859A6F4CCE4F4C657C430E97
                  B73EFDB382674BC18618F55628DC25653C7491C5C5EEFDC6DE1B444C2056A07D
                  1073E3D4F9B43F4DE5B2DD6ABDF1F12DE9BBA1AEFA13138E15EAF2F4B1B94363
                  897F94CA45D9A6A593C9F33E0BABCBB40BA62729DF999CC93865506605DA0FE8
                  DC3C3797F847C95C546E5A3A59BC19519F152A6D0393CC45FAC9736E56C468B5
                  02E927D5C95C2E7DF559D1E7B9C535A018C556A80FCFFDB4F73A6F0217DC139D
                  FFE8A6EFA52DA3BEC5A8B782E111DB85F146D71713B8DC79FCF0D7F73EF7BDB4
                  25D5C72C4E215881F61C06D78E9EECFA620297006747369C234ECD9C7826E17F
                  A4BFFCE4E75D5F4CE0F2ABBBB7FFB6B1EE7B69CB0E4707B7BD73DF1F4BFC6016
                  CFAE718B12C2466577BD872F095C7EF4A79B5A4FA14DA2B9B2472A55FAEDBD27
                  EB6BFFDE0C73407A3F1048E072E2D61F7C2F678C45BD47BB914B2CB5DE0FA823
                  97586A914BAC40914BAC40914BAC404687BA819F4843FB1A4CE3BB2F3F19D869
                  BF88CBF7E278CBE8443ACCCB74D0FE18F667ED49C2BBAE4D35B736691AEDC127
                  BD95D5EF4F9DEFFA402D7E08F0328472717226F7B3C6F71FAC2D3657C2D9F4DE
                  9DFB45D75712B8A8BFD9A5ABC48F5ED37AF4ECE9A5AF3E0F610F9578CB4B0217
                  1C91373EFEA3EFA52DA98CFB52D3DA6EB5DEBE7B5BBD98C48748926F8F52F3BC
                  48767D58A14210D37BE002695C84BE56AA507D5BA1748B49BBBB3BF5D66EDD37
                  D40D6885522C26ED782EF5C111C5F78C655BC14337DCB8765EEF86A7D619DFAC
                  52CCDE57873E3C379778B3582A17AD07BCD956F07FC8C2CA72D7A972F6EC04FA
                  C4643C299DF5D0ABBE0B30B956D2AE208423068F5A6E9CFA71DA9A6671C15178
                  EBD38FD45CCAECDB0A158898DF1CF961C68DEE3933302C6DACE328F85E050B0D
                  6885522F26F1EEFFDDE54F07A4609764C50AA5588CC9045246938D897EA8D1A2
                  154AA518C327F48CB8081D027060855226C6FC694ED3992FC50D0138B342A911
                  E364A2545943008EAD500AC4389C8659CA1040295628D1629C4FF2CE7F08A044
                  2B94503125BD4282F31040E9562871624A7D410DCF21004F562841623CBCFE8A
                  DB1080572B940831DE5EAEC767088081158AB918CFAFEEE43004C0C60AC5560C
                  8B1703FB1D02606685622886D16BC77D0D01B0B442B11263711E613B5CCA1F02
                  606C856222C6A215B0C8A5CC2100F65628EF62EC5A01BB5CCA1902106285F228
                  C6BA15B0CEC5F51080282B9417312EAC800B2E4E87E0E2D48C2C2B54AE98F756
                  972D3EA6E3C80A38E2020EC4E088E376A5CCD7CFDB2DF7D6465BD33BB8B302EE
                  B8803D31344172F63B02995BA172C53C7AF674B1B93AC866C6A91570CA050616
                  83E33BD77E8830FB7E6311563A6B947BFB343D46D9C7EC43AEAD806B2ED01673
                  F5FE17DB45B6B113ED79B37B67714A4C9015CAF08DCDD09EB56A69637DA7F5FC
                  DE13A3C9BC4C66341A30E75C9C26CE0A652E865B82B9889E55A45EA95E3B7AD2
                  F5C6C07A22B9D00E4EEEA34F141E6AE0F1BBF93C671C92C7058F017107A4663E
                  C1C3B5E12BD3C74C8ED23824890B1EF7FD6E6D45E524AE78F6373F31C91F8D00
                  2EB8EBF9E4EB8778A4C2E1B63DA79D7E7D14DD147AD35FC9F1E582DB92A58D7F
                  E139A4CACD4946784C335B1B9EAD1DC003613C87627502E593CB627325F18A42
                  683E72C3D3A891EAFFF653AFBD7CD7E8715F867C72E1709FAFAC4AB86E9B9DE7
                  9D5114639E772BE09D0B44316671B0021CB840149317132BC0840B4431E9F1B1
                  027CB8401493142B2BC08A0B4431DF8E9B15E0C605A298FFC7D00A30E402510C
                  572BC0930B842D86AD1560CB054215C3D90A70E602E189616E0598738190C4F0
                  B702FCB9401862445801115C40BB182956400A17D02B46901510C405348A9165
                  056471015D62C45901715C408B188956402217902F46A81510CA05248B916B05
                  E472019962445B01D15C409A18E956403A17902346811550C0052488D1610574
                  7001DE62D45801355C80AB184D56401317E02746991550C6053889D16705F471
                  011E62545A01955CC0B718AD56402B17F02746B11550CC057C88D16D05747381
                  B6984BF73E2B673A2AF556403D17EAEAFD2F2DBEFE25B1DC17A2E828082EE078
                  36DEB94363EF4CCEB09A73D051A17081F69B3C165696EDCEF55DAF54AF4C1F9F
                  AD0DFB5EB9920A880B656B2E6793B72CE92B382E14A2C1A319DC43F5B17BC2C3
                  148492F18E3FC505CAA5138A597AB28E7AB2CFB771A7D37EC5D28133F551FE53
                  B1BB2B742EBB6B6E6DEEB45ADBADE74467A4BA8764709B3ADB63914BAC40914B
                  AC40914BAC40914BAC40914BAC40914BAC40914BAC40DF005B47F41FB261B9C4
                  0000000049454E44AE426082}
                Proportional = True
                Stretch = True
                ExplicitLeft = 73
                ExplicitTop = 110
                ExplicitWidth = 180
                ExplicitHeight = 180
              end
            end
          end
          object Panel11: TPanel
            Left = 404
            Top = 0
            Width = 300
            Height = 451
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object gb_Consulta_Periodo: TGroupBox
              Left = 0
              Top = 80
              Width = 300
              Height = 108
              Align = alTop
              Caption = 'Consultar Pix Recebidos por Periodo'
              TabOrder = 0
              object Label3: TLabel
                Left = 12
                Top = 24
                Width = 13
                Height = 13
                Caption = 'De'
              end
              object Label6: TLabel
                Left = 12
                Top = 47
                Width = 17
                Height = 13
                Caption = 'At'#233
              end
              object dtp_Data_Inicial: TDateTimePicker
                Left = 35
                Top = 20
                Width = 98
                Height = 21
                Date = 44600.000000000000000000
                Time = 0.521547824071603800
                TabOrder = 0
              end
              object Button5: TButton
                AlignWithMargins = True
                Left = 7
                Top = 76
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 5
                Margins.Bottom = 5
                Align = alBottom
                Caption = 'Consultar Lista de Pix Recebios Por Per'#237'odo'
                TabOrder = 1
                OnClick = Button5Click
              end
              object dtp_Data_Final: TDateTimePicker
                Left = 35
                Top = 47
                Width = 98
                Height = 21
                Date = 44600.000000000000000000
                Time = 0.521547824071603800
                TabOrder = 2
              end
              object dtp_Hora_Inicial: TDateTimePicker
                Left = 143
                Top = 20
                Width = 98
                Height = 21
                Date = 44600.000000000000000000
                Time = 0.521547824071603800
                Kind = dtkTime
                TabOrder = 3
              end
              object dtp_Hora_Final: TDateTimePicker
                Left = 143
                Top = 47
                Width = 98
                Height = 21
                Date = 44600.000000000000000000
                Time = 0.521547824071603800
                Kind = dtkTime
                TabOrder = 4
              end
            end
            object gb_Consulta_Pix_TXID: TGroupBox
              Left = 0
              Top = 188
              Width = 300
              Height = 261
              Align = alTop
              Caption = 'Pix'
              TabOrder = 1
              object Label16: TLabel
                AlignWithMargins = True
                Left = 8
                Top = 89
                Width = 41
                Height = 13
                Margins.Left = 6
                Margins.Right = 6
                Align = alTop
                Caption = 'TxIdDev'
              end
              object Label17: TLabel
                AlignWithMargins = True
                Left = 8
                Top = 18
                Width = 58
                Height = 13
                Margins.Left = 6
                Margins.Right = 6
                Align = alTop
                Caption = 'endToEndId'
              end
              object Button6: TButton
                AlignWithMargins = True
                Left = 7
                Top = 61
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 5
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Consultar Pix Recebido'
                TabOrder = 0
                OnClick = Button6Click
              end
              object Button4: TButton
                AlignWithMargins = True
                Left = 7
                Top = 143
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Solicitar Devolu'#231'ao Pix'
                TabOrder = 1
                OnClick = Button4Click
              end
              object Button7: TButton
                AlignWithMargins = True
                Left = 7
                Top = 173
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Consultar Devolu'#231'ao Pix'
                TabOrder = 2
                OnClick = Button7Click
              end
              object edt_e2eid: TEdit
                AlignWithMargins = True
                Left = 5
                Top = 37
                Width = 290
                Height = 21
                Align = alTop
                TabOrder = 3
              end
              object Panel12: TPanel
                AlignWithMargins = True
                Left = 5
                Top = 108
                Width = 290
                Height = 27
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 4
                object SpeedButton2: TSpeedButton
                  AlignWithMargins = True
                  Left = 200
                  Top = 3
                  Width = 87
                  Height = 21
                  Align = alRight
                  Caption = 'Gerer TxIdDev'
                  OnClick = SpeedButton2Click
                end
                object edtTxIdDev: TEdit
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 191
                  Height = 21
                  Align = alClient
                  TabOrder = 0
                end
              end
            end
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 300
              Height = 80
              Align = alTop
              Caption = 'Cobran'#231'a Pix'
              TabOrder = 2
              object Button2: TButton
                AlignWithMargins = True
                Left = 7
                Top = 15
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 5
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Consultar Cobran'#231'a Pix'
                TabOrder = 0
                OnClick = Button2Click
              end
              object Button3: TButton
                AlignWithMargins = True
                Left = 7
                Top = 45
                Width = 286
                Height = 25
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Cancelar Cobran'#231'a Pix'
                TabOrder = 1
                OnClick = Button3Click
              end
            end
          end
        end
      end
    end
    object pnl_menu: TPanel
      Left = 0
      Top = 0
      Width = 1004
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = clMedGray
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      ParentBackground = False
      TabOrder = 0
      object PnlBtn_Funcoes: TPanel
        AlignWithMargins = True
        Left = 196
        Top = 5
        Width = 185
        Height = 31
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'FUN'#199#213'ES'
        Color = clMenuHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = PnlBtn_FuncoesClick
        OnMouseLeave = PnlsBtnMouseLeave
        OnMouseMove = PnlsBtnMouseMove
      end
      object PnlBtn_Configs: TPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 185
        Height = 31
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'CONFIGURA'#199#213'ES'
        Color = clMenuHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = PnlBtn_ConfigsClick
        OnMouseLeave = PnlsBtnMouseLeave
        OnMouseMove = PnlsBtnMouseMove
      end
    end
    object pnl_Configs: TPanel
      Left = 0
      Top = 41
      Width = 1004
      Height = 451
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel1: TPanel
        Left = 0
        Top = 379
        Width = 1004
        Height = 72
        Align = alBottom
        TabOrder = 0
        object BitBtn1: TBitBtn
          AlignWithMargins = True
          Left = 766
          Top = 4
          Width = 234
          Height = 64
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Salvar Configura'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
      end
      object gb_Config_Seg: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 998
        Height = 152
        Align = alTop
        Caption = 'Configura'#231#245'es de Seguran'#231'a Pix'
        TabOrder = 1
        object Label2: TLabel
          Left = 404
          Top = 64
          Width = 75
          Height = 13
          Caption = 'Tipo Chave PIX'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_Cert: TSpeedButton
          Left = 171
          Top = 77
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000060605
            05A7181613DF0000003D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000070707A7ACA8
            A4FFA69A8DFF2C2722F30000003D000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001C1918E0C1B8
            B0FFDCD7D1FFA69A8DFF2C2722F30000003D0000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000003D312D
            28F3C1B8B0FFDCD7D1FFA69A8DFF2C2722F30000003300000012000000540000
            0072000000680000003400000000000000000000000000000000000000000000
            003D312D28F3C1B8B0FFDCD7D1FF998E83FF020201DB322D28F6685E53FF7E72
            66FF796F63FF59524BFF131110CE000000360000000000000000000000000000
            00000000003D312D28F3B2ABA3FFD0C9C3FF887B6DFFA5998BFFA99E87FFB3A9
            6EFFAA9F73FFA39789FFA09387FF423E3AF70000004800000000000000000000
            00000000000000000034020202DC8F8275FFAFA598FFC3B14CFFEDE143FFF9F3
            5CFFF7EF53FFD5C435FFA7986CFFAB9F93FF32312FEE00000017000000000000
            00000000000000000012342E29F7B3A89DFFBCA243FFE3C517FFEBD626FFEFDD
            26FFEDDB26FFE8D026FFD2AF0BFFA3947AFF9F978FFF00000085000000000000
            00000000000000000054726A61FFB5A998FFCD9D02FFD9B000FFDFBC00FFE2C2
            00FFE1C000FFDCB700FFD6A900FFAA8A35FFBCB2A8FF1E1D1CCF000000000000
            0000000000000000007391887EFFB4A17EFFCA9100FFD09E00FFD5A700FFD7AC
            00FFD6AA00FFD3A300FFCE9800FFAD801AFFBAB0A6FF3F3D3CED000000000000
            000000000000000000688E867EFFB4A38AFFC18000FFC78B01FFCD9607FFD09C
            0DFFD09C10FFCD9812FFC98F13FFA57825FFC5BDB4FF353434E3000000000000
            00000000000000000034635D57FFC7C0B7FFB27C2AFFD1A04BFFD4A54DFFD5A7
            4DFFD5A64DFFD3A34DFFCC963FFF9E8157FFD2CDC7FF090909AF000000000000
            00000000000000000000131110CEC8C1BAFFB19C82FFC6975CFFE6CBA6FFE7CD
            A8FFE7CDA8FFDDB98AFFA27640FFC7C0B7FF858381FF0000004B000000000000
            0000000000000000000000000036464340F7D8D3CDFFB8AA99FFA88357FFB794
            6AFFAE8A5EFFA18360FFCEC7C0FFB9B6B4FF070707AA00000000000000000000
            000000000000000000000000000000000048343231EEB9B5B1FFE3E0DCFFDDD8
            D3FFE1DDD8FFE2DFDCFF898785FF070707AA0000000800000000000000000000
            00000000000000000000000000000000000000000017000000851E1D1DD03F3D
            3CED353434E3090909AF0000004B000000000000000000000000}
          OnClick = btn_CertClick
        end
        object btn_KeyCert: TSpeedButton
          Left = 358
          Top = 78
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000060605
            05A7181613DF0000003D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000070707A7ACA8
            A4FFA69A8DFF2C2722F30000003D000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001C1918E0C1B8
            B0FFDCD7D1FFA69A8DFF2C2722F30000003D0000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000003D312D
            28F3C1B8B0FFDCD7D1FFA69A8DFF2C2722F30000003300000012000000540000
            0072000000680000003400000000000000000000000000000000000000000000
            003D312D28F3C1B8B0FFDCD7D1FF998E83FF020201DB322D28F6685E53FF7E72
            66FF796F63FF59524BFF131110CE000000360000000000000000000000000000
            00000000003D312D28F3B2ABA3FFD0C9C3FF887B6DFFA5998BFFA99E87FFB3A9
            6EFFAA9F73FFA39789FFA09387FF423E3AF70000004800000000000000000000
            00000000000000000034020202DC8F8275FFAFA598FFC3B14CFFEDE143FFF9F3
            5CFFF7EF53FFD5C435FFA7986CFFAB9F93FF32312FEE00000017000000000000
            00000000000000000012342E29F7B3A89DFFBCA243FFE3C517FFEBD626FFEFDD
            26FFEDDB26FFE8D026FFD2AF0BFFA3947AFF9F978FFF00000085000000000000
            00000000000000000054726A61FFB5A998FFCD9D02FFD9B000FFDFBC00FFE2C2
            00FFE1C000FFDCB700FFD6A900FFAA8A35FFBCB2A8FF1E1D1CCF000000000000
            0000000000000000007391887EFFB4A17EFFCA9100FFD09E00FFD5A700FFD7AC
            00FFD6AA00FFD3A300FFCE9800FFAD801AFFBAB0A6FF3F3D3CED000000000000
            000000000000000000688E867EFFB4A38AFFC18000FFC78B01FFCD9607FFD09C
            0DFFD09C10FFCD9812FFC98F13FFA57825FFC5BDB4FF353434E3000000000000
            00000000000000000034635D57FFC7C0B7FFB27C2AFFD1A04BFFD4A54DFFD5A7
            4DFFD5A64DFFD3A34DFFCC963FFF9E8157FFD2CDC7FF090909AF000000000000
            00000000000000000000131110CEC8C1BAFFB19C82FFC6975CFFE6CBA6FFE7CD
            A8FFE7CDA8FFDDB98AFFA27640FFC7C0B7FF858381FF0000004B000000000000
            0000000000000000000000000036464340F7D8D3CDFFB8AA99FFA88357FFB794
            6AFFAE8A5EFFA18360FFCEC7C0FFB9B6B4FF070707AA00000000000000000000
            000000000000000000000000000000000048343231EEB9B5B1FFE3E0DCFFDDD8
            D3FFE1DDD8FFE2DFDCFF898785FF070707AA0000000800000000000000000000
            00000000000000000000000000000000000000000017000000851E1D1DD03F3D
            3CED353434E3090909AF0000004B000000000000000000000000}
          OnClick = btn_KeyCertClick
        end
        object edtCertificado: TLabeledEdit
          Left = 15
          Top = 79
          Width = 150
          Height = 21
          EditLabel.Width = 100
          EditLabel.Height = 13
          EditLabel.Caption = 'Caminho Certificado:'
          TabOrder = 0
        end
        object edtSenhaCertificado: TLabeledEdit
          Left = 202
          Top = 80
          Width = 150
          Height = 21
          EditLabel.Width = 89
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha Certificado:'
          TabOrder = 1
        end
        object edtClientID: TLabeledEdit
          Left = 291
          Top = 39
          Width = 265
          Height = 21
          EditLabel.Width = 41
          EditLabel.Height = 13
          EditLabel.Caption = 'Client ID'
          TabOrder = 2
        end
        object edtClientSecreat: TLabeledEdit
          Left = 569
          Top = 39
          Width = 412
          Height = 21
          EditLabel.Width = 61
          EditLabel.Height = 13
          EditLabel.Caption = 'Client Secret'
          TabOrder = 3
        end
        object edtDeveloperKey: TLabeledEdit
          Left = 15
          Top = 39
          Width = 265
          Height = 21
          EditLabel.Width = 125
          EditLabel.Height = 13
          EditLabel.Caption = 'Developer Application Key'
          TabOrder = 4
        end
        object edtChavePix: TLabeledEdit
          Left = 569
          Top = 79
          Width = 425
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = 'Chave Pix'
          TabOrder = 5
        end
        object CbbTipoChavePix: TComboBox
          Left = 389
          Top = 79
          Width = 167
          Height = 21
          TabOrder = 6
        end
        object edtNomeRecebedore: TLabeledEdit
          Left = 569
          Top = 121
          Width = 412
          Height = 21
          EditLabel.Width = 111
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome Titular da Conta:'
          MaxLength = 25
          TabOrder = 7
        end
        object edtCidadeRecebedor: TLabeledEdit
          Left = 15
          Top = 121
          Width = 541
          Height = 21
          EditLabel.Width = 56
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade Loja'
          TabOrder = 8
        end
      end
      object gbConfigImpressora: TGroupBox
        Left = 0
        Top = 264
        Width = 1004
        Height = 115
        Align = alBottom
        Caption = 'Impressora'
        TabOrder = 2
        object Label25: TLabel
          Left = 532
          Top = 47
          Width = 66
          Height = 13
          Caption = 'Linhas '#224' pular'
          Color = clBtnFace
          ParentColor = False
        end
        object Label26: TLabel
          Left = 407
          Top = 47
          Width = 98
          Height = 13
          Caption = 'Espa'#231'os entre linhas'
          Color = clBtnFace
          ParentColor = False
        end
        object Label27: TLabel
          Left = 720
          Top = 47
          Width = 38
          Height = 13
          Caption = 'Colunas'
          Color = clBtnFace
          ParentColor = False
        end
        object Label28: TLabel
          Left = 9
          Top = 47
          Width = 34
          Height = 13
          Caption = 'Modelo'
          Transparent = False
        end
        object Label7: TLabel
          Left = 204
          Top = 47
          Width = 26
          Height = 13
          Caption = 'Porta'
          Color = clBtnFace
          ParentColor = False
        end
        object Label29: TLabel
          Left = 620
          Top = 47
          Width = 71
          Height = 13
          Caption = 'P'#225'g. de c'#243'digo'
          Transparent = False
        end
        object btSerial: TSpeedButton
          Left = 847
          Top = 64
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000B0000
            0051000000580000005800000058000000580000005800000058000000580000
            005800000058000000580000005800000058000000510000000B000000B90000
            0066000000580000005800000058000000580000005800000058000000580000
            00580000005800000058000000580000005800000066000000B9000000A80000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000A8000000A80000
            0000000000000000000F000000B7000000A8000000A8000000A8000000A80000
            00A8000000A8000000B70000000F0000000000000000000000A8000000A80000
            0000000000000000007E0000005A0000001C00000037000000370000001C0000
            001C00000037000000460000007E0000000000000000000000A8000000A80000
            003700000037000000AA000000020000001C0000000F0000000F0000001C0000
            001C0000000F00000011000000AA0000003700000037000000A8000000A80000
            003700000037000000AD000000000000001C0000000F0000000F0000001C0000
            001C0000000F0000000F000000AD0000003700000037000000A8000000A80000
            000000000000000000A70000001C0000001C00000037000000370000001C0000
            001C0000003700000000000000A70000000000000000000000A8000000A80000
            0000000000000000005F000000A9000000A8000000A8000000A8000000A80000
            00A8000000A8000000A90000005F0000000000000000000000A8000000A80000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000A8000000B90000
            0066000000580000005800000058000000580000005800000058000000580000
            00580000005800000058000000580000005800000066000000B90000000B0000
            0051000000580000005800000058000000580000005800000058000000580000
            005800000058000000580000005800000058000000510000000B000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          OnClick = btSerialClick
        end
        object btProcuraImpressoras: TSpeedButton
          Left = 816
          Top = 64
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000060605
            05A7181613DF0000003D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000070707A7ACA8
            A4FFA69A8DFF2C2722F30000003D000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001C1918E0C1B8
            B0FFDCD7D1FFA69A8DFF2C2722F30000003D0000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000003D312D
            28F3C1B8B0FFDCD7D1FFA69A8DFF2C2722F30000003300000012000000540000
            0072000000680000003400000000000000000000000000000000000000000000
            003D312D28F3C1B8B0FFDCD7D1FF998E83FF020201DB322D28F6685E53FF7E72
            66FF796F63FF59524BFF131110CE000000360000000000000000000000000000
            00000000003D312D28F3B2ABA3FFD0C9C3FF887B6DFFA5998BFFA99E87FFB3A9
            6EFFAA9F73FFA39789FFA09387FF423E3AF70000004800000000000000000000
            00000000000000000034020202DC8F8275FFAFA598FFC3B14CFFEDE143FFF9F3
            5CFFF7EF53FFD5C435FFA7986CFFAB9F93FF32312FEE00000017000000000000
            00000000000000000012342E29F7B3A89DFFBCA243FFE3C517FFEBD626FFEFDD
            26FFEDDB26FFE8D026FFD2AF0BFFA3947AFF9F978FFF00000085000000000000
            00000000000000000054726A61FFB5A998FFCD9D02FFD9B000FFDFBC00FFE2C2
            00FFE1C000FFDCB700FFD6A900FFAA8A35FFBCB2A8FF1E1D1CCF000000000000
            0000000000000000007391887EFFB4A17EFFCA9100FFD09E00FFD5A700FFD7AC
            00FFD6AA00FFD3A300FFCE9800FFAD801AFFBAB0A6FF3F3D3CED000000000000
            000000000000000000688E867EFFB4A38AFFC18000FFC78B01FFCD9607FFD09C
            0DFFD09C10FFCD9812FFC98F13FFA57825FFC5BDB4FF353434E3000000000000
            00000000000000000034635D57FFC7C0B7FFB27C2AFFD1A04BFFD4A54DFFD5A7
            4DFFD5A64DFFD3A34DFFCC963FFF9E8157FFD2CDC7FF090909AF000000000000
            00000000000000000000131110CEC8C1BAFFB19C82FFC6975CFFE6CBA6FFE7CD
            A8FFE7CDA8FFDDB98AFFA27640FFC7C0B7FF858381FF0000004B000000000000
            0000000000000000000000000036464340F7D8D3CDFFB8AA99FFA88357FFB794
            6AFFAE8A5EFFA18360FFCEC7C0FFB9B6B4FF070707AA00000000000000000000
            000000000000000000000000000000000048343231EEB9B5B1FFE3E0DCFFDDD8
            D3FFE1DDD8FFE2DFDCFF898785FF070707AA0000000800000000000000000000
            00000000000000000000000000000000000000000017000000851E1D1DD03F3D
            3CED353434E3090909AF0000004B000000000000000000000000}
          OnClick = btProcuraImpressorasClick
        end
        object seLinhasPular: TSpinEdit
          Left = 532
          Top = 64
          Width = 75
          Height = 22
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object seEspLinhas: TSpinEdit
          Left = 407
          Top = 64
          Width = 108
          Height = 22
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 0
        end
        object seColunas: TSpinEdit
          Left = 720
          Top = 64
          Width = 75
          Height = 22
          MaxValue = 999
          MinValue = 1
          TabOrder = 5
          Value = 48
        end
        object cbxModeloPosPrinter: TComboBox
          Left = 9
          Top = 64
          Width = 180
          Height = 21
          Style = csDropDownList
          TabOrder = 0
        end
        object cbxPorta: TComboBox
          Left = 204
          Top = 64
          Width = 161
          Height = 21
          TabOrder = 1
        end
        object cbxPagCodigo: TComboBox
          Left = 620
          Top = 64
          Width = 76
          Height = 21
          Hint = 'Pagina de c'#243'digo usada pela Impressora POS'
          Style = csDropDownList
          TabOrder = 2
        end
        object btTestarPosPrinter: TBitBtn
          Left = 887
          Top = 15
          Width = 115
          Height = 98
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Testar Impressora'
          Layout = blGlyphTop
          TabOrder = 6
          OnClick = btTestarPosPrinterClick
        end
      end
      object grbxPSP: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 161
        Width = 998
        Height = 100
        Align = alClient
        Caption = 'Configura'#231#245'es Psp'
        TabOrder = 3
        object Label4: TLabel
          Left = 16
          Top = 44
          Width = 18
          Height = 13
          Caption = 'Psp'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 316
          Top = 44
          Width = 68
          Height = 13
          Caption = 'Tipo Ambiente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object CbbPSP: TComboBox
          Left = 16
          Top = 60
          Width = 286
          Height = 21
          TabOrder = 0
        end
        object CbbTipoAmbiente: TComboBox
          Left = 316
          Top = 60
          Width = 160
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 424
    Top = 47
    Width = 81
    Height = 30
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 656
    Top = 56
  end
  object Open_Dialog: TOpenDialog
    Filter = 'cert|*.cert|pem|*.key'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 724
    Top = 52
  end
  object RscPix1: TRscPix
    Seguranca.SSLVersions = [sslvSSLv23, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    Seguranca.SSLMethod = sslvSSLv3
    TitularPix.TipoChavePix = tcCPF
    TitularPix.DuracaoMinutos = 0
    TitularPix.TipoQRCode = tqDinamico
    PSP.TipoPsp = pspSicredi
    PSP.TipoPspAmbiente = taSandBox
    OnCobGet = RscPix1CobGet
    OnCobPut = RscPix1CobPut
    OnCobPatch = RscPix1CobPatch
    OnToken = RscPix1Token
    OnPixGet = RscPix1PixGet
    OnPixPut = RscPix1PixPut
    Left = 360
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 552
    Top = 40
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 480
    Top = 40
    object FDMemTable1nomePagador: TStringField
      FieldName = 'nomePagador'
    end
    object FDMemTable1cpfcnpjpagador: TStringField
      FieldName = 'cpfcnpjpagador'
    end
    object FDMemTable1inforpagador: TStringField
      FieldName = 'inforpagador'
    end
    object FDMemTable1endtoebdid: TStringField
      DisplayWidth = 60
      FieldName = 'endtoebdid'
      Size = 60
    end
    object FDMemTable1txid: TStringField
      DisplayWidth = 60
      FieldName = 'txid'
      Size = 60
    end
    object FDMemTable1valor: TCurrencyField
      FieldName = 'valor'
    end
    object FDMemTable1horario: TStringField
      FieldName = 'horario'
    end
  end
end
