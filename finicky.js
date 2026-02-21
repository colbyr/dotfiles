/**
 * Finicky Config
 * https://github.com/johnste/finicky
 *
 * Docs: https://github.com/johnste/finicky/wiki/Configuration
 */
module.exports = {
  defaultBrowser: "Dia",
  options: {
    hideIcon: true
  },
  handlers: [
    {
      match: [
        finicky.matchHostnames(['localhost']),
        "meet.google.com*",
        "riverside.fm*",
      ],
      browser: "Google Chrome",
    },
    {
      match: "open.spotify.com/*",
      browser: "Spotify"
    },
    // {
    //   match: [
    //     "zoom.us/*",
    //     finicky.matchDomains(/.*\zoom.us/),
    //     /zoom.us\/j\//,
    //   ],
    //   browser: "us.zoom.xos"
    // }
  ]
};
