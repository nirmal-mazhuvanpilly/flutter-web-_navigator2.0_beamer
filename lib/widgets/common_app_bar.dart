import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CommonAppBar extends PreferredSize {
  final String? title;
  final bool backButtonEnabled;
  CommonAppBar({Key? key, this.title, this.backButtonEnabled = true})
      : super(
            key: key,
            child: (kIsWeb)
                ? const SizedBox()
                : Container(
                    height: 80,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blue.shade900,
                    ])),
                    child: Builder(
                      builder: (context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Row(
                                children: [
                                  if (backButtonEnabled)
                                    GestureDetector(
                                      onTap: (() {
                                        Navigator.of(context).pop();
                                      }),
                                      child: const Icon(
                                        Icons.arrow_back_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  if (title != null)
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
            preferredSize: (kIsWeb)
                ? const Size.fromHeight(0)
                : const Size.fromHeight(100));
}
