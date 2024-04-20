import 'package:flutter_dotenv/flutter_dotenv.dart';
enum EnvVariableEnum {prod, dev}
class Env_variable {
  Env_variable._(); //making constructor private

static final Env_variable instance = Env_variable._(); //singlton
String? _envType;

Future<void> init(EnvVariableEnum envType) async{
  switch(envType){
    case EnvVariableEnum.dev:
      await dotenv.load(fileName: '.env.dev');

    case EnvVariableEnum.prod:
      await dotenv.load(fileName: '.env.prod');
  }
  _envType = dotenv.get('ENV');
}
String? get envType => _envType;

}