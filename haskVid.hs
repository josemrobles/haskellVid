-- import the required libs/modules
import System.Process
import System.Directory
import Control.Monad

-- List of formats we will be creating
formats :: [String]
formats = ["mp4","m4v","ogv","webm"]

-- get files in current Dir
c <- getCurrentDirectory
f <- getDirectoryContents c

-- Iterate through MOV files in current dir. If file is not MOV skip it


main :: IO ()
main = do
	putStrLn "Input File: "
  	inputFile <- getLine
	let v = map (\x -> ffmpeg' inputFile x) formats 	
	mapM_ runCommand v
	return ()

-- Takes the filename with extension and returns just the filename
split s d = takeWhile (\x -> x/= d) s

-- Takes a file and creates the derivative in she specified format (ext) 
ffmpeg' s ext = "ffmpeg -i " ++ s ++ " " ++ out
		where
			out = split s '.' ++ "." ++ ext
