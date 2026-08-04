/*
================================================================================
-- Nome        : Banco de Dados - Consulta via Cursor com Variáveis Externas
-- Função      : Exemplo de uso de variáveis dinâmicas no parâmetro da instrução
--               SQL em cursores LSP, permitindo consultas flexíveis no banco.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa aNomCli;
Definir Alfa aUF;
Definir Alfa aMensagem;
Definir Numero nCodCli;

@ -- Declaração do Cursor do Banco de Dados -- @
Definir Cursor Cur_tb_cliente;

@ -- Inicialização das Variáveis -- @
aNomCli = "";
aUF = "";
nCodCli = 1; @ -- Variável externa usada como filtro dinâmico -- @
aMensagem = "Não Encontrou o Cliente!";

@ -- Montagem da instrução SQL utilizando a variável externa no WHERE -- @
Cur_tb_cliente.SQL "SELECT NOMCLI, SIGUFS FROM tb_cliente \
                    WHERE CODCLI = :nCodCli";

@ -- Execução do cursor no banco de dados -- @
Cur_tb_cliente.AbrirCursor();

@ -- Validação da existência do registro -- @
Se (Cur_tb_cliente.Achou)
Inicio
    aNomCli = Cur_tb_cliente.NOMCLI;
    aUF = Cur_tb_cliente.SIGUFS;
    aMensagem = "Cliente: " + aNomCli + ", Estado (UF): " + aUF; 
Fim;      

@ -- Fechamento do cursor -- @
Cur_tb_cliente.FecharCursor(); 

@ -- Exibição do resultado -- @
Mensagem(Retorna, aMensagem);
