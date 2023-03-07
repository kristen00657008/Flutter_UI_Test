import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({Key? key}) : super(key: key);

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height - kToolbarHeight) *
                    0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 3, color: Colors.brown)),
                child: Stack(
                  children: [
                    TextField(
                      maxLines: null,
                      expands: true,
                      controller: controller,
                      onChanged: (text) {
                        setState(() {});
                      },
                      style: TextStyle(fontSize: 30),
                      decoration: null,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.copy),
                          onPressed: () {
                            print("Pressed");
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height:
                    (MediaQuery.of(context).size.height - kToolbarHeight) * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                padding: EdgeInsets.all(3),
                child: AutoSizeText(
                  controller.text,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
