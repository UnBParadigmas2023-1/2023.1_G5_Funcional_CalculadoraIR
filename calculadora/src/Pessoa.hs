module Pessoa where

import Deducao

data Titular = Titular { 
  rendimentosTributaveis :: Double,
  dedutiveis :: Deducoes
} deriving (Show)


baseCalculoImpostoSimples :: Float -> Float
baseCalculoImpostoSimples rendimentosTributaveis =
  let baseDeCalculo = rendimentosTributaveis - (rendimentosTributaveis * 0.2) in
  if rendimentosTributaveis * 0.2 <= 16754.34 then calculaImpostoDevidoAux baseDeCalculo else
  calculaImpostoDevidoAux rendimentosTributaveis - 16754.34


deducaoTotal :: Bool -> Float -> Float
deducaoTotal calculoAnual deducao
    | calculoAnual = deducao
    | otherwise = deducao / 12.0

calculaImpostoDevido :: Bool -> Titular -> Double
calculaImpostoDevido calculoAnual pessoaParaOCalculo =
    let baseDeCalculo = (rendimentosTributaveis pessoaParaOCalculo) - (deducaoTotal calculoAnual (dedutiveis pessoaParaOCalculo)) in
    calculaImpostoDevidoAux baseDeCalculo

calculaImpostoDevidoAux :: Float -> Float
calculaImpostoDevidoAux baseDeCalculo
    | baseDeCalculo <= 0 = 0.0
    | baseDeCalculo <= 1903.98 = 0.0
    | baseDeCalculo <= 2826.65 = (baseDeCalculo * 0.075 - 142.8)
    | baseDeCalculo <= 3751.05 = (baseDeCalculo * 0.15 - 354.8)
    | baseDeCalculo <= 4664.68 = (baseDeCalculo * 0.225 - 636.13)
    | otherwise = (baseDeCalculo * 0.275 - 869.36)

