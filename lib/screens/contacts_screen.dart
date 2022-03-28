import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/provider/contacts_provider.dart';
import 'package:flutter_web_app_navigation/widgets/common_app_bar.dart';
import 'package:provider/provider.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ContactsProvider>().getContacts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Consumer<ContactsProvider>(
          builder: (context, value, child) {
            if (value.contactList == null) {
              return const CircularProgressIndicator();
            }
            return Center(
              child: ListView.builder(
                itemCount: value.contactList?.length ?? 0,
                itemBuilder: (context, index) {
                  final _data = value.contactList?.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      {
                        context.beamToNamed(
                          '/contacts/${_data?.id}',
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Hero(
                            tag: _data?.id.toString() ?? "",
                            child: CircleAvatar(
                              child: Text(_data?.id.toString() ?? ""),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _data?.name ?? "",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                _data?.email ?? "",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
