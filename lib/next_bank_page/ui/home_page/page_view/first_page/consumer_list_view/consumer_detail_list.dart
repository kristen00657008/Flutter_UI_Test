import 'package:flutter/material.dart';

import 'consumer_detail_list_item.dart';

class ConsumerDetailList extends StatelessWidget {
  final bool scrollAble;
  final ScrollController? scrollController;
  const ConsumerDetailList({Key? key, required this.scrollAble, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: 20,
      // padding: EdgeInsets.zero,
      physics: scrollAble
          ? AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
          : NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ConsumerDetailListItem();
      }, separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }
}
