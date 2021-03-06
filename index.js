var Mincer, PORT, Path, app, assets, express;

Mincer = require('mincer');

Mincer.Template.libs["coffee"] = require("coffeescript");

PORT = 8080;

Path = require('path');

assets = require('connect-assets');

express = require('express');

app = express();

app.set('view engine', 'pug', {
  pretty: true
});

app.use(assets({
  paths: ['assets/javascripts'].map((e) => {
    return Path.join(__dirname, e);
  })
}));

app.get('/', (req, res) => {
  res.render('index', {});
});

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}!`);
});
