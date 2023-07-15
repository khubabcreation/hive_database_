import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_database/notes_model/Boxes.dart';
import 'package:hive_local_database/notes_model/Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<Box<Model>>(
          valueListenable: Boxes.getBoxes().listenable(),
          builder: (context, box, _) {
            /// idher ma apni modal class ka data ko list ka andar cast kar raha hun
            var data = box.values.toList().cast<Model>();
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: TextFormField(controller: nameController,
                      decoration: InputDecoration(hintText: 'Name'),

                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: TextFormField(controller: descriptionController,
                      decoration: InputDecoration(hintText: 'Description'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [

                            ListTile(
                              leading: Text(data[index].name.toString()),
                              trailing: IconButton(
                                onPressed: () {
                                  delete(data[index]);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                            ListTile(
                              leading: Text(data[index].description.toString()),
                              trailing: IconButton(
                                onPressed: () {
                                  delete(data[index]);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            /// idher mana variable ka andar data sotre karwa lia ha ....
            final data = Model(
                name: nameController.text,
                description: descriptionController.text);

            /// ab main box get karun ga idher ......
            var box = await Boxes.getBoxes();
            box.add(data);
            data.save();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

void delete(Model model)async{
   await model.delete();
}


}

///here is the flutter hive commandes when we get null value
///flutter packages pub run build_runner build

