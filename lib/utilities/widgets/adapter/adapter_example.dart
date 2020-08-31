import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/adapters/json_class_adapter.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/adapters/xml_class_adapter.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/adapter/contact_section.dart';

// Class use to display the example of how the adapter is used...`
class AdapterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContactsSection(
              adapter: JsonContactsAdapter(),
              headerText: 'Contacts from JSON API:',
            ),
            const SizedBox(height: spaceL),
            ContactsSection(
              adapter: XmlContactsAdapter(),
              headerText: 'Contacts from XML API:',
            ),
          ],
        ),
      ),
    );
  }
}
