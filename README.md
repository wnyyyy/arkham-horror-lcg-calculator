# Arkham Horror LCG Probability Calculator (Flutter App)
Arkham Horror LCG (Living Card Game) is a cooperative card game set in the Lovecraftian universe, where players team up to solve mysteries and fend off eldritch horrors. This app aids players in understanding the odds related to the game's unique dice-rolling mechanic, the Chaos Bag. Players draw tokens from the bag to determine outcomes, where each token has its own implications and the distribution of these tokens varies based on the scenario and difficulty level.

## Features
- Change bag composition: Users can select desired tokens that compose the Chaos Bag. The data is persisted among sessions.
- Calculate Probability: Based on the selected tokens and their quantity in the Chaos Bag, the app displays the probability of drawing them.
- Automatic token selection: The system can pre-select the winning tokens based on the informed input and the toggles, which allows for pre-selecting signs (tokens with context dependant value) and/or forbidding non-negative tokens.

## To do
- Add probability calculation when pulling multiple tokens

## Usage
- Launch the application
- Choose the tokens you wish to calculate the probability for by toggling them in the bottom half of the screen, or input a number to automatically select them.
- View the displayed probability based on your selections.

## Installation
```bash
git clone https://github.com/wnyyyy/arkham-horror-lcg-calculator
cd arkham_horror_lcg_calculator
flutter run
