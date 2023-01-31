import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/connectionDetails/presentation/screen/connection_details_screen.dart';
import 'package:switch_app/view/myConnections/data/model/connection_model.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../core/utils/app_assets.dart';
import '../core/utils/app_sizes.dart';

class ConnectionItem extends StatelessWidget {
  const ConnectionItem(
      {Key? key, required this.onTapMore, required this.getData})
      : super(key: key);

  final Function() onTapMore;
  final ConnectionData getData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          MagicRouter.navigateTo(ConnectionDetailsScreen(
            getData: getData,
          ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(5),
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: AppSizes.getProportionateScreenWidth(70),
                    height: AppSizes.getProportionateScreenHeight(70),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.avater),
                      ),
                    ),
                  ),
                  SpaceW(inputWidth: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getData.name!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        getData.title!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: onTapMore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
