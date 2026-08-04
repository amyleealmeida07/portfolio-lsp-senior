/*
================================================================================
-- Nome        : Banco de Dados - Atualização DML (UPDATE) via Cursor Dinâmico
-- Função      : Exemplo de execução de instrução UPDATE utilizando as funções SQL_
--               (SQL_Criar, SQL_DefinirComando, SQL_AbrirCursor e SQL_Destruir).
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração da Variável de Manipulador do Cursor -- @
Definir Alfa cCursor;

@ -- Instanciação e criação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Definição do comando DML de atualização -- @
SQL_DefinirComando(cCursor, "UPDATE tb_cliente \
                                SET APECLI = 'Cliente A (Santa Catarina)' \
                              WHERE CODCLI = 1");

@ -- Execução da instrução no banco de dados -- @
SQL_AbrirCursor(cCursor);

@ -- Fechamento e liberação de memória do cursor dinâmico -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);
