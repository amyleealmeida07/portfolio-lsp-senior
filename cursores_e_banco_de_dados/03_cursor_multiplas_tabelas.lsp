/*
================================================================================
-- Nome        : Banco de Dados - Consulta via Cursor com Múltiplas Tabelas
-- Função      : Exemplo de junção de tabelas (JOINs) em SQL nativo via cursor LSP,
--               utilizando parâmetros dinâmicos e formatação de saída com quebra de linha.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa aCodPro;
Definir Alfa aDesPro;
Definir Alfa aNomEmp;
Definir Alfa aDesFam;
Definir Alfa aEnter;
Definir Alfa aMensagem;
Definir Numero nCodEmp;

@ -- Declaração do Cursor do Banco de Dados -- @
Definir Cursor Cur_tb_produto;

@ -- Inicialização das Variáveis -- @
aMensagem = "";
nCodEmp = 1;
aCodPro = "5100001";

@ -- Obtenção do caractere ASCII 10 (Quebra de linha / Line Feed) -- @
CaracterParaAlfa(10, aEnter);

@ -- Montagem do SQL com relacional entre tabelas de Produtos, Empresas e Famílias -- @
Cur_tb_produto.SQL "SELECT pro.CODPRO, pro.DESPRO, emp.NOMEMP, fam.DESFAM \
                    FROM tb_produto pro, tb_empresa emp, tb_familia fam \
                    WHERE pro.CODEMP = emp.CODEMP \
                      AND pro.CODEMP = fam.CODEMP \
                      AND pro.CODFAM = fam.CODFAM \
                      AND pro.CODEMP = :nCodEmp \
                      AND pro.CODPRO = :aCodPro";

@ -- Execução da consulta -- @
Cur_tb_produto.AbrirCursor();

@ -- Validação e extração dos dados -- @
Se (Cur_tb_produto.Achou)
Inicio
    aDesPro = Cur_tb_produto.DESPRO;
    aCodPro = Cur_tb_produto.CODPRO;
    aNomEmp = Cur_tb_produto.NOMEMP;
    aDesFam = Cur_tb_produto.DESFAM;
    
    @ -- Montagem da mensagem estruturada com quebras de linha -- @
    aMensagem = "Produto: " + aCodPro + aEnter + 
                "Nome do Produto: " + aDesPro + aEnter + 
                "Empresa: " + aNomEmp + aEnter + 
                "Família: " + aDesFam;
                
    Mensagem(Retorna, aMensagem);    
Fim; 
Senao
Inicio
    Mensagem(Retorna, "Produto Não Encontrado!"); 
Fim;

@ -- Fechamento obrigatório do cursor -- @
Cur_tb_produto.FecharCursor();
