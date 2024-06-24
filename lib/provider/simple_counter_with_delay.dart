import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_intro/service/cat_service.dart';

final county = Provider<SimpeEaxmple>((ref) {
  return SimpeEaxmple();
});

final countyToViewInUi = FutureProvider<int>((ref) {
return  ref.watch(county).increament();
});
