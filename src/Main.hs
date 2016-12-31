module Main where

import Data.Time

data User = User { name :: String, signupDate :: LocalTime } deriving Show

signups = [ User "Joe" (LocalTime (fromGregorian 2016 11 24) (TimeOfDay 0 0 0))
          , User "Jill" (LocalTime (fromGregorian 2016 12 24) (TimeOfDay 0 0 0))
          , User "Jill" (LocalTime (fromGregorian 2016 12 24) (TimeOfDay 12 01 0))
          ]

-- User signups in the past month
userSignupPastMonth = do
  tz <- getCurrentTimeZone
  today <- utcToLocalTime tz <$> getCurrentTime
  pure $ filter (\u -> localDay (signupDate u) >= addDays (-30) (localDay (today))) signups

-- λ> userSignupPastMonth >>= mapM_ print
-- User {name = "Jill", signupDate = 2016-12-24 00:00:00}
-- User {name = "Jill", signupDate = 2016-12-24 12:01:00}


main :: IO ()
main = do
  putStrLn "hello world"
