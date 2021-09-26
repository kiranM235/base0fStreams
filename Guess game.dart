import 'dart:html';

void main() {
  
  final ButtonElement button = querySelector('button') as ButtonElement;
  final InputElement input = querySelector('input') as InputElement;
  
  button.onClick
    .take(4)
    .where((event) => input.value == "chocolate")
    .listen(
      (data){
        print("Yay, you won the game");
      },
      onDone: () {
        print("Too many bad guesses");
      }
  );
   

--------------------------------------------------------------------------------

on html typedef

<h1 id="header"> Guess the secret word </h1>

<input/>
<button> Guess </button>