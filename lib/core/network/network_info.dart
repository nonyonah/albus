import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:myapp/main.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI{
  late final Connectivity connectivity;
  
  static  final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());
  
  factory NetworkInfo() {
    return _networkInfo;
  }

  //checks if internet is connected
  // returns (true) if internet is connected
  //else returns (false) if internet is not connected

  @override
  Future<bool> isConnected() async{
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
 Future<ConnectivityResult> get connectivityResult async {
  return connectivity.checkConnectivity();
 }

 @override
  Stream<ConnectivityResult> get onConnectivityChanged => 
  connectivity.onConnectivityChanged;
  }

abstract class Failure {}

class ServiceFailure extends Failure {}

class CacheFailure extends Failure{}

class NetworkFailure extends Failure{}

class ServerException implements Exception{}

class CacheException implements Exception{}

class NetworkException implements Exception {}

class NoInternetException implements Exception{
  late String _message;
  NoInternetException([String message = 'NoInternetExceptionOccured']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
      .showSnackBar(SnackBar(content: Text(message)));
    }
  }
}