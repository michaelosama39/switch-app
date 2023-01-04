import 'package:flutter/material.dart';
import '../widgets/add_connection_appbar.dart';
import '../widgets/add_connection_body.dart';

class AddConnectionScreen extends StatelessWidget {
  const AddConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddConnectionAppBar(),
      body: AddConnectionBody(),
    );
  }
}
