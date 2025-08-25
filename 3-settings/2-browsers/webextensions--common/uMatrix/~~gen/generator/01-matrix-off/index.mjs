
// from uMatrix defaults
// I removed unknown stuff (browsers I don't use)
const SCHEMES = `
matrix-off: about-scheme true
matrix-off: behind-the-scene true
matrix-off: chrome-extension-scheme true
matrix-off: chrome-scheme true
matrix-off: moz-extension-scheme true
matrix-off: wyciwyg-scheme true # https://en.wikipedia.org/wiki/WYCIWYG
#matrix-off: opera-scheme true
#matrix-off: vivaldi-scheme true
`

// work tools
// allow everything, need them to work perfectly for one's job
const ALLOWLIST__PRO_DOMAINS = `
matrix-off: 1password.com true
matrix-off: adobe.com true
matrix-off: amplitude.com true
matrix-off: app.datadoghq.com true
matrix-off: applitools.com true
matrix-off: atlassian.com true
matrix-off: atlassian.net true
matrix-off: aws.amazon.com true
matrix-off: browserstack.com true
matrix-off: buildkite.com true
matrix-off: calven.com true
matrix-off: canva.com true
matrix-off: canva.dev true
matrix-off: chatgpt.com true
matrix-off: clerk.com true
matrix-off: cloud.scorm.com true
matrix-off: cloudflare.com true
matrix-off: cultureamp.com true
matrix-off: docker.com true
matrix-off: docusign.com true
matrix-off: dropbox.com true
matrix-off: figma.com true
matrix-off: forms.gle true
matrix-off: github.com true
matrix-off: glean.com true
matrix-off: google.com true
matrix-off: looker.com true
matrix-off: mistral.ai true
matrix-off: myworkday.com true
matrix-off: navan.com true
matrix-off: okta.com true
matrix-off: openai.com true
matrix-off: sentry.io true
matrix-off: slack.com true
matrix-off: trello.com true
matrix-off: workramp.com true
matrix-off: xero.com true
matrix-off: www.npmjs.com true
matrix-off: zoom.us true
matrix-off: vercel.com true
`

const ALLOWLIST__JOB_SEARCH_DOMAINS = `
matrix-off: employmenthero.com true
matrix-off: github.careers true
matrix-off: githubtalentcommunity.careers true
matrix-off: jibeapply.com true
matrix-off: jobs.apple.com true
matrix-off: metacareers.com true
matrix-off: microsoft.com true
matrix-off: workable.com true
matrix-off: myworkdayjobs.com true
matrix-off: schedule.lever.co true
matrix-off: icims.com true
`

// good citizens we trust
const ALLOWLIST__TRUSTED = `
matrix-off: canva.site true
matrix-off: devdocs.io true
matrix-off: gouv.fr true
matrix-off: gov.au true
matrix-off: gov.us true
matrix-off: offirmo.net true
matrix-off: prezzee.com.au true ## they are good citizens
matrix-off: wikimedia.org true
matrix-off: wikipedia.org true
matrix-off: youtubekids.com true
`

const ALLOWLIST__REGULATED = `
matrix-off: nab.com.au true
matrix-off: solium.com true
`

const DEV = `
matrix-off: 127.0.0.1 true
matrix-off: localhost true
`



const TOOLS = `
matrix-off: speedtestcustom.com true
matrix-off: usevia.app true  # keyboard configurator
`


const AGGREGATED = `
${SCHEMES}
${ALLOWLIST__JOB_SEARCH_DOMAINS}
${ALLOWLIST__PRO_DOMAINS}
${ALLOWLIST__REGULATED}
${ALLOWLIST__TRUSTED}
${TOOLS}
${DEV}
`

export default AGGREGATED
