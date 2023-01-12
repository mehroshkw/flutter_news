import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';
class NewsService {
  List<News> newsModel = [];
  Future<News?> getApi() async{
  final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=3353fbbbffdf4bb393e6813e9dea573e"));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200){
    print("Successfully called API");
    // for(Map i in data){
    //   newsModel.add(News.fromJson(i));
    // }
    return News.fromJson(data);
  }else{
    return News.fromJson(data);
    print("Error occured during api call");
  }
  }
}

class CategoryNewsService {
  List<News> newsModel = [];
  Future<News?> getApi(String category) async{
    final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=3353fbbbffdf4bb393e6813e9dea573e"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      print("Successfully called API");
      // for(Map i in data){
      //   newsModel.add(News.fromJson(i));
      // }
      return News.fromJson(data);
    }else{
      return News.fromJson(data);
      print("Error occured during api call");
    }
  }
}