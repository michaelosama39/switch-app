import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';

class HeaderViewProfile extends StatelessWidget {
  const HeaderViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.of(context);
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          width: AppSizes.getProportionateScreenWidth(115),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: AppSizes.getProportionateScreenWidth(15),
                  left: AppSizes.getProportionateScreenWidth(15),
                  bottom: AppSizes.getProportionateScreenHeight(35)),
              child: Image.network(cubit.userData!.user!.backgroundImage!),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: AppSizes.getProportionateScreenWidth(90),
                height: AppSizes.getProportionateScreenHeight(90),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(cubit.userData!.user!.image!),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          cubit.userData!.user!.name == null
              ? 'name'
              : cubit.userData!.user!.name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ),
        Text(
          cubit.userData!.user!.jobTitle == null
              ? 'job Title'
              : cubit.userData!.user!.jobTitle!,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        Text(
          cubit.userData!.user!.bio == null
              ? 'Bio'
              : cubit.userData!.user!.bio!,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        CustomButton(
          text: translation(context).connectWithMe,
          onPress: () {},
        ),
      ],
    );
  }
}
