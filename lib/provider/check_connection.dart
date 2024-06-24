import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkInternet = StreamProvider<List<ConnectivityResult>>((ref) {
  Connectivity check = Connectivity();
  return check.onConnectivityChanged;
});
