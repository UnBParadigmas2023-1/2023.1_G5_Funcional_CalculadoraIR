module Contribuinte (cadastrarContribuinte) where
import Util(readDouble, readInt, readName)



cadastrarContribuinte :: IO ()
cadastrarContribuinte = do
    putStrLn "-------------------------------------------------------------"
    putStrLn "Digite o nome: "
    nome <- readName 
    putStrLn "Digite o valor do rendimento tributável anual: "
    rendimento <- readDouble
    putStrLn "Digite o gasto anual com previdência oficial:  "
    gastoPrevidencia <- readDouble
    putStrLn "Digite o número de dependentes: "
    qtdDependentes <- readInt
    putStrLn "Digite o gasto anual com pensão alimentícia : "  
    pensaoAlimenticia <- readDouble
    putStrLn "Digite o gasto anual com saúde:" 
    gastoSaude <- readDouble
    putStrLn "Digite o gasto anual com educação: "
    gastoEducacao <- readDouble
    putStrLn "Digite o gasto anual total com outras despesas dedutíveis:  (Para mais informações consulte IN RFB nº 1500, de 2014)"
    gastoOutros <- readDouble


    salvarContribuinte(pack nome) redimento

    return()
