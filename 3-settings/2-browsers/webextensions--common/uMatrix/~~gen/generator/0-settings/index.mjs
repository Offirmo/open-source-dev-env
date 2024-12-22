
const SETTINGS__ME = `
https-strict: * true
`

// default settings set by uMatrix not overriden by me
const SETTINGS__UMATRIX = `
https-strict: behind-the-scene false
`

const AGGREGATED = `
${SETTINGS__ME}
${SETTINGS__UMATRIX}
`

export default AGGREGATED
