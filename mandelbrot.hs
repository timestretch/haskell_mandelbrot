{- Mandelbrot Example -- Erik Wrenholt, 2014-09-25 -}

import Data.List

mandelbrot :: Double -> Double -> Int
mandelbrot cr ci = 
	let cr_alt = cr - 0.5 in
	let iter i zr zi = 
		let temp = zr * zi in
		let zr2 = zr * zr in
		let zi2 = zi * zi in
		if zi2 + zr2 > 16.0 || i >= 1000 
			then i
			else iter (i+1) (zr2 - zi2 + cr_alt) (temp + temp + ci) in
	iter 0 0.0 0.0 


calc :: Int -> Int -> Int
calc x y = 
	let scale n = (fromIntegral n)/40.0 in
	mandelbrot (scale x) (scale y)


pixel_val :: Int -> Int -> String
pixel_val x y = 
	if calc x y == 1000 
		then "*" 
		else " "

range :: [Int]
range = [-39..39]

get_row :: Int -> String
get_row x = concat $ map (pixel_val x) range

all_rows :: String
all_rows = intercalate "\n" $ map get_row range

main :: IO ()
main = putStrLn $ all_rows
