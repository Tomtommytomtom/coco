import PrintNumbers (oneDigits, multiplesOfTen, multOfTen, numberInWords, shortScale, literals)
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
packetInWords (0,b,c) | b * 10 + c < 20 = literals !! (b * 10 + c)
packetInWords (0,b,c) = packetInWords (0,b,0) ++ "-" ++ packetInWords (0,0,c)
packetInWords (a,b,c) = oneDigits a ++ " hundred and " ++ packetInWords (0,b,c)



-- Packet + shortscale
packetWithShortscale :: Int -> NumberPacket -> String
packetWithShortscale _ (0,0,0) = []
packetWithShortscale 0 p = packetInWords p
packetWithShortscale n packet = packetInWords packet ++ " " ++ shortScale n

filterNotEmpty :: Eq a => [[a]] -> [[a]]
filterNotEmpty = filter (/=[])

-- helpers

join :: [String] -> String
join = intercalate " and "

shortscaleAndNumberPacket :: Number -> [(NumberPacket,Int)]
shortscaleAndNumberPacket p = reverse (zip (reverse p) [0..])

mapNumbers :: Number -> [String]
mapNumbers ns = map (\(p, i) -> packetWithShortscale i p) (shortscaleAndNumberPacket ns)

-- first map the numbers to their string
-- then filter the empty ones, (0,0,0)
-- then join everything with and
numberInWords :: Number -> String
numberInWords = join . filterNotEmpty . mapNumbers

-- one hundred and twenty-three million and four hundred and fifty-six thousand and seven hundred and eighty-nine
example :: Number
example = [(1,2,3),(4,5,6),(7,8,9)]

allThreeDigits :: Number
allThreeDigits = [(a,b,c) | a <- [0..9], b <- [0..9], c <- [0..9] ]