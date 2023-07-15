
import 'package:hive/hive.dart';
part 'Model.g.dart';
@HiveType(typeId:0)

class Model extends HiveObject {
  @HiveField(1)
  String name;
  @HiveField(2)

  String description;

  Model({required this.name, required this.description});
}
