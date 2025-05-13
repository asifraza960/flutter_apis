
import 'dart:convert';

import 'package:album_api/album_model.dart';
import 'package:http/http.dart';

extension ResponseModification  on Response {
  bool get isSuccess => statusCode == 200 || statusCode == 201;
}


class AlbumServices {
  static String basUrl = 'https://jsonplaceholder.typicode.com/';
  String apiUrl = '/albums';
  String get url =>  basUrl + apiUrl;


Future <List<Album>> fetchalbums()async{
  var response = await  get(Uri.parse(url));


  if (response.isSuccess){
    List jesonList = jsonDecode(response.body);
   return jesonList.map((map) => Album.fromMap(map)).toList();
  

  }else{
    throw Exception("Response is not successfull");
  }
}



Future<Album> fetchAlbum(String id)async {
  var response = await get(Uri.parse('/$url/$id'));
  if(response.isSuccess){
    Map <String ,dynamic>  map = jsonDecode(response.body);
    return Album.fromMap(map);
  }else{
       throw Exception("Response is not successfull fatch");
  }
}


// inset 
 Future <bool> insertAlbum(Album album)async{
  var response = await post(Uri.parse(url),body:  album.toJson());
  return response.isSuccess;
  
 }

//  delete
Future <bool> deletealbum(Album album)async{
  var response = await put(Uri.parse('/$url ${album.id}'), body:  album.toJson()  );
  return response.isSuccess;

}

//  update
 Future <bool> updatealbum(Album album)async{
  var response = await post(Uri.parse('/$url ${album.id}'),body:  album.toJson());
  return response.isSuccess;
  
 }

}
