import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fresh_news/models/blogs.dart';
import 'package:http/http.dart' as http;
class News{
List<blogs> blog=[];
Future<void> getnews() async {
  String url = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-12-18&sortBy=publishedAt&apiKey=1d1f4736003047c98488db2d51f545ee";
  var response = await http.get(url);
  var data =jsonDecode(response.body);
    if(data['status'] == 'ok'){
      data["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] != null){
          blogs article = blogs(
            title:element['title'],
        author:element['author'],
        description:element['description'],
        url:element['url'],
        urltoimage:element['urlToImage'],
        publishedat:element['publishedAt'],
        content:element['content']
          );
          blog.add(article);
        }
      }
      );
    }

}
}

class CategoryNewsClass{
  List<blogs> blog=[];
  Future<void> getnews( String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&$category'&apiKey=1d1f4736003047c98488db2d51f545ee";
    var response = await http.get(url);
    var data =jsonDecode(response.body);
    if(data['status'] == 'ok'){
      data["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] != null){
          blogs article = blogs(
              title:element['title'],
              author:element['author'],
              description:element['description'],
              url:element['url'],
              urltoimage:element['urlToImage'],
              publishedat:element['publishedAt'],
              content:element['content']
          );
          blog.add(article);
        }
      }
      );
    }

  }
}
