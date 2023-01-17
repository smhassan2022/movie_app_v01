import 'package:flutter/material.dart';

import '../pages/description.dart';
import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:"Trending Movies", color: Colors.white, size: 18,),
          SizedBox(height: 5),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index){
                 return InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(
                       name: trending[index]['title'],
                       bannerurl: 'https://image.tmdb.org/t/p/w500' +trending[index]['backdrop_path'],
                       posterurl:  'https://image.tmdb.org/t/p/w500' +trending[index]['poster_path'],
                       description: trending[index]['overview'],
                       vote: trending[index]['vote_average'].toString(),
                       launch_on: trending[index]['release_date'],
                     )));
                   },
                   child: trending[index]['title']!=null?  Container(
                     padding: EdgeInsets.all(3),
                     width: 140,
                     child: Column(
                       children: [
                         Container(
                           height: 210,
                           width: 140,
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +trending[index]['poster_path'],
                               )
                             ),
                           ),
                         ),
                         Container(
                           child: modified_text(text:trending[index]['title']!=null?
                             trending[index]['title']:'Loading...', size: 12, color: Colors.white,),
                         )
                       ],
                     ),
                   ):Container(),
                 );
                },
            ),
          ),
        ],
      ),
    );
  }
}
