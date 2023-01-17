import 'package:flutter/material.dart';

import '../pages/description.dart';
import '../utils/text.dart';

class TV extends StatelessWidget {

  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text:"TV Shows", color: Colors.white, size: 18,),
          SizedBox(height: 5),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionPage(
                      name: tv[index]['original_name'],
                      bannerurl: 'https://image.tmdb.org/t/p/w500' +tv[index]['backdrop_path'],
                      posterurl:  'https://image.tmdb.org/t/p/w500' +tv[index]['poster_path'],
                      description: tv[index]['overview'],
                      vote: tv[index]['vote_average'].toString(),
                      launch_on: tv[index]['release_date'].toString(),
                    )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    width: 240,
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          width: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w300' +tv[index]['poster_path'],
                                ), fit: BoxFit.fill
                            ),
                          ),
                        ),
                        Container(
                          child: modified_text(text:tv[index]['original_name']!=null?
                          tv[index]['original_name']:'Loading...', size: 12, color: Colors.white,),
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
