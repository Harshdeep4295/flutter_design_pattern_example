import 'package:flutter_design_pattern_example/design_pattern/adapter/apis/xmlApi.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contact_interface.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contacts.dart';
import 'package:xml/xml.dart' as xml;

// JsonContactAdapater impelemts the interface to have the same method but parse the xml contact data
class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsXml = _api.getContactsXml();
    var contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    var xmlDocument = xml.parse(contactsXml);
    var contactsList = List<Contact>();

    for (var xmlElement in xmlDocument.findAllElements('contact')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var email = xmlElement.findElements('email').single.text;
      var favouriteString = xmlElement.findElements('favourite').single.text;
      var favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favourite: favourite,
      ));
    }

    return contactsList;
  }
}
