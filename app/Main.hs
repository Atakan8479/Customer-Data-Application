module Main (main) where

import UserManagement 
import DataAnalysis 
import RiskManagement 

-- Main function

main :: IO ()
main = do

      -- User Navigation
      putStrLn "Choose an option: "
      putStrLn "1. List all the customers"
      putStrLn ">>>>>> Customer Data Analysis"
      putStrLn "2.1 Customer average age"
      putStrLn "2.2 Customer average balance"
      putStrLn "2.3 Customer average risk in float"
      putStrLn "2.4 Customer average risk in enum"
      putStrLn "2.5 List top n customer balance"
      putStrLn ">>>>>> Risk Analysis"
      putStrLn "3. List High Risk Customers"
      putStrLn "4. Exit"

      input <- getLine -- to read user’s input
      case input of   -- contains possible inputs from user according to user navigation
      
          "1" -> readTextFile "app/CustomerData.txt" 
          "2.1" -> putStrLn $ "------------ > Average age of customers: " ++ show (averageAge customers) 
          "2.2" -> putStrLn $ "------------ > Average balance of customers : " ++ show (averageBalance customers) 
          "2.3" -> putStrLn $ "------------ > Average risk of customers in float: " ++ show (averageRisk customers) 
          "2.4" -> do
            let avgRisk = averageRisk customers
            putStrLn $ "------------ > Average risk of customers in enum: " ++ show (enumRiskNote avgRisk) 
          "2.5" -> do
            putStrLn "------------ > Enter n value to list the top customers"
            n <- readLn :: IO Int 
            let topN = take n (getTopCustomer balance n customers) 
            putStrLn $ "------------ > Top “ ++ show n ++ “ customers with Max Balance: \n" ++ show topN
          "3" -> do
            putStrLn "-------------- > Enter Minimum Acceptable Balance for High Risk Note "
            thresHold <- readLn :: IO Int
            let highRiskCustomer = take thresHold (thresHoldBalance thresHold customers)
            putStrLn $ "High Risk Customers: \n" ++ show highRiskCustomer
