import 'package:flutter/material.dart';
import '../widgets/my_connections_body.dart';

class MyConnectionsScreen extends StatelessWidget {
  const MyConnectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyConnectionsBody(),
    );
  }
}
