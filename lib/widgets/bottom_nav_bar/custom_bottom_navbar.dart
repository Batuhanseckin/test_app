import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/manager/ui_helper.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatelessWidget {
  BuildContext context;
  final Function(int) onPress;
  final int currentIndex;
  CustomBottomNavBar({Key key, this.onPress, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      height: UIHelper.dynamicHeight(67),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem(
            "HomeScreen",
            Icons.home,
            0,
          ),
          SizedBox(width: UIHelper.dynamicWidth(51)),
          _buildItem(
            "Tickets",
            Icons.description_outlined,
            1,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String title,
    IconData icon,
    int index,
  ) {
    return InkWell(
      onTap: () {
        onPress(index);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: UIHelper.dynamicSp(27),
            color: currentIndex == index ? Color(0xFFFE5301) : null,
          ),
          SizedBox(width: UIHelper.dynamicWidth(14)),
          Text(
            title,
            style: GoogleFonts.workSans().copyWith(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: UIHelper.dynamicSp(14),
              color: currentIndex == index ? Color(0xFFFE5301) : null,
            ),
          ),
        ],
      ),
    );
  }
}
