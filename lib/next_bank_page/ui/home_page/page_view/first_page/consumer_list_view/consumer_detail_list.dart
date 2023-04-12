import 'package:flutter/material.dart';

import 'consumer_detail_list_item.dart';

class ConsumerDetailList extends StatefulWidget {
  final bool scrollAble;
  final ScrollController? scrollController;

  const ConsumerDetailList(
      {Key? key, required this.scrollAble, this.scrollController})
      : super(key: key);

  @override
  State<ConsumerDetailList> createState() => _ConsumerDetailListState();
}

class _ConsumerDetailListState extends State<ConsumerDetailList> {
  bool showData = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showData = true;
      });
    });
  }

  void refresh() {
    setState(() {
      showData = false;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showData = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        refresh();
      },
      child: ListView.separated(
        controller: widget.scrollController,
        itemCount: 20,
        // padding: EdgeInsets.zero,
        physics: widget.scrollAble
            ? AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
            : NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ConsumerDetailListItem(
            showData: showData,
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
