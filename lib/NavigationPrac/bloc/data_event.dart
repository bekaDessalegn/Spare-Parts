abstract class BoxContentEvent{}

class LoadAllBoxContents extends BoxContentEvent{}

class LoadSearchedContents extends BoxContentEvent{
  String value;
  LoadSearchedContents(this.value);
}

class LoadSingleBoxContent extends BoxContentEvent{
  int id;
  LoadSingleBoxContent(this.id);
}