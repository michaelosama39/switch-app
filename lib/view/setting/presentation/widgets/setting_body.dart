import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/view/myConnections/presentation/screens/my_connections_screen.dart';
import 'package:switch_app/view/setting/presentation/widgets/setting_item.dart';
import 'package:switch_app/view/setting/presentation/widgets/show_dialog_delete_account.dart';
import 'package:switch_app/view/setting/presentation/widgets/show_dialog_logout.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../changePassword/presentation/screens/change_password_screen.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.screenWidth,
            child: Text(
              'Setting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(10),
                horizontal: AppSizes.getProportionateScreenWidth(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: AppSizes.getProportionateScreenWidth(90),
                    height: AppSizes.getProportionateScreenHeight(90),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.avater),
                      ),
                    ),
                  ),
                  SpaceW(inputWidth: 10),
                  Column(
                    children: [
                      Text(
                        'Dominic Ovo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'test@gmail.com',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.sp,
                        ),
                      ),
                      SpaceH(inputHeigth: 5),
                      TextButton(
                        child: Text(
                          'change password',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.sp,
                          ),
                        ),
                        onPressed: () {
                          MagicRouter.navigateTo(ChangePasswordScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SpaceH(inputHeigth: 30),
          SettingItem(
            text: 'My Connections',
            onTap: () {
              MagicRouter.navigateTo(MyConnectionsScreen());
            },
          ),
          SettingItem(
            text: 'Help',
            onTap: () {},
          ),
          SettingItem(
            text: 'Change language',
            onTap: () {},
          ),
          SettingItem(
            text: 'Log out',
            onTap: () {
              showDialogLogout(context);
            },
          ),
          SpaceH(inputHeigth: 20),
          CustomButton(
            text: 'Delete Account',
            fontColor: Colors.red,
            buttonColor: Colors.black26,
            onPress: () {
              showDialogDeleteAccount(context);
            },
          ),
        ],
      ),
    );
  }
}
