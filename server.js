const express = require("express");
const { spawn } = require("child_process");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.post("/run", (req, res) => {
    const code = req.body.code;

    const child = spawn("compiler.exe");

    let output = "";
    let error = "";

    child.stdout.on("data", (data) => {
        output += data.toString();
    });

    child.stderr.on("data", (data) => {
        error += data.toString();
    });

    child.on("close", () => {
        if (error) {
            res.send("❌ ERROR:\n" + error);
        } else {
            res.send(output || "✅ Program executed successfully (no output)");
        }
    });

    child.stdin.write(code+"\n");
    child.stdin.end();
});

app.listen(3000, () => {
    console.log("🚀 Server running at http://localhost:3000");
});