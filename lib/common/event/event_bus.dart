import 'dart:async';

class EventBus {
  StreamController _streamController;

  StreamController get streamController => _streamController;

  // StreamController的broadcast 方法可以直接创建多订阅流
  // 如果[sync]为true，事件将在[fire]调用期间直接传递给流的侦听器。
  // 如果为false(默认值)，事件将在稍后创建事件的代码完成后传递给侦听器。
  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }
}
