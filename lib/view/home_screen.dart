import 'package:flutter/material.dart';
import 'package:mvvmarc/data/response/status.dart';
import 'package:mvvmarc/res/colors.dart';
import 'package:mvvmarc/utils/routes/routes_name.dart';
import 'package:mvvmarc/utils/utils.dart';
import 'package:mvvmarc/view_model/movies_view_model.dart';
import 'package:mvvmarc/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviesViewModel moviesViewModel = MoviesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesViewModel.fetchMoviesListApi();
  }
  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Movies List"),
        centerTitle: true,
        backgroundColor: AppColors.buttonColor,
        actions: [
          InkWell(
              onTap: () {
                userPrefrence.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Icon(Icons.logout_outlined, color: AppColors.blackColor,))),
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider<MoviesViewModel> (
        create: (BuildContext context) => moviesViewModel,
        child: Consumer<MoviesViewModel>(
          builder: (context,value, _) {
            switch(value.moviesList.status) {
              case  Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                              value.moviesList.data!.movies![index].posterurl!.toString(),
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stacks){
                                return Icon(Icons.error, color: Colors.red);
                            },
                          ),
                          title: Text(value.moviesList.data!.movies![index].title!.toString()),
                          subtitle: Text(value.moviesList.data!.movies![index].year!.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(value.moviesList.data!.movies![index].ratings!.toString()),
                              Icon(Icons.star, color: Colors.yellow,),
                            ],
                          ),

                        ),
                      );
            });
              default:
                return Container(
                  child: Text("Default"),
                );
            }
          }
        )
      )
    );
  }
}
