
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_app/services/peoples_service/api_call/peoples_api_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io' as io;

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;
  await dotenv.load(fileName: ".env");

  group('PeoplesApiServiceTest-', (){

    setUp(() async {

    });


    test('expect list returned', () async{
      final cache = PeoplesApiService();
      expect(await cache.getListOfPeoplesResponse(),[]);
    });



  });
}