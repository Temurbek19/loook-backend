const express = require("express");
const app = express();
const cors = require("cors");
const jwt = require("jsonwebtoken");
const fileUpload = require("express-fileupload");
const pool = require("./src/db");
const PORT = 4500;
const host = "localhost";
const path = require("path");

app.use(cors());
app.use(express.json());
app.use(fileUpload());
app.use(
  express.static(path.join(process.cwd(), "src", "images", "Foods_Images"))
);
app.use(
  express.static(path.join(process.cwd(), "src", "images", "Users_Images"))
);

app.get("/users", async (req, res) => {
  const response = await pool.query(
    "select * from users where user_type = 2 ORDER BY user_id ASC"
  );
  res.json(response.rows);
});

app.get("/user:id", async (req, res) => {
  const id = req.params.id;
  const response = await pool.query(
    "select user_name from users where user_id = $1",
    [id]
  );
  res.json(response.rows);
});

app.post("/users", async (req, res) => {
  const userName = req.body.user_name;
  const response = await pool.query(
    "insert into users(user_name, user_type) values($1, 2)",
    [userName]
  );
  res.json("User has Added!");
});

app.post("/registrasiya", async (req, res) => {
  const { user_img } = req.files;
  const body = req.body;
  user_img.mv(
    path.join(process.cwd(), "src", "images", "Users_Images", user_img.name)
  );
  const response = await pool.query(
    "select * from users u where u.user_name = $1 and u.user_password = $2",
    [body.user_name, body.user_password]
  );
  if (response.rows.length === 0) {
    const resp = await pool.query(
      "insert into users(user_name, user_password, user_img, user_type) values($1, $2, $3, 1)",
      [body.user_name, body.user_password, user_img.name]
    );
    res.json("Admin has added!");
  } else res.json("shake");
});

app.delete("/users:userId", async (req, res) => {
  const { userId } = req.params;
  const respon = await pool.query(
    "delete from orders where orders.user_id = $1",
    [userId]
  );
  const response = await pool.query(
    "delete from users where users.user_id = $1",
    [userId]
  );
  if (response.command === "DELETE");
  res.json("User has deleted!");
});

app.post("/login", async (req, res) => {
  const userName = req.body.user_name;
  const userPassword = req.body.user_password;
  const response = await pool.query(
    "select user_id from users where user_name = $1 and user_password = $2 and user_type = 1 ",
    [userName, userPassword]
  );
  if (response.rows[0]) {
    let token = jwt.sign(response.rows[0].user_id, "SECRET KEY");
    res.json(token);
  } else {
    res.json("shake");
  }
});

app.get("/token:userToken", async (req, res) => {
  const token = req.params.userToken;
  const userId = jwt.verify(token, "SECRET KEY");
  const response = await pool.query(
    "select user_name, user_img from users where user_id = $1",
    [userId]
  );
  res.send(response.rows[0]);
});

app.get("/foodtype", async (req, res) => {
  const response = await pool.query("select * from food_type");
  res.json(response.rows);
});

app.get("/foodtype:id", async (req, res) => {
  const foodtype = req.params.id;
  const response = await pool.query(
    "select * from foods where foods.food_type = $1",
    [foodtype]
  );
  res.json(response.rows);
});

app.get("/order:userId", async (req, res) => {
  const userId = req.params.userId;
  const response = await pool.query(
    "select food_name, food_img, food_price, count, order_id from foods f inner join (select * from orders o where o.user_id = $1) o on f.food_id = o.food_id ORDER BY order_id ASC",
    [userId]
  );
  res.json(response.rows);
});

app.post("/orders", async (req, res) => {
  const foodId = req.body.foodId;
  const foodCount = req.body.count;
  const userId = req.body.user_id;
  if (foodId && foodCount && userId) {
    const userOrder = await pool.query(
      "select * from orders o where o.user_id = $1 and o.food_id = $2",
      [userId, foodId]
    );
    if (userOrder.rowCount === 0) {
      const response = await pool.query(
        "insert into orders(user_id, food_id, count) values($1, $2, $3)",
        [userId, foodId, foodCount]
      );
      if ((response.command = "INSERT")) {
        const respon = await pool.query(
          "select food_name, food_img, food_price, count, order_id from foods f inner join (select * from orders o where o.user_id = $1) o on f.food_id = o.food_id ORDER BY order_id ASC",
          [userId]
        );
        res.json(respon.rows);
      }
    } else {
      const orderId = userOrder.rows[0].order_id;
      const orderCount = await pool.query(
        "select count from orders o where order_id = $1",
        [orderId]
      );
      const response = await pool.query(
        "update orders set count = $1  where order_id = $2",
        [+orderCount.rows[0].count + +foodCount, orderId]
      );
      if (response.command === "UPDATE") {
        const respon = await pool.query(
          "select food_name, food_img, food_price, count, order_id from foods f inner join (select * from orders o where o.user_id = $1) o on f.food_id = o.food_id ORDER BY order_id ASC",
          [userId]
        );
        res.json(respon.rows);
      }
    }
  }
});

app.delete("/order:orderId", async (req, res) => {
  const { orderId } = req.params;
  const response = await pool.query(
    "delete from orders where orders.order_id = $1",
    [orderId]
  );
  if (response.command === "DELETE") res.json("Order has deleted!");
});

app.listen(PORT, () =>
  console.log("Server is running http://" + host + ":" + PORT)
);
