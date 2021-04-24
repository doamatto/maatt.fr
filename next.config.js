module.exports = {
  images: {
    domains: [
      'i.scdn.co'
    ]
  },
  module.exports = {
  future: {
    webpack5: true,
  },
}
  webpack: (config) => {
    require('./lib/sitemap.js')
    config.node = {
      fs: 'empty',
      net: 'empty',
      tls: 'empty'
    }
    return config
  },
  webpackDevMiddleware: config => { return config },
  async redirects () {
    return [
      {
        source: '/privacy/southpine-wrappers',
        destination: '/projects/southpine-wrappers#privacy-statement',
        permanent: true
      },
      {
        source: '/updates%20projects/:date*/aas',
        destination: '/projects/always-amazon-smiling',
        permanent: true
      },
      {
        source: '/updates%20projects/:date*/southnode',
        destination: '/projects/southpine-wrappers',
        permanent: true
      },
      {
        source: '/updates%20projects/:date*/southpy',
        destination: '/projects/southpine-wrappers',
        permanent: true
      },
      {
        source: '/updates%20projects/:date*/5mloading',
        destination: '/projects/5mloading',
        permanent: true
      },
      {
        source: '/nano',
        destination: 'https://git.doamatto.xyz/nano',
        permanent: true
      },
      {
        source: '/updates/mello/:slug*',
        destination: '/projects/mello',
        permanent: true
      },
      {
        source: '/updates/swift/:slug*',
        destination: '/projects/swift',
        permanent: true
      },
      {
        source: '/updates/hex/:slug*',
        destination: '/projects/mono',
        permanent: true
      },
      {
        source: '/updates/nano/:slug*',
        destination: '/projects/nano',
        permanent: true
      },

      {
        source: '/updates%20projects/:date*/ppg',
        destination: 'https://github.com/doamatto/phone-passcode-gen',
        permanent: true
      },

      {
        source: '/stack',
        destination: '/uses',
        permanent: true
      },
      {
        source: '/favorites',
        destination: '/favourites',
        permanent: true
      },

      {
        source: '/cinematography',
        destination: '/cinema',
        permanent: true
      },
      {
        source: '/cine',
        destination: '/cinema',
        permanent: true
      },
      {
        source: '/videos',
        destination: '/cinema',
        permanent: true
      }
    ]
  }
}
