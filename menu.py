def somar(a, b):
    return a + b

def subtrair(a, b):
    return a - b

def multiplicar(a, b):
    return a * b

def dividir(a, b):
    if b == 0:
        return "Erro: Divisão por zero"
    return a / b

def menu():
    while True:
        print("\n1 - Somar")
        print("2 - Subtrair")
        print("3 - Multiplicar")
        print("4 - Dividir")
        print("0 - Sair")

        opcao = input("Escolha: ")

        if opcao == "0":
            print("Saindo...")
            break

        if opcao in ["1", "2", "3", "4"]:
            try:
                a = float(input("Primeiro número: "))
                b = float(input("Segundo número: "))

                if opcao == "1":
                    print("Resultado:", somar(a, b))
                elif opcao == "2":
                    print("Resultado:", subtrair(a, b))
                elif opcao == "3":
                    print("Resultado:", multiplicar(a, b))
                elif opcao == "4":
                    print("Resultado:", dividir(a, b))

            except ValueError:
                print("Entrada inválida")
        else:
            print("Opção inválida")

if __name__ == "__main__":
    menu()