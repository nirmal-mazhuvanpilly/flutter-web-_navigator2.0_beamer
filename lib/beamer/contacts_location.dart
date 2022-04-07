import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/provider/auth_provider.dart';
import 'package:flutter_web_app_navigation/screens/contacts_screen.dart';
import 'package:flutter_web_app_navigation/screens/contact_detail_screen_state.dart';
import 'package:flutter_web_app_navigation/screens/page_not_found.dart';
import 'package:provider/provider.dart';

class ContactsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

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
      String? title = data as String?;
      pages.add(BeamPage(
          key: ValueKey("Contacts $contactId"),
          title: title ?? "No contacts data",
          child: ContactsDetailScreenState(
            id: contactId,
          )));
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
        "404",
        "/contacts/:contactId",
        "/",
      ];

  @override
  List<BeamGuard> get guards => <BeamGuard>[
        BeamGuard(
            pathPatterns: [
              "/contacts/*",
              "/contacts",
            ],
            check: (context, location) {
              return context.read<AuthProvider>().isLoggedIn ?? false;
            },
            beamToNamed: (_, __) => "/login"),
      ];
}
