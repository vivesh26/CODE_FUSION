# CODE_FUSION
# ⚡ CODE FUSION

> Hybrid Compiler for C and Python using a Unified Intermediate Representation
---

## 🚀 About the Project

**CODE FUSION** is an educational compiler project that demonstrates how multiple programming languages can be processed using a **shared compilation pipeline**.

It accepts a simplified subset of **C-like and Python-like syntax** and converts them into a common **Three Address Code (TAC)**.

💡 This project bridges the gap between **theory and practical implementation** of compiler design.

---

## ✨ Features

* 🔄 Multi-language support (C-like + Python-like)
* ⚙️ Lexical analysis using **Flex**
* 🧠 Syntax analysis using **Bison**
* 📦 Intermediate code generation (TAC)
* 🔁 Control flow support (`if`, `while`)
* 🧾 Symbol table implementation
* 🌐 Web-based IDE interface
* ⚡ Live error detection & highlighting

---

## 🏗️ Architecture

```text
User Input (C/Python)
        ↓
Lexical Analysis (Flex)
        ↓
Parsing (Bison)
        ↓
Intermediate Code (TAC)
        ↓
Web Interface Output
```

---

## 📂 Project Structure

```bash
code-fusion/
│
├── backend/
│   ├── server.py
│   └── compiler
│
├── frontend/
│   ├── templates/
│   │   └── index.html
│   └── static/
│       ├── style.css
│       └── script.js
│
├── compiler/
│   ├── lexer.l
│   ├── parser.y
│   ├── tac.c
│   ├── symbol_table.c
│
├── Makefile
├── requirements.txt
└── README.md
```

---

## ⚙️ Installation & Setup

### 1️⃣ Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/code-fusion.git
cd code-fusion
```

---

### 2️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

---

### 3️⃣ Build Compiler

```bash
make
```

---

### 4️⃣ Run Server

```bash
cd backend
python server.py
```

---

### 5️⃣ Open in Browser

```
http://127.0.0.1:5000
```

---

## 💻 Example

### Input

```python
a = 5
b = 10

if a < b
    print a
```

---

### Output (TAC)

```text
t0 = 5
a = t0
t1 = 10
b = t1
t2 = a < b
ifFalse t2 goto L0
print a
L0:
```

---

## ⚠️ Limitations

* Supports only a **basic subset** of C and Python
* No support for:

  * Pointers
  * Arrays
  * OOP concepts
* Integer-only variables

---

## 🎓 Educational Purpose

This project is designed for **learning compiler design concepts**, including:

* Lexical Analysis
* Parsing Techniques
* Intermediate Code Generation
* Multi-language compilation

---

## 🔮 Future Scope

* 🔥 Syntax highlighting editor (Monaco)
* 📊 Parse tree visualization
* ⚙️ Assembly code generation
* 🌐 Online deployment

---

## 👨‍💻 Authors

* **Vivesh Verma**
* Team **CODE_SMASHERS**

---

## 📚 References

* *Compilers: Principles, Techniques, and Tools* (Dragon Book)
* Flex Documentation
* Bison Documentation
* GCC Compiler

---

## ⭐ Show Your Support

If you like this project, give it a ⭐ on GitHub!

---
