/*
================================================================================
-- Nome        : Manipulação de Texto - Inversão de String com Laço de Repetição
-- Função      : Exemplo de laço de repetição (Enquanto) e funções de manipulação 
--               de caracteres (TamanhoAlfa, CopiarAlfa, DeletarAlfa) para inverter textos.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Definição das Variáveis -- @
Definir Alfa aTexto;
Definir Alfa aNovoTexto;
Definir Alfa aTextoAux;
Definir Numero nTamanho;

@ -- Inicialização das Variáveis -- @
aTexto = "String que deve ser escrita de forma invertida!!";
aNovoTexto = "";
aTextoAux = "";

@ -- Laço de repetição para extração e montagem invertida caractere por caractere -- @
Enquanto (aTexto <> "")
Inicio
    aTextoAux = aTexto;
    
    @ -- Obtém o tamanho atual da string -- @
    TamanhoAlfa(aTextoAux, nTamanho);
    
    @ -- Copia o último caractere do texto auxiliar -- @
    CopiarAlfa(aTextoAux, nTamanho, 1);
    
    @ -- Concatena o caractere extraído na nova string -- @
    aNovoTexto = aNovoTexto + aTextoAux;
    
    @ -- Remove o último caractere processado da string original -- @
    aTextoAux = aTexto;
    DeletarAlfa(aTextoAux, nTamanho, 1);
    aTexto = aTextoAux;  
Fim;

@ -- Exibição da mensagem com o texto completamente invertido -- @
Mensagem(Retorna, aNovoTexto);
