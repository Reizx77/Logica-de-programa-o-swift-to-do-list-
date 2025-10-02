import Foundation

func iniciarApp() {
    var tarefas: [String] = []
    var rodando = true

    while rodando {
        print("""
        
        Lista de Tarefas 
        1 - Adicionar tarefa
        2 - Remover tarefa
        3 - Listar tarefas
        4 - Editar tarefa
        5 - Marcar/Desmarcar concluída
        6 - Contar tarefas pendentes
        0 - Sair
        Escolha uma opção:
        """)

        if let entrada = readLine(), let opcao = Int(entrada) {
            switch opcao {
            case 1:
                adicionarTarefa(&tarefas)
            case 2:
                removerTarefa(&tarefas)
            case 3:
                listarTarefas(&tarefas)
            case 4:
                editarTarefa(&tarefas)
            case 5:
                marcarTarefa(&tarefas)
            case 6:
                contarPendentes(&tarefas)
            case 0:
                print("Saindo do programa...")
                rodando = false
            default:
                print("Opção inválida.")
            }
        }
    }
}



func adicionarTarefa(_ tarefas: inout [String]) {
    print("Digite a nova tarefa:")
    if let nova = readLine(), !nova.isEmpty {
        tarefas.append("[ ] \(nova)")
        print("Tarefa adicionada.")
    }
}

func removerTarefa(_ tarefas: inout [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa para remover.")
        return
    }
    listarTarefas(&tarefas)
    print("Número da tarefa para remover:")
    if let escolha = readLine(), let indice = Int(escolha),
       indice > 0 && indice <= tarefas.count {
        tarefas.remove(at: indice - 1)
        print("Tarefa removida.")
    }
}

func listarTarefas(_ tarefas: inout [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa cadastrada.")
    } else {
        print("Tarefas:")
        for (i, t) in tarefas.enumerated() {
            print("\(i+1). \(t)")
        }
    }
}

func editarTarefa(_ tarefas: inout [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa para editar.")
        return
    }
    listarTarefas(&tarefas)
    print("Número da tarefa para editar:")
    if let escolha = readLine(), let indice = Int(escolha),
       indice > 0 && indice <= tarefas.count {
        print("Digite a nova descrição:")
        if let nova = readLine(), !nova.isEmpty {
            let prefixo = tarefas[indice - 1].prefix(3)
            tarefas[indice - 1] = "\(prefixo)\(nova)"
            print("Tarefa atualizada.")
        }
    }
}

func marcarTarefa(_ tarefas: inout [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa para marcar.")
        return
    }
    listarTarefas(&tarefas)
    print("Número da tarefa para marcar/desmarcar:")
    if let escolha = readLine(), let indice = Int(escolha),
       indice > 0 && indice <= tarefas.count {
        if tarefas[indice - 1].hasPrefix("[ ]") {
            let texto = tarefas[indice - 1].dropFirst(3)
            tarefas[indice - 1] = "[x] \(texto)"
            print("Tarefa marcada como concluída.")
        } else {
            let texto = tarefas[indice - 1].dropFirst(3)
            tarefas[indice - 1] = "[ ] \(texto)"
            print("Tarefa marcada como pendente.")
        }
    }
}

// Funcionalidade extra: contar quantas tarefas estão pendentes
func contarPendentes(_ tarefas: inout [String]) {
    let pendentes = tarefas.filter { $0.hasPrefix("[ ]") }.count
    print("Você tem \(pendentes) tarefa(s) pendente(s).")
}

// Inicia o programa
iniciarApp()

