/*
================================================================================
-- Nome        : Banco de Dados - Execução de UPDATE e Descarte de Cursor Dinâmico
-- Função      : Exemplo de ciclo de vida completo de cursor dinâmico para instruções
--               DML (UPDATE), incluindo fechamento e liberação com SQL_Destruir.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração da Variável de Manipulador do Cursor -- @
Definir Alfa cCursor;

@ -- Instanciação e criação do cursor dinâmico em memória -- @
SQL_Criar(cCursor);

@ -- Definição do comando DML de atualização -- @
SQL_DefinirComando(cCursor, "UPDATE tb_cliente \
                                SET APECLI = 'Cliente A (Santa Catarina)' \
                              WHERE CODCLI = 1");

@ -- Execução da instrução no banco de dados -- @
SQL_AbrirCursor(cCursor);

@ -- Fechamento do cursor após a execução do comando -- @
SQL_FecharCursor(cCursor);

@ -- Liberação definitiva do objeto da memória do servidor -- @
SQL_Destruir(cCursor);
