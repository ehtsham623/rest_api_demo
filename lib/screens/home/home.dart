import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_demo/constants/labels.dart';
import 'package:rest_api_demo/constants/ui_settings.dart';
import 'package:rest_api_demo/core/models/userModel.dart';
import 'package:rest_api_demo/core/providers/homeProvider.dart';
import 'package:rest_api_demo/screens/home/userListItem.dart';
import 'package:rest_api_demo/screens/shared/drawer/mDrawer.dart';
import 'package:rest_api_demo/screens/shared/mCircularIndicator.dart';
import 'package:rest_api_demo/screens/shared/noDataFoundWidget.dart';

class Home extends StatefulWidget {
  static const route = 'Home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<HomeProvider>().getUser(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Label.users,
          style: Theme.of(context).textTheme.bodyText1!,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              context.watch<HomeProvider>().isLoadingUser
                  ? const Padding(
                      padding: EdgeInsets.all(subPadding),
                      child: MCircularIndicator(),
                    )
                  : context.watch<HomeProvider>().userModel == null
                      ? const NoDataFoundWidget()
                      : usersListWidget(context),
            ],
          ),
        ),
      ),
      drawer: const MDrawer(),
    );
  }

  ///show all user in list
  Widget usersListWidget(BuildContext? context) {
    return Expanded(
      child: ListView.builder(
        itemCount: context!.watch<HomeProvider>().userModel?.data?.length,
        itemBuilder: (context, index) {
          return UserListItem(
            user: context.watch<HomeProvider>().userModel?.data?[index],
          );
        },
      ),
    );
  }
}
