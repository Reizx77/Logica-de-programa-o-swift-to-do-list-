import Foundation

func iniciarApp() {
    var tarefas: [String] = []   // Lista de tarefas
    var rodando = true           // Controle do loop

    while rodando {
        print("""
        1 - Adicionar
        2 - Listar
        3 - Remover
        4 - Contar tarefas
        5 - Limpar todas
        6 - Marcar/Desmarcar concluída
        0 - Sair
        Escolha:
        """)

        if let entrada = readLine(), let opcao = Int(entrada) {
            switch opcao {
            case 1:
                // Adicionar
                print("Digite a tarefa:")
                if let t = readLine(), !t.isEmpty {
                    tarefas.append("[ ] \(t)") // começa pendente
                }

            case 2:
                // Listar
                if tarefas.isEmpty { print("Nenhuma tarefa.") }
                else {
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
                }

            case 3:
                // Remover
                print("Número da tarefa para remover:")
                if let e = readLine(), let i = Int(e),
                   i > 0 && i <= tarefas.count {
                    tarefas.remove(at: i-1)
                }

            case 4:
                // Contar
                print("Você tem \(tarefas.count) tarefa(s).")

            case 5:
                // Limpar tudo
                tarefas.removeAll()
                print("Todas as tarefas foram apagadas.")

            case 6:
                // Marcar / Desmarcar
                if tarefas.isEmpty {
                    print("Nenhuma tarefa.")
                } else {
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
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

            case 0:
                // Sair
                rodando = false

            default:
                print("Opção inválida.")
            }
        }
    }
}

iniciarApp()
