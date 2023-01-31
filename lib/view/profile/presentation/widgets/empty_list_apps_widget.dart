import 'package:flutter/material.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/view/addLinks/presentation/screens/add_links_screen.dart';
import 'package:switch_app/widgets/custom_button.dart';

class EmptyListAppsWidget extends StatelessWidget {
  const EmptyListAppsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(AppAssets.lets_started),
          ),
          CustomButton(
            text: 'add your links',
            onPress: () {
              MagicRouter.navigateTo(AddLinksScreen());
            },
          ),
        ],
      ),
    );
  }
}
