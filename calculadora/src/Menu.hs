module Menu (mainMenu) where

import Lib (cadastrarContribuinte, menuImpostoAnual, menuImpostoMensal)
import System.Console.ANSI
import System.Exit (exitSuccess)

type MenuOption = String

type MenuFunction = IO ()

type Menu = [(MenuOption, MenuFunction)]

mainMenu :: IO ()
mainMenu = do
  -- withSQLite "database.sqlite" $ do
  --   tryCreateTable tabelaContribuinte

  clearScreen
  let menu :: Menu
      menu =
        [ ("1", cadastrarContribuinte),
          ("2", menuImpostoMensal),
          ("3", menuImpostoAnual),
          ("0", sair)
        ]
  showMenu menu

showMenu :: Menu -> IO ()
showMenu menu = do
  putStrLn "Escolha uma opcao:"
  putStrLn "1 - Cadastrar Contribuinte"
  putStrLn "2 - Calculo de imposto mensal"
  putStrLn "3 - Calculo de imposto anual"
  putStrLn "0 - Sair:"

  opcao <- getLine

  case lookup opcao menu of
    Just f -> do
      clearScreen
      f
      _ <- getChar
      clearScreen
      showMenu menu
    Nothing -> do
      putStrLn "Opcao invalida!"
      _ <- getChar
      clearScreen
      showMenu menu

sair :: IO ()
sair = putStrLn "Saindo do programa." >> exitSuccess

-- ============================================================================

-- imprimeUsuario :: Int -> Int -> ()
-- imprimeUsuario x y
--   | x == y = putStrLn "Todos os usuarios foram impressos"
--   | otherwise = do
-- usuario <- getUsuario x -- função de dados, buscar o usuario no banco pelo id
-- putStrln $ "ID: " ++ usuario[0]
-- putStrLn $ "Nome: " ++ usuario[1]
-- imprimeUsuario (x+1) y

-- estaEntre :: Ord a => a -> a -> a -> Bool
-- estaEntre x a b = x >= a && x <= b

-- impostoNaFonte :: String -> Int -> IO ()
-- impostoNaFonte escolha max_length
--   | estaEntre escolha 1 max_length = do
--     usuario <- getUsuario escolha
--     putStrLn $ "Calculando imposto de renda retido na fonte de " ++ usuario[1]
--     putStrLn $ "Imposto de renda mensal: " ++ calculaImpostoRendaMensal usuario[0] -- função de calculo de imposto de renda mensal
--     putStrLn "Pressione qualquer tecla para voltar ao menu"
--     getLine
--     menu
--   | otherwise = do
--     putStrLn " ID invalido, tente novamente"

-- impostoTotal :: String -> Int -> IO ()
-- impostoTotal escolha max_length
--   | estaEntre escolha 1 max_length = do
--     usuario <- getUsuario escolha
--     putStrLn $ "Calculando imposto de renda total de " ++ usuario[1]
--     putStrLn $ "Imposto de renda total: " ++ calculaImpostoRendaTotal usuario[0] -- função de calculo de imposto de renda total
--     putStrLn $ "As deduções totais foram de: " ++ calculaDeducoes usuario[0] -- função de calculo de deduções totais
--     putStrLn $ "Isso corresponde a uma alíquota efetiva de: " ++ calculaAliquotaEfetiva usuario[0] -- função de calculo de alíquota efetiva
--     putStrLn "Pressione qualquer tecla para voltar ao menu"
--     getLine
--     menu
--   | otherwise = do
--     putStrLn " ID invalido, tente novamente"

-- menu :: IO ()
-- menu = do
--   clearScreen
--   putStrLn "Calculadora de imposto de renda "
--   putStrLn "---------------------------------"
--   putStrLn "1 - Cadastro de pessoa"
--   putStrLn "2 - Calculo de imposto mensal"
--           -- nome da pessoa(id) : retorna o valor calculado
--           -- se nao existir, perguntar se deseja cadastrar
--           -- se sim, cadastrar
--   putStrLn "3 - Calculo de imposto anual"
--           -- nome da pessoa(id) : retorna o valor calculado
--           -- se nao existir, perguntar se deseja cadastrar
--           -- se sim, cadastrar
--   putStrLn "4 - Sair"
--   escolha <- getLine
--   case escolha of
--     "1" -> submenu1
--     "2" -> submenu2
--     "3" -> submenu3
--     "4" -> putStrLn "Saindo..."
--     _  ->  menu

-- submenu1 = do
--     clearScreen
--     putStrLn "Digite o nome: "
--     nome <- readName
--     putStrLn "Digite o valor do rendimento tributável anual: "
--     rendimento <- readDouble
--     putStrLn "Digite o gasto anual com previdência oficial:  "
--     gastoPrevidencia <- readDouble
--     putStrLn "Digite o número de dependentes: "
--     qtdDependentes <- readInt
--     putStrLn "Digite o gasto anual com pensão alimentícia : "
--     pensaoAlimenticia <- readDouble
--     putStrLn "Digite o gasto anual com saúde:"
--     gastoSaude <- readDouble
--     putStrLn "Digite o gasto anual com educação: "
--     gastoEducacao <- readDouble
--     putStrLn "Digite o gasto anual total com outras despesas dedutíveis:  (Para mais informações consulte IN RFB nº 1500, de 2014)"
--     gastoOutros <- readDouble
--     -- ** aqui vai a chamar o modulo para armazenar as informações anteriores em banco de dados ou arquivo **
--     putStrLn "Informações registradas com sucesso.....Pressione qualquer tecla para voltar ao menu"
--     _ <- getLine
--     menu

-- submenu2 :: IO ()
-- submenu2 = do
--   -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
--   clearScreen
--   putStrLn "---------------------------------"
--   putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda mensal,ou digite - para sair"
--   -- imprimeUsuario 0 max_length
--   putStrLn "---------------------------------"
--   opcao <- getLine
--   case opcao of
--     "-" -> menu
--     _ -> do
--       -- impostoNaFonte opcao max_length
--       putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
--       escolha <- getLine
--       case escolha of
--         "s" -> submenu2
--         "n" -> menu
--         _ -> do
--           putStrLn "Opcao invalida, retornando ao menu"
--           menu

--   escolha <- getLine
--   case escolha of
--     "1" -> submenu1
--     "2" -> submenu2
--     "3" -> submenu3
--     "4" -> putStrLn "Saindo..."
--     _  ->  menu

-- submenu3 :: IO ()
-- submenu3 = do
--   clearScreen
--   -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
--   putStrLn "---------------------------------"
--   putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda mensal,ou digite 0 para sair"
--   -- imprimeUsuario 0 max_length
--   putStrLn "---------------------------------"
--   opcao <- getLine
--   case opcao of
--     "0" -> menu
--     _ -> do
--       -- impostoTotal opcao max_length
--       putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
--       escolha <- getLine
--       case escolha of
--         "s" -> submenu2
--         "n" -> menu
--         _ -> do
--           putStrLn "Opcao invalida, retornando ao menu"
--           menu
