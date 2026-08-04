/*
================================================================================
-- Nome        : Banco de Dados - Cursores Encadeados (Pai / Filho)
-- Função      : Exemplo de cursores aninhados para montagem de relatórios ou
--               estruturas hierárquicas (Origem -> Famílias vinculadas).
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração de Variáveis Globais -- @
Definir Alfa aCodOri;
Definir Alfa aDesOri;
Definir Alfa aCodFam;
Definir Alfa aDesFam;
Definir Alfa aMensagem;
Definir Alfa aEnter;
Definir Numero nCodEmp;
Definir Numero nEntrou;

@ -- Declaração dos Cursores Encadeados -- @
Definir Cursor Cur_tb_origem;
Definir Cursor Cur_tb_familia;

@ -- Inicialização das Variáveis -- @
aMensagem = "";
RetornaAscII(13, aEnter);

@ -- Cursor Principal (Pai): Busca todas as origens cadastradas -- @
Cur_tb_origem.SQL "SELECT CODEMP, CODORI, DESORI FROM tb_origem";
Cur_tb_origem.AbrirCursor();

Enquanto (Cur_tb_origem.Achou)
Inicio
    nCodEmp = Cur_tb_origem.CODEMP;
    aCodOri = Cur_tb_origem.CODORI;
    aDesOri = Cur_tb_origem.DESORI;
    
    aMensagem = aMensagem + "Origem: " + aCodOri + " - " + aDesOri + ":" + aEnter;
    
    @ -- Cursor Secundário (Filho): Busca as famílias associadas à Origem e Empresa atuais -- @
    Cur_tb_familia.SQL "SELECT CODFAM, DESFAM FROM tb_familia \
                        WHERE CODEMP = :nCodEmp \
                          AND CODORI = :aCodOri";
                          
    Cur_tb_familia.AbrirCursor();
    nEntrou = 0;
    
    @ -- Laço secundário para iterar sobre as famílias retornadas -- @
    Enquanto (Cur_tb_familia.Achou)
    Inicio
        aCodFam = Cur_tb_familia.CODFAM;
        aDesFam = Cur_tb_familia.DESFAM;
        
        Se (nEntrou = 0)
        Inicio
            nEntrou = 1;
            aMensagem = aMensagem + " - Família(s): " + aCodFam + " - " + aDesFam + aEnter;
        Fim; 
        Senao
        Inicio
            aMensagem = aMensagem + "               " + aCodFam + " - " + aDesFam + aEnter;
        Fim;
        
        Cur_tb_familia.Proximo();
    Fim;
    
    @ -- Fechamento do cursor filho após a iteração -- @
    Cur_tb_familia.FecharCursor();
    
    @ -- Avança para a próxima origem no cursor pai -- @
    Cur_tb_origem.Proximo();
Fim;

@ -- Fechamento obrigatório do cursor pai -- @
Cur_tb_origem.FecharCursor();

@ -- Exibição da mensagem final formatada -- @
Se (aMensagem <> "")
Inicio
    Mensagem(Retorna, aMensagem);
Fim;
Senao 
Inicio
    Mensagem(Retorna, "Nenhuma Origem foi Cadastrada!!"); 
Fim;
