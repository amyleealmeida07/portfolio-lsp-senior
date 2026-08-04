/*
================================================================================
-- Nome        : Banco de Dados - Extração de Campo BLOB via Cursor Dinâmico (SQL_)
-- Função      : Exemplo de recuperação de campos binários (BLOB/imagens) do banco
--               de dados via SQL_RetornarBlob e gravação física em disco.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa cCursor;
Definir Alfa aLogo;
Definir Numero nArquivo;
Definir Numero nTamanho;

@ -- Instanciação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Consulta ao campo BLOB de logotipo da empresa -- @
SQL_DefinirComando(cCursor, "SELECT LOGEMP FROM tb_empresa WHERE CODEMP = 1");
SQL_AbrirCursor(cCursor);

Se (SQL_EOF(cCursor) = 0)
Inicio
    @ -- Recupera o conteúdo binário do campo BLOB -- @
    SQL_RetornarBlob(cCursor, "LOGEMP", aLogo);
    
    @ -- Abre/Cria o arquivo físico no caminho especificado para gravação -- @
    nArquivo = Abrir("C:\\temp\\LogoEmpresa.bmp", Gravar);
    
    @ -- Obtém o tamanho em bytes do conteúdo recuperado -- @
    TamanhoStr(aLogo, nTamanho);
    
    @ -- Escreve o conteúdo no arquivo e fecha o manipulador -- @
    Gravar(nArquivo, aLogo, nTamanho);
    Fechar(nArquivo);
    
    Mensagem(Retorna, "Logotipo gravado com sucesso.");
Fim;
Senao
Inicio
    Mensagem(Retorna, "Logotipo não encontrado.");
Fim;

@ -- Fechamento e liberação do cursor da memória -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);
