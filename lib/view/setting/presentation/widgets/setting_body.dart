import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
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
import '../../../../core/utils/app_func.dart';
import '../../../../localization/language.dart';
import '../../../../main.dart';
import '../../../changePassword/presentation/screens/change_password_screen.dart';
import '../../../help/presentation/screens/help_screen.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                final editProfileCubit = EditProfileCubit.of(context);
                return editProfileCubit.userData == null
                    ? const SizedBox()
                    : Card(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(10),
                      horizontal:
                      AppSizes.getProportionateScreenWidth(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height:
                            AppSizes.getProportionateScreenHeight(90),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(editProfileCubit
                                    .userData!.user!.image!),
                              ),
                            ),
                          ),
                        ),
                        SpaceW(inputWidth: 10),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                editProfileCubit.userData!.user!.name ==
                                    null
                                    ? 'name'
                                    : editProfileCubit
                                    .userData!.user!.name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                editProfileCubit.userData!.user!.email ==
                                    null
                                    ? 'email'
                                    : editProfileCubit
                                    .userData!.user!.email!,
                                textAlign: TextAlign.center,
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
                                  MagicRouter.navigateTo(
                                      ChangePasswordScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.getProportionateScreenWidth(5),
                  ),
                  child: PopupMenuButton(
                    icon: Row(
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
                            (e) =>
                            PopupMenuItem<Language>(
                              value: e,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
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
              ),
            ),
            SettingItem(
              text: translation(context).logOut,
              onTap: () {
                showDialogLogout(context, SettingCubit.of(context));
              },
            ),
            SpaceH(inputHeigth: 20),
            CustomButton(
              text: translation(context).deleteAccount,
              fontColor: Colors.red,
              buttonColor: Colors.black26,
              onPress: () {
                showDialogDeleteAccount(context, SettingCubit.of(context));
              },
            ),
            SpaceH(inputHeigth: 25),
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                final cubit = SettingCubit.of(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      img: AppAssets.facebook_icon,
                      imgColor: Colors.white,
                      buttonColor: Colors.blueAccent,
                      onPress: () {
                        AppFunc.launchUrlFun(cubit.mediaData!.social!.facebook!);
                      },
                    ),
                    SocialButton(
                      img: AppAssets.twitter_icon,
                      imgColor: Colors.white,
                      buttonColor: Colors.blue.withOpacity(0.8),
                      onPress: () {
                        AppFunc.launchUrlFun(cubit.mediaData!.social!.twitter!);
                      },
                    ),
                    SocialButton(
                      img: AppAssets.google_icon,
                      imgColor: Colors.white,
                      buttonColor: Colors.redAccent.withOpacity(0.9),
                      onPress: () {
                        AppFunc.launchUrlFun(cubit.mediaData!.social!.gmail!);
                      },
                    ),
                    SocialButton(
                      img: AppAssets.linkedin_icon,
                      imgColor: Colors.white,
                      buttonColor: Colors.blueAccent,
                      onPress: () {
                        AppFunc.launchUrlFun(cubit.mediaData!.social!.linkedin!);
                      },
                    ),
                  ],
                );
              },
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
