part of 'light_bloc.dart';

@immutable
sealed class LightState {}

final class LightInitial extends LightState {}

class LightOn extends LightState {}

class LightOff extends LightState {}

class BrokeLight extends LightState {}
