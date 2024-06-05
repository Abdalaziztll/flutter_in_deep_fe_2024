
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data_from_api/config/core_config.dart';
import 'package:store_data_from_api/model/people_model.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  List<PeopleModel> peopleModel = List.generate(
      core.get<SharedPreferences>().getStringList('peoples')!.length,
      (index) => PeopleModel.fromJson(
          core.get<SharedPreferences>().getStringList('peoples')![index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: peopleModel.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(peopleModel[index].name),
              subtitle: Text(peopleModel[index].message),
            );
          }),
    );
  }
}
