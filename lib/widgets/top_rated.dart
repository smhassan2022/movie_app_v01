import 'package:flutter/material.dart';

import '../pages/description.dart';
import '../utils/text.dart';

class TopRated extends StatelessWidget {

  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:"Top Rated Movies", color: Colors.white, size: 18,),
          SizedBox(height: 5),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(
                      name: toprated[index]['title'],
                      bannerurl: 'https://image.tmdb.org/t/p/w500' +toprated[index]['backdrop_path'],
                      posterurl:  'https://image.tmdb.org/t/p/w500' +toprated[index]['poster_path'],
                      description: toprated[index]['overview'],
                      vote: toprated[index]['vote_average'].toString(),
                      launch_on: toprated[index]['release_date'],
                    )));
                  },
                  child: Container(
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
                                  'https://image.tmdb.org/t/p/w500' +toprated[index]['poster_path'],
                                )
                            ),
                          ),
                        ),
                        Container(
                          child: modified_text(text:toprated[index]['title']!=null?
                          toprated[index]['title']:'Loading...', size: 12, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
