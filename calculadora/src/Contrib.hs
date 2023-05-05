{-# LANGUAGE DeriveGeneric, OverloadedStrings, OverloadedLabels #-}
module Contrib (Contribuinte,  salvarContribuinte, listarContribuintes) where

import Database.Selda
import Database.Selda.SQLite

data Contribuinte = Contribuinte {
    nome :: String,
    rendimento :: Double,
    gastoPrevidencia :: Double,
    qtdDependententes :: Int,
    pensaoAlimenticia :: Double,
    gastoSaude :: Double,
    gastoEducacao :: Double,
    gastoOutros :: Double
} deriving (Show, Read, Eq)


tabelaContribuinte :: Table Contribuinte
tabelaContribuinte = table "contribuintes" [#nome :- primary]

salvarContribuinte :: Contribuinte -> IO ()
salvarContribuinte novoContribuinte = withSQLite "database.sqlite" $ do
    createTable tabelaContribuinte
    insert_ tabelaContribuinte[novoContribuinte]

listarContribuintes :: IO ()
listarContribuintes = withSQLite "database.sqlite" $ do
    let queryContribuintes = do
        contribuinte <- select tabelaContribuinte
        return (nome :*: rendimento)
    contribuintes <- query queryContribuintes




-- listarContribuintes :: IO ()
-- listarContribuintes = withSQLite "database.sqlite" $ do
--     contribuintes <- query $ do
--         contribuinte <- select tabelaContribuinte
--         return (nome :*: rendimento)

-- listarContribuintes :: IO ()
-- listarContribuintes = query $ do
--     contribuintes <- select tabelaContribuinte
--     return $ (nome contribuintes) :*: (rendimento contribuintes)
    
    
    -- mapM_ print contribuites

    -- listarContribuintes <- query $ do
    --     contribuintes <- select tabelaContribuinte
    --     return $ (contribuintes ! #nome :*: contribuintes ! #rendimento )
    
    -- liftIO $ print listarContribuintes
