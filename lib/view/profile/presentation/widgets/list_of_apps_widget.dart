import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:switch_app/view/profile/presentation/widgets/app_profile_item.dart';

import '../controller/profile_cubit.dart';

class ListOfAppsWidget extends StatelessWidget {
  ListOfAppsWidget({Key? key}) : super(key: key);

  final Color draggableItemColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final profileCubit = ProfileCubit.of(context);
    profileCubit.listOfAllApps.addAll(profileCubit.appDetailsModel!.accounts!);
    return Expanded(
      child: ReorderableListView.builder(
        itemCount: profileCubit.appDetailsModel!.accounts!.length,
        proxyDecorator: proxyDecorator,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          final item =
              profileCubit.appDetailsModel!.accounts!.removeAt(oldIndex);
          profileCubit.appDetailsModel!.accounts!.insert(newIndex, item);
          profileCubit.listOfAllApps.clear();
          profileCubit.listOfAllApps
              .addAll(profileCubit.appDetailsModel!.accounts!);
          profileCubit.repositionApps(
              profileCubit.listOfAllApps[oldIndex].id.toString(),
              profileCubit.listOfAllApps[newIndex].id.toString());
        },
        itemBuilder: (context, index) {
          return AppProfileItem(
            key: Key("$index"),
            applicationsData: profileCubit.appDetailsModel!.accounts![index],
            index: index,
            profileCubit: profileCubit,
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
