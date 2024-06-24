import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_intro/model/cat_model.dart';
import 'package:riverpod_intro/service/cat_service.dart';

final catData = FutureProvider<ResutlModel>((ref) {
  return ref.read(pureCatData).getAllCat();
});

final pureCatData = Provider<CatService>((ref) {
  return CatService();
});
