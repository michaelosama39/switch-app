import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:switch_app/view/profile/presentation/widgets/app_profile_item.dart';
import '../../../../core/models/applications_model.dart';
import '../../../addLinks/presentation/controller/add_links_cubit.dart';
import '../controller/profile_cubit.dart';

class ListOfAppsWidget extends StatelessWidget {
  ListOfAppsWidget({Key? key}) : super(key: key);

  final Color draggableItemColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final addLinksCubit = AddLinksCubit.of(context);
    final profileCubit = ProfileCubit.of(context);
    List<ApplicationsData> listOfAllApps = [];
    List<ApplicationsData> listOfFristApp = [];
    listOfAllApps.addAll(addLinksCubit.listOfBusinessApps);
    listOfAllApps.addAll(addLinksCubit.listOfCreativeApps);
    listOfAllApps.addAll(addLinksCubit.listOfMusicApps);
    listOfAllApps.addAll(addLinksCubit.listOfSocialApps);
    listOfFristApp.insert(0, listOfAllApps.first);
    return Expanded(
      child: ReorderableListView.builder(
        itemCount: profileCubit.isDircect!
            ? listOfFristApp.length
            : listOfAllApps.length,
        proxyDecorator: proxyDecorator,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          final item = listOfAllApps.removeAt(oldIndex);
          listOfAllApps.insert(newIndex, item);
          print(listOfAllApps.first.name);
        },
        itemBuilder: (context, index) {
          return AppProfileItem(
            key: Key("${listOfAllApps[index].name}"),
            applicationsData: profileCubit.isDircect!
                ? listOfFristApp[index]
                : listOfAllApps[index],
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
