import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityFunction {
  ConnectivityFunction._(); // Private constructor to prevent instantiation

  static final ConnectivityFunction _instance = ConnectivityFunction._();

  factory ConnectivityFunction() => _instance;

  Future<bool> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    return _isConnected(result);
  }

  Stream<bool> get connectivityStream {
    return Connectivity().onConnectivityChanged.map(_isConnected);
  }

  bool _isConnected(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile)
        || result.contains(ConnectivityResult.wifi)
        || result.contains(ConnectivityResult.ethernet)
        || result.contains(ConnectivityResult.vpn)){
      return true;
    }else{
      return false;
    }
  }
}