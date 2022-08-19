import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:providerdemo/models/users_model.dart';

class UsersDataProvider with ChangeNotifier {
  List<UsersModel> post = [];
  bool loading = false;
  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }
}

Future<dynamic> getSinglePostData(context) async {
  UsersModel result = UsersModel();
  List<UsersModel> postList = [];
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      for(int i=0;i<10;i++){
        postList.add(UsersModel.fromJson(item[i]));
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