import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/view/profile/presentation/widgets/profile_appbar.dart';
import 'package:switch_app/view/profile/presentation/widgets/profile_card.dart';
import 'package:switch_app/view/viewProfile/presentation/screens/view_profile_screen.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../addLinks/presentation/screens/add_links_screen.dart';
import 'list_of_apps_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
        // bottom: AppSizes.getProportionateScreenHeight(10),
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
                      value: true,
                      onChanged: (value) {},
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
          SpaceH(inputHeigth: 3),
          BlocBuilder<AddLinksCubit, AddLinksState>(
            builder: (context, state) {
              return ListOfAppsWidget();
            },
          ),
        ],
      ),
    );
  }
}
