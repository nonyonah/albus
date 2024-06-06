import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:myapp/main.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<List<ConnectivityResult>> get connectivityResult;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  late final Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  NetworkInfo._internal(this.connectivity);

  factory NetworkInfo() {
    return _networkInfo;
  }

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return await connectivity.checkConnectivity();
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged => 
  connectivity.onConnectivityChanged;

  // This getter throws an exception if accessed
  Future<ConnectivityResult> get throwError {
    throw UnimplementedError("This getter is not implemented");
  }
}

// Exception and Failure Classes

abstract class Failure {}

class ServiceFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetExceptionOccurred']) {
    _message = message;
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!.showSnackBar(
        SnackBar(content: Text(_message)),
      );
    }
  }
}
