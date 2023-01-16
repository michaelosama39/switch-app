import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../localization/language.dart';
import '../../../../main.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({Key? key}) : super(key: key);

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
          Align(
            alignment: Alignment.centerLeft,
            child: PopupMenuButton(
              icon: const Icon(
                Icons.language,
              ),
              onSelected: (Language language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
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
          Image.asset(
            AppAssets.logo,
            width: AppSizes.getProportionateScreenHeight(180),
            height: AppSizes.getProportionateScreenHeight(180),
          ),
          Text(
            translation(context).resetPassword,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          InputFormField(
            hint: translation(context).password,
            validator: (v)=> Validator.password(context , v),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          InputFormField(
            hint: translation(context).confirmPassword,
            // validator: Validator.confirmPassword(context, value, password),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          SpaceH(inputHeigth: 25),
          CustomButton(
            text: translation(context).confirm,
            onPress: () {
              MagicRouter.navigateAndPopAll(LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
