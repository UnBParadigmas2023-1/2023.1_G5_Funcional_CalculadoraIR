module Pessoa where

import Deducao


data Titular = Titular
  { rendimentosTributaveis :: Double,
    dedutiveis :: Deducoes
  }
  deriving (Show)

baseCalculoImpostoSimples :: Double -> Double
baseCalculoImpostoSimples rendimentosTributaveis =
  let baseDeCalculo = rendimentosTributaveis - rendimentosTributaveis * 0.2
   in if rendimentosTributaveis * 0.2 <= 16754.34
        then calculaImpostoDevidoAux baseDeCalculo
        else calculaImpostoDevidoAux rendimentosTributaveis - 16754.34

calculaImpostoDevido :: Bool -> Titular -> Double
calculaImpostoDevido calculoAnual pessoaParaOCalculo =
  let baseDeCalculo = rendimentosTributaveis pessoaParaOCalculo - deducaoTotal calculoAnual (dedutiveis pessoaParaOCalculo)
  in if calculoAnual
      then calculaImpostoDevidoAnualAux baseDeCalculo
      else calculaImpostoDevidoAux baseDeCalculo

calculaImpostoDevidoAux :: Double -> Double
calculaImpostoDevidoAux baseDeCalculo
  | baseDeCalculo <= 0 = 0.0
  | baseDeCalculo <= 1903.98 = 0.0
  | baseDeCalculo <= 2826.65 = baseDeCalculo * 0.075 - 142.8
  | baseDeCalculo <= 3751.05 = baseDeCalculo * 0.15 - 354.8
  | baseDeCalculo <= 4664.68 = baseDeCalculo * 0.225 - 636.13
  | otherwise = baseDeCalculo * 0.275 - 869.36

calculaImpostoDevidoAnualAux :: Double -> Double
calculaImpostoDevidoAnualAux baseDeCalculo
  | baseDeCalculo <= 0 = 0.0
  | baseDeCalculo <= 1903.98 * 12 = 0.0
  | baseDeCalculo <= 2826.65 * 12 = baseDeCalculo * 0.075 - (142.8 * 12)
  | baseDeCalculo <= 3751.05 * 12 = baseDeCalculo * 0.15 - (354.8 * 12)
  | baseDeCalculo <= 4664.68 * 12 = baseDeCalculo * 0.225 - (636.13 * 12)
  | otherwise = baseDeCalculo * 0.275 - (869.36 * 12)
