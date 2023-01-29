import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:switch_app/view/profile/presentation/widgets/app_profile_item.dart';
import '../../../viewProfile/presentation/controller/view_profile_cubit.dart';
import '../controller/profile_cubit.dart';

class ListOfAppsWidget extends StatelessWidget {
  ListOfAppsWidget({Key? key}) : super(key: key);

  final Color draggableItemColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final cubit = ViewProfileCubit.of(context);
    final profileCubit = ProfileCubit.of(context);
    profileCubit.listOfAllApps.addAll(cubit.listOfAppDetailsData);
    return Expanded(
      child: ReorderableListView.builder(
        itemCount: cubit.listOfAppDetailsData.length,
        proxyDecorator: proxyDecorator,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          final item = cubit.listOfAppDetailsData.removeAt(oldIndex);
          cubit.listOfAppDetailsData.insert(newIndex, item);
          profileCubit.listOfAllApps.clear();
          profileCubit.listOfAllApps.addAll(cubit.listOfAppDetailsData);
        },
        itemBuilder: (context, index) {
          return AppProfileItem(
            key: Key("$index"),
            applicationsData: cubit.listOfAppDetailsData[index],
            index: index,
            profileCubit: profileCubit,
            viewProfileCubit: ViewProfileCubit.of(context),
          );
        },
      ),
    );
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: draggableItemColor,
          shadowColor: draggableItemColor,
          child: child,
        );
      },
      child: child,
    );
  }
}
