module DataAnalysis where
import UserManagement
import Data.List (sortBy) -- to sort the list
import Data.Ord (comparing) -- creates a comparation function for sorting list


-- calculates the average age of customers
averageAge :: [Customer] -> Double
averageAge customers = fromIntegral (sum ages) / fromIntegral (length customers) 
  where
    ages = map age customers -- takes the each each age values to be calculate


-- calculates the average balance of customers
averageBalance :: [Customer] -> Double
averageBalance customers = sum balances / fromIntegral (length customers) 
  where
    balances = map balance customers -- takes the each each balance value to be calculate
    


-- this function gives a value in float to all possible riskNote values
valueRiskInFloat :: String -> Float 
valueRiskInFloat risk
    | risk == "High"    = 3.0
    | risk == "Medium"  = 2.0
    | risk == "Low"     = 1.0


-- this function calculate the average risk value according to their riskNote which I calculate in valueRiskInFloat fucntion
averageRisk :: [Customer] -> Float  
averageRisk customers = sum risks / fromIntegral (length customers)
  where
    risks = map (valueRiskInFloat . riskNote) customers
    
    

-- this function decides average risk value is "low", "medium", or "high" according to averageRisk function
enumRiskNote :: Float -> String 
enumRiskNote avgRisk
    | avgRisk <= 1.0    = "Low" 
    | avgRisk <= 2.0    = "Medium"
    | otherwise         = "High"
    
    
-- this function gives top n customers according to their balance value
getTopCustomer :: (Customer -> Double) -> Int -> [Customer] -> [Customer] 
getTopCustomer balance n = take n . sortBy (flip $ comparing balance)
