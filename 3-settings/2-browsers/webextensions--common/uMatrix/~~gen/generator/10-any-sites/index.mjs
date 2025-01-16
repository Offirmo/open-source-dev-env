
const BASE = `

## by default, we block!
* * * block

## except low risk assets, from any domain
* * css allow
* * image allow

## BUT strictly block iframes, the staple of tracking!
* * frame block

## Allow 1st party
* 1st-party * allow
## even relax self-iframes for 1p
* 1st-party frame allow
`


const COMMONLY_EMBEDDED_THIRD_PARTIES = `

# SECURITY

## Amazon firewall https://aws.amazon.com/waf/
* awswaf.com * allow

## Google ReCaptcha
* www.google.com * allow
* www.google.com script allow
* www.google.com frame allow
* www.gstatic.com * allow
* www.gstatic.com script allow

## other
* auth0.com * allow
* captcha-delivery.com * allow
* identitytoolkit.googleapis.com * allow
* securetoken.googleapis.com * allow

# UTILS

## Algolia search
* algolia.net * allow
* algolianet.com * allow


* easyzoom.com * allow
* www.easyzoom.com frame allow


## ?
* ajax.googleapis.com * allow

* cloudflare.com * allow


## other
* gravatar.com * allow
* jquery.com script allow

## websites builders
## strictly speaking they can't be trusted, but many sites are based on those
## (compromise)
* fonts.googleapis.com css allow
* parastorage.com * allow
* shopify.com * allow
* shopifycloud.com * allow
* shopifysvc.com * allow
* squarespace-cdn.com * allow
* squarespace.com * allow
* website-files.com * allow
* wix.com * allow
* wixapps.net * allow
* wixstatic.com * allow

# EMBEDS

* cdn.embedly.com * allow
* imgur.com image allow
#* maps.googleapis.com * allow

## zen desk
* zdassets.com * allow



# MISC
* cloudflareinsights.com * allow

`


const AGGREGATED = `
${BASE}
${COMMONLY_EMBEDDED_THIRD_PARTIES}
`

export default AGGREGATED