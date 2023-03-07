import 'package:flutter/material.dart';
import 'package:flutter_ui_test/utils/routers.dart';
import 'package:go_router/go_router.dart';

import 'utils/locator.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI List"),),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 2,),
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int index) {
          if(index == routes.length){
            return Container();
          }
          return  ListTile(
            title: Text(routes[index].path),
            onTap: () {
              context.go("/" + routes[index].path);
              // Navigator.pushNamed(context, MyRouter.routeNames[index]);
            },
          );
        },
      ),
    );
  }
}
