import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  ResponsiveLayout({required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint){
      if(constraint.maxWidth < 800){
        return mobileLayout;
      }
      else if(constraint.maxWidth < 1100){
        return tabletLayout;
      }
      else{
        return desktopLayout;
      }
    });
  }
}
