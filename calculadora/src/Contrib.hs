module Contrib (Contribuinte (..), inserirContribuinte, listarContribuintes) where
{-# LANGUAGE DeriveGeneric, OverloadedStrings, OverloadedLabels #-}
import Database.Selda
import Database.Selda.SQLite

data Contribuinte = Contribuinte {     
    pid  :: ID Contribuinte
    nome :: Text,
    rendimento :: Double,
    gastoPrevidencia :: Double,
    qtdDependententes :: Int,
    pensaoAlimenticia :: Double,
    gastoSaude :: Double,
    gastoEducacao :: Double,
    gastoOutros :: Double
  } deriving (Generic, Show)
instance SqlRow Contribuinte

contribuinte :: Table Contribuinte
contribuinte = table "contribuinte" [#pid :- autoPrimary]

inserirContribuinte :: Contribuinte -> IO ()
inserirContribuinte novoContribuinte = withSQLite "database.sqlite" $ do
  insert_ tabelaContribuinte [novoContribuinte]

listarContribuintes :: IO [Contribuinte]
listarContribuintes = withSQLite "database.sqlite" $ do
  query $ select tabelaContribuinte
