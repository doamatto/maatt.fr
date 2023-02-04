postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
posts <- recentFirst =<< loadAll

--- --- ---
main :: IO ()
main = hakyllWith config $ do
	-- Basic pages
	match "pages/*.md" $ do
		route $ setExtension "html"
		compile $ pandocCompiler
			>>= loadAndApplyTemplate "templates/page.html" defaultContext
			>>= loadAndApplyTemplate "templates/default.html" defaultContext
			>>= relativizeUrls

	-- Feed pages
	match "blog/_index.md" $ do
		route $ setExtension "html"
		compile $ do
			ctx <- blogCtx <$>
				sortBy (comparing itemIdentifier) <$> loadAll "posts/*"
			>>= loadAndApplyTemplate "templates/feed.html" defaultContext
			>>= loadAndApplyTemplate "templates/default.html" defaultContext
			>>= relativizeUrls
	match "z/_index.md" $ do
		route $ setExtension "html"
		compile $ do
			ctx <- blogCtx <$>
				sortBy (comparing itemIdentifier) <$> loadAll "posts/*"
			>>= loadAndApplyTemplate "templates/feed.html" defaultContext
			>>= loadAndApplyTemplate "templates/default.html" defaultContext
			>>= relativizeUrls

	-- Blog pages
	match "content/blog/*.md" $ do
		route $ setExtension "html"
		compile $ pandocCompiler
			>>= loadAndApplyTemplate "templates/post.html" postCtx
			>>= loadAndApplyTemplate "templates/default.html" postCtx
			>>= relativizeUrls

	-- Templates
	match "templates/*" $ compile templateBodyCompiler
	-- Light site templates
	match "templates/lite/*" $ compile templateBodyCompiler

--- --- ---
config :: Configuration
config = defaultConfiguration

--- --- ---
create ["atom.xml"] $ do
	route idRoute
	compile $ do
		let feedCtx = postCtx `mappend`
			constField "description" "This is a post's description"
		posts <- fmap (take 10) . recentFirst =<< loadAll "blog/*"
		renderAtom myFeedConfiguration feedCtx posts
create ["rss.xml"] $ do
	route idRoute
	compile $ do
		let feedCtx = postCtx `mappend`
			constField "description" "This is a post's description"
		posts <- fmap (take 10) . recentFirst =<< loadAll "blog/*"
		renderRss myFeedConfiguration feedCtx 
