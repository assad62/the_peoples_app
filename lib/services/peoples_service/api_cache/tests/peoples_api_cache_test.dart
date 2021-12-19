import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_starter_app/services/peoples_service/api_cache/peoples_api_cache_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../../../../tests/mock_path_provider.dart';






void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('APICacheTest-', (){



    TestWidgetsFlutterBinding.ensureInitialized();

    setUp(() async {
      PathProviderPlatform.instance = MockPathProviderPlatform();

    });

    test('getApplicationsDocumentsDirectory', () async {
      Directory result = await getApplicationDocumentsDirectory();
      expect(result.path, kApplicationDocumentsPath);
    });

    test('expect String returned', () async{
      final cache = PeoplesApiCache();
      expect(await cache.getCacheResponse(),"");
    });



  });
}