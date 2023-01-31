import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../widgets/input_form_field.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final cubit = EditProfileCubit.of(context);
          return cubit.userData == null
              ? const LoadingIndicator()
              : Container(
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
                                bottom:
                                    AppSizes.getProportionateScreenHeight(35)),
                            child: Stack(
                              children: [
                                Container(
                                  width: AppSizes.screenWidth,
                                  height: AppSizes.getProportionateScreenHeight(
                                      220),
                                  child: cubit.backgroundImage == null
                                      ? Image.network(
                                          cubit
                                              .userData!.user!.backgroundImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          File(
                                            cubit.backgroundImage!.path,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.camera,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () async {
                                      await cubit.selectBackgroundImage();
                                    },
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
                                    width: AppSizes.getProportionateScreenWidth(
                                        120),
                                    height:
                                        AppSizes.getProportionateScreenHeight(
                                            120),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: cubit.profileImage == null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                cubit.userData!.user!.image!,
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : DecorationImage(
                                              image: FileImage(
                                                File(cubit.profileImage!.path),
                                              ),
                                              fit: BoxFit.cover,
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
                                      onPressed: () async {
                                        await cubit.selectImage();
                                        // final image = await ImagePicker()
                                        //     .pickImage(
                                        //     source: ImageSource.gallery)
                                        //     .then((value) {
                                        //   cubit.image = value!;
                                        //   cubit.selectImage();
                                        // });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      InputFormField(
                        hint: translation(context).name,
                        validator: (v) => Validator.name(context, v),
                        fillColor: Colors.white,
                        icon: Icons.person,
                        controller: cubit.nameController,
                      ),
                      InputFormField(
                        hint: translation(context).lastName,
                        validator: (v) => Validator.name(context, v),
                        fillColor: Colors.white,
                        icon: Icons.person,
                        controller: cubit.lastNameController,
                      ),
                      InputFormField(
                        hint: translation(context).yourEmail,
                        validator: (v) => Validator.email(context, v),
                        fillColor: Colors.white,
                        icon: Icons.email_outlined,
                        controller: cubit.emailController,
                      ),
                      InputFormField(
                        hint: translation(context).phone,
                        validator: (v) => Validator.phoneNumber(context, v),
                        fillColor: Colors.white,
                        icon: Icons.phone,
                        controller: cubit.phoneController,
                      ),
                      InputFormField(
                        hint: translation(context).jobTitle,
                        validator: (v) => Validator.productTitle(context, v),
                        fillColor: Colors.white,
                        icon: Icons.receipt,
                        controller: cubit.jobTitleController,
                      ),
                      InputFormField(
                        hint: translation(context).jopDescription,
                        validator: (v) => Validator.productTitle(context, v),
                        fillColor: Colors.white,
                        icon: Icons.wysiwyg_rounded,
                        controller: cubit.bioController,
                      ),
                      SpaceH(inputHeigth: 25),
                      BlocBuilder<EditProfileCubit, EditProfileState>(
                        builder: (context, state) {
                          return state is EditProfileDataLoading
                              ? LoadingIndicator()
                              : CustomButton(
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
                        onPress: () {
                          MagicRouter.pop();
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
