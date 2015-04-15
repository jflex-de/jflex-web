{-# LANGUAGE OverloadedStrings #-}

import Hakyll
import Text.Regex.TDFA ((=~))

----- JFlex hakyll site script -----

main :: IO ()
main = hakyll $ do
    match ("css/*.min.css" .||. "js/*" .||. "img/*" .||. "fonts/*" .||. "release/*") $ do
        route   idRoute
        compile copyFileCompiler

    match ("files/*") $ do
        route   $ gsubRoute "files/" (const "")
        compile copyFileCompiler

    match ("docs/*") $ do
        route   $ gsubRoute "docs/" (const "")
        compile copyFileCompiler
        
    match "css/*.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "pages/*.md" $ do
        route   $ setExtension "html" `composeRoutes` 
                  gsubRoute "pages/" (const "")
        compile $ do
          body <- getResourceBody
          filtered <- return $ fmap issueFilter body
          return (renderPandoc filtered)
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- raw html include, does not apply issue filter
    match "pages/*.html" $ do
        route   $ gsubRoute "pages/" (const "")
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


-----------------------

issueFilter :: String -> String
issueFilter markdown = substAll "#[0-9]{1,4}[^0-9]" subst markdown
  where
    subst match =      
      let lst = [last match]
          num = tail (init match)
          url = "https://github.com/jflex-de/jflex/issues/"
      in "[#" ++ num ++ "](" ++ url ++ num ++ ")" ++ lst


substAll :: String -> (String -> String) -> String -> String
substAll expr subst input =
  let
    (before, match, after) = input =~ expr
  in
    if not (null match)
    then before ++ subst match ++ substAll expr subst after
    else input
