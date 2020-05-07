module Web.Framework.Plzwrk.TH.HSX
  ( HSXAttribute(..)
  , HSX(..)
  , parseHSX
  )
where

import           Control.Applicative            ( (<*)
                                                , (*>)
                                                , (<$>)
                                                , (<$)
                                                )
import           Control.Monad                  ( void )
import           Control.Monad.Fail
import           Data.Char
import           Data.List                      ( foldl' )
import           Text.Parsec
import           Text.Parsec.String

data HSXAttribute = HSXStringAttribute String
                 | HSXHaskellCodeAttribute String
                 | HSXHaskellTxtAttribute String deriving (Show, Eq)

data HSX =  HSXElement String [(String, HSXAttribute)] [HSX]
          | HSXSelfClosingTag String [(String, HSXAttribute)]
          | HSXHaskellCode String
          | HSXHaskellText String
          | HSXBody String
        deriving (Show, Eq)

hsx :: Parser HSX
hsx = tag

tag = do
  char '<'
  ws
  name <- many (letter <|> digit)
  ws
  attr <- many attribute
  ws
  close <- try (string "/>" <|> string ">")
  if (length close) == 2
  then return (HSXSelfClosingTag name attr)
  else do
        elementHSXBody <- manyTill elementHSXBody (endTag name)
        ws
        return (HSXElement name attr elementHSXBody)

elementHSXBody = ws *> (try tag <|> try haskellCodeNode <|> try haskellTxtNode <|> text)

endTag :: String -> Parser String
endTag str = string "</" *> string str <* char '>'

text = HSXBody <$> many1 (noneOf "><")

stringAttribute = do
  char '"'
  value <- many (noneOf ['"'])
  char '"'
  return $ HSXStringAttribute value

haskellTxtAttr = do
  string "#t{"
  value <- manyTill anyChar (string "}#")
  ws
  return $ HSXHaskellTxtAttribute value

makeBracketed cmd contain = do
  let start = ("#" <> cmd <> "{")
  let end = "}#"
  string start
  value <- manyTill anyChar (string end)
  ws
  return $ if (contain) then start <> value <> end else value

haskellCodeAttr = do
  value <- makeBracketed "c" False
  return $ HSXHaskellCodeAttribute value

haskellCodeNode :: Parser HSX
haskellCodeNode = do
  value <- makeBracketed "e" False
  return $ HSXHaskellCode value

haskellTxtNode :: Parser HSX
haskellTxtNode = do
  value <- makeBracketed "t" False
  return $ HSXHaskellText value

attribute = do
  name <- many (noneOf "= />")  
  ws
  char '='
  ws
  value <- stringAttribute <|> (try haskellCodeAttr) <|> haskellTxtAttr
  ws
  return (name, value)

ws :: Parser ()
ws = void $ many $ oneOf " \t\r\n"

parseHSX :: MonadFail m => (String, Int, Int) -> String -> m HSX
parseHSX (file, line, col) s =
    case runParser p () "" s of
      Left err  -> fail $ show err
      Right e   -> return e
  where
    p = do updatePosition file line col
           ws
           e <- hsx
           ws
           eof
           return e

updatePosition file line col = do
   pos <- getPosition
   setPosition $
     (flip setSourceName) file $
     (flip setSourceLine) line $
     (flip setSourceColumn) col $
     pos
