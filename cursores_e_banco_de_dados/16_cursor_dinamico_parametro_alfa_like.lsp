/*
================================================================================
-- Nome        : Banco de Dados - Parâmetros Alfa e Filtro LIKE via Cursor Dinâmico (SQL_)
-- Função      : Exemplo de passagem de parâmetros do tipo Alfa com wildcards (LIKE)
--               utilizando SQL_DefinirAlfa e concatenação de resultados com quebra de linha.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração das Variáveis Globais -- @
Definir Alfa cCursor;
Definir Alfa aNomCli;
Definir Alfa aParamUf;
Definir Alfa aMensagem;
Definir Alfa aNL; @ Caractere de nova linha @

@ -- Instanciação do cursor dinâmico -- @
SQL_Criar(cCursor);

@ -- Definição do comando SQL com parâmetro dinâmico (:aParamUf) -- @
SQL_DefinirComando(cCursor, "SELECT NOMCLI FROM tb_cliente \
                              WHERE TIPCLI = 'J' \
                                AND SIGUFS LIKE :aParamUf \
                              ORDER BY NOMCLI");

@ -- Define o valor do parâmetro para buscar estados que iniciam com 'S' -- @
aParamUf = "S%";
SQL_DefinirAlfa(cCursor, "aParamUf", aParamUf);

@ -- Abertura e execução do cursor -- @
SQL_AbrirCursor(cCursor);

@ -- Inicialização da mensagem e do caractere ASCII 10 (Line Feed) -- @
aNomCli = "";
aMensagem = "Clientes encontrados:";
CaracterParaAlfa(10, aNL);

@ -- Iteração sobre os registros retornados -- @
Enquanto (SQL_EOF(cCursor) = 0)
Inicio
    SQL_RetornarAlfa(cCursor, "NOMCLI", aNomCli);
    aMensagem = aMensagem + aNL + aNomCli;
    SQL_Proximo(cCursor);
Fim;

@ -- Fechamento e liberação de memória do cursor -- @
SQL_FecharCursor(cCursor);
SQL_Destruir(cCursor);

@ -- Exibição da mensagem final formatada -- @
Mensagem(Retorna, aMensagem);
