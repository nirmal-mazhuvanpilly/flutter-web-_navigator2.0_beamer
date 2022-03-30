import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/contacts.dart';
import 'package:flutter_web_app_navigation/provider/contacts_provider.dart';
import 'package:provider/provider.dart';

class ContactsDetailScreenState extends StatefulWidget {
  final int? id;

  const ContactsDetailScreenState({Key? key, this.id}) : super(key: key);
  @override
  State<ContactsDetailScreenState> createState() =>
      _ContactsDetailScreenStateState();
}

class _ContactsDetailScreenStateState extends State<ContactsDetailScreenState> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ContactsProvider>().getContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ContactsProvider>(builder: (context, value, child) {
        if (value.contactList != null) {
          if (widget.id! <= value.contactList!.length) {
            Contacts? contacts = value.contactList
                ?.firstWhere((Contacts contacts) => contacts.id == widget.id);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: contacts?.id.toString() ?? "",
                    child: CircleAvatar(
                        radius: 75,
                        child: Text(
                          contacts?.id.toString() ?? "",
                          style: const TextStyle(fontSize: 50),
                        )),
                  ),
                  const SizedBox(height: 10),
                  ContactFields(fieldName: "Name : ", field: contacts?.name),
                  ContactFields(
                      fieldName: "Username : ", field: contacts?.username),
                  ContactFields(fieldName: "Email : ", field: contacts?.email),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Data Not Found",
                    style: TextStyle(fontSize: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).maybePop();
                    },
                    child: Text(
                      "Click here to get contacts",
                      style: TextStyle(
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

class ContactFields extends StatelessWidget {
  final String? fieldName;
  final String? field;
  const ContactFields({
    Key? key,
    this.fieldName,
    this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(fieldName ?? "",
            style: TextStyle(color: Colors.blue.shade900, fontSize: 20)),
        Text(field ?? "",
            style: TextStyle(color: Colors.blue.shade900, fontSize: 20)),
      ],
    );
  }
}
