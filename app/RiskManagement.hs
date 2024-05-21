module RiskManagement where

import UserManagement


-- this function gives us the customers whose balance less than n value, which user enters, and whose riskNote "High"

thresHoldBalance :: Int -> [Customer] -> [Customer] 
thresHoldBalance thresHold = filter (\customer -> riskNote customer == "High" && balance customer < fromIntegral thresHold)
