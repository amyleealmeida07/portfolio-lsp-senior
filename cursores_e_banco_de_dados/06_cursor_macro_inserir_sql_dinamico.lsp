/*
================================================================================
-- Nome        : Banco de Dados - SQL Dinâmico via Macro __INSERIR em Cursor
-- Função      : Exemplo de injeção dinâmica de trechos de código SQL dentro da
--               instrução do cursor utilizando a macro nativa __INSERIR().
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Numero nCount;
Definir Alfa aStr;
Definir Alfa aMacro; @ Conterá o trecho SQL condicional a ser injetado @

@ -- Declaração do Cursor do Banco de Dados -- @
Definir Cursor Cur_tb_pais;

@ -- Definição da cláusula SQL dinâmica que será injetada na macro -- @
aMacro = "AND CODMOE = '01'";

@ -- Montagem da consulta SQL contendo a macro __INSERIR -- @
Cur_tb_pais.SQL "SELECT CODPAI, NOMPAI \
                   FROM tb_pais \
                  WHERE MERSUL = 'S' \
                        __INSERIR(:aMacro) \
                  ORDER BY CODPAI";

@ -- Inicialização do contador e abertura do cursor -- @
nCount = 0;
Cur_tb_pais.AbrirCursor();

@ -- Iteração sobre os registros encontrados com o filtro dinâmico aplicado -- @
Enquanto (Cur_tb_pais.Achou)
Inicio
    nCount++;
    Cur_tb_pais.Proximo();
Fim;

@ -- Fechamento obrigatório do cursor -- @
Cur_tb_pais.FecharCursor();

@ -- Formatação e exibição do resultado obtido -- @
IntParaAlfa(nCount, aStr);
aStr = "Encontrados '" + aStr + "' registros!";

Mensagem(Retorna, aStr);
