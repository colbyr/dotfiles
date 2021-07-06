/**
 * Finicky Config
 * https://github.com/johnste/finicky
 *
 * Docs: https://github.com/johnste/finicky/wiki/Configuration
 */
module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: [
        finicky.matchHostnames(['localhost']),
        "meet.google.com*"
      ],
      browser: "Google Chrome"
    }
  ]
};
