/*
================================================================================
-- Nome        : Banco de Dados - Leitura de Campo Alfa via Cursor Dinâmico (SQL_)
-- Função      : Exemplo de extração de valores de colunas do tipo texto/alfa
--               utilizando a função SQL_RetornarAlfa em cursores dinâmicos.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração de Variáveis Globais -- @
Definir Alfa cCursor;
Definir Alfa aNome;

@ -- Instanciação e criação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Definição do comando SQL de consulta -- @
SQL_DefinirComando(cCursor, "SELECT NOMCLI FROM tb_cliente \
                              WHERE CODCLI = 1");

@ -- Abertura e execução da consulta no banco de dados -- @
SQL_AbrirCursor(cCursor);

@ -- Validação e leitura do valor retornado -- @
Se (SQL_EOF(cCursor) = 0)
Inicio
    @ -- Recupera o conteúdo da coluna NomCli para a variável aNome -- @
    SQL_RetornarAlfa(cCursor, "NOMCLI", aNome);
    Mensagem(Retorna, aNome);
Fim;
Senao
Inicio
    Mensagem(Retorna, "Cliente não encontrado.");
Fim;

@ -- Fechamento e liberação do objeto da memória do servidor -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);
