import 'package:apod/core/bindings/core_bindings.dart';
import 'package:apod/features/splash/data/local_data_source/splash_local_data_source.dart';
import 'package:apod/features/splash/splash_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements Future<SharedPreferences> {}

void main() {
  late Future<SharedPreferences> sharedPreferences;
  late SplashLocalDataSource dataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({'test': true});
    Modular.bindModule(SplashModule());
    sharedPreferences = Modular.get<Future<SharedPreferences>>();
    dataSource = Modular.get<SplashLocalDataSource>();
  });

  group('SplashLocalDataSourceImpl', () {
    test('should get the correct instance injection', () {
      expect(dataSource, isA<SplashLocalDataSource>());
      expect(sharedPreferences, isA<Future<SharedPreferences>>());
    });

    test('should return a boolean when fetchLocalBool is called', () async {
      final result = await dataSource.fetchLocalBool('test');

      expect(result, true);
    });

    test('should call SharedPreferences to save a boolean when saveLocalBool is called', () async {
      expect(() async => await dataSource.saveLocalBool(key: 'test', value: false), isA<void>());

      await dataSource.saveLocalBool(key: 'test', value: false);

      final prefs = await sharedPreferences;

      expect(prefs.getBool('test'), false);
    });
  });
}
