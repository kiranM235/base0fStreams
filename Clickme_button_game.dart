import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button') as ButtonElement;

  button.onClick.timeout(Duration(seconds: 1), onTimeout: (sink) {
    sink.addError("Too slow");
  }).listen((data) {}, onError: (err) {
    print(err);
  });
}
