import 'package:bloc_pattern/counter/counter_event.dart';
import 'package:bloc_pattern/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterManager extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterManager() : super(TheNumberIsZeroNow(counter: 0)) {
    on<IncreamentCounter>(
      (event, emit) {
        if (counter >= 10) {
        } else {
          counter++;
          print(counter);
          emit(TheNumberIsAdded(counter: counter));
        }
      },
    );

    on<DecreamenetCounter>(
      (event, emit) {
        if (counter <= 0) {
        } else {
          counter--;
          emit(TherNumberIsSub(counter: counter));
        }
      },
    );

    on<RestoreToZero>(
      (event, emit) {
        counter = 0;
        emit(TheNumberIsZeroNow(counter: counter));
      },
    );
  }
}
