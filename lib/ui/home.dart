import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/ui/category_news.dart';
import 'package:http/http.dart' as http;

import '../helper/news_api_service.dart';
import '../models/article_model.dart';
import '../widgets/category_tile.dart';
import '../widgets/new_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CategoryModel>? cat;
  CategoryModel? categoryModel;
  List<News> newsModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter",
            style: TextStyle(
              color: Colors.black
            ),
            ),
            Text("News",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25
            ),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryDetails.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imageAssetUrl: categoryDetails[index].imageAssetUrl!,
                      categoryName: categoryDetails[index].categorieName!,
                    );
                  }),
            ),
            Container(
              height: 600,
              margin: EdgeInsets.only(top: 16),
              child: FutureBuilder(
                future: NewsService().getApi(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    print(snapshot.data!.articles!.length);
                    print(snapshot.data!.status);
                    return ListView.builder(
                        // itemCount: 4,
                        itemCount: snapshot.data!.articles!.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl:snapshot.data!.articles![index]!.urlToImage.toString(),
                            title: snapshot.data!.articles![index]!.title.toString(),
                            description: snapshot.data!.articles![index]!.description.toString(),
                            content: snapshot.data!.articles![index]!.content.toString(),
                            url: snapshot.data!.articles![index]!.url.toString(),
                          );
                        });

                  }else{
                     return Center(
                       child: CircularProgressIndicator(
                         color: Colors.blue,
                       ),
                     );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
