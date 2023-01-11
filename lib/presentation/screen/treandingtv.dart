import 'package:flutter/material.dart';

import '../discription.dart';
import '../widget/customtext.dart';

class TreandingTv extends StatelessWidget {
  final List trendingTv;

  const TreandingTv({Key? key, required this.trendingTv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomText(text: "Treanding Tv", color: Colors.white, size: true),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: trendingTv.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    "https://image.tmdb.org/t/p/w500" +
                                        trendingTv[index]['backdrop_path'],
                                  ),
                                  fit: BoxFit.cover))),
                      CustomText(
                          text:
                              "${trendingTv[index]['original_name'] ?? "loading"}",
                          color: Colors.white),
                    ],
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Description(
                        description: trendingTv[index]['overview'],
                        name: trendingTv[index]['original_name'],
                        // ignore: prefer_interpolation_to_compose_strings
                        bannerurl: "https://image.tmdb.org/t/p/w500" +
                            trendingTv[index]['backdrop_path'],
                        // ignore: prefer_interpolation_to_compose_strings
                        posturl: "https://image.tmdb.org/t/p/w500" +
                            trendingTv[index]['poster_path'],
                        vote: trendingTv[index]['vote_average'].toString(),
                        launchon: trendingTv[index]['first_air_date']);
                  },
                ));
              },
            );
          },
        ),
      )
    ]);
  }
}
