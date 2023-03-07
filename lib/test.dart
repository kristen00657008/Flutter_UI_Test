import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  ScrollController controller = ScrollController();
  bool isAtTop = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (isAtTop && controller.offset > 10) {
          isAtTop = false;
          controller.animateTo(controller.position.minScrollExtent + 100,
              duration: Duration(milliseconds: 200), curve: Curves.decelerate);
        }
        if(!isAtTop && controller.offset < 10) {
          isAtTop = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
             SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              toolbarHeight: 100,
              collapsedHeight: 100,
              expandedHeight: 350.0,
              centerTitle: true,
              title: isAtTop ? Container() : Text('Demo'),
              flexibleSpace: FlexibleSpaceBar(
                title: isAtTop ? Text('Demo') : Container(),
                collapseMode: CollapseMode.parallax,
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('List Item $index'),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
