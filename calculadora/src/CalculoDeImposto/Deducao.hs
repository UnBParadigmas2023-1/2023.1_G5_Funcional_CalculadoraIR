module Deducao where


-- Salva as deducoes possiveis, anuais ou mensais.
data Deducoes = Deducoes
  { previdenciaOficial :: Float,
    quatidadeDeDependentes :: Integer,
    alimentados :: [Float],
    instruidos :: Integer,
    despesaComInstrucao :: Float,
    despesaMedica :: Float,
    pensaoAlimenticia :: Float,
    outrasDeducoes :: Float
  }

-- Calcula a deducao total por dependente.
deducaoTotalPorDependente :: Bool -> Deducoes -> Float
deducaoTotalPorDependente calculoAnual deducoes =
  let valorPorDependente = if calculoAnual then 2275.08 else 189.59
   in valorPorDependente * fromInteger (quatidadeDeDependentes deducoes)


-- Calculo apenas para imposto anual, onde temos o limite de 3561.50 por instruido.
-- Os instruidos podem ser o titular, cada dependente ou alimentado que o titular gastou com instrução.
deducaoTotalComIntrucao :: Deducoes -> Float 
deducaoTotalComIntrucao deducoes = 
  let upperMax = 3561.50 * fromInteger (instruidos deducoes)
    in 
      if upperMax > (despesaComInstrucao deducoes) then 
        despesaComInstrucao deducoes
      else
        upperMax
    
-- Retorna o valor a ser deduzido do rendimento tributavel.
deducaoTotal :: Bool -> Deducoes -> Float
deducaoTotal calculoAnual deducoes = 
  let deducoesComuns = previdenciaOficial deducoes + deducaoTotalPorDependente calculoAnual deducoes + pensaoAlimenticia deducoes + outrasDeducoes deducoes
    in
      if calculoAnual then 
        deducoesComuns + sum (alimentados deducoes)
        + deducaoTotalComIntrucao deducoes
        + despesaMedica deducoes
      else
        deducoesComuns
