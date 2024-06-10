import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/animal_servivc/animal_service.dart';
import 'package:bloc_pattern/model/animal_model.dart';
import 'package:bloc_pattern/model/handling.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalInitial()) {
    on<GetAnimal>((event, emit) async {
      emit(LoadingState());
      ResultModel response = await AnimalServiceImp().getAnimal();

      if (response is ListOf<AnimalModel>) {
        emit(AnimalListSuccess(animals: response.data));
      } else {
        emit(ErrorState());
      }
    });



    on<CreateNewAnimal>(
      (event, emit) async {
        emit(LoadingState());
        // ! We Can Find The attribute of Event in the 'event' object 
        ResultModel result = await AnimalServiceImp().createNewAniml(event.name);
        if (result is AnimalModel) {
          emit(SuccessAnimalCreated());
          
        } else {
          emit(ErrorState());
        }
      },
    );
  }
}
