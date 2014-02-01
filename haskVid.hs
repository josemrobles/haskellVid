import System.Process
import System.Directory
import Control.Monad

formats :: [String]
formats = ["mp4","m4v","ogv","webm"]

main :: IO ()
main = do
	putStrLn "Input File: "
  	inputFile <- getLine
	let v = map (\x -> ffmpeg' inputFile x) formats 	
	mapM_ runCommand v
	return ()

split s d = takeWhile (\x -> x/= d) s
split' d = takeWhile (\x -> x/= d)

ffmpeg' s ext = "ffmpeg -i " ++ s ++ " " ++ out
		where
			out = split s '.' ++ "." ++ ext

getDirContents dir = getDirectoryContents dir 
