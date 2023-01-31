import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/profile/presentation/widgets/show_dialogedit_link.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';
import '../../../Profile/data/model/app_details_model.dart';
import '../../../viewProfile/presentation/controller/view_profile_cubit.dart';
import '../controller/profile_cubit.dart';

class AppProfileItem extends StatefulWidget {
  AppProfileItem({
    Key? key,
    required this.applicationsData,
    required this.index,
    required this.profileCubit,
  }) : super(key: key);

  final AppDetailsData applicationsData;
  final int index;
  final ProfileCubit profileCubit;

  @override
  State<AppProfileItem> createState() => _AppProfileItemState();
}

class _AppProfileItemState extends State<AppProfileItem> {
  bool isChack = false;

  @override
  void initState() {
    widget.applicationsData.status_app == 0 ? isChack = false : isChack = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: widget.profileCubit.isDircect && widget.index == 0
            ? BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              )
            : null,
        padding: EdgeInsets.only(
          right: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onPressed: () {
                    widget.profileCubit.editLink(widget.applicationsData);
                    showDialogEditLink(
                      context,
                      widget.profileCubit,
                      widget.applicationsData,
                    );
                  },
                ),
                SpaceW(inputWidth: 5),
                Container(
                  width: AppSizes.getProportionateScreenWidth(25),
                  child: Image.network(
                      "https://switch.technomasrsystems.com/public/uploads/apps/${widget.applicationsData.categoryName}/${widget.applicationsData.account!.icon}"),
                ),
                SpaceW(inputWidth: 10),
                Text(
                  widget.applicationsData.account!.name!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CupertinoSwitch(
              activeColor: AppColors.primaryColor,
              value: isChack,
              onChanged: (value) {
                setState(() {
                  isChack = value;
                  print(value);
                  widget.profileCubit
                      .changeStatusApp(widget.applicationsData.id!, isChack!);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
