
import 'package:album_api/album_model.dart';
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
       if(snapshot.hasData){

      final album = snapshot.data;
      return ListView.builder (
        itemCount: album?.length,
        itemBuilder: (context,index)=> ListTile(
          title: Text(album![index].id.toString()),
          subtitle: Text(album![index].userId.toString()),
          
        )
        ,);
       }else{
        return Text("something went wromg");
       }
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