import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostDataProvider with ChangeNotifier {
  List<PostModel> post = [];
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }
}

Future<dynamic> getSinglePostData(context) async {
  PostModel result = PostModel();
  List<PostModel> postList = [];
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      for(int i=0;i<10;i++){
        postList.add(PostModel.fromJson(item[i]));
      }
      return postList;
    } else {
      Fluttertoast.showToast(msg:"Data not found", toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.redAccent);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return result;
}
