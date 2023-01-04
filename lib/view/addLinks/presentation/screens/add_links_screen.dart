import 'package:flutter/material.dart';

import '../widgets/add_links_appbar.dart';
import '../widgets/add_links_body.dart';

class AddLinksScreen extends StatelessWidget {
  const AddLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddLinksAppBar(),
      body: AddLinksBody(),
    );
  }
}
