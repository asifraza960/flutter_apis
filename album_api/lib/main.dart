
import 'package:album_api/album_model.dart';
import 'package:album_api/album_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<List<Album>>? _futureAlbums;
    AlbumServices _apiService = AlbumServices();

   

    return Scaffold(
      appBar: AppBar(
        title: Text("AlbumAPi"),
        centerTitle: true,
      
      ),
      body: FutureBuilder(
        future: _futureAlbums, 
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.none){
          return Center(
            child: ElevatedButton(onPressed: (){
          
            }, child: Text("loading....")
            )
          );
        }else if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState==ConnectionState.waiting){
          return Center (child: CircleAvatar(),
          );
        }
      else {
        return Center(child: Text("Somthing went wronng"),);
      }
     
      }
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      ),
    );
  }
}