/*
================================================================================
-- Nome        : Modularização - Validação de Registro e Exclusão via ExecSQL
-- Função      : Exemplo de uso de função customizada para verificação de existência
--               de registro no banco e remoção de dados com ExecSQL (DELETE).
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração de Variáveis Globais -- @
Definir Numero nPaisExiste;
Definir Alfa aCodPai;

@ -- Assinatura da Função Customizada -- @
Definir Funcao PaisExiste(Numero End aPaisExiste);

@ -- Inicialização dos Dados -- @
aCodPai = "9876";
nPaisExiste = 0; @ Assume que o registro não existe inicialmente @

@ -- Verifica se o registro existe no banco de dados -- @
PaisExiste(nPaisExiste);

@ -- Se o registro existir, executa o comando de exclusão (DELETE) -- @
Se (nPaisExiste = 1)
Inicio
    ExecSQL "DELETE FROM tb_pais WHERE CODPAI = :aCodPai";
    
    @ -- Revalida a existência do registro para confirmar a remoção -- @
    PaisExiste(nPaisExiste);
Fim;

@ ============================================================================== @
@ -- Implementação da Função Customizada PaisExiste -- @
@ ============================================================================== @
Funcao PaisExiste(Numero End aPaisExiste);
Inicio
    Definir Cursor Cur_tb_pais;
    Definir Alfa aNomPai;
    
    aNomPai = ""; 
    aPaisExiste = 0; @ Flag 0 = Não existe @
    
    @ -- Consulta no banco de dados para verificar a presença do código -- @
    Cur_tb_pais.SQL "SELECT NOMPAI FROM tb_pais WHERE CODPAI = :aCodPai";
    Cur_tb_pais.AbrirCursor();
    
    Se (Cur_tb_pais.Achou)
    Inicio
        aNomPai = "Nome do país '" + aCodPai + "' = '" + Cur_tb_pais.NOMPAI + "'";
        aPaisExiste = 1; @ Flag 1 = Existe @
    Fim;
    Senao 
    Inicio
        aNomPai = "País '" + aCodPai + "' não encontrado!";
    Fim;
    
    @ -- Fechamento obrigatório do cursor -- @
    Cur_tb_pais.FecharCursor();
    
    @ -- Exibição do status obtido -- @
    Mensagem(Retorna, aNomPai);
Fim;
