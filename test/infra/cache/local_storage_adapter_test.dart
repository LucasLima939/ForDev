import 'package:faker/faker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

import 'package:for_dev/data/cache/cache.dart';
import 'package:mockito/mockito.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage{
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({@required this.secureStorage});
  Future<void> saveSecure({@required String key ,@required String value})async{
    await secureStorage.write(key: key, value: value);
  }
}

class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage{}

void main(){
  FlutterSecureStorageSpy secureStorage;
  LocalStorageAdapter sut;
  String key;
  String value;
  setUp((){
    secureStorage = FlutterSecureStorageSpy();
    sut = LocalStorageAdapter(secureStorage: secureStorage);
    key = faker.lorem.word();
    value = faker.guid.guid();
  });

  test('Should call save secure with correct values', () async {
    await sut.saveSecure(key: key, value: value);
    verify(secureStorage.write(key: key, value: value));
  });
}