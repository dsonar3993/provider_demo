import 'package:flutter/material.dart';
import 'package:providerdemo/services/posts_service.dart';
class PostsList extends StatelessWidget {
   final PostDataProvider postData;
   const PostsList({ Key? key,required this.postData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
        return Card(
          child: ListTile(
              title: Text(postData.post[index].title??""),
              subtitle: Text(postData.post[index].body??""),
          ),
        );
        }) );
  }
}