import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/profile/presentation/widgets/show_dialogedit_link.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';
import '../../../viewProfile/data/model/app_details_model.dart';
import '../../../viewProfile/presentation/controller/view_profile_cubit.dart';
import '../controller/profile_cubit.dart';

class AppProfileItem extends StatefulWidget {
  AppProfileItem({
    Key? key,
    required this.applicationsData,
    required this.index,
    required this.profileCubit, required this.viewProfileCubit,
  }) : super(key: key);

  final AppDetailsData applicationsData;
  final int index;
  final ProfileCubit profileCubit;
  final ViewProfileCubit viewProfileCubit;

  @override
  State<AppProfileItem> createState() => _AppProfileItemState();
}

class _AppProfileItemState extends State<AppProfileItem> {
  bool isCheck = false;

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
                  onPressed: () {
                    widget.profileCubit.editLink(widget.applicationsData);
                    showDialogEditLink(
                      context,
                      widget.profileCubit,
                      widget.viewProfileCubit,
                      widget.applicationsData,
                    );
                  },
                ),
                SpaceW(inputWidth: 5),
                Container(
                  width: AppSizes.getProportionateScreenWidth(25),
                  child: Image.network(
                      "https://switch.technomasrsystems.com/public/uploads/apps/${widget
                          .applicationsData.categoryName}/${widget
                          .applicationsData.account!.icon}"),
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
            Switch(
              activeColor: AppColors.primaryColor,
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  isCheck = value;
                  widget.viewProfileCubit.changeStatusApp(widget.applicationsData.id!, isCheck);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
