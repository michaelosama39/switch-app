import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/view/forgetPassword/presentation/screens/forget_password_screen.dart';
import 'package:switch_app/view/login/presentation/controller/login_cubit.dart';
import 'package:switch_app/view/login/presentation/widgets/social_item.dart';
import 'package:switch_app/view/register/presentation/screens/register_screen.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/input_form_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(40),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Container(
                width: AppSizes.screenWidth,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () {},
                ),
              ),
              Image.asset(
                AppAssets.logo,
                width: AppSizes.getProportionateScreenHeight(180),
                height: AppSizes.getProportionateScreenHeight(180),
              ),
              Text(
                'Welcome  to switch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              InputFormField(
                hint: 'Your Email',
                validator: Validator.email,
                fillColor: Colors.white,
                icon: Icons.email_outlined,
                controller: cubit.emailController,
              ),
              InputFormField(
                hint: 'Password',
                validator: Validator.password,
                fillColor: Colors.white,
                icon: Icons.lock_outlined,
                secure: true,
                controller: cubit.passwordController,
              ),
              SpaceH(inputHeigth: 25),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.loginState != current.loginState,
                builder: (context, state) {
                  return state.loginState == RequestState.loading
                      ? const LoadingIndicator()
                      : CustomButton(
                          text: 'Sign In',
                          onPress: cubit.login,
                        );
                },
              ),
              SpaceH(inputHeigth: 10),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpaceH(inputHeigth: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialItem(
                    image: AppAssets.google,
                    onTap: () {},
                  ),
                  SpaceW(inputWidth: 30),
                  SocialItem(
                    image: AppAssets.facebook,
                    onTap: () {},
                  ),
                ],
              ),
              SpaceH(inputHeigth: 10),
              TextButton(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                onPressed: () {
                  MagicRouter.navigateTo(const ForgetPasswordScreen());
                },
              ),
              InkWell(
                onTap: () {
                  MagicRouter.navigateAndReplacement(const RegisterScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have a account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' Register',
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
