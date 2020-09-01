import 'package:faker/faker.dart';

// Fake api is used to to work with different state
class FakeApi {
  Future<List<String>> getNames() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (random.boolean()) {
          return _getRandomNames();
        }

        throw Exception('Unexpected error');
      },
    );
  }

  List<String> _getRandomNames() {
    if (random.boolean()) {
      return [];
    }

    return [
      faker.person.name(),
      faker.person.name(),
      faker.person.name(),
    ];
  }
}
