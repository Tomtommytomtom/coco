import PrintNumbers (oneDigits, multiplesOfTen, multOfTen, numberInWords, shortScale)
import Data.List (intercalate)

-- abstraktion zahlen in pakete umwandeln

type NumberPacket = (Int,Int,Int)
type Number = [NumberPacket]

packetToValue :: NumberPacket -> Int
packetToValue (a,b,c) = a * 100 + b * 10 + c

valueToPacket :: Int -> NumberPacket
valueToPacket x = (x `div` 100, x `mod` 100 `div` 10, x `mod` 10)


-- tamaras eigentlicher algorithmus

packetInWords :: NumberPacket -> String
packetInWords (0,0,0) = []
packetInWords (a,0,0) = oneDigits a ++ " hundred"
packetInWords (0,b,0) = multOfTen b
packetInWords (0,0,c) = oneDigits c
packetInWords (0,b,c) = packetInWords (0,b,0) ++ "-" ++ packetInWords (0,0,c)
packetInWords (a,b,c) = oneDigits a ++ " hundred and " ++ packetInWords (0,b,c)

-- Packet + shortscale
packetWithShortscale :: Int -> NumberPacket -> String
packetWithShortscale _ (0,0,0) = []
packetWithShortscale 0 p = packetInWords p
packetWithShortscale n packet = packetInWords packet ++ " " ++ shortScale n 

filterNotEmpty :: Eq a => [[a]] -> [[a]]
filterNotEmpty = filter (/=[])

join :: [String] -> String
join = intercalate " and "

mapNumbers :: [NumberPacket] -> [String]
mapNumbers p = map (\(p, i) -> packetWithShortscale i p ) (reverse (zip (reverse p) [0..]))

-- fold
numberInWords :: Number -> String
numberInWords = join . filterNotEmpty . mapNumbers
example :: Number
example = [(1,2,3),(4,5,6),(7,8,9)]