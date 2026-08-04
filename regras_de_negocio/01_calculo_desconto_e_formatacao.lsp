/*
================================================================================
-- Nome        : Processamento de Vendas - Cálculo de Desconto e Máscaras
-- Função      : Exemplo de manipulação de variáveis, cálculo percentual,
--               conversão de tipos e formatação de máscaras em LSP.
-- ERP         : Senior Gestão Empresarial (ERP)
================================================================================
*/

@ -- Definição das Variáveis -- @
Definir Alfa aNomeCliente;
Definir Numero nNumeroPedido;
Definir Numero nTotalPedido;
Definir Numero nComDesconto;
Definir Data dDataVenda;

Definir Alfa aNumeroPedido;
Definir Alfa aTotalPedido;
Definir Alfa aComDesconto;
Definir Alfa aDataVenda;
Definir Alfa aMensagem;

@ -- Atribuição de Dados de Exemplo -- @
aNomeCliente = "Cliente Exemplo";
nNumeroPedido = 100;
nTotalPedido = 234.56;

@ -- Aplicação de regra de negócio: Cálculo de 10% de desconto -- @
nComDesconto = nTotalPedido * 0.9;

@ -- Atribuição e manipulação de data -- @
MontaData(08, 12, 2025, dDataVenda);

@ -- Conversão de Tipos e Aplicação de Máscaras -- @
IntParaAlfa(nNumeroPedido, aNumeroPedido);

@ -- Conversão de número para texto respeitando a máscara monetária -- @
ConverteMascara(1, nTotalPedido, aTotalPedido, "zzz.zz9,99");
ConverteMascara(1, nComDesconto, aComDesconto, "zzz.zz9,99");

@ -- Conversão de data para texto no padrão brasileiro -- @
ConverteMascara(1, dDataVenda, aDataVenda, "DD/MM/YYYY");

@ -- Concatenação e exibição de mensagem compilada -- @
aMensagem = "Pedido: " + aNumeroPedido + 
            ", Cliente: " + aNomeCliente +
            ", Total Pedido: " + aTotalPedido + 
            ", Com Desconto: " + aComDesconto +
            ", Data da Venda: " + aDataVenda;

Mensagem(Retorna, aMensagem);
