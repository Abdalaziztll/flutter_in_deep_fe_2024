part of 'light_bloc.dart';

@immutable
sealed class LightEvent {}


class ChangeLight extends LightEvent {}