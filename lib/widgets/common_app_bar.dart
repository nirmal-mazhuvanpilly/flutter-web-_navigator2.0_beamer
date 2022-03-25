import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CommonAppBar extends PreferredSize {
  CommonAppBar({Key? key})
      : super(
            key: key,
            child: (kIsWeb)
                ? const SizedBox()
                : Container(
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blue.shade900,
                    ])),
                    child: Builder(
                      builder: (context) {
                        return Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.white,
                                ))
                          ],
                        );
                      },
                    ),
                  ),
            preferredSize: (kIsWeb)
                ? const Size.fromHeight(0)
                : const Size.fromHeight(100));
}
