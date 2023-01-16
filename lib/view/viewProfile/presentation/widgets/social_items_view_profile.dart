import 'package:flutter/material.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/models/applications_model.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/loading_indicator.dart';
import '../../../../widgets/space_height.dart';

class SocialItemsViewProfile extends StatelessWidget {
  const SocialItemsViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    List<ApplicationsData> listOfAllApps = [];
    listOfAllApps.addAll(cubit.listOfBusinessApps);
    listOfAllApps.addAll(cubit.listOfCreativeApps);
    listOfAllApps.addAll(cubit.listOfMusicApps);
    listOfAllApps.addAll(cubit.listOfSocialApps);
    return GetAllAppsState().applicationsState == RequestState.loading
        ? LoadingIndicator()
        : Column(
            children: [
              Wrap(
                spacing: AppSizes.getProportionateScreenWidth(25),
                runSpacing: AppSizes.getProportionateScreenWidth(10),
                alignment: WrapAlignment.start,
                children: List.generate(
                  listOfAllApps.length,
                  (index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: AppSizes.getProportionateScreenWidth(60),
                        child: Image.network(listOfAllApps[index].icon!),
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
