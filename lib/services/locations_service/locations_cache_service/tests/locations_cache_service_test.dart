import 'dart:io';

import 'package:flutter_starter_app/services/locations_service/locations_cache_service/locations_cache_service_impl.dart';
import 'package:flutter_starter_app/services/peoples_service/api_cache/peoples_api_cache_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../../../../tests/mock_path_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('LocationCacheTest-', (){



    TestWidgetsFlutterBinding.ensureInitialized();

    setUp(() async {
      PathProviderPlatform.instance = MockPathProviderPlatform();

    });

    test('getApplicationsDocumentsDirectory', () async {
      Directory result = await getApplicationDocumentsDirectory();
      expect(result.path, kApplicationDocumentsPath);
    });

    test('expect String returned', () async{
      final cache = LocationsCacheService();
      expect(await cache.getAddressString(0.0, 0.0),"");
    });



  });
}