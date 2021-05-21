import vercel from '@sveltejs/adapter-vercel'

const config = {
	preprocess: [ windi({})	],
	kit: { adapter: vercel() }
};

export default config;
