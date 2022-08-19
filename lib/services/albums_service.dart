import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/albums_model.dart';

class AlbumsDataProvider with ChangeNotifier {
  List<AlbumsModel> post = [];
  bool loading = false;
  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }
}

Future<dynamic> getSinglePostData(context) async {
  AlbumsModel result = AlbumsModel();
  List<AlbumsModel> postList = [];
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      for(int i=0;i<10;i++){
        postList.add(AlbumsModel.fromJson(item[i]));
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