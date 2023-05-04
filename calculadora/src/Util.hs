module Util (readDouble, readInt, readName) where
    
import Text.Read 
import Data.Char 

readDouble :: IO Double
readDouble = do
        input <- getLine
        case readMaybe input of
            Just d -> return d
            Nothing -> do
                putStrLn "Entrada inválida. Digite um número válido:"
                readDouble

readInt :: IO Int
readInt = do
        input <- getLine
        case readMaybe input of
            Just i -> return i
            Nothing -> do
                putStrLn "Entrada inválida. Digite um número inteiro:"
                readInt

readName :: IO String
readName = do
        input <- getLine
        if isValidString input
            then return input
            else do
                putStrLn "Entrada inválida. Digite um nome válido:"
                readName

isValidString :: String -> Bool
isValidString str = all isAlpha str