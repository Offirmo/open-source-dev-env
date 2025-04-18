
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
## even relax self-iframes
* 1st-party frame allow
`


const COMMONLY_EMBEDDED_THIRD_PARTIES = `

# SECURITY

## Amazon firewall https://aws.amazon.com/waf/
* awswaf.com * allow

## Google ReCaptcha
* www.google.com * allow
* www.google.com script allow # force unlock
* www.google.com frame allow # force unlock
* www.gstatic.com * allow
* www.gstatic.com script allow

## other
* csp.withgoogle.com * allow
* auth0.com * allow
* captcha-delivery.com * allow
* identitytoolkit.googleapis.com * allow
* securetoken.googleapis.com * allow
* challenges.cloudflare.com * allow

# UTILS

## Algolia search
* algolia.net * allow
* algolianet.com * allow


* easyzoom.com * allow
* easyzoom.com frame allow


## ?
* ajax.googleapis.com * allow

* cloudflare.com * allow


## other
* gravatar.com * allow
* jquery.com script allow

## websites builders
## strictly speaking they can't be trusted, but many sites are based on those
## (compromise)
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

## assets
* fonts.googleapis.com css allow
* imgur.com image allow


# EMBEDS

* cdn.embedly.com * allow
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
