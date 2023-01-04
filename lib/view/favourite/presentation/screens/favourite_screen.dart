import 'package:flutter/material.dart';

import '../widgets/favourite_appbar.dart';
import '../widgets/favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FavouriteAppBar(),
      body: FavouriteBody(),
    );
  }
}
