import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/profile/presentation/screens/qr_code_screen.dart';
import 'package:switch_app/view/viewProfile/presentation/screens/view_profile_screen.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../addLinks/presentation/screens/add_links_screen.dart';
import '../../../editProfile/presentation/screens/edit_profile_screen.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  MagicRouter.navigateTo(ViewProfileScreen());
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppSizes.getProportionateScreenHeight(5)),
                child: Image.asset(
                  AppAssets.logo_without_image,
                  width: AppSizes.getProportionateScreenWidth(140),
                ),
              ),
              IconButton(
                icon: Icon(Icons.ios_share),
                onPressed: () {},
              ),
            ],
          ),
          Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(10),
                horizontal: AppSizes.getProportionateScreenWidth(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: AppSizes.getProportionateScreenWidth(100),
                        height: AppSizes.getProportionateScreenHeight(100),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.avater),
                          ),
                        ),
                      ),
                      SpaceW(inputWidth: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dominic Ovo',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'software engineer',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          MagicRouter.navigateTo(EditProfileScreen());
                        },
                      ),
                      TextButton(
                        child: Text(
                          'QR Code',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          MagicRouter.navigateTo(QrCodeScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SpaceH(inputHeigth: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: AppSizes.getProportionateScreenHeight(45),
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
                  children: [
                    Text(
                      'direct',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                    Switch(
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
                    children: [
                      Text(
                        'add link',
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                            SpaceW(inputWidth: 5),
                            Icon(FontAwesomeIcons.facebook),
                            SpaceW(inputWidth: 10),
                            Text(
                              'facebook',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
