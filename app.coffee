_     = require 'lodash'
Path  = require 'path'

PORT = 8080

Mincer = require('mincer')
Mincer.Template.libs["coffee"] = require("coffeescript")

assets = require 'connect-assets'
express = require 'express'
app = express()

app.use('/aboss-api2', express.static('/aboss-api2'))
app.use('/aboss-assets', express.static('/public/aboss-ui'))

app.set 'view engine', 'pug', { pretty: true }
app.locals.pretty = true;
console.log __dirname
app.use assets 
  servePath: '/aboss-assets'
  compress: false
  # build: true
  paths: [
    'assets/javascripts'
  ].map (e)-> Path.join __dirname, e

app.get '/', (req, res) ->
  res.render 'index', { title: 'My chat app', user: '' }

# http://localhost:8801/aboss-ui/cacc/CACC001/index.html?rand=9197757&params=eyJBQk9TU19TVEFURSI6eyJzeXNkYXRlIjoiMjAxOC0wOC0yMCIsInVzZXJuYW1lIjoiYWRtaW4iLCJkZWZhdWx0X2RlcG9zaXRvcnlfbWFwcGluZ190eXBlIjoiQSIsInN1cHBvcnRlZF9mcm9udHMiOlsiZnJlZXdpbGwiLCJzZXR0cmFkZSIsImZsZXh0cmFkZSJdLCJjb21wYW55Ijp7InBhcnRpY2lwYW50X2lkIjoiMDIyIn19fQ==
app.get '/aboss-ui/*/index.html', (req, res)->
  url = req._parsedUrl
  paramsDecoded = {}
  if _.isString req.query.params
    paramsDecoded = JSON.parse(atob(req.query.params));

  ABOSS_STATE = {}
  ABOSS_STATE = _.get paramsDecoded, 'ABOSS_STATE', {}
  ABOSS_STATE = if _.isObject ABOSS_STATE 
                  JSON.stringify ABOSS_STATE
                else
                  "{}"

  appName = Path.basename(Path.dirname url.pathname)
  indexFile = appName.toLowerCase()
  main      = appName.toUpperCase() + "Main"
  res.render indexFile, _.extend {}, { main, ABOSS_STATE } 
  
app.listen(PORT, () => console.log("Example app listening on port #{PORT}!"))
