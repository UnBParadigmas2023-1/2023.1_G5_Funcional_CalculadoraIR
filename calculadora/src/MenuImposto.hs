module MenuImposto (menuImpostoMensal, menuImpostoAnual) where

import Contrib (Contribuinte(nome, rendimento, gastoPrevidencia, qtdDependententes, pensaoAlimenticia, gastoSaude, gastoEducacao, gastoOutros), lerContribuintesArquivo)
import Data.Text (Text, pack)
import Pessoa (Titular(Titular, rendimentosTributaveis, dedutiveis), calculaImpostoDevido)
import Deducao (Deducoes(Deducoes, previdenciaOficial, quantidadeDeDependentes, despesaComInstrucao, despesaMedica, pensaoAlimenticiaDeducao, outrasDeducoes))


menuImpostoMensal :: IO ()
menuImpostoMensal = do
  -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
  putStrLn "---------------------------------"
  putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda mensal,ou digite - para sair"

  contribuintes <- lerContribuintesArquivo
  printContribuintes contribuintes
  putStrLn "---------------------------------"
  opcao <- getLine
  -- case opcao of
  let contribuinte = encontraContribuintePorNome (pack opcao) contribuintes
  case contribuinte of
    Nothing -> do
      putStrLn "Contribuinte nao encontrado"
      menuImpostoMensal
    Just contribuinte -> do
      let titular = Titular {
        rendimentosTributaveis = rendimento contribuinte,
        dedutiveis = Deducoes {
          previdenciaOficial = gastoPrevidencia contribuinte,
          quantidadeDeDependentes = qtdDependententes contribuinte,
          despesaComInstrucao = gastoEducacao contribuinte,
          despesaMedica = gastoSaude contribuinte,
          pensaoAlimenticiaDeducao = pensaoAlimenticia contribuinte,
          outrasDeducoes = gastoOutros contribuinte
        }
      }
      let x = calculaImpostoDevido False titular
      print x
      print contribuinte


printContribuintes :: [Contribuinte] -> IO ()
printContribuintes [] = return ()

printContribuintes (x:xs) = do
  print x
  printContribuintes xs


encontraContribuintePorNome :: Text -> [Contribuinte] -> Maybe Contribuinte
encontraContribuintePorNome _ [] = Nothing
encontraContribuintePorNome n (x:xs)
  | n == nome x = Just x
  | otherwise = encontraContribuintePorNome n xs


menuImpostoAnual :: IO ()
menuImpostoAnual = do
  -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
  putStrLn "---------------------------------"
  putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda anual,ou digite 0 para sair"

-- -- imprimeUsuario 0 max_length
-- putStrLn "---------------------------------"
-- opcao <- getLine

-- case opcao of
--   "0" -> menu
--   _ -> do
--     -- impostoTotal opcao max_length
--     putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
--     escolha <- getLine
--     case escolha of
--       "s" -> menuImpostoAnual
--       "n" -> menu
--       _ -> do
--         putStrLn "Opcao invalida, retornando ao menu"
--         menu
