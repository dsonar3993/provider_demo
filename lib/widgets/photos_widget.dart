import 'package:flutter/material.dart';
import 'package:providerdemo/services/photos_service.dart';
class PhotosList extends StatelessWidget {
   final PhotosDataProvider photosData;
   const PhotosList({ Key? key,required this.photosData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        return Stack(
          //crossAxisAlignment: CrossAxisAlignment.center,
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(photosData.post[index].thumbnailUrl??"",scale: 0.25,),
            Container(
              color: Colors.white.withOpacity(0.25), 
              padding: const EdgeInsets.all(8),
              child: Text(photosData.post[index].title??"",maxLines: 2,textAlign: TextAlign.center,))
          ],
        );
      });
  }
}