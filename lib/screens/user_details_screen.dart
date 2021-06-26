import 'package:flutter/material.dart';
import 'package:git_profile/controllers/user_provider.dart';
import 'package:git_profile/models/repo_model.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserProvider>().userModel;
    final List<RepoModel> repoInfo = context.watch<UserProvider>().repos;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("60 / 60 \nRequest Left".toUpperCase()),
                IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userInfo.avataUrl),
              ),
              title: Text(
                userInfo.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: "@${userInfo.userName}\n",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: userInfo.bio,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                ),
                Text(userInfo.joinedDate),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '${userInfo.repos} Repositories',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 20),
                Text(
                  '${userInfo.followers} Followers',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 20),
                Text(
                  '${userInfo.followers}  following',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "Top Repos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "by",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Stars",
                    style: TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: repoInfo.map((repo) {
                  return Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.book_outlined,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              repo.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            repo.description != null ? repo.description : "",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RepoMetaData(
                                  iconWidget: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  label: repo.language != null
                                      ? repo.language
                                      : "",
                                ),
                                RepoMetaData(
                                  iconWidget: Icon(
                                    Icons.star,
                                  ),
                                  label: repo.starCount.toString(),
                                ),
                                RepoMetaData(
                                  iconWidget: Icon(
                                    Icons.share,
                                  ),
                                  label: repo.forks.toString(),
                                ),
                              ],
                            ),
                            RepoMetaData(
                                iconWidget: Text(repo.size.toString()),
                                label: "KB"),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class RepoMetaData extends StatelessWidget {
  const RepoMetaData({Key key, this.iconWidget, this.label}) : super(key: key);

  final Widget iconWidget;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget,
        SizedBox(
          width: 5,
        ),
        Text(label),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
