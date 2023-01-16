import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';
import '../controller/add_links_cubit.dart';

class BusinessSection extends StatelessWidget {
  BusinessSection({Key? key}) : super(key: key);

  // int lengthOfList = 1;
  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
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
        BlocBuilder<AddLinksCubit, AddLinksState>(
          builder: (context, state) {
            return Container(
              height: AppSizes.getProportionateScreenHeight(200),
              child: ListView.builder(
                itemCount: cubit.listOfBusinessApps.length >= 3
                    ? cubit.listOfBusinessApps.length ~/ 3
                    : 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  lengthOfSubList = (((cubit.listOfBusinessApps.length / 3) -
                              (cubit.listOfBusinessApps.length ~/ 3)) *
                          10) /
                      3;
                  return Row(
                    children: [
                      Column(
                        children: List.generate(
                          cubit.listOfBusinessApps.length >= 3
                              ? 3
                              : cubit.listOfBusinessApps.length,
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
                                      Container(
                                        width: AppSizes
                                            .getProportionateScreenWidth(25),
                                        child: Image.network(cubit
                                            .listOfBusinessApps[index].icon!),
                                      ),
                                      SpaceW(inputWidth: 10),
                                      Text(
                                        cubit.listOfBusinessApps[index].name!,
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
                                        context,
                                        FontAwesomeIcons.facebook,
                                        cubit,
                                        cubit.listOfBusinessApps[index],
                                        'business',
                                      );
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
                      index == (cubit.listOfBusinessApps.length ~/ 3) - 1
                          ? Column(
                              children: List.generate(
                                lengthOfSubList!.toInt(),
                                (index) => Card(
                                  child: Container(
                                    width: AppSizes.screenWidth * 0.7,
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          AppSizes.getProportionateScreenHeight(
                                              10),
                                      horizontal:
                                          AppSizes.getProportionateScreenWidth(
                                              15),
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
                                              context,
                                              FontAwesomeIcons.facebook,
                                              cubit,
                                              cubit.listOfBusinessApps[index],
                                              'business',
                                            );
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
            );
          },
        ),
      ],
    );
  }
}
