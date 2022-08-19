import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:providerdemo/models/photos_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhotosDataProvider with ChangeNotifier {
  List<PhotosModel> post = [];
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }
}

Future<dynamic> getSinglePostData(context) async {
  PhotosModel result = PhotosModel();
  List<PhotosModel> photosList = [];
  try {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      for(int i=0;i<10;i++){
        photosList.add(PhotosModel.fromJson(item[i]));
      }
      return photosList;
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
