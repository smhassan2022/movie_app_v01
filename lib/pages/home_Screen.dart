import 'package:flutter/material.dart';
import 'package:movie_app_v01/widgets/top_rated.dart';
import 'package:movie_app_v01/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apiKey = '2274dd6db1982715a463101c2ebac820';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjc0ZGQ2ZGIxOTgyNzE1YTQ2MzEwMWMyZWJhYzgyMCIsInN1YiI6IjYzYzQ1ODE3YWFlYzcxMDBmMGZiZDUwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.M-HiTPVcN47AnYMbAqw0K7ynsD4HGALsAj8pcvYOuEM';

  void initState(){
    loadmovies();
    super.initState();
  }

  // function for load movies by API
  loadmovies()async{
    TMDB tmbdWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    Map trendingresult = await tmbdWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmbdWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmbdWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });

    print(tv);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
       // centerTitle: true,
        title: Text('Eyeflix 👀'.toUpperCase(),
        style: TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          TextButton.icon(onPressed: (){},
              label: Text("Find Movie", style: TextStyle(color: Colors.white),),
              icon:Icon(Icons.search, color: Colors.white,),)
        ],
      ),
      body: ListView(
          children: [
            TV(tv: tv),
            TopRated(toprated: topratedmovies),
            TrendingMovies(trending:trendingmovies)
          ],
      ),
    );
  }
}
