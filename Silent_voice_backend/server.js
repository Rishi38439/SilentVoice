require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const app = express();
app.use(cors({ origin: "*" }));
app.use(bodyParser.json());

const JWT_SECRET = process.env.JWT_SECRET || "your_secret_key";

// Hardcoded Users (Instead of MongoDB)
const users = [
  {
    username: "admin",
    password: bcrypt.hashSync("admin", 10), // Hashed password
  },
  {
    username: "user123",
    password: bcrypt.hashSync("password123", 10),
  },
];

// API Route: User Login
app.post("/api/login", async (req, res) => {
  const { username, password } = req.body;

  const user = users.find((u) => u.username === username);
  if (!user) {
    return res.status(401).json({ message: "User not found" });
  }

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    return res.status(401).json({ message: "Invalid credentials" });
  }

  // Generate JWT Token
  const token = jwt.sign({ username: user.username }, JWT_SECRET, {
    expiresIn: "1h",
  });

  res.json({ message: "Login successful", token });
}
);
app.post("/api/signup", async (req, res) => {
  const { username, email, mobile, password } = req.body;

  // Check if user already exists
  const existingUser = users.find((u) => u.username === username);
  if (existingUser) {
    return res.status(400).json({ message: "Username already taken" });
  }

  // Hash the password
  const hashedPassword = await bcrypt.hash(password, 10);

  // Store new user
  const newUser = { username, email, mobile, password: hashedPassword };
  users.push(newUser);

  // Generate JWT Token
  const token = jwt.sign({ username }, JWT_SECRET, { expiresIn: "1h" });

  res.json({ message: "Signup successful", token });
});



// Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT,"0.0.0.0",() => console.log(`Server running on port ${PORT}`));
