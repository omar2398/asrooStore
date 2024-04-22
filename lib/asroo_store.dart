import 'package:asro_store/core/app/connectiviy_check.dart';
import 'package:flutter/material.dart';
import 'package:asro_store/core/common/screens/no_networkScreen.dart';
import 'package:asro_store/core/app/env.variables.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AsrooStoreApp extends StatefulWidget {
  const AsrooStoreApp({Key? key}) : super(key: key);

  @override
  _AsrooStoreAppState createState() => _AsrooStoreAppState();
}

class _AsrooStoreAppState extends State<AsrooStoreApp> {
  late final ConnectivityFunction _connectivityFunction;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    _connectivityFunction = ConnectivityFunction(); // _instance
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    setState(() {
      isConnected = false; // Initially set to false
    });

    final result = await _connectivityFunction.checkConnectivity();
    setState(() {
      isConnected = result;
    });

    _connectivityFunction.connectivityStream.listen((event) {
      setState(() {
        isConnected = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isConnected) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner:
        Env_variable.instance.envType == 'dev' ? true : false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, widget) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: Scaffold(
              body: Builder(
                builder: (context) {
                  return Container(
                    child: Center(
                      child: Text(
                        'hello pep'
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return MaterialApp(
        home: const noNetworkScreen(),
      );
    }
  }
}