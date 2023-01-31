import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';
import '../../../../core/utils/app_sizes.dart';
import '../controller/add_links_cubit.dart';
import 'add_link_item.dart';

class BusinessSection extends StatelessWidget {
  BusinessSection({Key? key}) : super(key: key);

  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    return BlocBuilder<AddLinksCubit, AddLinksState>(
      builder: (context, state) {
        int listOfBusinessAppsLength = cubit.listOfBusinessApps.length;
        return cubit.listOfBusinessApps.isEmpty
            ? SizedBox()
            : Column(
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
                  SizedBox(
                    height: AppSizes.getProportionateScreenHeight(
                        listOfBusinessAppsLength == 0
                            ? 0
                            : listOfBusinessAppsLength == 1
                                ? AppSizes.getProportionateScreenHeight(80)
                                : listOfBusinessAppsLength == 2
                                    ? AppSizes.getProportionateScreenHeight(185)
                                    : listOfBusinessAppsLength >= 3
                                        ? AppSizes.getProportionateScreenHeight(
                                            240)
                                        : 0),
                    child: ListView.builder(
                      itemCount: cubit.listOfBusinessApps.length >= 3
                          ? cubit.listOfBusinessApps.length ~/ 3
                          : 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, indexCo) {
                        lengthOfSubList = (((cubit.listOfBusinessApps.length /
                                        3) -
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
                                (indexIn) => AddLinkItem(
                                  applicationsData: cubit.listOfBusinessApps[
                                      (indexCo * 3) + indexIn],
                                  onTap: () {
                                    showDialogAddLink(
                                      context,
                                      cubit,
                                      cubit.listOfBusinessApps[
                                          (indexCo * 3) + indexIn],
                                      'business',
                                    );
                                  },
                                ),
                              ),
                            ),
                            indexCo ==
                                    (cubit.listOfBusinessApps.length ~/ 3) - 1
                                ? Column(
                                    children: List.generate(
                                      lengthOfSubList!.toInt(),
                                      (indexIn) => AddLinkItem(
                                        applicationsData: cubit
                                                .listOfBusinessApps[
                                            ((cubit.listOfBusinessApps.length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                        onTap: () {
                                          showDialogAddLink(
                                            context,
                                            cubit,
                                            cubit.listOfBusinessApps[((cubit
                                                            .listOfBusinessApps
                                                            .length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                            'business',
                                          );
                                        },
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
      },
    );
  }
}
