
const BASE = `

## by default, we block!
* * * block

## except low risk assets, from any domain
* * css allow
* * image allow

## BUT strictly block iframes, the staple of tracking
* * frame block

## Allow 1st party
* 1st-party * allow
## even relax self-iframes for 1p
* 1st-party frame allow
`


const COMMONLY_EMBEDDED_THIRD_PARTIES = `

## Google ReCaptcha
* www.google.com * allow
* www.google.com script allow
* www.google.com frame allow
* www.gstatic.com * allow
* www.gstatic.com script allow


## Algolia search
* algolia.net * allow
* algolianet.com * allow


## ?
* ajax.googleapis.com * allow
* cloudflare.com * allow


## other
* captcha-delivery.com * allow
* gravatar.com * allow


## websites builders
## strictly speaking they can't be trusted, but many sites are based on those
## (compromise)
* parastorage.com * allow
* squarespace-cdn.com * allow
* squarespace.com * allow
* wix.com * allow
* wixapps.net * allow
* wixstatic.com * allow
* website-files.com * allow


## zen desk
* zdassets.com * allow

`


const AGGREGATED = `
${BASE}
${COMMONLY_EMBEDDED_THIRD_PARTIES}
`

export default AGGREGATED
