import 'dart:async';
import 'package:bloc/counter_event.dart';

class CounterBloc {
  int _counter = 0;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEvenetCountroller = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEvenetCountroller.sink;
  CounterBloc() {
    _counterEvenetCountroller.stream.listen(mapEventToState);
  }

  void mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEvenetCountroller.close();
  }
}
