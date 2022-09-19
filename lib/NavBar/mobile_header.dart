import 'package:flutter/material.dart';
import 'package:spare_parts/NavBar/models/header_items.dart';
import 'package:spare_parts/NavBar/utils/globals.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    onTap: () {},
  ),
  HeaderItem(title: "MY INTRO", onTap: () {}),
  HeaderItem(title: "SERVICES", onTap: () {}),
  HeaderItem(title: "PORTFOLIO", onTap: () {}),
  HeaderItem(title: "TESTIMONIALS", onTap: () {}),
  HeaderItem(title: "BLOGS", onTap: () {}),
  HeaderItem(
    title: "HIRE ME",
    onTap: () {},
    isButton: true,
  ),
];

class MobileHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Globals.scaffoldKey,
        backgroundColor: Color.fromRGBO(7, 17, 26, 1),
        endDrawer: Drawer(
          backgroundColor: Color.fromRGBO(7, 17, 26, 1),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return headerItems[index].isButton
                      ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextButton(
                        onPressed: headerItems[index].onTap,
                        child: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                      : ListTile(
                    title: Text(
                      headerItems[index].title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: headerItems.length,
              ),
            ),
          ),
        ),
      body: buildMobileHeader(),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState!.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

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
