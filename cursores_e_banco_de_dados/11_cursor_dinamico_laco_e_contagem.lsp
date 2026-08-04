/*
================================================================================
-- Nome        : Banco de Dados - Iteração e Contagem com Cursor Dinâmico (SQL_)
-- Função      : Exemplo de iteração sobre múltiplos registros com laço Enquanto,
--               uso de SQL_Proximo e contagem de registros em cursor dinâmico.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa cCursor;
Definir Alfa aContador;
Definir Alfa aMensagem;
Definir Numero nContador;

@ -- Instanciação e criação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Definição do comando SQL -- @
SQL_DefinirComando(cCursor, "SELECT * FROM tb_cliente WHERE SITCLI = 'A'");

@ -- Abertura do cursor dinâmico -- @
SQL_AbrirCursor(cCursor);

nContador = 0;

@ -- Laço para percorrer todos os registros retornados -- @
Enquanto (SQL_EOF(cCursor) = 0)
Inicio
    nContador++;
    SQL_Proximo(cCursor); @ Avança para o próximo registro do cursor @
Fim;

@ -- Formatação do resultado para exibição -- @
IntParaAlfa(nContador, aContador);
aMensagem = aContador + " Registros Encontrados!";

@ -- Liberação / Destruição do cursor em memória -- @
SQL_Destruir(cCursor);

@ -- Exibição da mensagem ao usuário -- @
Mensagem(Retorna, aMensagem);
