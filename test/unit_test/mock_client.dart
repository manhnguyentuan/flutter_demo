import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_review_movie/core/core.dart';
import 'package:flutter_review_movie/inject.dart';

void main() {
  group("Api provider test", () {
    test("fetch movie list succses test", () async {
      Injection.initInjection();
      var dio = Injection.injector.get<Dio>();
      var response = await dio.get(
          "http://api.themoviedb.org/3/movie/now_playing?api_key=e0cfbba4815cad8a435c7caa472ab7bf");

//      expect(
//          response.data,
//          {
//            "results": [
//              {
//                "vote_count": 1214,
//                "id": 420818,
//                "video": false,
//                "vote_average": 7.2,
//                "title": "The Lion King",
//                "popularity": 409.507,
//                "poster_path": "/dzBtMocZuJbjLOXvrl4zGYigDzh.jpg",
//                "original_language": "en",
//                "original_title": "The Lion King",
//                "genre_ids": [
//                  12,
//                  16,
//                  10751,
//                  18,
//                  28
//                ],
//                "backdrop_path": "/1TUg5pO1VZ4B0Q1amk3OlXvlpXV.jpg",
//                "adult": false,
//                "overview": "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.",
//                "release_date": "2019-07-12"
//              },
//              {
//                "vote_count": 8168,
//                "id": 299534,
//                "video": false,
//                "vote_average": 8.4,
//                "title": "Avengers: Endgame",
//                "popularity": 385.304,
//                "poster_path": "/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
//                "original_language": "en",
//                "original_title": "Avengers: Endgame",
//                "genre_ids": [
//                  12,
//                  878,
//                  28
//                ],
//                "backdrop_path": "/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg",
//                "adult": false,
//                "overview": "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
//                "release_date": "2019-04-24"
//              },
//              {
//                "vote_count": 27,
//                "id": 566555,
//                "video": false,
//                "vote_average": 5.1,
//                "title": "Detective Conan: The Fist of Blue Sapphire",
//                "popularity": 236.663,
//                "poster_path": "/86Y6qM8zTn3PFVfCm9J98Ph7JEB.jpg",
//                "original_language": "ja",
//                "original_title": "名探偵コナン 紺青の拳（フィスト）",
//                "genre_ids": [
//                  16,
//                  28,
//                  18,
//                  9648,
//                  35
//                ],
//                "backdrop_path": "/wf6VDSi4aFCZfuD8sX8JAKLfJ5m.jpg",
//                "adult": false,
//                "overview": "23rd movie in the \"Detective Conan\" franchise.",
//                "release_date": "2019-04-12"
//              },
//              {
//                "vote_count": 2641,
//                "id": 429617,
//                "video": false,
//                "vote_average": 7.8,
//                "title": "Spider-Man: Far from Home",
//                "popularity": 208.197,
//                "poster_path": "/rjbNpRMoVvqHmhmksbokcyCr7wn.jpg",
//                "original_language": "en",
//                "original_title": "Spider-Man: Far from Home",
//                "genre_ids": [
//                  28,
//                  12,
//                  878
//                ],
//                "backdrop_path": "/dihW2yTsvQlust7mSuAqJDtqW7k.jpg",
//                "adult": false,
//                "overview": "Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.",
//                "release_date": "2019-06-28"
//              },
//              {
//                "vote_count": 6,
//                "id": 559981,
//                "video": false,
//                "vote_average": 2.3,
//                "title": "Chasing the Dragon 2 : Master of Ransom",
//                "popularity": 186.549,
//                "poster_path": "/7zkFBGCYtvOvYJAlnoCmMKQzu3m.jpg",
//                "original_language": "zh",
//                "original_title": "Chasing the Dragon 2 : Master of Ransom",
//                "genre_ids": [],
//                "backdrop_path": null,
//                "adult": false,
//                "overview": "'Chasing the Dragon 2 : Master of Ransom' is based on a real-life spate of kidnappings that terrorised Hong Kong’s elite in the 1990's. Tony Leung Ka-fai plays the kidnap kingpin, while Louis Koo is the undercover agent who infiltrates his gang.",
//                "release_date": "2019-07-19"
//              },
//              {
//                "vote_count": 33,
//                "id": 384018,
//                "video": false,
//                "vote_average": 6.5,
//                "title": "Fast & Furious Presents: Hobbs & Shaw",
//                "popularity": 152.988,
//                "poster_path": "/keym7MPn1icW1wWfzMnW3HeuzWU.jpg",
//                "original_language": "en",
//                "original_title": "Fast & Furious Presents: Hobbs & Shaw",
//                "genre_ids": [
//                  28
//                ],
//                "backdrop_path": "/fgPZgeqxDKIw86pBiAyLhh0vTrU.jpg",
//                "adult": false,
//                "overview": "A spinoff of The Fate of the Furious, focusing on Johnson's US Diplomatic Security Agent Luke Hobbs forming an unlikely alliance with Statham's Deckard Shaw.",
//                "release_date": "2019-08-01"
//              },
//              {
//                "vote_count": 293,
//                "id": 459992,
//                "video": false,
//                "vote_average": 6.8,
//                "title": "Long Shot",
//                "popularity": 109.556,
//                "poster_path": "/m2ttWZ8rMRwIMT7zA48Jo6mTkDS.jpg",
//                "original_language": "en",
//                "original_title": "Long Shot",
//                "genre_ids": [
//                  35,
//                  10749
//                ],
//                "backdrop_path": "/88r25ghJzVYKq0vaOApqEOZsQlD.jpg",
//                "adult": false,
//                "overview": "When Fred Flarsky reunites with and charms his first crush, Charlotte Field—one of the most influential women in the world. As Charlotte prepares to make a run for the Presidency, she hires Fred as her speechwriter and sparks fly.",
//                "release_date": "2019-05-02"
//              },
//              {
//                "vote_count": 139,
//                "id": 466272,
//                "video": false,
//                "vote_average": 7.4,
//                "title": "Once Upon a Time in Hollywood",
//                "popularity": 104.42,
//                "poster_path": "/8j58iEBw9pOXFD2L0nt0ZXeHviB.jpg",
//                "original_language": "en",
//                "original_title": "Once Upon a Time in Hollywood",
//                "genre_ids": [
//                  18,
//                  35,
//                  28,
//                  80,
//                  37
//                ],
//                "backdrop_path": "/b82nVVhYNRgtsTFV1jkdDwe6LJZ.jpg",
//                "adult": false,
//                "overview": "A faded television actor and his stunt double strive to achieve fame and success in the film industry during the final years of Hollywood's Golden Age in 1969 Los Angeles.",
//                "release_date": "2019-07-25"
//              },
//              {
//                "vote_count": 846,
//                "id": 373571,
//                "video": false,
//                "vote_average": 6.3,
//                "title": "Godzilla: King of the Monsters",
//                "popularity": 102.022,
//                "poster_path": "/pU3bnutJU91u3b4IeRPQTOP8jhV.jpg",
//                "original_language": "en",
//                "original_title": "Godzilla: King of the Monsters",
//                "genre_ids": [
//                  878,
//                  28
//                ],
//                "backdrop_path": "/uovH5k4BAEPqXqxgwVrTtqH169g.jpg",
//                "adult": false,
//                "overview": "Follows the heroic efforts of the crypto-zoological agency Monarch as its members face off against a battery of god-sized monsters, including the mighty Godzilla, who collides with Mothra, Rodan, and his ultimate nemesis, the three-headed King Ghidorah. When these ancient super-species - thought to be mere myths - rise again, they all vie for supremacy, leaving humanity's very existence hanging in the balance.",
//                "release_date": "2019-05-29"
//              },
//              {
//                "vote_count": 1689,
//                "id": 301528,
//                "video": false,
//                "vote_average": 7.7,
//                "title": "Toy Story 4",
//                "popularity": 96.772,
//                "poster_path": "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg",
//                "original_language": "en",
//                "original_title": "Toy Story 4",
//                "genre_ids": [
//                  12,
//                  16,
//                  35,
//                  10751
//                ],
//                "backdrop_path": "/m67smI1IIMmYzCl9axvKNULVKLr.jpg",
//                "adult": false,
//                "overview": "Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that's Andy or Bonnie. But when Bonnie adds a reluctant new toy called \"Forky\" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.",
//                "release_date": "2019-06-19"
//              },
//              {
//                "vote_count": 1717,
//                "id": 458156,
//                "video": false,
//                "vote_average": 7.1,
//                "title": "John Wick: Chapter 3 – Parabellum",
//                "popularity": 88.706,
//                "poster_path": "/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg",
//                "original_language": "en",
//                "original_title": "John Wick: Chapter 3 – Parabellum",
//                "genre_ids": [
//                  80,
//                  28,
//                  53
//                ],
//                "backdrop_path": "/vVpEOvdxVBP2aV166j5Xlvb5Cdc.jpg",
//                "adult": false,
//                "overview": "Super-assassin John Wick returns with a \$14 million price tag on his head and an army of bounty-hunting killers on his trail. After killing a member of the shadowy international assassin’s guild, the High Table, John Wick is excommunicado, but the world’s most ruthless hit men and women await his every turn.",
//                "release_date": "2019-05-15"
//              },
//              {
//                "vote_count": 1876,
//                "id": 447404,
//                "video": false,
//                "vote_average": 7,
//                "title": "Pokémon Detective Pikachu",
//                "popularity": 87.357,
//                "poster_path": "/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg",
//                "original_language": "en",
//                "original_title": "Pokémon Detective Pikachu",
//                "genre_ids": [
//                  28,
//                  12,
//                  14
//                ],
//                "backdrop_path": "/nDP33LmQwNsnPv29GQazz59HjJI.jpg",
//                "adult": false,
//                "overview": "In a world where people collect pocket-size monsters (Pokémon) to do battle, a boy comes across an intelligent monster who seeks to be a detective.",
//                "release_date": "2019-05-03"
//              },
//              {
//                "vote_count": 2,
//                "id": 604165,
//                "video": false,
//                "vote_average": 9,
//                "title": "Kamen Rider Zi-O the Movie: Over Quartzer!",
//                "popularity": 84.236,
//                "poster_path": "/ftVSHLDbkVh0XycxGPqszEUyt3T.jpg",
//                "original_language": "ja",
//                "original_title": "劇場版 仮面ライダージオウ Over Quartzer!",
//                "genre_ids": [
//                  28,
//                  12,
//                  878
//                ],
//                "backdrop_path": "/3yb93vHjVc9amUgLhAHRJGMNGpH.jpg",
//                "adult": false,
//                "overview": "The Quartzers, calling themselves the Wardens of Time, appear after Sougo Tokiwa has collected all of the Heisei Era Ride Watches. A grand conspiracy behind the birth of the King of Time becomes ever clearer...",
//                "release_date": "2019-07-26"
//              },
//              {
//                "vote_count": 670,
//                "id": 479455,
//                "video": false,
//                "vote_average": 5.9,
//                "title": "Men in Black: International",
//                "popularity": 83.616,
//                "poster_path": "/dPrUPFcgLfNbmDL8V69vcrTyEfb.jpg",
//                "original_language": "en",
//                "original_title": "Men in Black: International",
//                "genre_ids": [
//                  28,
//                  35,
//                  878,
//                  12
//                ],
//                "backdrop_path": "/2FYzxgLNuNVwncilzUeCGbOQzP7.jpg",
//                "adult": false,
//                "overview": "The Men in Black have always protected the Earth from the scum of the universe. In this new adventure, they tackle their biggest, most global threat to date: a mole in the Men in Black organization.",
//                "release_date": "2019-06-12"
//              },
//              {
//                "vote_count": 160,
//                "id": 511987,
//                "video": false,
//                "vote_average": 5.8,
//                "title": "Crawl",
//                "popularity": 58.787,
//                "poster_path": "/mKxpYRIrCZLxZjNqpocJ2RdQW8v.jpg",
//                "original_language": "en",
//                "original_title": "Crawl",
//                "genre_ids": [
//                  53,
//                  28,
//                  27
//                ],
//                "backdrop_path": "/2cAce3oD0Hh7f5XxuXmNXa1WiuZ.jpg",
//                "adult": false,
//                "overview": "While struggling to save her father during a Category 5 hurricane, a young woman finds herself trapped inside a flooding house and fighting for her life against Florida’s most savage and feared predators.",
//                "release_date": "2019-07-11"
//              },
//              {
//                "vote_count": 0,
//                "id": 571627,
//                "video": false,
//                "vote_average": 0,
//                "title": "The Divine Fury",
//                "popularity": 51.367,
//                "poster_path": "/9Z2qT9iZYLzzsCSYu7A4SEQsKX0.jpg",
//                "original_language": "ko",
//                "original_title": "사자",
//                "genre_ids": [
//                  28,
//                  27,
//                  9648
//                ],
//                "backdrop_path": "/4MDYpCwqSVO5RcTiZ4GEfePzDdl.jpg",
//                "adult": false,
//                "overview": "Yong-hu, a world champion martial artist who believes in no God, only himself, suddenly develops stigmata on his palms. Visiting a church in hopes of healing the stigmata, he ends up saving Father AHN, who falls into danger while performing an exorcism. In this way he learns of the power of the stigmata. As time passes Yong-hu accepts his new calling and begins saving people who are possessed by demons, but then he must prepare for a final confrontation with the evil Jisin, who ensnares people with the power of the devil.",
//                "release_date": "2019-07-31"
//              },
//              {
//                "vote_count": 1269,
//                "id": 320288,
//                "video": false,
//                "vote_average": 6.2,
//                "title": "Dark Phoenix",
//                "popularity": 48.209,
//                "poster_path": "/kZv92eTc0Gg3mKxqjjDAM73z9cy.jpg",
//                "original_language": "en",
//                "original_title": "Dark Phoenix",
//                "genre_ids": [
//                  878,
//                  28
//                ],
//                "backdrop_path": "/phxiKFDvPeQj4AbkvJLmuZEieDU.jpg",
//                "adult": false,
//                "overview": "The X-Men face their most formidable and powerful foe when one of their own, Jean Grey, starts to spiral out of control. During a rescue mission in outer space, Jean is nearly killed when she's hit by a mysterious cosmic force. Once she returns home, this force not only makes her infinitely more powerful, but far more unstable. The X-Men must now band together to save her soul and battle aliens that want to use Grey's new abilities to rule the galaxy.",
//                "release_date": "2019-06-05"
//              },
//              {
//                "vote_count": 7,
//                "id": 486589,
//                "video": false,
//                "vote_average": 5.8,
//                "title": "Red Shoes and the Seven Dwarfs",
//                "popularity": 47.926,
//                "poster_path": "/xQccIXfq9J4tgbvdSSPPLLYZGRD.jpg",
//                "original_language": "en",
//                "original_title": "Red Shoes and the Seven Dwarfs",
//                "genre_ids": [
//                  16,
//                  10749
//                ],
//                "backdrop_path": "/4uhVMTAgGt36h68SCTOQKCB4z50.jpg",
//                "adult": false,
//                "overview": "Princes who have been turned into Dwarfs seek the red shoes of a lady in order to break the spell, although it will not be easy.",
//                "release_date": "2019-07-25"
//              },
//              {
//                "vote_count": 238,
//                "id": 530385,
//                "video": false,
//                "vote_average": 7.3,
//                "title": "Midsommar",
//                "popularity": 43.992,
//                "poster_path": "/eycO6M2s38xO1888Gq2gSrXf0A6.jpg",
//                "original_language": "en",
//                "original_title": "Midsommar",
//                "genre_ids": [
//                  27,
//                  18
//                ],
//                "backdrop_path": "/8yE6wv1l570zWyh6zmkFxysw3Kc.jpg",
//                "adult": false,
//                "overview": "A young couple travels to Sweden to visit their friend’s rural hometown and attend its mid-summer festival. What begins as an idyllic retreat quickly descends into an increasingly violent and bizarre competition at the hands of a pagan cult.",
//                "release_date": "2019-07-03"
//              },
//              {
//                "vote_count": 478,
//                "id": 521029,
//                "video": false,
//                "vote_average": 5.9,
//                "title": "Annabelle Comes Home",
//                "popularity": 42.187,
//                "poster_path": "/qWsHMrbg9DsBY3bCMk9jyYCRVRs.jpg",
//                "original_language": "en",
//                "original_title": "Annabelle Comes Home",
//                "genre_ids": [
//                  27
//                ],
//                "backdrop_path": "/dBt0DoFfbhOI4ypUfRj1uTq623M.jpg",
//                "adult": false,
//                "overview": "Determined to keep Annabelle from wreaking more havoc, demonologists Ed and Lorraine Warren bring the possessed doll to the locked artifacts room in their home, placing her “safely” behind sacred glass and enlisting a priest’s holy blessing. But an unholy night of horror awaits as Annabelle awakens the evil spirits in the room, who all set their sights on a new target—the Warrens' ten-year-old daughter, Judy, and her friends.",
//                "release_date": "2019-06-26"
//              }
//            ],
//            "page": 1,
//            "total_results": 933,
//            "dates": {
//              "maximum": "2019-08-06",
//              "minimum": "2019-06-19"
//            },
//            "total_pages": 47
//          });

      var source = Injection.injector.get<MovieNetWorkSource>();

      expect(await source.getMovies('/now_playing'), isInstanceOf<MovieResponse>());
    });

  });
}
