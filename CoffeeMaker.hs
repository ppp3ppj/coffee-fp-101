-- Define the Main module
module Main where

import Control.Monad (void)

-- Define the CoffeeMaker functions
boilWater :: IO (Either String String)
boilWater = do
  putStrLn "Boiling water..."
  return (Right "Water is boiled")

grindBeans :: IO (Either String String)
grindBeans = do
  putStrLn "Grinding beans..."
  return (Right "Beans are ground")

makeCoffee :: (Either String String, Either String String) -> IO (Either String String)
makeCoffee (Right "Water is boiled", Right "Beans are ground") = do
  putStrLn "Making coffee..."
  return (Right "Coffee is ready!")
makeCoffee _ = return (Left "Can't make coffee until water is boiled and beans are ground.")

-- Functional pipeline
main :: IO ()
main = do
  waterStatus <- boilWater
  beansStatus <- grindBeans
  coffeeStatus <- makeCoffee (waterStatus, beansStatus)
  case coffeeStatus of
    Right message -> putStrLn message
    Left message -> putStrLn message
