import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';

import 'add_link_item.dart';

class CreativeSection extends StatelessWidget {
  CreativeSection({Key? key}) : super(key: key);

  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    return BlocBuilder<AddLinksCubit, AddLinksState>(
      builder: (context, state) {
        int listOfCreativeAppsLength = cubit.listOfCreativeApps.length;
        return cubit.listOfCreativeApps.isEmpty
            ? SizedBox()
            : Column(
                children: [
                  Container(
                    width: AppSizes.screenWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      translation(context).creative,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.getProportionateScreenHeight(
                        listOfCreativeAppsLength == 0
                            ? 0
                            : listOfCreativeAppsLength == 1
                                ? AppSizes.getProportionateScreenHeight(80)
                                : listOfCreativeAppsLength == 2
                                    ? AppSizes.getProportionateScreenHeight(185)
                                    : listOfCreativeAppsLength >= 3
                                        ? AppSizes.getProportionateScreenHeight(
                                            240)
                                        : 0),
                    child: ListView.builder(
                      itemCount: cubit.listOfCreativeApps.length >= 3
                          ? cubit.listOfCreativeApps.length ~/ 3
                          : 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, indexCo) {
                        lengthOfSubList =
                            (((cubit.listOfCreativeApps.length / 3) -
                                        (cubit.listOfCreativeApps.length ~/ 3)) *
                                    10) /
                                3;
                        return Row(
                          children: [
                            Column(
                              children: List.generate(
                                cubit.listOfCreativeApps.length >= 3
                                    ? 3
                                    : cubit.listOfCreativeApps.length,
                                (indexIn) => AddLinkItem(
                                  applicationsData: cubit.listOfCreativeApps[
                                      (indexCo * 3) + indexIn],
                                  onTap: () {
                                    showDialogAddLink(
                                      context,
                                      cubit,
                                      cubit.listOfCreativeApps[
                                          (indexCo * 3) + indexIn],
                                      'creative',
                                    );
                                  },
                                ),
                              ),
                            ),
                            indexCo == (cubit.listOfCreativeApps.length ~/ 3) - 1
                                ? Column(
                                    children: List.generate(
                                      lengthOfSubList!.toInt(),
                                      (indexIn) => AddLinkItem(
                                        applicationsData: cubit
                                                .listOfCreativeApps[
                                            ((cubit.listOfCreativeApps.length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                        onTap: () {
                                          showDialogAddLink(
                                            context,
                                            cubit,
                                            cubit.listOfCreativeApps[((cubit
                                                            .listOfCreativeApps
                                                            .length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                            'creative',
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
