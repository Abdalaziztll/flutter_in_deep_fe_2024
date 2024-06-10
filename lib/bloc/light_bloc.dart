import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'light_event.dart';
part 'light_state.dart';

class LightBloc extends Bloc<LightEvent, LightState> {
  LightBloc() : super(LightInitial()) {
    int counte = 0;
    on<ChangeLight>((event, emit) {
      if (state is LightOn) {
        emit(LightOff());
      } else {
        if (counte > 5) {
          emit(BrokeLight());
        } else {
          counte++;
          emit(LightOn());
        }
      }
    });
  }
}

