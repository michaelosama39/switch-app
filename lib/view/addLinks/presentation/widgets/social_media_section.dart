import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';

import 'add_link_item.dart';

class SocialMediaSection extends StatelessWidget {
  SocialMediaSection({Key? key}) : super(key: key);

  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    return BlocBuilder<AddLinksCubit, AddLinksState>(
      builder: (context, state) {
        int listOfSocialAppsLength = cubit.listOfSocialApps.length;
        return cubit.listOfSocialApps.isEmpty
            ? SizedBox()
            : Column(
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
                  SizedBox(
                    height: AppSizes.getProportionateScreenHeight(
                        listOfSocialAppsLength == 0
                            ? 0
                            : listOfSocialAppsLength == 1
                                ? AppSizes.getProportionateScreenHeight(70)
                                : listOfSocialAppsLength == 2
                                    ? AppSizes.getProportionateScreenHeight(130)
                                    : listOfSocialAppsLength >= 3
                                        ? AppSizes.getProportionateScreenHeight(
                            200)
                                        : 0),
                    child: ListView.builder(
                      itemCount: cubit.listOfSocialApps.length >= 3
                          ? cubit.listOfSocialApps.length ~/ 3
                          : 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, indexCo) {
                        lengthOfSubList =
                            (((cubit.listOfSocialApps.length / 3) -
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
                                (indexIn) => AddLinkItem(
                                  applicationsData: cubit.listOfSocialApps[
                                      (indexCo * 3) + indexIn],
                                  onTap: () {
                                    showDialogAddLink(
                                      context,
                                      cubit,
                                      cubit.listOfSocialApps[
                                          (indexCo * 3) + indexIn],
                                      'social',
                                    );
                                  },
                                ),
                              ),
                            ),
                            indexCo == (cubit.listOfSocialApps.length ~/ 3) - 1
                                ? Column(
                                    children: List.generate(
                                      lengthOfSubList!.toInt(),
                                      (indexIn) => AddLinkItem(
                                        applicationsData: cubit
                                                .listOfSocialApps[
                                            ((cubit.listOfSocialApps.length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                        onTap: () {
                                          showDialogAddLink(
                                            context,
                                            cubit,
                                            cubit.listOfSocialApps[((cubit
                                                            .listOfSocialApps
                                                            .length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                            'social',
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
