import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.childrengridItem});
  final List<Widget> childrengridItem;
 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
       

        return GridView.count(
            padding: EdgeInsets.zero,
            physics:const NeverScrollableScrollPhysics(),
            crossAxisCount: constraints.maxWidth >= 1630?3:constraints.maxWidth >= 700?3:1,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 3.0,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: childrengridItem);
      },
    );
  }
}
