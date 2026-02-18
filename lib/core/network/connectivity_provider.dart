import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
Connectivity connectivity(ref) => Connectivity();

@riverpod
Future<bool> isConnected(ref) async {
  final connectivity = ref.watch(connectivityProvider);
  final result = await connectivity.checkConnectivity();
  return !result.contains(ConnectivityResult.none);
}

@riverpod
Stream<bool> connectivityStream(ref) {
  final connectivity = ref.watch(connectivityProvider);
  return connectivity.onConnectivityChanged.map(
    (results) => !results.contains(ConnectivityResult.none),
  );
}
