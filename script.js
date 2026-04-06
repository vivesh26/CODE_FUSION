let editor;

// Load Monaco Editor
require.config({
    paths: {
        vs: "https://unpkg.com/monaco-editor@0.45.0/min/vs"
    }
});

require(["vs/editor/editor.main"], function () {

    monaco.editor.defineTheme("fusionTheme", {
        base: "vs",
        inherit: true,
        rules: [
            { token: "keyword", foreground: "7c3aed" },
            { token: "number", foreground: "f59e0b" },
            { token: "string", foreground: "10b981" },
            { token: "identifier", foreground: "2563eb" }
        ],
        colors: {
            "editor.background": "#ffffff"
        }
    });

    editor = monaco.editor.create(document.getElementById("editor"), {
        value: `a = 5
b = a + 2
print(b)`,
        language: "python",
        theme: "fusionTheme",
        automaticLayout: true,
        fontSize: 14
    });
});



async function runCode() {
    const code = editor.getValue();

    const outputBox = document.getElementById("output");
    outputBox.innerText = "⏳ Running...";

    try {
        const response = await fetch("http://localhost:3000/run", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ code })
        });

        const data = await response.text();
        outputBox.innerText = data;

    } catch (error) {
        outputBox.innerText = "❌ Error: Cannot connect to server";
    }
}
