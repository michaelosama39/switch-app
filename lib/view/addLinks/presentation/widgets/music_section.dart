import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/add_link_item.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/show_dialog_add_link.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../controller/add_links_cubit.dart';

class MusicSection extends StatelessWidget {
  MusicSection({Key? key}) : super(key: key);

  double? lengthOfSubList;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    return BlocBuilder<AddLinksCubit, AddLinksState>(
      builder: (context, state) {
        int listOfMusicAppsLength = cubit.listOfMusicApps.length;
        return cubit.listOfMusicApps.isEmpty
            ? SizedBox()
            : Column(
                children: [
                  Container(
                    width: AppSizes.screenWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      translation(context).music,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.getProportionateScreenHeight(
                        listOfMusicAppsLength == 0
                            ? 0
                            : listOfMusicAppsLength == 1
                                ? AppSizes.getProportionateScreenHeight(70)
                                : listOfMusicAppsLength == 2
                                    ? AppSizes.getProportionateScreenHeight(150)
                                    : listOfMusicAppsLength >= 3
                                        ? AppSizes.getProportionateScreenHeight(
                                            200)
                                        : 0),
                    child: ListView.builder(
                      itemCount: cubit.listOfMusicApps.length >= 3
                          ? cubit.listOfMusicApps.length ~/ 3
                          : 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, indexCo) {
                        lengthOfSubList = (((cubit.listOfMusicApps.length / 3) -
                                    (cubit.listOfMusicApps.length ~/ 3)) *
                                10) /
                            3;
                        return Row(
                          children: [
                            Column(
                              children: List.generate(
                                cubit.listOfMusicApps.length >= 3
                                    ? 3
                                    : cubit.listOfMusicApps.length,
                                (indexIn) => AddLinkItem(
                                  applicationsData: cubit
                                      .listOfMusicApps[(indexCo * 3) + indexIn],
                                  onTap: () {
                                    showDialogAddLink(
                                      context,
                                      cubit,
                                      cubit.listOfMusicApps[
                                          (indexCo * 3) + indexIn],
                                      'music',
                                    );
                                  },
                                ),
                              ),
                            ),
                            indexCo == (cubit.listOfMusicApps.length ~/ 3) - 1
                                ? Column(
                                    children: List.generate(
                                      lengthOfSubList!.toInt(),
                                      (indexIn) => AddLinkItem(
                                        applicationsData: cubit.listOfMusicApps[
                                            ((cubit.listOfMusicApps.length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                        onTap: () {
                                          showDialogAddLink(
                                            context,
                                            cubit,
                                            cubit.listOfMusicApps[((cubit
                                                            .listOfMusicApps
                                                            .length ~/
                                                        3) *
                                                    3) +
                                                indexIn],
                                            'music',
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
