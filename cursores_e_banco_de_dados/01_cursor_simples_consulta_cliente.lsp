/*
================================================================================
-- Nome        : Banco de Dados - Consulta de Cliente via Cursor Simples
-- Função      : Exemplo de abertura de cursor para execução de query SQL nativa,
--               leitura do primeiro registro encontrado e fechamento do cursor.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa aNomCli;
Definir Alfa aUF;
Definir Alfa aMensagem;

@ -- Declaração do Cursor do Banco de Dados -- @
Definir Cursor Cur_tb_cliente;

@ -- Inicialização dos Dados -- @
aNomCli = "";
aUF = "";
aMensagem = "Não Encontrou o Cliente!";

@ -- Montagem da instrução SQL dentro do cursor -- @
Cur_tb_cliente.SQL "SELECT NOMCLI, SIGUFS FROM tb_cliente \
                    WHERE CODCLI = 1";

@ -- Execução da consulta no banco de dados -- @
Cur_tb_cliente.AbrirCursor();

@ -- Validação da existência do registro -- @
Se (Cur_tb_cliente.Achou)
Inicio
    aNomCli = Cur_tb_cliente.NOMCLI;
    aUF = Cur_tb_cliente.SIGUFS;
    aMensagem = "Cliente: " + aNomCli + ", Estado (UF): " + aUF; 
Fim;      

@ -- Fechamento obrigatório do cursor para liberação de memória/conexão -- @
Cur_tb_cliente.FecharCursor(); 

@ -- Exibição do resultado -- @
Mensagem(Retorna, aMensagem);
