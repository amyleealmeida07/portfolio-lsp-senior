/*
================================================================================
-- Nome        : Banco de Dados - Execução de SQL com Tratamento de Erro (ExecSqlEx)
-- Função      : Exemplo de inserção de dados via ExecSqlEx tratando o retorno de 
--               sucesso/falha e capturando a mensagem de erro do banco de dados.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Numero nSucesso;
Definir Alfa aMensagem;
Definir Alfa aSQL;
Definir Alfa aCodPai;
Definir Alfa aNomPai;
Definir Alfa aMerSul;
Definir Numero nEANPai;
Definir Alfa aVisEnt;

@ -- Atribuição das Variáveis para o Registro -- @
aCodPai = "9876";
aNomPai = "País " + aCodPai;
aMerSul = "N";
nEANPai = 0;
aVisEnt = "N";

@ -- Execução da instrução INSERT capturando status e mensagem de erro -- @
ExecSqlEx("INSERT INTO tb_pais (CODPAI, NOMPAI, CODMOE, MERSUL, EANPAI, VISENT, PAISIS) \
           VALUES (:aCodPai, :aNomPai, NULL, :aMerSul, :nEANPai, :aVisEnt, NULL)", 
           nSucesso, 
           aMensagem);

@ -- Avaliação do resultado da execução (0 = Sucesso) -- @
Se (nSucesso = 0)
Inicio
    Mensagem(Retorna, "Registro inserido com sucesso!");
Fim;
Senao
Inicio
    @ -- Trata e exibe o erro retornado pelo banco de dados -- @
    aMensagem = "Erro ao inserir registro: " + aMensagem;             
    Mensagem(Erro, aMensagem);
Fim;
