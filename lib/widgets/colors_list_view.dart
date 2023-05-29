import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, required this.isActive});
  final bool isActive;
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> colors = [
    Color(0xff292F36),
    Color(0xff4ECDC4),
    Color(0xffFFFFFF),
    Color(0xffFF6B6B),
    Color(0xff987284),
    Color(0xff9DBF9E),
    Color(0xffD0D6B5),
    Color(0xffF9B5AC),
    Color(0xffEE7674),
    Color(0xff82D173),
    Color(0xff95A3B3),
    Color(0xff4C2C69),
    Color(0xff42253B)
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                    ;
                  },
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: colors[index],
                  ),
                ));
          }),
    );
  }
}
