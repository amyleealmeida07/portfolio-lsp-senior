/*
================================================================================
-- Nome        : Validação de Dados - Estrutura Condicional para Dias da Semana
-- Função      : Exemplo de estrutura condicional encadeada (Se / Senao) para 
--               mapeamento de valores numéricos e tratamento de entradas inválidas.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Definição das Variáveis -- @
Definir Alfa aDiaSemana;
Definir Numero nDia;

@ -- Inicialização dos Dados -- @
aDiaSemana = "";
nDia = 3;

@ -- Estrutura Condicional Encadeada (Mapeamento do Dia da Semana) -- @
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
    @ -- Tratamento para valor numérico fora do intervalo esperado -- @
    aDiaSemana = "Dia da Semana Inválido!";

@ -- Exibição do resultado obtido -- @
Mensagem(Retorna, aDiaSemana);
