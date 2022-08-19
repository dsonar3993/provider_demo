import 'package:flutter/material.dart';
import 'package:providerdemo/services/albums_service.dart';
class AlbumsList extends StatelessWidget {
   final AlbumsDataProvider albumsData;
   const AlbumsList({ Key? key,required this.albumsData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.collections,size: 72,),
            Text(albumsData.post[index].title??"",maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 14),),
          ],
        );
      },
    );
  }
}