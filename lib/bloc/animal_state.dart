// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'animal_bloc.dart';

@immutable
sealed class AnimalState {}

final class AnimalInitial extends AnimalState {}

class AnimalListSuccess extends AnimalState {
  List<AnimalModel> animals;
  AnimalListSuccess({
    required this.animals,
  });
}

class ErrorState extends AnimalState {}

class LoadingState extends AnimalState {}

class SuccessAnimalCreated extends AnimalState {}