import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/favourite/presentation/screens/favourite_screen.dart';
import 'package:switch_app/view/myConnections/presentation/widgets/exchange_list.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/connection_item.dart';
import '../../../addConnection/presentation/screens/add_connection_screen.dart';
import 'connection_list.dart';

class MyConnectionsBody extends StatelessWidget {
  const MyConnectionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    MagicRouter.navigateTo(FavouriteScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    MagicRouter.navigateTo(AddConnectionScreen());
                  },
                ),
              ],
            ),
          ),
          InputFormField(
            hint: translation(context).search,
            borderRadius: 10,
            suffixIcon: Icon(Icons.search),
            fillColor: Colors.white,
          ),
          SpaceH(inputHeigth: 10),
          Container(
            width: AppSizes.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: translation(context).connections,
                  buttonColor: Colors.white,
                  fontColor: Colors.black,
                  borderColor: AppColors.primaryColor,
                  radius: 20,
                  paddingVertical: 5,
                  onPress: () {},
                ),
                CustomButton(
                  text: translation(context).exchange,
                  buttonColor: Colors.white,
                  fontColor: Colors.black,
                  borderColor: Colors.grey,
                  radius: 20,
                  paddingVertical: 5,
                  onPress: () {},
                ),
              ],
            ),
          ),
          ConnectionList(),
          // ExchangeList(),
        ],
      ),
    );
  }
}
