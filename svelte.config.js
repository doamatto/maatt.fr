import vercel from '@sveltejs/adapter-vercel'

const config = {
	preprocess: [ windi({})	],
	kit: {
		adapter: vercel(),
		amp: true,
		files: {
			template: 'src/app.html'
		},
		floc: false,
		hydrate: true,
		prerender: {
			crawl: true,
			enabled: true,
			force: false,
			pages: ['*']
		},
		router: true,
		ssr: true,
	}
};

export default config;
