import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_news/Data/News.dart';
import 'package:fresh_news/Data/data.dart';
import 'package:fresh_news/Pages/artice.dart';
import 'package:fresh_news/Pages/category.dart';
import 'package:fresh_news/models/blogs.dart';
import 'package:fresh_news/models/categorymodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<categorymodel> categories = new List <categorymodel>();
  List<blogs> articles = new List<blogs>();
  bool loading =true;
  @override
   void initState(){
    super.initState();
    categories=getcategories();
    getNews();
  }

  getNews() async{
    News news =News();
    await news.getnews();
    articles =news.blog;
    setState(() {
      loading =false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.pink,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Fresh',
              style: TextStyle(
                color: Colors.black
              ),
            ),
            Text('News',
              style: TextStyle(
                  color: Colors.pink
              ),
            )
          ],
        ),
      ),
      body: loading ? Container(
        child:Center(child: CircularProgressIndicator()),
      ):

      SingleChildScrollView(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                      return Tile(
                        imageurl:categories[index].imageurl ,
                        name: categories[index].name,
                      );
                      },
                  ),
                ),
                ///blogs
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Container(

                    child:ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                        return BlockTile(
                          imageurl:articles[index].urltoimage ,
                          title:articles[index].title ,
                          desc: articles[index].description,
                          url:articles[index].url,
                        );
                        }
                    )
                  ),
                )


              ],
            ),
          )
        ),
      )
    );
  }
}
class Tile extends StatelessWidget {
  final imageurl,name;
  Tile({this.imageurl,this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(
          category: name.toString().toLowerCase(),
        )));
      },
      child: Container(
      margin: EdgeInsets.only(right: 13.0),
        child:Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
                child:CachedNetworkImage(imageUrl: imageurl,width:120.0,height: 80.0,fit: BoxFit.cover,)),
            Container(
                alignment: Alignment.center,
                child:Text(name,style:TextStyle(
                color: Colors.white,
                  fontSize: 18.0,
                  decoration: TextDecoration.underline,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold,
                  )
                )
            ),

          ],
        )
      ),
    );
  }
}
class BlockTile extends StatelessWidget {
  final String imageurl,title,desc,url;
  BlockTile(
      {@required this.url,@required this.imageurl,@required this.title,@required this.desc}
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
            builder: (context)=>ArticleView(
            imageurl:url,
            )
        ));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
                child: Image.network(imageurl)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: TextStyle(
                fontSize: 20.0,
                fontWeight:FontWeight.w800,
                fontStyle:FontStyle.italic,
                decoration:TextDecoration.underline,

              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text

                (desc,style: TextStyle(
                color: Colors.black54,
                fontSize: 17.0,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

