
const DOMAIN_FAMILIES__BIG = `

## Mozilla
mozilla.org mozilla.net * allow
mozilla.org mozilla.net frame allow
mozilla.org interactive-examples.mdn.mozilla.net frame allow


## Google
## https://developers.google.com/maps/domains
google.com googleusercontent.com * allow
google.com gstatic.com * allow
google.com youtube.com * allow
google.com youtube.com frame allow
### youtube = we try to block ads!
## last tested 2025/01
youtube.com googlevideo.com * allow
youtube.com jnn-pa.googleapis.com xhr allow
youtube.com play.google.com xhr allow
youtube.com yt3.ggpht.com image allow  # https://www.reddit.com/r/privacy/comments/q5h62m/what_is_ggphtcom/
youtube.com ytimg.com * allow # seems need XHR as well as image


## codepen
codepen.io cdpn.io * allow
codepen.io cdpn.io frame allow
codepen.io codepenassets.com * allow
## codepen common 3p
codepen.io esm.sh * allow
codepen.io jsdelivr.net * allow
codepen.io threejs.org * allow
codepen.io skypack.dev * allow


## codesandbox
codesandbox.io csb.app * allow
codesandbox.io csb.app frame allow

stackblitz.com github.com * allow
stackblitz.com w-corp-staticblitz.com * allow
stackblitz.com webcontainer.io * allow

## facebook
facebook.com fbcdn.net * allow
instagram.com cdninstagram.com * allow
instagram.com fbcdn.net * allow
threads.net cdninstagram.com * allow
threads.net fbcdn.net * allow

## reddit
reddit.com redditmedia.com * allow
reddit.com redditmedia.com frame allow
reddit.com redditstatic.com * allow
reddit.com redd.it * allow

## Twitter
x.com twimg.com * allow
x.com twitter.com * allow


## S/O
stackexchange.com sstatic.net * allow
stackexchange.com stackoverflow.com * allow
stackoverflow.com askubuntu.com * allow
stackoverflow.com cookielaw.org * allow
stackoverflow.com mathoverflow.net * allow
stackoverflow.com serverfault.com * allow
stackoverflow.com sstatic.net * allow
stackoverflow.com stackapps.com * allow
stackoverflow.com stackexchange.com * allow
stackoverflow.com superuser.com * allow


## Amazon
amazon.com.au amazon.com * allow
amazon.com.au amazonaws.com * allow
amazon.com.au media-amazon.com * allow
amazon.com.au ssl-images-amazon.com * allow
amazon.com.au amazon.co.jp * allow


## Spotify
spotify.com scdn.co * allow
spotify.com spotifycdn.com * allow
spotify.com audio-ak-spotify-com.akamaized.net * allow


## Google Blog
googleblog.com blogger.com * allow
googleblog.com googleusercontent.com * allow


## WikiPedia
wikipedia.org wikimedia.org * allow


aliexpress.com aliapp.org * allow
aliexpress.com alibaba.com * allow
aliexpress.com alicdn.com * allow
aliexpress.com aliyun.com * allow
aliexpress.com aliyuncs.com * allow
`


const DOMAIN_FAMILIES__SMALL = `
booking.com bstatic.com * allow
deezer.com dzcdn.net * allow
domain.com.au domain-static.s3.ap-southeast-2.amazonaws.com * allow
domain.com.au domainstatic.com.au * allow
greenpeace.org.au greenpeace.org * allow
iop.org iopscience.com * allow
iop.org iopscience.org * allow
linkedin.com licdn.com * allow
netflix.com nflxext.com * allow
patreon.com patreonusercontent.com * allow
prezzee.com.au jsdelivr.net * allow
prezzee.com.au prezzeeapis.com * allow
quora.com quoracdn.net * allow
rewardgateway.com.au rewardgateway.net * allow
steampowered.com steamcommunity.com * allow
steampowered.com steamstatic.com * allow
steampowered.com steamstatic.com * allow
wowhead.com zamimg.com * allow
`


import PRIVATE from './private-do-not-merge.mjs'

const AGGREGATED = `
${DOMAIN_FAMILIES__BIG}
${DOMAIN_FAMILIES__SMALL}
${PRIVATE}
`

export default AGGREGATED



/*
g123-cpp.com g123.jp * allow
g123.jp * frame allow
g123.jp g123-cpp.com * allow
g123.jp sentry-cdn.com * allow
g123.jp sentry.io * allow
*/
