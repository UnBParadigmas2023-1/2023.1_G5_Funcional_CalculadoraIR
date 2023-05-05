import Deducoes

module Pessoa where

data Titular = Titular { 
  rendimentosTributaveis :: Float,
  dedutiveis :: Deducoes
}


baseCalculoImpostoSimples :: Float -> Float
baseCalculoImpostoSimples rendimentosTributaveis =
  let baseDeCalculo = rendimentosTributaveis - (rendimentosTributaveis * 0.2) in
  if rendimentosTributaveis * 0.2 <= 16754.34 then baseDeCalculo else
  rendimentosTributaveis - 16754.34

calculoSimples :: Integer -> Float
calculoSimples rendimento =
  let limite = 16000
    in
      if rendimento <= limite then
        rendimento * 0.2
      else -- Rendimento maior que o limite.
        3200.0

calculaImpostoDevido :: Bool -> Titular -> Float
calculaImpostoDevido calculoAnual pessoaParaOCalculo =
    let baseDeCalculo = (rendimentosTributaveis pessoaParaOCalculo) - (deducaoTotal calculoAnual (dedutiveis pessoaParaOCalculo)) in
    calculaImpostoDevidoAux baseDeCalculo

calculaImpostoDevidoAux :: Float -> Float
calculaImpostoDevidoAux baseDeCalculo
    | baseDeCalculo <= 0 = 0.0
    | baseDeCalculo <= 1903.98 = 0.0
    | baseDeCalculo <= 2826.65 = (baseDeCalculo * 0.075 - 142.80) + calculaImpostoDevidoAux (baseDeCalculo - 2826.65)
    | baseDeCalculo <= 3751.05 = (baseDeCalculo * 0.15 - 354.80) + calculaImpostoDevidoAux (baseDeCalculo - 3751.05)
    | baseDeCalculo <= 4664.68 = (baseDeCalculo * 0.225 - 636.13) + calculaImpostoDevidoAux (baseDeCalculo - 4664.68)
    | otherwise = (baseDeCalculo * 0.275 - 869.36) + calculaImpostoDevidoAux (baseDeCalculo - 4664.68)
