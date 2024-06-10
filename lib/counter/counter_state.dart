// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterState {}

class TheNumberIsAdded extends CounterState {
  int counter;
  TheNumberIsAdded({
    required this.counter,
  });
}

class TherNumberIsSub extends CounterState {
  int counter;
  TherNumberIsSub({
    required this.counter,
  });
}

class TheNumberIsZeroNow extends CounterState {
  int counter;
  TheNumberIsZeroNow({
    required this.counter,
  });
  
}
