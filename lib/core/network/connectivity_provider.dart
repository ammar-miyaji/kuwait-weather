import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
Connectivity connectivity(ref) => Connectivity();

@riverpod
Future<bool> isConnected(ref) async {
  final connectivity = ref.watch(connectivityProvider);
  final result = await connectivity.checkConnectivity();
  return _isOnline(result);
}

@riverpod
Stream<bool> connectivityStream(ref) async* {
  final connectivity = ref.watch(connectivityProvider);

  // Emit current state first
  final current = await connectivity.checkConnectivity();
  yield _isOnline(current);

  // Then emit on every change
  await for (final results in connectivity.onConnectivityChanged) {
    yield _isOnline(results);
  }
}

bool _isOnline(List<ConnectivityResult> results) {
  return results.any((r) =>
      r == ConnectivityResult.wifi ||
      r == ConnectivityResult.mobile ||
      r == ConnectivityResult.ethernet ||
      r == ConnectivityResult.vpn);
}
