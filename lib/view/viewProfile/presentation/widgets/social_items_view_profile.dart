import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../../../core/models/applications_model.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/loading_indicator.dart';
import '../../../../widgets/space_height.dart';
import '../../data/model/app_details_model.dart';

class SocialItemsViewProfile extends StatelessWidget {
  const SocialItemsViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ViewProfileCubit.of(context);
    List<AppDetailsData> listOfAllApps = [];
    listOfAllApps.addAll(cubit.listOfAppDetailsDataSocial);
    listOfAllApps.addAll(cubit.listOfAppDetailsDataCreative);
    listOfAllApps.addAll(cubit.listOfAppDetailsDataMusic);
    listOfAllApps.addAll(cubit.listOfAppDetailsDataBusiness);
    return Column(
      children: [
        Wrap(
          spacing: AppSizes.getProportionateScreenWidth(25),
          runSpacing: AppSizes.getProportionateScreenWidth(10),
          alignment: WrapAlignment.start,
          children: List.generate(
            listOfAllApps.length,
            (index) {
              return InkWell(
                onTap: () {
                  AppFunc.launchUrlFun(listOfAllApps[index].url!);
                },
                child: Container(
                  width: AppSizes.getProportionateScreenWidth(60),
                  child: Image.network(
                      "https://switch.technomasrsystems.com/public/uploads/apps/${listOfAllApps[index].categoryName}/${listOfAllApps[index].account!.icon}"),
                ),
              );
            },
          ),
        ),
        SpaceH(inputHeigth: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(40),
          ),
          child: CustomButton(
            text: translation(context).getYourSwitchProduct,
            onPress: () {
              MagicRouter.navigateAndPopAll(BottomNavScreen(
                selectedIndex: 1,
              ));
            },
          ),
        ),
      ],
    );
  }
}
