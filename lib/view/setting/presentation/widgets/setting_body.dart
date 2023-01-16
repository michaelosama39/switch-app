import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/myConnections/presentation/screens/my_connections_screen.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';
import 'package:switch_app/view/setting/presentation/widgets/setting_item.dart';
import 'package:switch_app/view/setting/presentation/widgets/show_dialog_delete_account.dart';
import 'package:switch_app/view/setting/presentation/widgets/show_dialog_logout.dart';
import 'package:switch_app/view/setting/presentation/widgets/social_button.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../localization/language.dart';
import '../../../../main.dart';
import '../../../changePassword/presentation/screens/change_password_screen.dart';
import '../../../help/presentation/screens/help_screen.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SettingCubit.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: AppSizes.screenWidth,
              child: Text(
                translation(context).setting,
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
                            translation(context).changePassword,
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
              text: translation(context).myConnections,
              onTap: () {
                MagicRouter.navigateTo(MyConnectionsScreen());
              },
            ),
            SettingItem(
              text: translation(context).help,
              onTap: () {
                MagicRouter.navigateTo(HelpScreen());
              },
            ),
            SizedBox(
              width: AppSizes.screenWidth,
              height: AppSizes.getProportionateScreenHeight(80),
              child: PopupMenuButton(
                icon: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(15),
                      vertical: AppSizes.getProportionateScreenHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).changeLanguage,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                onSelected: (Language language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale);
                    await AppStorage.cacheLang(language.languageCode);
                  }
                },
                itemBuilder: (context) {
                  return Language.languageList()
                      .map<PopupMenuItem<Language>>(
                        (e) => PopupMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Text(e.name)
                            ],
                          ),
                        ),
                      )
                      .toList();
                },
              ),
            ),
            SettingItem(
              text: translation(context).logOut,
              onTap: () {
                showDialogLogout(context ,cubit);
              },
            ),
            SpaceH(inputHeigth: 20),
            CustomButton(
              text: translation(context).deleteAccount,
              fontColor: Colors.red,
              buttonColor: Colors.black26,
              onPress: () {
                showDialogDeleteAccount(context);
              },
            ),
            SpaceH(inputHeigth: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  img: AppAssets.facebook_icon,
                  imgColor: Colors.white,
                  buttonColor: Colors.blueAccent,
                  onPress: () {
                    // AppFunc.launchUrlFun(facebook_url!);
                  },
                ),
                SocialButton(
                  img: AppAssets.twitter_icon,
                  imgColor: Colors.white,
                  buttonColor: Colors.blue.withOpacity(0.8),
                  onPress: () {
                    // AppFunc.launchUrlFun(twitter_url!);
                  },
                ),
                SocialButton(
                  img: AppAssets.google_icon,
                  imgColor: Colors.white,
                  buttonColor: Colors.redAccent.withOpacity(0.9),
                  onPress: () {
                    // AppFunc.launchUrlFun(google_url!);
                  },
                ),
                SocialButton(
                  img: AppAssets.linkedin_icon,
                  imgColor: Colors.white,
                  buttonColor: Colors.blueAccent,
                  onPress: () {
                    // AppFunc.launchUrlFun(linkedin_url!);
                  },
                ),
              ],
            ),
            SpaceH(inputHeigth: 20),
            Image.asset(
              AppAssets.logo_without_image,
              width: AppSizes.screenWidth * 0.25,
            ),
            Text(
              'Switch v1.0.0',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              translation(context).allRightsReservedToSwitch,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
