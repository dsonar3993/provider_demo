import 'package:flutter/material.dart';
import 'package:providerdemo/services/todos_service.dart';
class TodosList extends StatelessWidget {
   final TodossDataProvider todosData;
   const TodosList({ Key? key,required this.todosData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
        return SwitchListTile(
            title: Text(todosData.post[index].title??""),
            onChanged: (val){},
            value: todosData.post[index].completed??false,
        );
        }) );
  }
}