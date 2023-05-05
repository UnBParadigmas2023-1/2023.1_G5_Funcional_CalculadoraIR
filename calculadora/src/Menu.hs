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
