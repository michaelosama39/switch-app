 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/view/register/presentation/controller/register_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../localization/language.dart';
import '../../../../main.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/loading_indicator.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
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
                translation(context).letsGetStarted,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                translation(context).createAnNewAccount,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              InputFormField(
                hint: translation(context).fullName,
                controller: cubit.nameController,
                validator: (value) => Validator.name(value),
                fillColor: Colors.white,
                icon: Icons.person,
              ),
              InputFormField(
                hint: translation(context).yourEmail,
                controller: cubit.emailController,
                validator: (value) => Validator.email(value),
                fillColor: Colors.white,
                icon: Icons.email_outlined,
              ),
              InputFormField(
                hint: translation(context).yourPhone,
                controller: cubit.phoneController,
                validator: (value) => Validator.phoneNumber(value),
                fillColor: Colors.white,
                icon: Icons.phone,
              ),
              InputFormField(
                hint: translation(context).password,
                controller: cubit.passwordController,
                validator: (value) => Validator.password(value),
                fillColor: Colors.white,
                icon: Icons.lock_outlined,
                secure: true,
              ),
              InputFormField(
                hint: translation(context).confirmPassword,
                controller: cubit.checkPasswordController,
                validator: (value) => Validator.confirmPassword(
                    value, cubit.passwordController.text),
                fillColor: Colors.white,
                icon: Icons.lock_outlined,
                secure: true,
              ),
              SpaceH(inputHeigth: 25),
              BlocBuilder<RegisterCubit, RegisterState>(
                buildWhen: (previous, current) =>
                    previous.registerState != current.registerState,
                builder: (context, state) {
                  return state.registerState == RequestState.loading
                      ? const LoadingIndicator()
                      : CustomButton(
                          text: translation(context).signUp,
                          onPress: cubit.register,
                        );
                },
              ),
              SpaceH(inputHeigth: 10),
              InkWell(
                onTap: () {
                  MagicRouter.navigateAndReplacement(LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translation(context).haveAccount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' ${translation(context).signIn}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
