


const KNOWN = `

## codepen
codepen.io cdpn.io * allow
codepen.io cdpn.io frame allow
codepen.io codepenassets.com * allow
## codepen common 3p
codepen.io esm.sh * allow
codepen.io jsdelivr.net * allow
codepen.io threejs.org * allow




## facebook family
facebook.com fbcdn.net * allow
instagram.com cdninstagram.com * allow
instagram.com fbcdn.net * allow



patreon.com patreonusercontent.com * allow


reddit.com redditmedia.com * allow
reddit.com redditmedia.com frame allow
reddit.com redditstatic.com * allow


stackexchange.com cloudflare.com * allow
stackexchange.com sstatic.net * allow
stackoverflow.com ajax.googleapis.com * allow
stackoverflow.com sstatic.net * allow


amazon.com.au amazon.com * allow
amazon.com.au amazonaws.com * allow
amazon.com.au media-amazon.com * allow
amazon.com.au ssl-images-amazon.com * allow


deezer.com dzcdn.net * allow

domain.com.au domain-static.s3.ap-southeast-2.amazonaws.com * allow
domain.com.au domainstatic.com.au * allow


greenpeace.org.au greenpeace.org * allow


netflix.com nflxext.com * allow


spotify.com scdn.co * allow
spotify.com spotifycdn.com * allow
spotify.com audio-ak-spotify-com.akamaized.net * allow

`



const AGGREGATED = `
${KNOWN}
`

export default AGGREGATED



/*
g123-cpp.com g123.jp * allow
g123.jp * frame allow
g123.jp g123-cpp.com * allow
g123.jp sentry-cdn.com * allow
g123.jp sentry.io * allow
*/
