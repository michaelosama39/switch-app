import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/myConnections/presentation/screens/favourite_screen.dart';
import 'package:switch_app/view/myConnections/presentation/controller/my_connections_cubit.dart';
import 'package:switch_app/view/myConnections/presentation/widgets/exchange_list.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../../../../core/appStorage/app_storage.dart';
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
                InkWell(
                  onTap: () {
                    AppFunc.shareText(
                        text:
                        'https://switch-profile.technomasrsystems.com/${AppStorage
                            .getUserId}');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                      vertical: AppSizes.getProportionateScreenHeight(5),
                    ),
                    child: Icon(Icons.share),
                  ),
                ),
                InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(FavouriteScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                      vertical: AppSizes.getProportionateScreenHeight(5),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(AddConnectionScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                      vertical: AppSizes.getProportionateScreenHeight(5),
                    ),
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
            builder: (context, state) {
              final myConnectionsCubit = MyConnectionsCubit.of(context);
              return InputFormField(
                hint: translation(context).search,
                borderRadius: 10,
                suffixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                controller: myConnectionsCubit.searchController,
                onChanged: (v) {
                  myConnectionsCubit.searchTextChanged(v);
                },
              );
            },
          ),
          SpaceH(inputHeigth: 10),
          BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
            builder: (context, state) {
              final myConnectionsCubit = MyConnectionsCubit.of(context);
              return Column(
                children: [
                  Container(
                    width: AppSizes.screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            text: translation(context).connections,
                            buttonColor: Colors.white,
                            fontColor: Colors.black,
                            borderColor: myConnectionsCubit.myConnection ==
                                MyConnection.connections
                                ? AppColors.primaryColor
                                : Colors.grey,
                            radius: 20,
                            paddingVertical: 10,
                            paddingHorizontal: 5,
                            onPress: () {
                              myConnectionsCubit.changeTabButton('connection');
                              myConnectionsCubit.getConnectionList();
                            },
                          ),
                        ),
                        SpaceW(inputWidth: 15),
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              CustomButton(
                                text: translation(context).exchange,
                                buttonColor: Colors.white,
                                fontColor: Colors.black,
                                borderColor: myConnectionsCubit.myConnection ==
                                    MyConnection.exchange
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                radius: 20,
                                paddingVertical: 10,
                                paddingHorizontal: 5,
                                onPress: () {
                                  myConnectionsCubit
                                      .changeTabButton('exchange');
                                  myConnectionsCubit.getExchangeList();
                                },
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                right: 25,
                                child: myConnectionsCubit
                                    .listOfExchangeData.isEmpty
                                    ? SizedBox()
                                    : Container(
                                  width: AppSizes
                                      .getProportionateScreenWidth(8),
                                  height: AppSizes
                                      .getProportionateScreenHeight(
                                      8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
              return MyConnectionsCubit
                  .of(context)
                  .myConnection ==
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
