/*
================================================================================
-- Nome        : Modularização - Função Customizada com Passagem por Referência
-- Função      : Declaração e execução de função (FSoma) utilizando passagem de 
--               parâmetros por referência (end), conversão e variáveis de sistema.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Declaração de Variáveis Globais e Variáveis de Sistema -- @
Definir Alfa aResultado;
Definir Numero nAno;
Definir Numero nEmp;
Definir Numero nV1;
Definir Numero nV2;
Definir Numero nR;

@ -- Assinatura da Função Customizada -- @
Definir Funcao FSoma(Numero nValor1, Numero nValor2, Numero end nResultado);

@ -- Obtenção de variáveis nativas do sistema (Ano do Sistema e Empresa Atual) -- @
nAno = AnoSis;
nEmp = EmpAtu;

@ -- Primeira Execução da Função -- @
nV1 = 10;
nV2 = 20;
FSoma(nV1, nV2, nR);
IntParaAlfa(nR, aResultado);
Mensagem(Retorna, aResultado);

@ -- Segunda Execução da Função (Reutilização de Código) -- @
nV1 = 100;
nV2 = 200;
FSoma(nV1, nV2, nR);
IntParaAlfa(nR, aResultado);
Mensagem(Retorna, aResultado);

@ ============================================================================== @
@ -- Implementação da Função FSoma -- @
@ ============================================================================== @
Funcao FSoma(Numero nValor1, Numero nValor2, Numero end nResultado);
Inicio
    @ -- Atribuição do resultado da soma à variável passada por referência -- @
    nResultado = nValor1 + nValor2;
Fim;
