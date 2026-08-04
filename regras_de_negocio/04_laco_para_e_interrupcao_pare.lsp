/*
================================================================================
-- Nome        : Controle de Fluxo - Laço Para e Interrupção com Pare
-- Função      : Exemplo de iteração finita utilizando laço Para, validação
--               condicional de intervalo e interrupção antecipada via Pare.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Definição das Variáveis -- @
Definir Alfa aDiaSemana;
Definir Numero nDia;
Definir Numero i;

@ -- Inicialização dos Dados -- @
aDiaSemana = "";
nDia = 30;

@ -- Laço de repetição contado (Para) -- @
Para (i = 1; i <= nDia; i++)
Inicio
    @ -- Verificação condicional do valor do dia -- @
    Se (nDia = 1)
        aDiaSemana = "Segunda-feira";
    Senao
    Se (nDia = 2)
        aDiaSemana = "Terça-feira";
    Senao
    Se (nDia = 3)
        aDiaSemana = "Quarta-feira";
    Senao
    Se (nDia = 4)
        aDiaSemana = "Quinta-feira";
    Senao
    Se (nDia = 5)
        aDiaSemana = "Sexta-feira";
    Senao
    Se (nDia = 6)
        aDiaSemana = "Sábado";
    Senao
    Se (nDia = 7)
        aDiaSemana = "Domingo";
    Senao
        @ -- Interrupção imediata do laço caso o valor esteja fora do intervalo (1 a 7) -- @
        Pare;
Fim;

@ -- Exibição do resultado obtido -- @
Mensagem(Retorna, aDiaSemana);
