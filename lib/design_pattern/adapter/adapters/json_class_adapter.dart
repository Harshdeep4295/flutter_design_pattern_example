import 'dart:convert';

import 'package:flutter_design_pattern_example/design_pattern/adapter/apis/jsonApi.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contact_interface.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contacts.dart';

// JsonContactAdapater impelemts the interface to have the same method but parse the json contact data
class JsonContactsAdapter implements IContactsAdapter {
  final JsonContactsApi _api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsJson = _api.getContactsJson();
    var contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    var contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactsJsonList = contactsMap['contacts'] as List;
    var contactsList = contactsJsonList
        .map((json) => Contact(
              fullName: json['fullName'],
              email: json['email'],
              favourite: json['favourite'],
            ))
        .toList();

    return contactsList;
  }
}
