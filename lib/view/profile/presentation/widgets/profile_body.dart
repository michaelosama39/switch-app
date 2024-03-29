import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/view/profile/presentation/controller/profile_cubit.dart';
import 'package:switch_app/view/profile/presentation/widgets/profile_appbar.dart';
import 'package:switch_app/view/profile/presentation/widgets/profile_card.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../addLinks/presentation/screens/add_links_screen.dart';
import 'empty_list_apps_widget.dart';
import 'list_of_apps_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final profileCubit = ProfileCubit.of(context);
        return Container(
          padding: EdgeInsets.only(
            top: AppSizes.getProportionateScreenHeight(30),
            left: AppSizes.getProportionateScreenWidth(10),
            right: AppSizes.getProportionateScreenWidth(10),
          ),
          child: Column(
            children: [
              ProfileAppbar(),
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return ProfileCard();
                },
              ),
              SpaceH(inputHeigth: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: AppSizes.getProportionateScreenHeight(45),
                    width: AppSizes.getProportionateScreenWidth(115),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translation(context).direct,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                        Switch(
                          activeColor: AppColors.primaryColor,
                          value: profileCubit.isDircect,
                          onChanged: (value) {
                            profileCubit.changeSelectedDircect();
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(AddLinksScreen());
                    },
                    child: Container(
                      height: AppSizes.getProportionateScreenHeight(45),
                      width: AppSizes.getProportionateScreenWidth(115),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getProportionateScreenWidth(10),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            translation(context).addLink,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.add_circle_outline),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SpaceH(inputHeigth: 5),
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    current is ShowAppDetailsLoaded ||
                    current is DeleteAppStateLoaded ||
                    current is RepositionAppsLoaded,
                builder: (context, state) {
                  if (state is ShowAppDetailsLoaded) {
                    return ProfileCubit.of(context).appDetailsModel == null
                        ? EmptyListAppsWidget()
                        : ListOfAppsWidget();
                  } else if (state is ShowAppDetailsLoading) {
                    return LoadingIndicator();
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
