import 'package:flutter/material.dart';
import 'package:spare_parts/Responsive%20Dashboard/desktop_layout.dart';
import 'package:spare_parts/Responsive%20Dashboard/mobile_layout.dart';
import 'package:spare_parts/Responsive%20Dashboard/responsive_layout.dart';
import 'package:spare_parts/Responsive%20Dashboard/tablet_layout.dart';

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileLayout: MobileLayout(), tabletLayout: TabletLayout(), desktopLayout: DesktopLayout());
  }
}
