import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_service.dart';
import '../list_card.dart';
import '../provider/restaurant_provider.dart';


// class SearchPage extends StatefulWidget{
//   static const routeName = '/search_page';
//
//   const SearchPage({super.key});
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//             'Search',
//             style: Theme.of(context).textTheme.headlineSmall,
//           ),
//       ),
//       body: const TextField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: 'Type to search',
//         ),
//       ),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   static const routeName = '/search_page';
//
//   const SearchPage({super.key});
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
// class _SearchPageState extends State<SearchPage> {
//   final myController = TextEditingController();
//   String query = ' ';
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<SearchProvider>(
//       create: (context) =>
//           SearchProvider(apiService: ApiService(), query: query),
//       child: Consumer<SearchProvider>(
//         builder: (context, state, _) {
//           if (state.state == ResultState.loading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state.state == ResultState.hasData) {
//             return Scaffold(
//               appBar: AppBar(
//                 // centerTitle: true,
//                 title: // Note: Same code is applied for the TextFormField as well
//                 Container(
//                   width: 280,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border.all(width: 2)),
//                   child: const SizedBox(
//                         width: 200,
//                         child: TextField(
//                           textInputAction: TextInputAction.search,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'Type to search',
//                           ),
//                           ),
//                         ),
//                 ),
//               ),
//               body: ListView.builder(
//                   itemBuilder: (context, index) {
//                     var restaurants = state.result.restaurants[index];
//                     return ListCard(restaurants: restaurants);
//                   },
//                   itemCount: state.result.restaurants.length),
//             );
//           } else if (state.state == ResultState.noData) {
//             return Center(
//               child: Material(
//                 child: Text(state.message),
//               ),
//             );
//           } else if (state.state == ResultState.error) {
//             return Center(
//               child: Material(
//                 child: Text(state.message),
//               ),
//             );
//           } else {
//             return const Center(
//               child: Material(
//                 child: Text(''),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   static const routeName = '/search_page';
//   static String query = ' ';
//
//   const SearchPage({super.key});
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   final controller = TextEditingController();
//   bool search = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Search',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//       ),
//       // body: const TextField(
//       //   decoration: InputDecoration(
//       //     border: OutlineInputBorder(),
//       //     hintText: 'Type to search',
//       //   ),
//       // ),
//       body: Column(
//         children: <Widget>[
//           const Padding(
//             padding: EdgeInsets.all(16),
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           _buildSearchList(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchList() {
//     return Consumer<SearchProvider>(
//           builder: (context, state, child) {
//             if (state.state == ResultState.loading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state.state == ResultState.hasData) {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: state.result.restaurants.length,
//                 itemBuilder: (context, index) {
//                   var restaurants = state.result.restaurants[index];
//                   return SearchCard(restaurants: restaurants);
//                 },
//               );
//             } else if (state.state == ResultState.noData) {
//               return const Scaffold(
//                 body: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.storefront),
//                       Text('There is no match to your search'),
//                     ],
//                   ),
//                 ),
//               );
//             } else if (state.state == ResultState.error) {
//               return Scaffold(
//                 appBar: AppBar(),
//                 body: const Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.wifi_off),
//                       Text('No Internet Connection'),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: Material(
//                   child: Text(''),
//                 ),
//               );
//             }
//           },
//         );
//   }
// }

class SearchPage extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Consumer<SearchProvider>(
    //   builder: (context, state, _) {
    //     if (state.state == ResultState.loading) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (state.state == ResultState.hasData) {
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: state.result.restaurants.length,
    //         itemBuilder: (context, index) {
    //           var restaurants = state.result.restaurants[index];
    //           return ListCard(restaurants: restaurants);
    //         },
    //       );
    //     } else if (state.state == ResultState.noData) {
    //       return Center(
    //         child: Material(
    //           child: Text(state.message),
    //         ),
    //       );
    //     } else if (state.state == ResultState.error) {
    //       return Center(
    //         child: Material(
    //           child: Text(state.message),
    //         ),
    //       );
    //     } else {
    //       return const Center(
    //         child: Material(
    //           child: Text(''),
    //         ),
    //       );
    //     }
    //   },
    // );
    // return ChangeNotifierProvider<SearchProvider>(
    //   create: (_) => SearchProvider(apiService: ApiService())._fetchSearch(query),
    //   child: Consumer<SearchProvider>(
    //     builder: (context, state, _) {
    //       if (state.state == ResultState.loading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (state.state == ResultState.hasData) {
    //         return ListView.builder(
    //           shrinkWrap: true,
    //           itemCount: state.result!.restaurants.length,
    //           itemBuilder: (context, index) {
    //             var restaurants = state.result!.restaurants[index];
    //             return ListCard(restaurants: restaurants);
    //           },
    //         );
    //
    //       } else if (state.state == ResultState.noData) {
    //         return const Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Center(
    //               child: Text(
    //                 "There's no match to your search",
    //               ),
    //             )
    //           ],
    //         );
    //       }
    //     },
    //   ),
    // );
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(apiService: ApiService(), searchQuery: query),
      child: Consumer<SearchProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var restaurants = state.result.restaurants[index];
                return ListCard(restaurants: restaurants);
              },
            );
          } else if (state.state == ResultState.noData) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "There's no match to your search",
                  ),
                ),
              ],
            );
          } else if (state.state == ResultState.error) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "An error occurred while fetching data",
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'Search Restaurants',
        style: Theme
            .of(context)
            .textTheme
            .titleMedium,
      ),
    );
  }
}