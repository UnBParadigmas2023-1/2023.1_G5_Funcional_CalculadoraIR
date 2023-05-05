module MenuImposto (menuImpostoMensal, menuImpostoAnual) where

import Contrib (Contribuinte(nome, rendimento, gastoPrevidencia, qtdDependententes, pensaoAlimenticia, gastoSaude, gastoEducacao, gastoOutros), lerContribuintesArquivo)
import Data.Text (Text, pack)
import Pessoa (Titular(Titular, rendimentosTributaveis, dedutiveis), calculaImpostoDevido)
import Deducao (Deducoes(Deducoes, previdenciaOficial, quantidadeDeDependentes, despesaComInstrucao, despesaMedica, pensaoAlimenticiaDeducao, outrasDeducoes))


data TipoImposto = Mensal | Anual deriving (Show, Read, Eq)


calculaImpostPorTipo :: TipoImposto -> IO ()
calculaImpostPorTipo tipo = do
  let eAnual = tipo == Anual

  putStrLn "---------------------------------"
  contribuintes <- lerContribuintesArquivo
  printContribuintes contribuintes
  putStrLn "---------------------------------"
  opcao <- getLine
  case opcao of
    "-" -> putStrLn "Saindo..."
    opcao -> do
      let contribuinteEscolhido = encontraContribuintePorNome (pack opcao) contribuintes
      case contribuinteEscolhido of
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
          let impostoDevido = calculaImpostoDevido eAnual titular
          putStrLn $ "Imposto devido: " ++ show impostoDevido
          putStrLn "Deseja calcular o imposto de outro contribuinte? (s/n)"

          escolha <- getLine
          case escolha of
            "s" -> menuImpostoMensal
            _ -> putStrLn "Retornando ao menu"


menuImpostoMensal :: IO ()
menuImpostoMensal = do
  putStrLn "Digite o nome do contribuinte que deseja calcular o imposto de renda mensal, ou digite - para sair"
  calculaImpostPorTipo Mensal


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
  putStrLn "Digite o nome do contribuinte que deseja calcular o imposto de renda anual, ou digite - para sair"
  calculaImpostPorTipo Anual
