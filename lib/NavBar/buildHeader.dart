import 'package:flutter/material.dart';
import 'package:spare_parts/NavBar/mobile_header.dart';

Widget buildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderLogo(),
        HeaderRow(),
      ],
    ),
  );
}

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "B",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: headerItems
            .map(
              (item) => item.isButton
              ? MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 5.0),
              child: TextButton(
                onPressed: item.onTap,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
              : MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: item.onTap,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
            .toList(),
    );
  }
}