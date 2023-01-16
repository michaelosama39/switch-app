import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/space_width.dart';

class SocialMediaSection extends StatelessWidget {
  SocialMediaSection({Key? key}) : super(key: key);

  // int lengthOfList = 5;
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
            translation(context).socialMedia,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
        BlocBuilder<AddLinksCubit, AddLinksState>(
          builder: (context, state) {
            return SizedBox(
              height: AppSizes.getProportionateScreenHeight(200),
              child: ListView.builder(
                itemCount: cubit.listOfSocialApps.length >= 3
                    ? cubit.listOfSocialApps.length ~/ 3
                    : 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  lengthOfSubList = (((cubit.listOfSocialApps.length / 3) -
                              (cubit.listOfSocialApps.length ~/ 3)) *
                          10) /
                      3;
                  return Row(
                    children: [
                      Column(
                        children: List.generate(
                          cubit.listOfSocialApps.length >= 3
                              ? 3
                              : cubit.listOfSocialApps.length,
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
                                            .listOfSocialApps[index].icon!),
                                      ),
                                      SpaceW(inputWidth: 10),
                                      Text(
                                        cubit.listOfSocialApps[index].name!,
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
                                          cubit.listOfSocialApps[index],
                                          'social');
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
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
                      index == (cubit.listOfSocialApps.length ~/ 3) - 1
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
                                            Container(
                                              width: AppSizes
                                                  .getProportionateScreenWidth(
                                                      25),
                                              child: Image.network(cubit
                                                  .listOfSocialApps[index]
                                                  .icon!),
                                            ),
                                            SpaceW(inputWidth: 10),
                                            Text(
                                              cubit.listOfSocialApps[index]
                                                  .name!,
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
                                                cubit.listOfSocialApps[index],
                                                'social');
                                          },
                                          child: Row(
                                            children: [
                                              const Icon(
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
                          : const SizedBox(),
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
