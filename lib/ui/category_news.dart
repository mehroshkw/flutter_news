import 'package:flutter/material.dart';

import '../helper/news_api_service.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import '../widgets/new_tile.dart';

class NewsCategory extends StatefulWidget {
  final String category;
  const NewsCategory({required this.category});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  CategoryModel? categoryModel;
  // List<News> newsModel = [];
  // bool _loading = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
        child: Container(
          height: height,
          margin: EdgeInsets.only(top: 16),
          child: FutureBuilder(
            future: CategoryNewsService().getApi(widget.category),
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
      ),
    );
  }
}
