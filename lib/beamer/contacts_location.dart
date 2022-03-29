import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/provider/contacts_provider.dart';
import 'package:flutter_web_app_navigation/screens/contact_detail_screen.dart';
import 'package:flutter_web_app_navigation/screens/contacts_screen.dart';
import 'package:flutter_web_app_navigation/screens/data_not_found_screen.dart';
import 'package:flutter_web_app_navigation/screens/home_screen.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';
import 'package:provider/provider.dart';

class ContactsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];
    pages.add(const BeamPage(
      key: ValueKey("Home"),
      title: "HomePage", //Title Name in Browser
      child: HomeScreen(),
    ));

    if (state.uri.path.contains("404")) {
      pages.add(const BeamPage(
        key: ValueKey("Page not found"),
        title: "Page not found",
        child: PageNotFound(),
      ));
    }

    if (state.uri.path.contains("contacts")) {
      pages.add(const BeamPage(
        type: BeamPageType.fadeTransition,
        key: ValueKey("Contacts"),
        title: "Contacts",
        child: ContactsScreen(),
      ));
    }

    final String? contactIdParameter = state.pathParameters["contactId"];
    if (contactIdParameter != null) {
      final contactId = int.tryParse(contactIdParameter);
      if (context.read<ContactsProvider>().contactList == null) {
        pages.add(const BeamPage(
          key: ValueKey("Data not found"),
          title: "Data not found",
          child: DataNotFound(),
        ));
      } else {
        bool isPage = context
            .read<ContactsProvider>()
            .contactList!
            .any((element) => element.id == contactId);
        if (isPage) {
          final contact = context
              .read<ContactsProvider>()
              .contactList
              ?.firstWhere((contact) => contact.id == contactId);
          if (contact != null) {
            pages.add(
              BeamPage(
                key: ValueKey('Contact-$contactIdParameter'),
                title: 'Contact $contactIdParameter',
                type: BeamPageType.fadeTransition,
                child: ContactDetailScreen(
                  contact: contact,
                ),
              ),
            );
          }
        } else {
          pages.add(const BeamPage(
            key: ValueKey("Page not found"),
            title: "Page not found",
            child: PageNotFound(),
          ));
        }
      }
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "404",
        "/contacts/:contactId",
        "/",
      ];
}
