const express = require('express');
const app = express();
const port = process.env.PORT || 8090;
const cors = require('cors');
const bodyParser = require('body-parser');

app.use(cors());

require('dotenv').config();
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json({ type: '*/*' }));
app.use(express.static('static'));

app.listen(port, err => {
  if (err) {
      console.error("Error escuchando: ", err);
      return;
  }
  console.log(`Escuchando en el puerto :${port}`);
});