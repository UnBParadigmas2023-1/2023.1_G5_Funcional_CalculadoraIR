module Pessoa where

import Deducao

data Titular = Titular { 
  rendimentosTributaveis :: Double,
  dedutiveis :: Deducoes
} deriving (Show)

calculoSimples :: Double -> Double
calculoSimples rendimento =
  let limite = 16000
    in
      if rendimento <= limite then
        rendimento * 0.2
      else -- Rendimento maior que o limite.
        3200.0

calculaImpostoDevido :: Bool -> Titular -> Double
calculaImpostoDevido calculoAnual pessoaParaOCalculo =
    let baseDeCalculo = (rendimentosTributaveis pessoaParaOCalculo) - (deducaoTotal calculoAnual (dedutiveis pessoaParaOCalculo)) in
    if baseDeCalculo <= 1903.98 then 0.0 else
    if baseDeCalculo <= 2826.65 then baseDeCalculo * 0.075 - 142.80 else
    if baseDeCalculo <= 3751.05 then baseDeCalculo * 0.15 - 354.80 else
    if baseDeCalculo <= 4664.68 then baseDeCalculo * 0.225 -636.13 else
    baseDeCalculo * 0.275 -869.36
