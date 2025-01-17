
// from uMatrix defaults
// I removed unknown stuff (browsers I don't use)
const SCHEMES = `
matrix-off: about-scheme true
matrix-off: behind-the-scene true
matrix-off: chrome-extension-scheme true
matrix-off: chrome-scheme true
matrix-off: moz-extension-scheme true
matrix-off: wyciwyg-scheme true
`

// work tools
// allow everything, need them to work perfectly for my job ;)
const ALLOWLIST__PRO_DOMAINS = `
matrix-off: 1password.com true
matrix-off: amplitude.com true
matrix-off: app.datadoghq.com true
matrix-off: applitools.com true
matrix-off: atlassian.com true
matrix-off: atlassian.net true
matrix-off: buildkite.com true
matrix-off: calven.com true
matrix-off: canva.com true
matrix-off: canva.dev true
matrix-off: cloud.scorm.com true
matrix-off: cloudflare.com true
matrix-off: docker.com true
matrix-off: dropbox.com true
matrix-off: figma.com true
matrix-off: forms.gle true
matrix-off: github.com true
matrix-off: google.com true
matrix-off: microsoftonline.com true
matrix-off: myworkday.com true
matrix-off: navan.com true
matrix-off: okta.com true
matrix-off: sentry.io true
matrix-off: slack.com true
matrix-off: trello.com true
matrix-off: workramp.com true
matrix-off: xero.com true
matrix-off: zoom.us true
`


// good citizens we trust
const ALLOWLIST__TRUSTED = `
matrix-off: canva.site true
matrix-off: devdocs.io true
matrix-off: gov.au true
matrix-off: offirmo.net true
matrix-off: prezzee.com.au true
matrix-off: wikimedia.org true
matrix-off: wikipedia.org true
matrix-off: speedtestcustom.com true
`

const ALLOWLIST__REGULATED = `
matrix-off: nab.com.au true
`

const DEV = `
matrix-off: 127.0.0.1 true
matrix-off: localhost true
`



const SPECIAL = `
## keyboard configurator
matrix-off: usevia.app true
`


const AGGREGATED = `
${SCHEMES}
${ALLOWLIST__PRO_DOMAINS}
${ALLOWLIST__REGULATED}
${ALLOWLIST__TRUSTED}
${SPECIAL}
${DEV}
`

export default AGGREGATED
