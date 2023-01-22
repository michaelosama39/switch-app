import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/myConnections/presentation/screens/favourite_screen.dart';
import 'package:switch_app/view/myConnections/presentation/controller/my_connections_cubit.dart';
import 'package:switch_app/view/myConnections/presentation/widgets/exchange_list.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../core/utils/app_sizes.dart';
import '../screens/add_connection_screen.dart';
import 'connection_list.dart';

class MyConnectionsBody extends StatelessWidget {
  const MyConnectionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    MagicRouter.navigateTo(FavouriteScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    MagicRouter.navigateTo(AddConnectionScreen());
                  },
                ),
              ],
            ),
          ),
          InputFormField(
            hint: translation(context).search,
            borderRadius: 10,
            suffixIcon: Icon(Icons.search),
            fillColor: Colors.white,
          ),
          SpaceH(inputHeigth: 10),
          BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
            builder: (context, state) {
              final myConnectionsCubit = MyConnectionsCubit.of(context);
              return Column(
                children: [
                  Container(
                    width: AppSizes.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          text: translation(context).connections,
                          buttonColor: Colors.white,
                          fontColor: Colors.black,
                          borderColor: myConnectionsCubit.myConnection ==
                                  MyConnection.connections
                              ? AppColors.primaryColor
                              : Colors.grey,
                          radius: 20,
                          paddingVertical: 5,
                          onPress: () {
                            myConnectionsCubit.changeTabButton('connection');
                            myConnectionsCubit.getConnectionList();
                          },
                        ),
                        CustomButton(
                          text: translation(context).exchange,
                          buttonColor: Colors.white,
                          fontColor: Colors.black,
                          borderColor: myConnectionsCubit.myConnection ==
                                  MyConnection.exchange
                              ? AppColors.primaryColor
                              : Colors.grey,
                          radius: 20,
                          paddingVertical: 5,
                          onPress: () {
                            myConnectionsCubit.changeTabButton('exchange');
                            myConnectionsCubit.getExchangeList();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          SpaceH(inputHeigth: 10),
          BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
            builder: (context, state) {
              return MyConnectionsCubit.of(context).myConnection ==
                      MyConnection.connections
                  ? ConnectionList()
                  : ExchangeList();
            },
          ),
        ],
      ),
    );
  }
}
