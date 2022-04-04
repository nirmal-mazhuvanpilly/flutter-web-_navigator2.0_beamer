import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/beamer/books_location.dart';

class BottomNavBar extends StatefulWidget {
  final GlobalKey<BeamerState> beamerKey;
  const BottomNavBar({Key? key, required this.beamerKey}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BeamerDelegate? _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState?.routerDelegate;
    _beamerDelegate?.addListener(() {
      return _setStateListener();
    });
  }

  @override
  void dispose() {
    _beamerDelegate?.removeListener(() {
      return _setStateListener();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex =
        _beamerDelegate?.currentBeamLocation is BooksLocation ? 0 : 1;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(label: "Books", icon: Icon(Icons.book)),
        BottomNavigationBarItem(label: "Articles", icon: Icon(Icons.article)),
      ],
      onTap: (index) =>
          _beamerDelegate?.beamToNamed(index == 0 ? "/books" : "/articles"),
    );
  }
}
