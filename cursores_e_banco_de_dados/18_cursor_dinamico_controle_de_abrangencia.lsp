/*
================================================================================
-- Nome        : Banco de Dados - Controle de Abrangência de Usuário (SQL_)
-- Função      : Exemplo do uso da função SQL_UsarAbrangencia() para habilitar 
--               ou desabilitar restrições de abrangência do usuário no cursor.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa cCursor;
Definir Alfa aNL;
Definir Alfa aMensagem;
Definir Alfa aNomFil;
Definir Alfa aNumCgc;
Definir Numero nCodEmp;
Definir Numero nCodFil;

@ -- Instanciação e criação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Configura a abrangência: 1 = Aplica abrangência do usuário, 0 = Ignora abrangência -- @
SQL_UsarAbrangencia(cCursor, 0);

@ -- Definição do comando SQL para listar empresas e filiais -- @
SQL_DefinirComando(cCursor, "SELECT CODEMP, CODFIL, NOMFIL, NUMCGC \
                              FROM tb_filial \
                             ORDER BY CODEMP, CODFIL");

@ -- Abertura do cursor dinâmico -- @
SQL_AbrirCursor(cCursor);

CaracterParaAlfa(10, aNL); @ Quebra de linha ASCII 10 @
aMensagem = "Lista de empresas/filiais:";

@ -- Iteração para leitura de todos os registros retornados -- @
Enquanto (SQL_EOF(cCursor) = 0)
Inicio
    SQL_RetornarInteiro(cCursor, "CODEMP", nCodEmp);
    SQL_RetornarInteiro(cCursor, "CODFIL", nCodFil);
    SQL_RetornarAlfa(cCursor, "NOMFIL", aNomFil);
    SQL_RetornarAlfa(cCursor, "NUMCGC", aNumCgc);
    
    aMensagem = aMensagem + aNL + "Emp: " + nCodEmp + 
               " | Filial: " + nCodFil + 
               " - " + aNomFil + 
               " (CNPJ: " + aNumCgc + ")";
               
    SQL_Proximo(cCursor);
Fim;

@ -- Fechamento e liberação de memória do cursor -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);

@ -- Exibição do relatório final -- @
Mensagem(Retorna, aMensagem);
