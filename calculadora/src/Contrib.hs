module Contrib  where
{-# LANGUAGE DeriveGeneric, OverloadedStrings, OverloadedLabels #-}
import Database.Selda
import Database.Selda.SQLite

data Contribuinte = Contribuinte {     
    -- pid  :: ID Contribuinte,
    nome :: Text,
    rendimento :: Double,
    gastoPrevidencia :: Double,
    qtdDependententes :: Integer,
    pensaoAlimenticia :: Double,
    gastoSaude :: Double,
    gastoEducacao :: Double,
    gastoOutros :: Double
  } deriving (Show, Read)

criaContribuinte :: Text -> Double -> Double -> Integer -> Double -> Double -> Double -> Double -> Contribuinte
criaContribuinte nome rendimento gastoPrevidencia qtdDependententes pensaoAlimenticia gastoSaude gastoEducacao gastoOutros = Contribuinte {
    -- pid = def,
    nome = nome,
    rendimento = rendimento,
    gastoPrevidencia = gastoPrevidencia,
    qtdDependententes = qtdDependententes,
    pensaoAlimenticia = pensaoAlimenticia,
    gastoSaude = gastoSaude,
    gastoEducacao = gastoEducacao,
    gastoOutros = gastoOutros
  }


savaContribuinteArquivo :: Contribuinte -> IO ()
savaContribuinteArquivo contribuinte = appendFile "contribuintes.txt" (show contribuinte ++ "\n")

lerContribuintesArquivo :: IO [Contribuinte]
lerContribuintesArquivo = do
  content <- readFile "contribuintes.txt"
  let contribuintes = map read (lines content)
  return contribuintes

-- instance SqlRow Contribuinte

-- contribuinte :: Table Contribuinte
-- contribuinte = table "contribuinte" [#pid :- autoPrimary]

-- inserirContribuinte :: Contribuinte -> IO ()
-- inserirContribuinte novoContribuinte = withSQLite "database.sqlite" $ do
--   insert_ tabelaContribuinte [novoContribuinte]

-- listarContribuintes :: IO [Contribuinte]
-- listarContribuintes = withSQLite "database.sqlite" $ do
--   query $ select tabelaContribuinte
