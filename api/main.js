const express = require("express");
var bodyParser = require("body-parser");
var cors = require("cors");
const Client = require("@replit/database");
const app = express();
const port = 3000;

const client = new Client();

app.use(cors());
app.use(bodyParser.json());
app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.post("/signin", (req, res) => {
  console.log(req.body);
  if (req.body.email == "admin@gmail.com" && req.body.password == "passcode") {
    res.json({ login: true, admin: true });
  } else {
    res.json({ login: true, admin: false });
  }
});

app.post("/addContract", async (req, res) => {
  if (req.body.transaction != undefined) {
    await client.set(`org_${req.body.id}`, [req.body.transaction]);
    res.json({ login: true });
  } else res.json({ result: false });
});
app.post("/getContract", async (req, res) => {
  if (req.body.id != undefined) {
    const contract = await client.get(`org_${req.body.id}`);
    res.json({ contractTxn: contract });
  } else res.json({ result: false });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
