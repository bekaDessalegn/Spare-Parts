import 'package:flutter/material.dart';
import 'package:spare_parts/NavBar/desktop_header.dart';
import 'package:spare_parts/NavBar/mobile_header.dart';
import 'package:spare_parts/NavBar/tablet_header.dart';
import 'package:spare_parts/Responsive%20Dashboard/responsive_layout.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileLayout: MobileHeader(), tabletLayout: TabletHeader(), desktopLayout: DesktopHeader());
  }
}
