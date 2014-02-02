import System.Process
import System.Directory
import Control.Monad

formats :: [String]
formats = ["mp4","m4v","ogv","webm"]

-- get files in current Dir
c <- getCurrentDirectory
f <- getDirectoryContents c

-- Iterate through MOV files in current dir

main :: IO ()
main = do
	putStrLn "Input File: "
  	inputFile <- getLine
	let v = map (\x -> ffmpeg' inputFile x) formats 	
	mapM_ runCommand v
	return ()

split s d = takeWhile (\x -> x/= d) s

ffmpeg' s ext = "ffmpeg -i " ++ s ++ " " ++ out
		where
			out = split s '.' ++ "." ++ ext
