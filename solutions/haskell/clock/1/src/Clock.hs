module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int deriving (Eq, Show)

addMods :: Int -> Int -> Int -> Int -> Int
addMods modX divY x y = (x + y `div` divY) `mod` modX

addHours :: Int -> Int -> Int
addHours = addMods 24 60

addMinutes :: Int -> Int
addMinutes = (flip (addMods 60 1)) 0

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = Clock (addHours hour minute) (addMinutes minute)

toString :: Clock -> String
toString (Clock h m) = paddedH ++ ":" ++ paddedM
    where paddedH = (reverse.(take 2).reverse) ("00" ++ show h)
          paddedM = (reverse.(take 2).reverse) ("00" ++ show m)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Clock h m) = fromHourMin (addHours rawHours rawMinutes) (addMinutes rawMinutes)
    where rawHours   = hour + h
          rawMinutes = minute + m
