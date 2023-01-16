import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../widgets/input_form_field.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          final cubit = EditProfileCubit.of(context);
          return Container(
            padding: EdgeInsets.only(
              top: AppSizes.getProportionateScreenHeight(15),
              left: AppSizes.getProportionateScreenWidth(10),
              right: AppSizes.getProportionateScreenWidth(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: AppSizes.getProportionateScreenWidth(15),
                          left: AppSizes.getProportionateScreenWidth(15),
                          bottom: AppSizes.getProportionateScreenHeight(35)),
                      child: Stack(
                        children: [
                          cubit.backgroundImage != null
                              ? Image.network(cubit.backgroundImage!)
                              : Image.asset(
                            AppAssets.background_profile,
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              width: AppSizes.getProportionateScreenWidth(120),
                              height:
                              AppSizes.getProportionateScreenHeight(120),
                              decoration: BoxDecoration(
                                image: cubit.image != null
                                    ? DecorationImage(
                                  image: NetworkImage(cubit.image!),
                                )
                                    : DecorationImage(
                                  image: AssetImage(AppAssets.avater),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -3,
                              bottom: -5,
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.camera,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InputFormField(
                  hint: 'Dominic Ovo',
                  validator: (v) => Validator.name(context, v),
                  fillColor: Colors.white,
                  icon: Icons.person,
                  controller: cubit.nameController,
                ),
                InputFormField(
                  hint: 'test@gmail.com',
                  validator: (v) => Validator.email(context, v),
                  fillColor: Colors.white,
                  icon: Icons.email_outlined,
                  controller: cubit.emailController,
                ),
                InputFormField(
                  hint: '01000000000',
                  validator: (v) => Validator.phoneNumber(context, v),
                  fillColor: Colors.white,
                  icon: Icons.phone,
                  controller: cubit.phoneController,
                ),
                InputFormField(
                  hint: 'software engineer',
                  validator: (v) => Validator.productTitle(context, v),
                  fillColor: Colors.white,
                  icon: Icons.receipt,
                  controller: cubit.jobTitleController,
                ),
                InputFormField(
                  hint: 'Bio',
                  validator: (v) => Validator.productTitle(context, v),
                  fillColor: Colors.white,
                  icon: Icons.wysiwyg_rounded,
                  controller: cubit.bioController,
                ),
                SpaceH(inputHeigth: 25),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: translation(context).save,
                      onPress: () {
                        cubit.editProfile();
                      },
                    );
                  },
                ),
                SpaceH(inputHeigth: 10),
                CustomButton(
                  text: translation(context).cancel,
                  fontColor: AppColors.primaryColor,
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  onPress: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
