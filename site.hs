{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mappend)
import Hakyll

----- JFlex hakyll site script -----

main :: IO ()
main = hakyll $ do
    match ("js/*" .||. "img/*" .||. "fonts/*" .||. "release/*") $ do
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
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "pages/*.html" $ do
        route   $ gsubRoute "pages/" (const "")
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


