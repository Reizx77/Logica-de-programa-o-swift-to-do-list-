# Logica-de-programa-o-swift-to-do-list-

# 📝 Swift To-Do List

Um pequeno projeto em **Swift** para treinar lógica de programação e uso de **funções, optionals, e switch-case**.  
O programa implementa um gerenciador de tarefas simples via terminal, sem uso de variáveis globais.

---

## 🚀 Funcionalidades

- Exibe um menu interativo com opções
- Listar tarefas
- Adicionar tarefas
- Remover tarefas por índice
- Editar tarefas existentes
- Captura entradas com **readLine()**
- Usa **Optionals** (`String?`, `if let`) para validar entradas e evitar erros

---

## 📂 Estrutura do Código

- `iniciarApp()` → Função principal que mostra o menu e controla o fluxo  
- `listarTarefas(tarefas: [String])` → Exibe todas as tarefas salvas  
- `pedirEntrada(mensagem: String) -> String?` → Lê entrada do usuário e retorna `nil` se for inválida  

---

## ▶️ Exemplo de Execução

=== Lista de Tarefas ===
1 - Listar tarefas
2 - Adicionar tarefa
3 - Remover tarefa
4 - Editar tarefa
0 - Sair
Escolha uma opção:
2
Digite a nova tarefa:
Estudar Swift
Tarefa adicionada com sucesso.

=== Lista de Tarefas ===

