import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:switch_app/view/profile/presentation/widgets/app_profile_item.dart';
import '../../../../core/models/applications_model.dart';
import '../../../addLinks/presentation/controller/add_links_cubit.dart';

class ListOfAppsWidget extends StatelessWidget {
  ListOfAppsWidget({Key? key}) : super(key: key);

  final Color draggableItemColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final cubit = AddLinksCubit.of(context);
    List<ApplicationsData> listOfAllApps = [];
    listOfAllApps.addAll(cubit.listOfBusinessApps);
    listOfAllApps.addAll(cubit.listOfCreativeApps);
    listOfAllApps.addAll(cubit.listOfMusicApps);
    listOfAllApps.addAll(cubit.listOfSocialApps);
    return Expanded(
      child: ReorderableListView.builder(
        itemCount: listOfAllApps.length,
        proxyDecorator: proxyDecorator,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--;
          final item = listOfAllApps.removeAt(oldIndex);
          listOfAllApps.insert(newIndex, item);
        },
        itemBuilder: (context, index) {
          return AppProfileItem(
            key: Key("${listOfAllApps[index].name}"),
            applicationsData: listOfAllApps[index],
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
