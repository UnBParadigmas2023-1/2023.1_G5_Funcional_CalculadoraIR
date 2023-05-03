module Menu(
    menu,
    submenu1,
    submenu2,
    submenu3
) where
  
import System.Console.ANSI
import CalculoDeImposto.Pessoas



menu :: IO ()
menu = do
  clearScreen
  putStrLn "Calculadora de imposto de renda "
  putStrLn "---------------------------------"
  putStrLn "1 - Cadastro de pessoa"
    -- cadastro de nome
    -- cadastro de rendimentos tributáveis totais
    -- despesas dedutiveis:
      -- gasto previdencia oficial:
      -- quantos dependentes:
      -- gasto pensao alimenticia:
      -- gasto com saude:
      -- gasto com educação:
      -- Outros gastos dedutiveis (total):
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

submenu1 :: IO ()
submenu1 = do
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

