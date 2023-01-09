import 'package:flutter/material.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/business_section.dart';
import 'package:switch_app/view/addLinks/presentation/widgets/social_media_section.dart';
import 'package:switch_app/widgets/space_height.dart';
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
              hint: translation(context).searchAboutApplication,
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
