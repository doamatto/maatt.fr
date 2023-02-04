module Main (main) where

import qualified System.Exit 	(ExitCode)
import qualified System.Process as Process
import Hakyll
--- --- ---

main :: IO ()
main = hakyllWith config $ do
	-- Template rendering
	match "templates/*" $ compile $ templateCompiler
	match "templates/lite/*" $ compile $ templateCompiler

	-- Index
	match "pages/index.html" $ do
		route "index.html"
		compile $ do
			posts <- fmap (take 5) . recentFirst =<< loadAll "posts/*"
			let indexCtx =
				listField "posts" (postCtx) (return posts) <>
				defaultContext
			getResourceBody
				>>= applyAsTempalte indexCtx
				>>= loadAndApplyTemplate "templates/default.html"
				>>= relativizeUrls
	--- 404 page
	match "pages/404.html" $ do
		route idRoute
		compile $ pandocCompiler
			>>= loadAndApplyTemplate "templates/default.html"

	--- Render RSS, Atom, and JSON feeds
	create ["rss.xml"] $ do
		route idRoute
		compile $ do
			loadAllSnapshots "posts/*" "content"
			>>= fmap (take 10) . recentFirst
			>>= renderRss (feedConfiguration) feedCtx

--- --- ---
postCtx :: Context String
postCtx = mconcat [
	updatedField "updated" "%U",
    dateField "date" "%B %e, %Y",
    Context $ \key -> case key of
        "title" -> unContext (mapContext escapeHtml defaultContext) key
        _       -> unContext mempty key
    , defaultContext
]

feedCtx :: Context String
feedCtx = mconcat [
	Context $ \key -> case key of
        "title" -> unContext (mapContext escapeHtml defaultContext) key
        _       -> unContext mempty key
    , defaultContext
]

--- --- ---
config :: Configuration
config = defaultConfiguration { deploySite = deploy } where
	deploy :: Configuration -> IO ExitCode
	deploy _c = do
		branch <- Process.readProcess "git" ["rev-parse", "--abbrev-ref", "HEAD"] ""
	case words branch of
		["main"] -> Process.rawSystem "rsync" ["--checksum", "-ave", "ssh -p 22", "_site/", "maatt.fr:/srv/sites/maatt.fr/live" ]
		["next"] -> Process.rawSystem "rsync" ["--checksum", "-ave", "ssh -p 22", "_site/", "maatt.fr:/srv/sites/maatt.fr/staging" ]
		_        -> fail $ "Branch not deployable."

feedConfiguration :: String -> FeedConfiguration
feedConfiguration title = FeedConfiguration {
	feedTitle = "Matt Ronchetto — doamatto",
	feedDescription = "I'm a high school student living in San Diego. I like to mess around with software development and graphic design.",
	feedAuthorName = "Matt Ronchetto",
	feedAuthorEmail = "heyy@maatt.fr",
	feedRoot = "https://maatt.fr"
}
