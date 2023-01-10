import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/forgetPassword/presentation/screens/verfication_code_screen.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../localization/language.dart';
import '../../../../main.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

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
            translation(context).forgetPassword,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          Text(
            translation(context).addYourEmailToSendCode,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          InputFormField(
            hint: translation(context).yourEmail,
            validator: Validator.email,
            fillColor: Colors.white,
            icon: Icons.email_outlined,
          ),
          SpaceH(inputHeigth: 25),
          CustomButton(
            text: translation(context).send,
            onPress: () {
              MagicRouter.navigateTo(VerficationCodeScreen());
            },
          ),
        ],
      ),
    );
  }
}
