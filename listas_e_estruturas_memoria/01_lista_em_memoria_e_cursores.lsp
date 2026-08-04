/*
================================================================================
-- Nome        : Estrutura de Dados - Manipulação de Listas em Memória
-- Função      : Exemplo de criação de tabela temporária em memória (Definir Lista),
--               atribuição de chave, população via cursor e iteração com LLista.FDA.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração de Variáveis e Estruturas -- @
Definir Lista LLista;
Definir Cursor Cur_tb_estado;
Definir Cursor Cur_tb_cep;
Definir Alfa aUF;
Definir Alfa aNomeEstado;
Definir Alfa aMensagem;
Definir Alfa aQtdCid;
Definir Alfa aEnter;
Definir Numero nQtdCid;

RetornaAscII(13, aEnter);

@ -- 1. Definição da Estrutura dos Campos da Lista Dinâmica -- @
LLista.DefinirCampos();
LLista.AdicionarCampo("UF", Alfa);
LLista.AdicionarCampo("NomeEstado", Alfa);
LLista.AdicionarCampo("QtdCid", Numero);
LLista.EfetivarCampos();

@ -- Definição da Chave de Ordenação da Lista -- @
LLista.Chave("UF");

@ -- 2. Leitura dos dados do banco e população da Lista em memória -- @
Cur_tb_estado.SQL "SELECT SIGUFS, NOMUFS FROM tb_estado";
Cur_tb_estado.AbrirCursor();

Enquanto (Cur_tb_estado.Achou)
Inicio
    @ -- Cria um novo registro em branco na lista -- @
    LLista.Adicionar();
    
    LLista.UF = Cur_tb_estado.SIGUFS;
    LLista.NomeEstado = Cur_tb_estado.NOMUFS;
    aUF = Cur_tb_estado.SIGUFS;
    
    @ -- Cursor secundário para contagem de cidades por estado -- @
    Cur_tb_cep.SQL "SELECT CEPINI FROM tb_cep WHERE SIGUFS = :aUF";
    Cur_tb_cep.AbrirCursor();
    nQtdCid = 0;
    
    Enquanto (Cur_tb_cep.Achou)
    Inicio
        nQtdCid++;
        Cur_tb_cep.Proximo();
    Fim;
    
    Cur_tb_cep.FecharCursor();
    
    @ -- Atribui a contagem e efetiva a gravação do registro na lista -- @
    LLista.QtdCid = nQtdCid;
    LLista.Gravar();
    
    Cur_tb_estado.Proximo();
Fim;

@ -- Liberação do cursor principal do banco de dados -- @
Cur_tb_estado.FecharCursor();

@ -- 3. Iteração e leitura da Lista em Memória -- @
aMensagem = "Estados: " + aEnter;

@ -- Posiciona no primeiro elemento da lista -- @
LLista.Primeiro();

@ -- Enquanto não chegar ao Fim do Arquivo/Lista (FDA = 0) -- @
Enquanto (LLista.FDA = 0)
Inicio
    aUF = LLista.UF;
    aNomeEstado = LLista.NomeEstado;
    nQtdCid = LLista.QtdCid;
    
    ConverteMascara(1, nQtdCid, aQtdCid, "zzz.zz9");
    aMensagem = aMensagem + aUF + " - " + aQtdCid + aEnter;
    
    @ -- Avança para o próximo registro em memória -- @
    LLista.Proximo();
Fim;

@ -- Exibição da mensagem final consolidada em memória -- @
Mensagem(Retorna, aMensagem);
