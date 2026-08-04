# 🚀 Portfólio de Scripts em LSP (Linguagem Sênior de Programação)

Este repositório reúne uma coleção de exemplos práticos, algoritmos e rotinas desenvolvidas em **LSP (Linguagem Sênior de Programação)**, utilizada na customização e extensão das soluções corporativas da **Senior Sistemas** (como o ERP Senior Gestão Empresarial).

O objetivo deste projeto é demonstrar o domínio de boas práticas de desenvolvimento na linguagem, cobrindo desde lógica essencial até operações avançadas com banco de dados, tratamento de erros, transações atômicas e estruturas em memória.

---

## 🛠️ Tecnologias e Conceitos Utilizados

* **Linguagem:** LSP (Linguagem Sênior de Programação)
* **Banco de Dados:** Consultas SQL nativas, manipulação DML (INSERT, UPDATE, DELETE), cursores estáticos e dinâmicos (`SQL_`)
* **Integridade de Dados:** Controle de Transações Atômicas (Commit e Rollback com `IniciarTransacao`, `FinalizarTransacao` e `DesfazerTransacao`)
* **Manipulação de Memória:** Estruturas de listas em memória (`Definir Lista`), armazenamento dinâmico e ordenação por chaves
* **Tratamento de Arquivos e Mídia:** Extração e gravação física de campos binários (`BLOB`) em disco
* **Boas Práticas:** Modularização com funções customizadas, sanitização de tabelas e gerenciamento/liberação de memória (`SQL_Destruir`)

---

## 📁 Estrutura do Repositório

```text
portfolio-lsp-senior/
│
├── cursores_e_banco_de_dados/
│   ├── 01_cursor_simples_consulta_cliente.lsp
│   ├── 02_cursor_com_variaveis_externas.lsp
│   ├── 03_cursor_multiplas_tabelas.lsp
│   ├── 04_cursor_multiplos_registros_laco.lsp
│   ├── 05_cursor_encadeado_pai_filho.lsp
│   ├── 06_cursor_macro_inserir_sql_dinamico.lsp
│   ├── 07_execsql_insercao_e_validacao.lsp
│   ├── 08_execsqlex_tratamento_de_erros.lsp
│   ├── 09_controle_de_transacao_commit_rollback.lsp
│   ├── 10_cursor_dinamico_funcoes_sql.lsp
│   ├── 11_cursor_dinamico_laco_e_contagem.lsp
│   ├── 12_cursor_dinamico_update_dml.lsp
│   ├── 13_cursor_dinamico_update_e_destruicao.lsp
│   ├── 14_cursor_dinamico_retornar_alfa.lsp
│   ├── 15_cursor_dinamico_exportar_blob.lsp
│   ├── 16_cursor_dinamico_parametro_alfa_like.lsp
│   ├── 17_cursor_dinamico_parametros_multitipos_e_mascaras.lsp
│   └── 18_cursor_dinamico_controle_de_abrangencia.lsp
│
├── funcoes_e_modulos/
│   ├── 01_funcoes_customizadas_e_parametros.lsp
│   └── 02_funcao_validacao_e_delecao_execsql.lsp
│
└── listas_e_estruturas_memoria/
    └── 01_lista_em_memoria_e_cursores.lsp
