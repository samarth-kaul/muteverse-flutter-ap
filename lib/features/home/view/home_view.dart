import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class HomeView extends StatelessWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const HomeView(),
  );
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
