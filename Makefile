all:
	ghc -O2 -o mandelbrot mandelbrot.hs -fwarn-missing-signatures
