module MenuImposto (menuImpostoMensal, menuImpostoAnual) where


menuImpostoMensal :: IO ()
menuImpostoMensal = do
  -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
    putStrLn "---------------------------------"
    putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda mensal,ou digite - para sair"
  -- -- imprimeUsuario 0 max_length
  --   putStrLn "---------------------------------"
  --   opcao <- getLine
  --   case opcao of
  --       "-" -> menu
  --       _ -> do
  --     -- impostoNaFonte opcao max_length
      
  --       putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
  --       escolha <- getLine
  --       case escolha of
  --           "s" -> menuImpostoMensal
  --           "n" -> menu
  --           _ -> do
            
  --           putStrLn "Opcao invalida, retornando ao menu"
  --           menu
      
  


menuImpostoAnual :: IO ()
menuImpostoAnual = do
  -- max_length <- getUsuariosLength -- pegas quantidade de usuarios, funcionalidade de dados
  putStrLn "---------------------------------"
  putStrLn "Selecione o ID do usuario que deseja calcular o imposto de renda anual,ou digite 0 para sair"
  -- -- imprimeUsuario 0 max_length
  -- putStrLn "---------------------------------"
  -- opcao <- getLine
  
  -- case opcao of
  --   "0" -> menu
  --   _ -> do
  --     -- impostoTotal opcao max_length
  --     putStrLn "Gostaria de calcular o imposto de renda de outro usuario? (s/n)"
  --     escolha <- getLine
  --     case escolha of
  --       "s" -> menuImpostoAnual
  --       "n" -> menu
  --       _ -> do
  --         putStrLn "Opcao invalida, retornando ao menu"
  --         menu
