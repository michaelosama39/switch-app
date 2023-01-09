import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';

class BusinessSection extends StatelessWidget {
  BusinessSection({Key? key}) : super(key: key);

  int lengthOfList = 1;
  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppSizes.screenWidth,
          alignment: Alignment.centerLeft,
          child: Text(
            translation(context).business,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: AppSizes.getProportionateScreenHeight(200),
          child: ListView.builder(
            itemCount:
            lengthOfList >=3 ?  lengthOfList ~/ 3 : 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              lengthOfSubList =
                  (((lengthOfList / 3) - (lengthOfList ~/ 3)) * 10) / 3;
              return Row(
                children: [
                  Column(
                    children: List.generate(
                      lengthOfList >=3 ? 3 : lengthOfList,
                      (index) => Card(
                        child: Container(
                          width: AppSizes.screenWidth * 0.7,
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.getProportionateScreenHeight(10),
                            horizontal:
                                AppSizes.getProportionateScreenWidth(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.facebook),
                                  SpaceW(inputWidth: 5),
                                  Text(
                                    'facebook',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showDialogAddLink(
                                      context, FontAwesomeIcons.facebook);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.grey,
                                    ),
                                    SpaceW(inputWidth: 5),
                                    Text(
                                      translation(context).add,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  index == (lengthOfList ~/ 3) - 1
                      ? Column(
                          children: List.generate(
                            lengthOfSubList!.toInt(),
                            (index) => Card(
                              child: Container(
                                width: AppSizes.screenWidth * 0.7,
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      AppSizes.getProportionateScreenHeight(10),
                                  horizontal:
                                      AppSizes.getProportionateScreenWidth(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(FontAwesomeIcons.facebook),
                                        SpaceW(inputWidth: 5),
                                        Text(
                                          'facebook',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialogAddLink(
                                            context, FontAwesomeIcons.facebook);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color: Colors.grey,
                                          ),
                                          SpaceW(inputWidth: 5),
                                          Text(
                                            translation(context).add,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
