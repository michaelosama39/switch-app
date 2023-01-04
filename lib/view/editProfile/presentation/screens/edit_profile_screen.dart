import 'package:flutter/material.dart';

import '../widgets/edit_profile_appbar.dart';
import '../widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditProfileAppBar(),
      body: EditProfileBody(),
    );
  }
}
