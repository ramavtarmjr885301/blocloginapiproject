import 'package:blocloginapiproject/BLoC/DataBloc/data_bloc.dart';
import 'package:blocloginapiproject/BLoC/DataBloc/data_event.dart';
import 'package:blocloginapiproject/BLoC/DataBloc/data_state.dart';
import 'package:blocloginapiproject/custom_aap_bar.dart';
import 'package:blocloginapiproject/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<DataBloc>().add(DataFetchEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Home Screen'),
        floatingActionButton: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesNames.counterScreen);
            },
            child: const Text(
              "Go to counter Screen",
              style: TextStyle(color: Colors.amber),
            )),
        body: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.postsData.length,
              itemBuilder: (context, index) {
                final post = state.postsData[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(post.title.toString()),
                      subtitle: Text(post.body.toString()),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}


//  ListTile(
//                   title: Text(post.title.toString()),
//                   subtitle: Text(post.body.toString()),
//                 );


// ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (context, index) {
//                 final post = state.posts[index];
//                 return Card(
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   child: Container(
//                      height: 230,
//                      decoration: BoxDecoration(
//               gradient:const LinearGradient(
//                 colors: [Colors.blue, Colors.purple],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//                     child: ListTile(
//                       title: Text(post.title.toString()),
//                       subtitle: Text(post.body.toString()),
//                     ),
//                   ),
//                 );
//               },
//             );


//////////////////////////////////////////////
///BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state is FetchListLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is FetchListSuccessState) {
//             return ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (context, index) {
//                 final post = state.posts[index];
//                 return Card(
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   child: Container(
//                      height: 230,
//                      decoration: BoxDecoration(
//               gradient:const LinearGradient(
//                 colors: [Colors.blue, Colors.purple],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//                     child: ListTile(
//                       title: Text(post.title.toString()),
//                       subtitle: Text(post.body.toString()),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is FetchListErrorState) {
//             return Center(child: Text(state.errorMsg));
//           }
//           return const Center(child: Text("Home Screen"));
//         },
//       ),
//       );
//   }
// }