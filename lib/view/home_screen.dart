import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewModel = HomeViewViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMovieslistApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        InkWell(
            onTap: () {
              userPreference.removeUser().then((value) {
                Navigator.of(context).pushNamed(RoutesName.login);
              });
            },
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            )),
      ]),
      body: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        height: 100,
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                              value.moviesList.data!.movies![index].posterurl
                                  .toString(),
                              height: 100,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(value
                                .moviesList.data!.movies![index].title
                                .toString()),
                          ),
                        ),
                      );
                    }));
            }
            return Container();
          })),
    );
  }
}
