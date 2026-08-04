/*
================================================================================
-- Nome        : Banco de Dados - Parâmetros Multi-tipos e Leitura com Máscara
-- Função      : Exemplo completo de cursor dinâmico (SQL_) utilizando múltiplos tipos 
--               de parâmetros (Inteiro, Data, Flutuante) e formatação de saídas.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Numero nCodEmp;
Definir Numero nCodFil;
Definir Data dDatEmi;
Definir Alfa aDatEmi;
Definir Numero nNumNfv;
Definir Alfa aNumNfv;
Definir Numero nVlrLiq;
Definir Alfa aVlrLiq;
Definir Alfa aNomCli;
Definir Alfa cCursor;
Definir Alfa aNL; @ Caractere de nova linha @
Definir Alfa aRetorno;

@ -- Atribuição inicial das variáveis de filtro -- @
nCodEmp = 1;
nCodFil = 1;
MontaData(27, 05, 2005, dDatEmi);
nVlrLiq = 1000;

@ -- Instanciação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Consulta SQL unindo vendas e clientes com aliases explicito nas colunas -- @
SQL_DefinirComando(cCursor, "SELECT nfv.NUMNFV, nfv.DATEMI, nfv.VLRLIQ, cli.NOMCLI \
                              FROM tb_nota_fiscal nfv, tb_cliente cli \
                             WHERE nfv.CODCLI = cli.CODCLI \
                               AND nfv.CODEMP = :nCodEmp \
                               AND nfv.CODFAM = :nCodFil \
                               AND nfv.DATEMI = :dDatEmi \
                               AND nfv.VLRLIQ > :nVlrLiq");

@ -- Atribuição dos parâmetros de acordo com o tipo de dado correto -- @
SQL_DefinirInteiro(cCursor, "nCodEmp", nCodEmp);
SQL_DefinirInteiro(cCursor, "nCodFil", nCodFil);
SQL_DefinirData(cCursor, "dDatEmi", dDatEmi);
SQL_DefinirFlutuante(cCursor, "nVlrLiq", nVlrLiq);

@ -- Abertura do cursor dinâmico -- @
SQL_AbrirCursor(cCursor);

CaracterParaAlfa(10, aNL); @ ASCII 10 (Line Feed) @
aRetorno = "Dados encontrados:";

@ -- Iteração sobre os registros encontrados -- @
Enquanto (SQL_EOF(cCursor) = 0)
Inicio
    @ -- Recupera os valores de retorno do cursor para as variáveis locais -- @
    SQL_RetornarAlfa(cCursor, "NOMCLI", aNomCli);
    
    SQL_RetornarInteiro(cCursor, "NUMNFV", nNumNfv);
    ConverteMascara(1, nNumNfv, aNumNfv, "999.999.999");
    
    SQL_RetornarFlutuante(cCursor, "VLRLIQ", nVlrLiq);
    ConverteMascara(2, nVlrLiq, aVlrLiq, "#-#zzz.zzz.zz9.99");
    
    SQL_RetornarData(cCursor, "DATEMI", dDatEmi);
    ConverteMascara(3, dDatEmi, aDatEmi, "DD/MM/YYYY");
    
    @ -- Montagem da mensagem formatada -- @
    aRetorno = aRetorno + aNL + "Cliente: " + aNomCli + 
               ", Nr. Nota: " + aNumNfv + 
               ", Vlr. Líquido: " + aVlrLiq + 
               ", Data Emissão: " + aDatEmi + aNL + 
               "------------------------";
    
    @ -- Avança para o próximo registro -- @
    SQL_Proximo(cCursor);
Fim;

@ -- Fechamento e liberação de memória do cursor -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);

@ -- Exibição dos dados consolidados -- @
Mensagem(Retorna, aRetorno);
