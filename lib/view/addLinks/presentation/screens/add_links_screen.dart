import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';

import '../../../../core/services/services_locator.dart';
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
