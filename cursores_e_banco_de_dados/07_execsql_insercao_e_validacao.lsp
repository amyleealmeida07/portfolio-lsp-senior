/*
================================================================================
-- Nome        : Banco de Dados - Inserção via ExecSql e Validação com Cursor
-- Função      : Exemplo de execução de comando DML (INSERT) usando o comando 
--               ExecSql e posterior verificação da gravação via cursor LSP.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Numero nEANPai;
Definir Numero nResult;
Definir Alfa aCodPai;
Definir Alfa aNomPai;
Definir Alfa aMerSul;
Definir Alfa aVisEnt;

@ -- Declaração do Cursor de Verificação -- @
Definir Cursor Cur_tb_pais;

@ -- Atribuição das Variáveis para o Novo Registro -- @
aCodPai = "9876";
aNomPai = "País " + aCodPai;
aMerSul = "N";
nEANPai = 0;
aVisEnt = "N";

@ -- Execução do comando INSERT dinâmico no banco de dados via ExecSql -- @
ExecSql "INSERT INTO tb_pais \
          (CODPAI, NOMPAI, CODMOE, MERSUL, EANPAI, VISENT, PAISIS) VALUES \
          (:aCodPai, :aNomPai, NULL, :aMerSul, :nEANPai, :aVisEnt, NULL)";

nResult = 0; @ Inicializa a flag de verificação (0 = Não encontrado) @

@ -- Verificação da gravação no banco de dados através do cursor -- @
Cur_tb_pais.SQL "SELECT CODPAI \
                   FROM tb_pais \
                  WHERE CODPAI = :aCodPai";

Cur_tb_pais.AbrirCursor();

Se (Cur_tb_pais.Achou)
Inicio
    nResult = 1; @ Flag atualizada para registro encontrado @
Fim;

@ -- Fechamento obrigatório do cursor -- @
Cur_tb_pais.FecharCursor();

@ -- Exibição da confirmação para o usuário -- @
Se (nResult = 1)
Inicio
    Mensagem(Retorna, "Registro inserido e encontrado com sucesso!");
Fim;
Senao
Inicio
    Mensagem(Retorna, "O registro não foi encontrado no banco de dados!");
Fim;
