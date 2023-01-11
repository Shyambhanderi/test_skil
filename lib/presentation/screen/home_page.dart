import 'package:flutter/material.dart';
import 'package:skilltest/presentation/screen/topreatedmovie.dart';
import 'package:skilltest/presentation/screen/treandingtv.dart';
import 'package:skilltest/presentation/widget/customtext.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'treandingmovie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List treandingMovie = [];
  List toptreandingMovie = [];
  List tv = [];
  final String apikey = "d3089b832c3ac67a138a7d200f9ea110";
  final accesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzA4OWI4MzJjM2FjNjdhMTM4YTdkMjAwZjllYTExMCIsInN1YiI6IjYzYmUzODA4ZmMzMWQzMDBhOGRmY2I4YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wFRbQfnEn9DRkfQW4dpFdauXC73EFEfmaahmiqBcGdA";

  void initState() {
    loadmovie();
    super.initState();
  }

  loadmovie() async {
    TMDB tmdbWidth = TMDB(
        ApiKeys(
          apikey,
          accesstoken,
        ),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map result = await tmdbWidth.v3.trending.getTrending();
    Map toptreandingMovieresult = await tmdbWidth.v3.movies.getTopRated();
    Map tvresult = await tmdbWidth.v3.tv.getPopular();
    debugPrint("result ==== $result");
    setState(() {
      treandingMovie = result['results'];
      toptreandingMovie = toptreandingMovieresult['results'];
      tv = tvresult['results'];
    });
    debugPrint("result ==== $tv");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const CustomText(
            text: "Trending Movie or Tv show",
            color: Colors.white,
            size: true,
          )),
      body: ListView(
        children: [
          TreandingMovie(
            trending: treandingMovie,
          ),
          TopTreandingMovie(
            trending: toptreandingMovie,
          ),
          TreandingTv(
            trendingTv: tv,
          ),
        ],
      ),
    );
  }
}
