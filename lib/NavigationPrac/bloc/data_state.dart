import 'package:spare_parts/NavigationPrac/model/box_content.dart';

abstract class BoxContentState{}

class BoxContentInitial extends BoxContentState{}

class BoxContentLoading extends BoxContentState{}

class BoxContentLoaded extends BoxContentState{
  final List<BoxContent> contents;
  BoxContentLoaded(this.contents);
}

class BoxContentFailed extends BoxContentState{}