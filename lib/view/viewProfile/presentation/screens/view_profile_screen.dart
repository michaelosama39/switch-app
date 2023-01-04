import 'package:flutter/material.dart';
import '../widgets/view_profile_appbar.dart';
import '../widgets/view_profile_body.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewProfileAppBar(),
      body: ViewProfileBody(),
    );
  }
}
