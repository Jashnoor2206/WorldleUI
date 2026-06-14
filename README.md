# WordBreaker (Variation of CodeBreaker)

A Wordle-inspired word guessing game built with SwiftUI for iOS. Guess the hidden word within 6 attempts using color-coded feedback.

---

## Features

- Adjustable word length (3–6 letters) via the Settings panel
- Color-coded keyboard that tracks used letters across attempts
- Animated transitions for guesses and keyboard
- Words loaded from Stanford's CS193p word list
- Restart at any time with a new random word

---

## How to Play

1. Tap letters on the on-screen keyboard to fill in your guess
2. Press **Guess** to submit
3. Use the color feedback to narrow down the hidden word:

| Color | Meaning |
|-------|---------|
| 🟩 Green | Correct letter, correct position |
| 🟨 Yellow | Correct letter, wrong position |
| ⬜ Gray | Letter not in the word |

4. You have **6 attempts** to guess the word
5. Press **Restart** at any time to start a new game

---

## Project Structure

| File | Description |
|------|-------------|
| `WordBreaker_Variation_of_CodeBreaker_App.swift` | App entry point |
| `WordleMainView.swift` | Main game screen and state management |
| `Wordle.swift` | Core game logic (guessing, matching, restarting) |
| `Code.swift` | Data model for master code, guesses, and attempts |
| `DefaultScreen.swift` | Reusable row view for guess and attempt display |
| `BottomKeyboard.swift` | On-screen keyboard with color-coded letter tracking |
| `Buttons.swift` | Toolbar with Restart, Guess, Settings, and Rules buttons |
| `SettingScreen.swift` | Settings sheet for adjusting word length |
| `RulesScreen.swift` | Rules and instructions sheet |
| `Words.swift` | Async word loader from Stanford CS193p word list |

---

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+
- Internet connection (for loading the word list on first launch)

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Jashnoor2206/WorldleUI.git
   ```
2. Open the `.xcodeproj` file in Xcode
3. Select a simulator or connected device
4. Press **Run** (⌘R)

---

## Credits

- Word list sourced from [Stanford CS193p](https://web.stanford.edu/class/cs193p/)
- Built by **Jashnoor Singh**
