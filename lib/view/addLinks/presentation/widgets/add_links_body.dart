import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/business_section.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/social_media_section.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../../../../widgets/input_form_field.dart';
import 'music_section.dart';

class AddLinksBody extends StatelessWidget {
  const AddLinksBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.getProportionateScreenWidth(10),
          right: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Column(
          children: [
            InputFormField(
              hint: 'search about application',
              suffixIcon: Icon(Icons.search),
              borderRadius: 5,
            ),
            SpaceH(inputHeigth: 10),
            SocialMediaSection(),
            SpaceH(inputHeigth: 10),
            BusinessSection(),
            SpaceH(inputHeigth: 10),
            MusicSection(),
          ],
        ),
      ),
    );
  }
}
