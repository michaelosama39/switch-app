import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';
import '../../../viewProfile/data/model/app_details_model.dart';
import '../controller/profile_cubit.dart';

Future showDialogEditLink(context, ProfileCubit cubit,
    ViewProfileCubit viewProfileCubit, AppDetailsData appDetailsData) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: AppSizes.getProportionateScreenHeight(400),
          width: AppSizes.screenWidth * 0.7,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  SpaceH(inputHeigth: 15),
                  Container(
                    width: AppSizes.getProportionateScreenWidth(50),
                    child: Image.network(
                        "https://switch.technomasrsystems.com/public/uploads/apps/${appDetailsData.categoryName}/${appDetailsData.account!.icon}"),
                  ),
                  Text(
                    appDetailsData.account!.name!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpaceH(inputHeigth: 20),
                  InputFormField(
                    hint: translation(context).pageTitle,
                    validator: (value) => Validator.name(context, value),
                    controller: cubit.accountNameController,
                  ),
                  InputFormField(
                    hint: translation(context).url,
                    controller: cubit.accountUrlController,
                  ),
                  SpaceH(inputHeigth: 30),
                  CustomButton(
                    text: translation(context).save,
                    onPress: () {
                      viewProfileCubit.editAppDetails(
                          appDetailsData.id!,
                          cubit.accountNameController.text,
                          cubit.accountUrlController.text);
                    },
                  ),
                ],
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    MagicRouter.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
