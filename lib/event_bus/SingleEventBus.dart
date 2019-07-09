import 'package:event_bus/event_bus.dart';

class SingleEventBus {
  static EventBus _eventBus;

  static EventBus instance() {
    if (_eventBus == null) {
      _eventBus = EventBus();
    }
    return _eventBus;
  }
}
