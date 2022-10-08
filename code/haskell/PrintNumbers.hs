module PrintNumbers where
-- This is a functional implementation of an algorithm
-- exercise we had in computational thinking

shortScaleLst :: [String]
shortScaleLst = [
  "",
  "thousand",
  "million",
  "billion",
  "trillion",
  "quadrillion",
  "quintillion",
  "sextillion",
  "septillion" ]
literals :: [String]
literals = [
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen" ]

multiplesOfTen = [
  "ten",
  "twenty",
  "thirty",
  "fourty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety"]


shortScale :: Int -> String
shortScale n | n < 9 = shortScaleLst !! n
shortScale _ = []

oneDigits :: Int -> String
oneDigits n | n < 10 = literals !! n
oneDigits _ = []

numberInWords :: Int -> String
numberInWords n | n < 20 = literals !! n
numberInWords n | n < 100 && n `mod` 10 == 0 = multiplesOfTen !! (n `div` 10)
numberInWords n | n < 100 = numberInWords(n `div` 10 * 10) ++ "-" ++ numberInWords(n `mod` 10)
numberInWords n | n < 1000 = oneDigits(n `div` 100) ++ " hundred" ++ numberInWords(n `mod` 100)
numberInWords n | n < 10^29 = error "not yet implemented"

multOfTen n = multiplesOfTen !! (n - 1)
-- 3 > log 10 > 6 -> thousand