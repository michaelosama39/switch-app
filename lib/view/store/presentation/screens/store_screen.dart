import 'package:flutter/material.dart';
import '../widgets/store_body.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreBody(),
    );
  }
}
