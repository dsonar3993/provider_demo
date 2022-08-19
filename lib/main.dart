import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:providerdemo/services/photos_service.dart';
import 'package:providerdemo/widgets/albums_widget.dart';
import 'package:providerdemo/widgets/posts_widget.dart';
import 'package:providerdemo/services/albums_service.dart';
import 'package:providerdemo/services/posts_service.dart';
import 'package:providerdemo/services/todos_service.dart';
import 'package:providerdemo/services/users_service.dart';
import 'package:providerdemo/widgets/todos_widget.dart';
import 'package:providerdemo/widgets/users_widget.dart';

import 'widgets/photos_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<PostDataProvider>(create: (_) => PostDataProvider()),
  ChangeNotifierProvider<AlbumsDataProvider>(create: (_) => AlbumsDataProvider()),
  ChangeNotifierProvider<TodossDataProvider>(create: (_) => TodossDataProvider()),
  ChangeNotifierProvider<UsersDataProvider>(create: (_) => UsersDataProvider()),
  ChangeNotifierProvider<PhotosDataProvider>(create: (_) => PhotosDataProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderDemoScreen(),
    );
  }
}

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<PostDataProvider>(context, listen: false);
    postMdl.getPostData(context);
    final albumMdl = Provider.of<AlbumsDataProvider>(context, listen: false);
    albumMdl.getPostData(context);
    final todosMdl = Provider.of<TodossDataProvider>(context, listen: false);
    todosMdl.getPostData(context);
    final usersMdl = Provider.of<UsersDataProvider>(context, listen: false);
    usersMdl.getPostData(context);
    final photosMdl = Provider.of<PhotosDataProvider>(context, listen: false);
    photosMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostDataProvider>(context);
    final albumMdl = Provider.of<AlbumsDataProvider>(context);
    final todosMdl = Provider.of<TodossDataProvider>(context);
    final usersMdl = Provider.of<UsersDataProvider>(context);
    final photosMdl = Provider.of<PhotosDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body:
      activeIndex == 0 ?
       !postMdl.loading?
        PostsList(postData: postMdl) :const Center(child: CircularProgressIndicator())
        :activeIndex == 1 ?
        !albumMdl.loading?
        AlbumsList(albumsData: albumMdl) :const Center(child: CircularProgressIndicator()):
        activeIndex == 2?
        !photosMdl.loading?
        PhotosList(photosData: photosMdl) :const Center(child: CircularProgressIndicator())
        :activeIndex == 3 ?
        !todosMdl.loading?
        TodosList(todosData: todosMdl) :const Center(child: CircularProgressIndicator()):
        activeIndex == 4?
        !usersMdl.loading?
        UsersList(usersData: usersMdl) :const Center(child: CircularProgressIndicator())
        :const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index)=>setState(() {activeIndex=index;}),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "Posts",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album),label: "Albums"),
          BottomNavigationBarItem(icon: Icon(Icons.photo),label: "Photos"),
          BottomNavigationBarItem(icon: Icon(Icons.checklist),label: "ToDo List"),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: "Users")
        ],
      ),
      
    );
  }
}