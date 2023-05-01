module Menu(
    menu,
    submenu1,
    submenu2,
    submenu3
) where
  
import System.Console.ANSI
import Util


menu :: IO ()
menu = do
  clearScreen
  putStrLn "Calculadora de imposto de renda "
  putStrLn "---------------------------------"
  putStrLn "1 - Cadastro de pessoa"
  putStrLn "2 - Calculo de imposto mensal"
          -- nome da pessoa(id) : retorna o valor calculado
          -- se nao existir, perguntar se deseja cadastrar
          -- se sim, cadastrar
  putStrLn "3 - Calculo de imposto anual"
          -- nome da pessoa(id) : retorna o valor calculado
          -- se nao existir, perguntar se deseja cadastrar
          -- se sim, cadastrar
  putStrLn "4 - Sair"
  escolha <- getLine
  case escolha of
    "1" -> submenu1
    "2" -> submenu2
    "3" -> submenu3
    "4" -> putStrLn "Saindo..."
    _  ->  menu





submenu1 = do
    clearScreen
    putStrLn "Digite o nome: "
    nome <- readName 
    putStrLn "Digite o valor do rendimento tributável anual: "
    rendimento <- readDouble
    putStrLn "Digite o gasto anual com previdência oficial:  "
    gastoPrevidencia <- readDouble
    putStrLn "Digite o número de dependentes: "
    qtdDependentes <- readInt
    putStrLn "Digite o gasto anual com pensão alimentícia : "  
    pensaoAlimenticia <- readDouble
    putStrLn "Digite o gasto anual com saúde:" 
    gastoSaude <- readDouble
    putStrLn "Digite o gasto anual com educação: "
    gastoEducacao <- readDouble
    putStrLn "Digite o gasto anual total com outras despesas dedutíveis:  (Para mais informações consulte IN RFB nº 1500, de 2014)"
    gastoOutros <- readDouble
    -- ** aqui vai a chamar o modulo para armazenar as informações anteriores em banco de dados ou arquivo **
    putStrLn "Informações registradas com sucesso.....Pressione qualquer tecla para voltar ao menu"
    _ <- getLine
    menu

    

submenu2 :: IO ()
submenu2 = do
  clearScreen
  putStrLn "---------------------------------"
  putStrLn "1 - "
  putStrLn "2 - "
  putStrLn "3 - "
  putStrLn "4 - "
  escolha <- getLine
  case escolha of
    "1" -> submenu1
    "2" -> submenu2
    "3" -> submenu3
    "4" -> putStrLn "Saindo..."
    _  ->  menu


submenu3 :: IO ()
submenu3 = do
  clearScreen
  putStrLn "---------------------------------"
  putStrLn "1 - "
  putStrLn "2 - "
  putStrLn "3 - "
  putStrLn "4 - "
  escolha <- getLine
  case escolha of
    "1" -> submenu1
    "2" -> submenu2
    "3" -> submenu3
    "4" -> putStrLn "Saindo..."
    _  ->  menu

