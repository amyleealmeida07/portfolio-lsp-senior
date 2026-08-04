/*
================================================================================
-- Nome        : Banco de Dados - Cursor com Múltiplos Registros e Laço Enquanto
-- Função      : Exemplo de iteração sobre múltiplos registros retornados por uma 
--               consulta SQL utilizando o método Proximo(), com formatação de CEP.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa aNomCid;
Definir Alfa aCepIni;
Definir Alfa aUF;
Definir Alfa aMensagem;
Definir Alfa aEnter;
Definir Numero nCepIni;

@ -- Declaração do Cursor do Banco de Dados -- @
Definir Cursor Cur_tb_cep;

@ -- Inicialização das Variáveis -- @
aUF = "SP";
aNomCid = "";
aCepIni = "";
aMensagem = "";

@ -- Obtenção do caractere ASCII 13 (Carriage Return / Quebra de Linha) -- @
RetornaAscII(13, aEnter);

@ -- Montagem do SQL para busca de múltiplos registros por UF -- @
Cur_tb_cep.SQL "SELECT CEPINI, NOMCID FROM tb_cep WHERE SIGUFS = :aUF";

@ -- Abertura e execução da consulta -- @
Cur_tb_cep.AbrirCursor();

@ -- Laço de repetição para percorrer todos os registros retornados -- @
Enquanto (Cur_tb_cep.Achou)
Inicio
    nCepIni = Cur_tb_cep.CEPINI;
    aNomCid = Cur_tb_cep.NOMCID;
    
    @ -- Aplicação de máscara para formatação numérica de CEP (Ex: 00000-000) -- @
    ConverteMascara(2, nCepIni, aCepIni, "99999-999");
    
    @ -- Acúmulo dos dados formatados na variável de mensagem -- @
    aMensagem = aMensagem + aCepIni + " - " + aNomCid + aEnter;
    
    @ -- Avança para o próximo registro retornado pelo cursor -- @
    Cur_tb_cep.Proximo();
Fim;

@ -- Fechamento obrigatório do cursor -- @
Cur_tb_cep.FecharCursor();

@ -- Exibição da lista consolidada de cidades e CEPs -- @
Mensagem(Retorna, aMensagem);
