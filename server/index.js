//----------------------    IMPORTS     ---------------------- //

const express = require("express");
const cors = require("cors");
const pool = require("./db");
const bcrypt = require("bcrypt");
const session = require("express-session");
const passport = require("passport");
// const passportLocal = require("passport-local").Strategy;

//----------------------   MIDDLEWARE    ---------------------- //

// Middleware
const app = express();

app.use(cors());
app.use(express.json());
app.use(
  session({
    secret: "secretiot",
    resave: false,
    saveUninitialized: false,
  })
);

const port = process.env.SERVER_PORT || 5000;

app.use(passport.initialize());
app.use(passport.session());
require("./passportConfig")(passport);


//---------------------- ROUTES ---------------------- //

//----------------- AUTH -------------------- //

// Routes
app.get("/", async (req, res) => {
  try {
    console.log("get");
  } catch (err) {
    console.error(err.message);
  }
});

// Get Username
app.get("/user", async (req, res) => {
  
  const userId = req.query.id;
  
  pool.query("SELECT name FROM users WHERE id=$1", [userId], (err, results) => {
    if (err) {
      console.log(err);
    }
    else {res.send(results.rows);}
  });
});

// Sign in
app.post("/login", async (req, res, next) => {
  passport.authenticate("local", (err, user, info) => {
    if (err) console.log(err);
    if (!user) res.send(info);
    else {
      req.logIn(user, (err) => {
        if (err) console.log(err);
        res.send({ id: user.id });
      });
    }
  })(req, res, next);
});

// Sign-up
app.post("/sign", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    let hashedPassword = await bcrypt.hash(password, 10);

    pool.query(
      "SELECT * FROM users WHERE email=$1",
      [email],
      (err, results) => {
        if (err) {
          console.log(err);
        }
        if (results.rows.length > 0) {
          res.send("Email already registered");
        } else {
          pool.query(
            "INSERT INTO users (name,email, password) VALUES($1,$2,$3)",
            [name, email, hashedPassword],
            (err, results) => {
              if (err) {
                console.log(err);
              } else {
                res.send("Success");
              }
            }
          );
        }
      }
    );
  } catch (err) {
    console.error(err.message);
  }
});

//---------------------- START SERVER ---------------------- //

app.listen(port, () => {
  console.log("Server listening on port 5000");
});
