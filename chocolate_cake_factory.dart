import 'dart:async';

void main() {
  final baker = StreamTransformer.fromHandlers(handleData: (type, sink) {
    if (type == "chocolate") {
      // add cake to the flow
      sink.add(Cake());
    } else {
      // add an error
      sink.addError("We cannot bake that type");
    }
  });

  // 1. define a stream controller

  final StreamController controller = StreamController();

  final order = Order('vanilla');
  // 2. define an entry point of that controller and add some values to it
  controller.sink.add(order);

  controller.stream.map((order) => order.type).transform(baker).listen((data) {
    print("Yay we got the cake $data");
  }, onError: (err) {
    print(err);
  });
}

class Order {
  final String type;
  Order(this.type);
}

class Cake {}
