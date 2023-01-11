// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:skilltest/presentation/discription.dart';
import 'package:skilltest/presentation/widget/customtext.dart';

class TreandingMovie extends StatelessWidget {
  final List trending;

  const TreandingMovie({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 25,
      ),
      const CustomText(
          text: "Treanding Movie", color: Colors.white, size: true),
      const SizedBox(
        height: 25,
      ),
      SizedBox(
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: trending.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          trending[index]['poster_path'])))),
                      CustomText(
                        text: "${trending[index]['title'] ?? "loading"}",
                        color: Colors.white,
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Description(
                        description: trending[index]['overview'],
                        name: trending[index]['title'],
                        bannerurl: "https://image.tmdb.org/t/p/w500" +
                            trending[index]['backdrop_path'],
                        posturl: "https://image.tmdb.org/t/p/w500" +
                            trending[index]['poster_path'],
                        vote: trending[index]['vote_average'].toString(),
                        launchon: trending[index]['release_date']);
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
