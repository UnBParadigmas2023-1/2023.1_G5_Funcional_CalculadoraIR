module User where

data User = User {
    nome :: String,
    rendimento :: Double,
    gastoPrevidencia :: Double,
    qtdDependententes :: Int,
    pensaoAlimenticia :: Double,
    gastoSaude :: Double,
    gastoEducacao :: Double,
    gastoOutros :: Double
} deriving (Show, Read, Eq)

createUser :: String -> Double -> Double -> Int -> Double -> Double -> Double -> Double -> User
createUser = User

saveUser :: User -> IO ()
saveUser user = appendFile "usuarios.txt" (show user ++ "\n")

