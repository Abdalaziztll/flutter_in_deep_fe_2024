import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = Provider<String>((ref) {
  return 'Hello World';
});

final counter = StateProvider<int>((ref) {
  int number = 0;
  return number;
});
