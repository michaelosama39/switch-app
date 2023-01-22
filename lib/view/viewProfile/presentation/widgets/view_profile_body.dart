import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/viewProfile/presentation/widgets/header_view_profile.dart';
import 'package:switch_app/view/viewProfile/presentation/widgets/social_items_view_profile.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/loading_indicator.dart';
import '../../../addLinks/presentation/controller/add_links_cubit.dart';
import '../../../editProfile/presentation/controller/edit_profile_cubit.dart';

class ViewProfileBody extends StatelessWidget {
  const ViewProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.getProportionateScreenWidth(10),
          right: AppSizes.getProportionateScreenWidth(10),
          bottom: AppSizes.getProportionateScreenHeight(30),
        ),
        child: Column(
          children: [
            BlocBuilder<EditProfileCubit, EditProfileState>(
              builder: (context, state) {
                return EditProfileCubit.of(context).userData == null
                    ? const LoadingIndicator()
                    : HeaderViewProfile();
              },
            ),
            SpaceH(inputHeigth: 10),
            BlocBuilder<AddLinksCubit, AddLinksState>(
              builder: (context, state) {
                return SocialItemsViewProfile();
              },
            )
          ],
        ),
      ),
    );
  }
}
