

import 'package:hive/hive.dart';

import 'Model.dart';

class Boxes {
  ///idher ham na ya btana ha ka ham na kis class  sa data lana ha getter ka zariya
  static Box<Model> getBoxes() => Hive.box<Model>('notes');
}