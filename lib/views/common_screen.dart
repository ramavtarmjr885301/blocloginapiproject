import 'package:bloc_practice/routes/routes_names.dart';
import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  const CommonScreen({super.key});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Common Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  Row(

               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [Text("With Local Database", style: TextStyle(fontSize: 17,),
               ),
               Text("With Online Database", style: TextStyle(fontSize: 17,),)],
            ),
           const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesNames.localLoginScreen);
                    },
                    child: const Text("Local Login")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesNames.loginScreen);
                    },
                    child: const Text("Api Login")),
              ],
            )
          ],
        ));
  }
}
