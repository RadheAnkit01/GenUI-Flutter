# GenUI Flutter 🚀

GenUI is a dynamic, server-driven dynamic UI streaming application built with Flutter. It leverages the power of Google's Gemini AI model to turn raw user prompts into fully responsive, validated, and interactive Flutter widgets on-the-fly without requiring a client-side app update.

---

## 🏗️ Architectural Flow

The engine parses natural language, guarantees structural schema integrity, and dynamically renders interactive states via an isolated recursive engine.

User Prompt ──> Gemini ──> JSON String ──> jsonDecode() ──> Validation ──> Renderer ──> Flutter Widgets

### Deep Dive: The Renderer Core Engine

Manual Renderer ──> Dynamic Widgets ──> Recursive Layouts ──> Schemas ──> State Binding ──> Actual GenUI SDK

---

## ✨ Features

- **Generative UI Component Engine:** Instantly renders complex layout configurations (like interactive MCQs, form sheets, or dynamic data cards) based purely on text prompts.
- **Performance-Optimized Streams:** Combines `ChangeNotifierProvider` and `ListView.builder` positional-stability so appending a new generative child card _never_ accidentally re-triggers rebuild workflows on older elements.
- **Zero App Updates Required:** UI schemas are interpreted dynamically via a custom layout engine at runtime.
- **State-Preserved Interactions:** Fully handles internal button selectors and state-binding layers natively within the generated layouts.

---

## 🛠️ Security & Key Management

This project enforces strict **GitHub Push Protection** compliance. Secrets are isolated at compilation using `--dart-define` compilation parameters, avoiding exposed codebase keys.

### Local Development Setup

To run this project locally, do not hardcode your Gemini API credentials. Configure your local workspace environment:

1. Create a `.vscode/launch.json` file (this directory is pre-registered inside your `.gitignore` workspace properties):

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "GenUI (Debug)",
      "request": "launch",
      "type": "dart",
      "toolArgs": [
        "--dart-define=GEMINI_API_KEY=YOUR_ACTUAL_GEMINI_KEY_HERE"
      ]
    }
  ]
}

2. Alternatively, compile and run the application explicitly via the terminal interface:

    flutter run --dart-define=GEMINI_API_KEY=YOUR_ACTUAL_GEMINI_KEY_HERE
```

### 💡 Tips for Customization:

- Replace `YOUR_ACTUAL_GEMINI_KEY_HERE` with any specific instructions you want to give people reading your project.
- When you push this to GitHub, the textual arrows (`──>`) will display as beautifully formatted pipeline pathways automatically!
