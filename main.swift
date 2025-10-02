import Foundation

// Função para adicionar uma tarefa
func adicionarTarefa(_ tarefas: inout [String]) {
    print("Digite a tarefa:")
    if let t = readLine(), !t.isEmpty {
        tarefas.append("[ ] \(t)") // começa pendente
    }
}

// Função para listar todas as tarefas
func listarTarefas(_ tarefas: [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa.")
    } else {
        for (i, t) in tarefas.enumerated() {
            print("\(i+1). \(t)")
        }
    }
}

// Função para remover uma tarefa
func removerTarefa(_ tarefas: inout [String]) {
    listarTarefas(tarefas)
    print("Número da tarefa para remover:")
    if let e = readLine(), let i = Int(e),
       i > 0 && i <= tarefas.count {
        tarefas.remove(at: i-1)
    }
}

// Função para editar o nome de uma tarefa
func editarTarefa(_ tarefas: inout [String]) {
    listarTarefas(tarefas)
    print("Número da tarefa para editar:")
    if let e = readLine(), let i = Int(e),
       i > 0 && i <= tarefas.count {
        print("Novo nome da tarefa:")
        if let novoNome = readLine(), !novoNome.isEmpty {
            // Mantém o status [ ] ou [x] e substitui o texto
            let prefixo = String(tarefas[i-1].prefix(3))
            tarefas[i-1] = "\(prefixo) \(novoNome)"
        }
    }
}

// Função para contar tarefas
func contarTarefas(_ tarefas: [String]) {
    print("Você tem \(tarefas.count) tarefa(s).")
}

// Função para limpar todas as tarefas
func limparTarefas(_ tarefas: inout [String]) {
    tarefas.removeAll()
    print("Todas as tarefas foram apagadas.")
}

// Função para marcar/desmarcar concluída
func alternarConclusao(_ tarefas: inout [String]) {
    listarTarefas(tarefas)
    print("Número da tarefa para marcar/desmarcar:")
    if let e = readLine(), let i = Int(e),
       i > 0 && i <= tarefas.count {
        if tarefas[i-1].hasPrefix("[ ]") {
            let texto = tarefas[i-1].dropFirst(3)
            tarefas[i-1] = "[x] \(texto)"
        } else {
            let texto = tarefas[i-1].dropFirst(3)
            tarefas[i-1] = "[ ] \(texto)"
        }
    }
}

// Função principal
func iniciarApp() {
    var tarefas: [String] = []
    var rodando = true

    while rodando {
        print("""
        ===== Lista de Tarefas =====
        1 - Adicionar
        2 - Listar
        3 - Remover
        4 - Contar tarefas
        5 - Limpar todas
        6 - Marcar/Desmarcar concluída
        7 - Editar tarefa
        0 - Sair
        Escolha:
        """)

        if let entrada = readLine(), let opcao = Int(entrada) {
            switch opcao {
            case 1: adicionarTarefa(&tarefas)
            case 2: listarTarefas(tarefas)
            case 3: removerTarefa(&tarefas)
            case 4: contarTarefas(tarefas)
            case 5: limparTarefas(&tarefas)
            case 6: alternarConclusao(&tarefas)
            case 7: editarTarefa(&tarefas)
            case 0: rodando = false
            default: print("Opção inválida.")
            }
        }
    }
}

// Inicia o programa
iniciarApp()
