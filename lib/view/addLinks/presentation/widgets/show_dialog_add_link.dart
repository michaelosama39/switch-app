import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/models/applications_model.dart';

Future showDialogAddLink(context, AddLinksCubit cubit,
    ApplicationsData applicationsData, String categoryName) {
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
              Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(applicationsData.icon!),
                    ),
                    SpaceH(inputHeigth: 10),
                    Text(
                      applicationsData.name!,
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
                      controller: cubit.pageTitleController,
                    ),
                    InputFormField(
                      hint: translation(context).url,
                      controller: cubit.urlController,
                    ),
                    SpaceH(inputHeigth: 30),
                    CustomButton(
                      text: translation(context).save,
                      onPress: () {
                        cubit.typeId = applicationsData.id;
                        cubit.categoryName = categoryName;
                        cubit.addLink();
                      },
                    ),
                  ],
                ),
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
