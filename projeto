func iniciarApp() {
    var tarefas: [String] = []

    while true {
        print("""

        === Lista de Tarefas ===
        1 - Listar tarefas
        2 - Adicionar tarefa
        3 - Remover tarefa
        4 - Editar tarefa
        0 - Sair
        Escolha uma opção:
        """)
        
        let opcao = readLine()
        
        if let escolha = opcao, let numero = Int(escolha) {
            switch numero {
            case 1:
                listarTarefas(tarefas: tarefas)
            case 2:
                if let nova = pedirEntrada(mensagem: "Digite a nova tarefa:") {
                    tarefas.append(nova)
                    print("Tarefa adicionada com sucesso.")
                } else {
                    print("Nenhuma tarefa digitada.")
                }
            case 3:
                listarTarefas(tarefas: tarefas)
                if let indiceStr = pedirEntrada(mensagem: "Número da tarefa para remover:"),
                   let indice = Int(indiceStr), indice > 0, indice <= tarefas.count {
                    let removida = tarefas.remove(at: indice - 1)
                    print("Tarefa removida: \(removida)")
                } else {
                    print("Número inválido.")
                }
            case 4:
                listarTarefas(tarefas: tarefas)
                if let indiceStr = pedirEntrada(mensagem: "Número da tarefa para editar:"),
                   let indice = Int(indiceStr), indice > 0, indice <= tarefas.count,
                   let nova = pedirEntrada(mensagem: "Digite a nova descrição:") {
                    tarefas[indice - 1] = nova
                    print("Tarefa atualizada com sucesso.")
                } else {
                    print("Número inválido ou texto vazio.")
                }
            case 0:
                print("Saindo do app...")
                return
            default:
                print("Opção inválida.")
            }
        } else {
            print("Entrada inválida, digite um número.")
        }
    }
}

func listarTarefas(tarefas: [String]) {
    if tarefas.isEmpty {
        print("Nenhuma tarefa cadastrada.")
    } else {
        print("Suas tarefas:")
        for (i, tarefa) in tarefas.enumerated() {
            print("\(i + 1). \(tarefa)")
        }
    }
}

func pedirEntrada(mensagem: String) -> String? {
    print(mensagem)
    let entrada = readLine()
    if let texto = entrada, !texto.isEmpty {
        return texto
    }
    return nil
}

iniciarApp()
