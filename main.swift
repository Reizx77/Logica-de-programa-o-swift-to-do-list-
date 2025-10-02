func iniciarApp() {
    var tarefas: [String] = []

    while true {
        print("""
         Lista de Tarefas 
        1 - Adicionar tarefa
        2 - Remover tarefa
        3 - Listar tarefas
        4 - Editar tarefa
        5 - Marcar/Desmarcar concluída
        0 - Sair
        Escolha uma opção:
        """)

        if let entrada = readLine(), let opcao = Int(entrada) {
            switch opcao {
            case 1:
                print("Digite a nova tarefa:")
                if let nova = readLine(), !nova.isEmpty {
                    tarefas.append("[ ] \(nova)")
                    print("Tarefa adicionada.")
                }

            case 2:
                if tarefas.isEmpty {
                    print("Nenhuma tarefa para remover.")
                } else {
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
                    print("Número da tarefa para remover:")
                    if let escolha = readLine(), let indice = Int(escolha),
                       indice > 0 && indice <= tarefas.count {
                        tarefas.remove(at: indice - 1)
                        print("Tarefa removida.")
                    }
                }

            case 3:
                if tarefas.isEmpty {
                    print("Nenhuma tarefa cadastrada.")
                } else {
                    print("Tarefas:")
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
                }

            case 4:
                if tarefas.isEmpty {
                    print("Nenhuma tarefa para editar.")
                } else {
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
                    print("Número da tarefa para editar:")
                    if let escolha = readLine(), let indice = Int(escolha),
                       indice > 0 && indice <= tarefas.count {
                        print("Digite a nova descrição:")
                        if let nova = readLine(), !nova.isEmpty {
                            // Mantém o status [ ] ou [x] e só troca o texto
                            let prefixo = tarefas[indice - 1].prefix(3)
                            tarefas[indice - 1] = "\(prefixo)\(nova)"
                            print("Tarefa atualizada.")
                        }
                    }
                }

            case 5:
                if tarefas.isEmpty {
                    print("Nenhuma tarefa para marcar.")
                } else {
                    for (i, t) in tarefas.enumerated() {
                        print("\(i+1). \(t)")
                    }
                    print("Número da tarefa para marcar/desmarcar:")
                    if let escolha = readLine(), let indice = Int(escolha),
                       indice > 0 && indice <= tarefas.count {
                        if tarefas[indice - 1].hasPrefix("[ ]") {
                            tarefas[indice - 1] = tarefas[indice - 1].replacingOccurrences(of: "[ ]", with: "[x]")
                            print("Tarefa marcada como concluída.")
                        } else {
                            tarefas[indice - 1] = tarefas[indice - 1].replacingOccurrences(of: "[x]", with: "[ ]")
                            print("Tarefa marcada como pendente.")
                        }
                    }
                }

            case 0:
                print("Saindo do programa...")
                return

            default:
                print("Opção inválida.")
            }
        }
    }
}

iniciarApp()
