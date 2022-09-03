import 'package:spare_parts/NavigationPrac/data_provider/dataprovider.dart';
import 'package:spare_parts/NavigationPrac/model/box_content.dart';
import 'package:spare_parts/NavigationPrac/utils/either.dart';

class DataRepository{

  DataProvider dataProvider;
  DataRepository(this.dataProvider);

  Future<Either<List<BoxContent>>?> getBoxContents() async {

    try{
      final contents = await dataProvider.getContents();
      return Either(val: contents);
    }catch(e){
      print(e);
      return Either(error: "Loading Contents Failed! Please try again");
    }
  }

  Future<List<BoxContent>> getBoxContent(int id) async {
    try{
      final contents = await dataProvider.getContent(id);
      return contents;
    }catch(e){
      print(e);
      throw Exception("Loading Content Failed! Please try again");
    }
  }

  Future<Either<List<BoxContent>>> serachBoxContent(String value) async {
    try{
      final contents = await dataProvider.searchContents(value);
      return Either(val: contents);
    }catch(e){
      print(e);
      return Either(error: "Searching Contents Failed! Please try again");
    }
  }

}