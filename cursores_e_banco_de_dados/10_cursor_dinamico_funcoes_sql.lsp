/*
================================================================================
-- Nome        : Banco de Dados - Cursor Dinâmico via Funções SQL_
-- Função      : Exemplo de criação e manipulação de cursor dinâmico usando a API 
--               de funções SQL_ (SQL_Criar, SQL_DefinirComando, SQL_AbrirCursor, SQL_EOF).
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração da Variável de Manipulador do Cursor -- @
Definir Alfa cCursor;

@ -- Instanciação e criação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Definição da instrução SQL a ser executada -- @
SQL_DefinirComando(cCursor, "SELECT * FROM tb_cliente WHERE SITCLI = 'A'");

@ -- Abertura do cursor dinâmico -- @
SQL_AbrirCursor(cCursor);

@ -- Validação da existência de registros (SQL_EOF = 0 indica que NÃO atingiu o fim do arquivo) -- @
Se (SQL_EOF(cCursor) = 0)
Inicio
    Mensagem(Retorna, "Registro encontrado com sucesso!");
Fim;
Senao
Inicio
    Mensagem(Retorna, "Nenhum registro encontrado!");
Fim;

@ -- Destruição / Liberação do cursor em memória -- @
SQL_Destruir(cCursor);
