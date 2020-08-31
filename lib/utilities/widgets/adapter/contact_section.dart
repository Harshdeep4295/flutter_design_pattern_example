import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contact_interface.dart';
import 'package:flutter_design_pattern_example/design_pattern/adapter/contacts.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/adapter/contact_card.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/platform_button.dart';

// This class is used to displaty the contacts from the interface adapter
class ContactsSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;

  const ContactsSection({
    @required this.adapter,
    @required this.headerText,
  })  : assert(adapter != null),
        assert(headerText != null);

  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = List<Contact>();

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        const SizedBox(height: spaceM),
        Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: contacts.length > 0 ? 1.0 : 0.0,
              child: Column(
                children: <Widget>[
                  for (var contact in contacts)
                    ContactCard(
                      contact: contact,
                    )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: contacts.length == 0 ? 1.0 : 0.0,
              child: PlatformButton(
                child: Text('Get contacts'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _getContacts,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
