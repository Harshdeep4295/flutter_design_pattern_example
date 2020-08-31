import 'package:flutter_design_pattern_example/design_pattern/adapter/contacts.dart';

// abstaract class used as an interface
abstract class IContactsAdapter {
  List<Contact> getContacts();
}
