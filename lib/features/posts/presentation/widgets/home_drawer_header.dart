import 'package:flutter/material.dart';

class HomeDrawerHeader extends StatefulWidget {
  const HomeDrawerHeader();

  @override
  State<HomeDrawerHeader> createState() => _HomeDrawerHeaderState();
}

class _HomeDrawerHeaderState extends State<HomeDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(),
    );
  }
}
