module Deducao where


-- Salva as deducoes possiveis, anuais ou mensais.
data Deducoes = Deducoes
  { previdenciaOficial :: Double,
    quantidadeDeDependentes :: Integer,
    despesaComInstrucao :: Double,
    despesaMedica :: Double,
    pensaoAlimenticiaDeducao :: Double,
    outrasDeducoes :: Double
  } deriving (Show)

-- Calcula a deducao total por dependente.
deducaoTotalPorDependente :: Bool -> Deducoes -> Double
deducaoTotalPorDependente calculoAnual deducoes =
  let valorPorDependente = if calculoAnual then 2275.08 else 189.59
   in valorPorDependente * fromInteger (quantidadeDeDependentes deducoes)


-- Retorna o valor a ser deduzido do rendimento tributavel.
deducaoTotal :: Bool -> Deducoes -> Double
deducaoTotal calculoAnual deducoes = 
  let deducoesComuns = previdenciaOficial deducoes + deducaoTotalPorDependente calculoAnual deducoes + pensaoAlimenticiaDeducao deducoes + outrasDeducoes deducoes
    in
      if calculoAnual then 
        deducoesComuns 
        + despesaComInstrucao deducoes
        + despesaMedica deducoes
      else
        deducoesComuns
