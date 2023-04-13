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
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: widget.scrollController,
      itemCount: 20,
      physics: widget.scrollAble
          ? AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
          : NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ConsumerDetailListItem();
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
