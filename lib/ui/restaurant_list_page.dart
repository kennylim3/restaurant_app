import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/list_card.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/search_page.dart';

class RestaurantListPage extends StatefulWidget{
  static const routeName = '/restaurant_list';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

// class _RestaurantListPageState extends State<RestaurantListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     'Restaurant',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.search),
//                     onPressed: () {
//                       Navigator.pushNamed(context, SearchPage.routeName);
//                     },
//                   ),
//                 ],
//               ),
//               Text(
//                 'Recommendations for you!',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               const SizedBox(height: 12),
//             ],
//           )),
//       body: _buildList(),
//     );
//   }
//
//   Widget _buildList() {
//     return Consumer<RestaurantProvider>(
//       builder: (context, state, _) {
//         if (state.state == ResultState.loading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state.state == ResultState.hasData) {
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.result.restaurants.length,
//             itemBuilder: (context, index) {
//               var restaurants = state.result.restaurants[index];
//               return ListCard(restaurants: restaurants);
//             },
//           );
//         } else if (state.state == ResultState.noData) {
//           return Center(
//             child: Material(
//               child: Text(state.message),
//             ),
//           );
//         } else if (state.state == ResultState.error) {
//           return Center(
//             child: Material(
//               child: Text(state.message),
//             ),
//           );
//         } else {
//           return const Center(
//             child: Material(
//               child: Text(''),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

class _RestaurantListPageState extends State<RestaurantListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Restaurant',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: SearchPage());
                    },
                  ),
                ],
              ),
              Text(
                'Recommendations for you!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
            ],
          )),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
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
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}