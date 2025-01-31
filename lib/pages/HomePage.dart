import 'package:flutter/material.dart';
import 'package:learningflutterappwrite/widgets/drawer/drawer.dart';

class Homepage extends StatefulWidget {
  static const String name = 'home';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      drawer: DrawerMenu(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   children: [TextButton(onPressed: () {}, child: Text('Folder'))],
            // ),
            // Greycontainer(
            //     child: StreamBuilder(
            //         stream: appProvider.folderStream,
            //         builder: (context, snapshot) {
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             return Center(child: CircularProgressIndicator());
            //           }

            //           if (snapshot.hasError) {
            //             return Center(
            //               child: Text(snapshot.error.toString()),
            //             );
            //           }

            //           final folders = snapshot.data ?? [];
            //           return ListView.builder(
            //               itemCount: folders.length,
            //               itemBuilder: (context, index) {
            //                 final folder = folders[index];
            //                 return ListTile(
            //                   title: Text(folder['title']),
            //                   subtitle: Text(folder['description']),
            //                 );
            //               });
            //         }))
          ],
        ),
      )),
    );
  }
}
