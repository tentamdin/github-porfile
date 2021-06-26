import 'package:flutter/material.dart';
import 'package:git_profile/controllers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/github.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: userNameController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                context.watch<UserProvider>().isloading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await context
                              .read<UserProvider>()
                              .getUserData(userNameController.text, context);
                          await context
                              .read<UserProvider>()
                              .getUserRepos(userNameController.text, context);
                        },
                        child: Text("Get Git Profile"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
