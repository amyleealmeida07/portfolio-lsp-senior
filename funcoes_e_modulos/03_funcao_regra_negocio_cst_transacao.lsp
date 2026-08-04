/*
================================================================================
-- Nome        : Regra de Negócio - Preenchimento Automático de CST por Transação
-- Função      : Consulta a situação tributária (CST) vinculada à transação da nota 
--               fiscal e atribui automaticamente ao item caso esteja preenchida.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis de Sistema do Identificador (Variáveis de Entrada/Saída) -- @
Definir Alfa VSORIGEM;
Definir Alfa VSCODTNS;
Definir Alfa VSCODSTR;

@ -- Declaração das Variáveis Locais do Script -- @
Definir Alfa vCstTransacao;
Definir Alfa vCodTns;
Definir Numero vCodEmp;
Definir Numero vTamTexto;
Definir Alfa vQuery;

@ -- Valida se a transação foi informada -- @
Se (VSCODTNS <> "")
Inicio
    vCodEmp = CodEmp;
    vCodTns = VSCODTNS;
    vCstTransacao = "";

    @ -- Cria e configura o cursor dinâmico para buscar o CST da transação -- @
    SQL_Criar(vQuery);
    SQL_DefinirComando(vQuery, "SELECT COMSTR FROM tb_transacao WHERE CODEMP = :vCodEmp AND CODTNS = :vCodTns");
    SQL_DefinirInteiro(vQuery, "vCodEmp", vCodEmp);
    SQL_DefinirAlfa(vQuery, "vCodTns", vCodTns);
    SQL_AbrirCursor(vQuery);
    
    @ -- Leitura do valor retornado -- @
    Se (SQL_EOF(vQuery) = 0)
    Inicio
        SQL_RetornarAlfa(vQuery, "COMSTR", vCstTransacao);
    Fim;
        
    @ -- Encerramento e liberação de memória do cursor -- @
    SQL_FecharCursor(vQuery);
    SQL_Destruir(vQuery);

    @ -- Verifica se retornou algum CST válido -- @
    TamanhoAlfa(vCstTransacao, vTamTexto);

    Se (vTamTexto > 0)
    Inicio
        VSCODSTR = vCstTransacao;
    Fim;
Fim;
