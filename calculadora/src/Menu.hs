module Menu(
    menu,
    submenu1,
    submenu2,
    submenu3,
    imprimeUsuario,
    estaEntre,
    impostoTotal,
    impostoNaFonte
) where
  
import System.Console.ANSI
import Control.Monad.RWS (MonadState(put))


imprimeUsuario :: Int -> Int -> ()
imprimeUsuario x y 
  | x == y = putStrLn "Todos os usuarios foram impressos"
  | otherwise = do
    usuario <- getUsuario x -- função de dados, buscar o usuario no banco pelo id
    putStrln $ "ID: " ++ usuario[0]
    putStrLn $ "Nome: " ++ usuario[1]
    imprimeUsuario (x+1) y

estaEntre :: Ord a => a -> a -> a -> Bool
estaEntre x a b = x >= a && x <= b 


impostoNaFonte :: String -> Int -> IO ()
impostoNaFonte escolha max_length
  | estaEntre escolha 1 max_length = do
    usuario <- getUsuario escolha
    putStrLn $ "Calculando imposto de renda retido na fonte de " ++ usuario[1]
    putStrLn $ "Imposto de renda mensal: " ++ calculaImpostoRendaMensal usuario[0] -- função de calculo de imposto de renda mensal
    putStrLn "Pressione qualquer tecla para voltar ao menu"
    getLine
    menu
  | otherwise = do
    putStrLn " ID invalido, tente novamente"

impostoTotal :: String -> Int -> IO ()
impostoTotal escolha max_length
  | estaEntre escolha 1 max_length = do
    usuario <- getUsuario escolha
    putStrLn $ "Calculando imposto de renda total de " ++ usuario[1]
    putStrLn $ "Imposto de renda total: " ++ calculaImpostoRendaTotal usuario[0] -- função de calculo de imposto de renda total
    putStrLn $ "As deduções totais foram de: " ++ calculaDeducoes usuario[0] -- função de calculo de deduções totais
    putStrLn $ "Isso corresponde a uma alíquota efetiva de: " ++ calculaAliquotaEfetiva usuario[0] -- função de calculo de alíquota efetiva
    putStrLn "Pressione qualquer tecla para voltar ao menu"
    getLine
    menu
  | otherwise = do
    putStrLn " ID invalido, tente novamente"


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
  max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
  clearScreen
  putStrLn "---------------------------------"
  putStrLn "Selecione o ID do usuario que deseja calcular o importo de renda mensal,ou digite - para sair"
  imprimeUsuario 0 max_length
  putStrLn "---------------------------------"
  opcao <- getLine
  case opcao of
    "-" -> menu
    _ -> do
      impostoNaFonte opcao max_length
      putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
      escolha <- getLine
      case escolha of
        "s" -> submenu2
        "n" -> menu
        _ -> do
          putStrLn "Opcao invalida, retornando ao menu"
          menu
      
  
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
  max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
  putStrLn "---------------------------------"
  putStrLn "Selecione o ID do usuario que deseja calcular o importo de renda mensal,ou digite 0 para sair"
  imprimeUsuario 0 max_length
  putStrLn "---------------------------------"
  opcao <- getLine
  case opcao of
    "0" -> menu
    _ -> do
      impostoTotal opcao max_length
      putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
      escolha <- getLine
      case escolha of
        "s" -> submenu2
        "n" -> menu
        _ -> do
          putStrLn "Opcao invalida, retornando ao menu"
          menu
