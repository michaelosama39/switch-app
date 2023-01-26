import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/changePassword/presentation/controller/change_password_cubit.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        final cubit = ChangePasswordCubit.of(context);
        return Container(
          padding: EdgeInsets.only(
            top: AppSizes.getProportionateScreenHeight(10),
            left: AppSizes.getProportionateScreenWidth(10),
            right: AppSizes.getProportionateScreenWidth(10),
          ),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                InputFormField(
                  hint: translation(context).oldPassword,
                  controller: cubit.passwordController,
                  validator: (v) => Validator.password(context, v),
                  fillColor: Colors.white,
                  icon: Icons.lock_outlined,
                  secure: true,
                ),
                InputFormField(
                  hint: translation(context).newPassword,
                  controller: cubit.newPassword,
                  validator: (v) => Validator.password(context, v),
                  fillColor: Colors.white,
                  icon: Icons.lock_outlined,
                  secure: true,
                ),
                InputFormField(
                  hint: translation(context).confirmPassword,
                  controller: cubit.newConfirmPassword,
                  validator: (v) => Validator.confirmPassword(
                      context, v, cubit.newPassword.text),
                  fillColor: Colors.white,
                  icon: Icons.lock_outlined,
                  secure: true,
                ),
                SpaceH(inputHeigth: 30),
                BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    return state is ChangePasswordLoading
                        ? LoadingIndicator()
                        : CustomButton(
                            text: translation(context).changePassword,
                            buttonColor: AppColors.primaryColor,
                            onPress: cubit.changePassword,
                          );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
