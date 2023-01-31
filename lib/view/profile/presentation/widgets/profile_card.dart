import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/space_width.dart';
import '../../../editProfile/presentation/controller/edit_profile_cubit.dart';
import '../../../editProfile/presentation/screens/edit_profile_screen.dart';
import '../screens/qr_code_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.of(context);
    return cubit.userData == null
        ? const SizedBox()
        : Card(
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
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              cubit.userData!.user!.image!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SpaceW(inputWidth: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.userData!.user!.name == null
                                ? 'name'
                                : cubit.userData!.user!.name!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            cubit.userData!.user!.jobTitle == null
                                ? 'job Title'
                                : cubit.userData!.user!.jobTitle!,
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
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          MagicRouter.navigateTo(const EditProfileScreen());
                        },
                      ),
                      TextButton(
                        child: Text(
                          translation(context).qrCode,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          MagicRouter.navigateTo(const QrCodeScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
