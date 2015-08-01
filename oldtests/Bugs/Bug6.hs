
module Bugs.Bug6 (main) where

import Test.HUnit hiding (Test)
import Test.Framework
import Test.Framework.Providers.HUnit

import Text.MegaParsec
import Text.MegaParsec.String

import Util

main :: Test
main =
  testCase "Look-ahead preserving error location (#6)" $
  parseErrors variable "return" @?= ["'return' is a reserved keyword"]

variable :: Parser String
variable = do
      x <- lookAhead (some letter)
      if x == "return"
       then fail "'return' is a reserved keyword"
       else string x