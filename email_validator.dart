import 'dart:html';
import 'dart:async';

 

void main() {
  final InputElement input = querySelector('input') as InputElement;
  final DivElement div = querySelector('div') as DivElement;

 

  final validator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@") && email.contains(".")) {
      sink.add(email);
    } else {
      sink.addError("Invalid email address");
    }
  });

 


  input.onInput
      .map((dynamic event) => "${event.target.value}")
      .transform(validator)
      .listen(
        (data) {
          div.innerHtml = "";
        },
        onError: (err) {
          div.innerHtml = err;
        },
  );
}

--------------------------------------------------------------------------------

on html typedef

<h1 id="header"> Enter your email address </h1>

<input/>
<div style = "color:red;"></div>



