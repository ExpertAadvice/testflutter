import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/utils/route_utils/route_names.dart';

import '../../../data/utils/status.dart';
import '../splash/userViewModel.dart';
import 'homeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RouteNames.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status!) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList.data![index].toString(),
                          errorBuilder: (context, error, stack) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data.toString()),
                        subtitle:
                            Text(value.moviesList.data![index].toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("5"),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
