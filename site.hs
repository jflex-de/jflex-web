{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mappend)
import Hakyll

----- JFlex hakyll site script -----

main :: IO ()
main = hakyll $ do
    match ("js/*" .||. "img/*" .||. "fonts/*") $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "pages/*.md" $ do
        route   $ setExtension "html" `composeRoutes` gsubRoute "pages/" (const "")
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
