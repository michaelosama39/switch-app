import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';
import '../../../Profile/data/model/app_details_model.dart';
import '../controller/profile_cubit.dart';

Future showDialogEditLink(
    context, ProfileCubit cubit, AppDetailsData appDetailsData) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: AppSizes.screenHeight * 0.43,
          width: AppSizes.screenWidth * 0.7,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Image.network(
                        "https://switch.technomasrsystems.com/public/uploads/apps/${appDetailsData.categoryName}/${appDetailsData.account!.icon}"),
                  ),
                  SpaceH(inputHeigth: 10),
                  Text(
                    appDetailsData.account!.name!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpaceH(inputHeigth: 10),
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
                      cubit.editAppDetails(
                          appDetailsData.id!,
                          cubit.accountNameController.text,
                          cubit.accountUrlController.text);
                    },
                  ),
                  SpaceH(inputHeigth: 10),
                  CustomButton(
                    text: translation(context).delete,
                    buttonColor: Colors.red,
                    onPress: () {
                      cubit.deleteApp(appDetailsData.id!);
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
