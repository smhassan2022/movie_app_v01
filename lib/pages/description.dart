import 'package:flutter/material.dart';
import 'package:movie_app_v01/utils/text.dart';

class DescriptionPage extends StatelessWidget {

  final String name, description, bannerurl, posterurl, vote, launch_on;

  const DescriptionPage({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl,
    required this.vote, required this.launch_on }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(

          children: [
            Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network (
                      bannerurl, fit: BoxFit.cover,
                  ),
                ),),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 10,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('Watch Now', style: TextStyle(fontSize: 20, color: Colors.white),),
                        icon:  Icon(Icons.play_arrow, size: 40, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black38 ,
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
            ),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: modified_text(text: name!=null?name:'Not Loaded', size: 22, color: Colors.white,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: modified_text(text:'Releasing On -' +launch_on, size: 13, color: Colors.grey,),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: modified_text(text: 'Average Rating ⭐ ' +vote, size: 13, color: Colors.grey,),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width:  100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(text:description, size: 13, color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
