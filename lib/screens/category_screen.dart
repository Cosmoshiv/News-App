import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../datas/news_data.dart';
import 'home_screen.dart';

class CategoryNews extends StatefulWidget {
  final String? category;
  CategoryNews({this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<Article> articles = <Article>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    CategoryNewsClass news = CategoryNewsClass();
    await news.getNews(widget.category!);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("NewsViews"),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        //scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Blogtiles(
                            imageUrl: articles[index].urlToImage!,
                            title: articles[index].title!,
                            descrip: articles[index].description!,
                            url: articles[index].articleUrl!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
