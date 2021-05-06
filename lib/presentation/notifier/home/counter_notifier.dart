import 'package:nocia/presentation/notifier/home/counter_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(const CounterState());

  void setPage(int value) {
    state = state.copyWith(page: value);
  }
}