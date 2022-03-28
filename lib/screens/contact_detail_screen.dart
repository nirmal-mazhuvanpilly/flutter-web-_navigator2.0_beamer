import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/contacts.dart';
import 'package:flutter_web_app_navigation/widgets/common_app_bar.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contacts? contact;
  const ContactDetailScreen({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 75,
                child: Text(
                  contact?.id.toString() ?? "",
                  style: const TextStyle(fontSize: 50),
                )),
            const SizedBox(height: 10),
            ContactFields(fieldName: "Name : ", field: contact?.name),
            ContactFields(fieldName: "Username : ", field: contact?.username),
            ContactFields(fieldName: "Email : ", field: contact?.email),
            ContactFields(
                fieldName: "Street : ", field: contact?.address?.street),
            ContactFields(
                fieldName: "Suite : ", field: contact?.address?.suite),
            ContactFields(fieldName: "City : ", field: contact?.address?.city),
            ContactFields(
                fieldName: "Zipcode : ", field: contact?.address?.zipcode),
            ContactFields(
                fieldName: "Lat : ", field: contact?.address?.geo?.lat),
            ContactFields(
                fieldName: "Lng : ", field: contact?.address?.geo?.lng),
            ContactFields(fieldName: "Phone : ", field: contact?.phone),
            ContactFields(fieldName: "Website : ", field: contact?.website),
            ContactFields(
                fieldName: "Company name : ", field: contact?.company?.name),
            ContactFields(
                fieldName: "Catch phrase : ",
                field: contact?.company?.catchPhrase),
            ContactFields(fieldName: "Bs : ", field: contact?.company?.bs),
          ],
        ),
      ),
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
