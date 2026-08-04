/*
================================================================================
-- Nome        : Banco de Dados - Controle de Transação SQL (Commit e Rollback)
-- Função      : Exemplo de transação atômica (IniciarTransacao, FinalizarTransacao
--               e DesfazerTransacao) garantindo consistência total nas operações.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração da Função de Validação -- @
Definir Funcao ValidaErro();

@ -- Declaração das Variáveis Globais -- @
Definir Alfa aCodPai;
Definir Alfa aNomPai;
Definir Alfa aMerSul;
Definir Numero nEANPai;
Definir Alfa aVisEnt;
Definir Alfa aSigUfs;
Definir Alfa aNomUfs;
Definir Alfa aMsgErro;
Definir Numero nSucesso;
Definir Numero i;

@ -- Atribuição dos Dados do País -- @
aCodPai = "9876";
aNomPai = "País " + aCodPai;
aMerSul = "N";
nEANPai = 0;
aVisEnt = "N";

@ -- Início da operação atômica de comandos SQL (Abertura de Transação) -- @
IniciarTransacao();

@ -- 1. Exclui os estados vinculados ao país -- @
ExecSqlEx("DELETE FROM tb_estado WHERE CODPAI = :aCodPai", nSucesso, aMsgErro);
ValidaErro();

@ -- 2. Exclui o país principal -- @
ExecSqlEx("DELETE FROM tb_pais WHERE CODPAI = :aCodPai", nSucesso, aMsgErro);
ValidaErro();

@ -- 3. Reinsere o país principal -- @
ExecSqlEx("INSERT INTO tb_pais VALUES (:aCodPai, :aNomPai, NULL, :aMerSul, \
           :nEANPai, :aVisEnt, NULL, NULL, NULL, NULL)", nSucesso, aMsgErro);
ValidaErro();

@ -- 4. Laço para inserção de múltiplos estados vinculados -- @
Para (i = 1; i <= 9; i++)
Inicio
    aSigUfs = "";
    IntParaAlfa(i, aSigUfs);
    aSigUfs = "A" + aSigUfs;
    aNomUfs = "Estado " + aSigUfs;
    
    ExecSqlEx("INSERT INTO tb_estado VALUES (:aSigUfs, :aNomUfs, :aCodPai, NULL)", nSucesso, aMsgErro);
    ValidaErro();
Fim;

@ -- Confirma definitivamente as alterações no banco de dados (Commit) -- @
FinalizarTransacao();
Mensagem(Retorna, "A operação foi realizada com sucesso!");

@ ============================================================================== @
@ -- Implementação da Função de Validação e Tratamento de Erros -- @
@ ============================================================================== @
Funcao ValidaErro();
Inicio
    @ -- Se ocorreu erro (nSucesso = 1), desfaz a transação completa (Rollback) -- @
    Se (nSucesso = 1)
    Inicio
        DesfazerTransacao();
        aMsgErro = "Erro na execução da operação SQL: " + aMsgErro;
        
        @ -- Aborta a execução da regra exibindo mensagem de erro -- @
        Mensagem(Erro, aMsgErro);
    Fim;
Fim;
