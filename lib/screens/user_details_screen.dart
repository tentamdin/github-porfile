import 'package:flutter/material.dart';
import 'package:git_profile/controllers/user_provider.dart';
import 'package:git_profile/models/repo_model.dart';
import 'package:git_profile/routes/app_routes.dart';
import 'package:git_profile/widgets/custom_text.dart';
import 'package:git_profile/widgets/repo_metadata.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserProvider>().userModel;
    final rateInfo = context.watch<UserProvider>().rate;
    final List<RepoModel> repoInfo = context.watch<UserProvider>().repos;
    var joinedDate =
        DateFormat.yMMMd().format(DateTime.parse(userInfo.joinedDate));
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
                Text(
                  rateInfo != null && rateInfo.remaining != null
                      ? "${rateInfo.remaining} / 60\nRequest Left".toUpperCase()
                      : "0 / 60\nRequest Left".toUpperCase(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.repoWebview,
                        arguments:
                            "https://github.com/tentamdin/github-porfile");
                  },
                )
              ],
            ),
            AspectRatio(
              aspectRatio: 1 / 0.3,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userInfo.avataUrl),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          label: userInfo.name,
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          fontSize: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.repoWebview,
                                arguments: userInfo.userLink);
                          },
                          child: CustomText(
                            label: userInfo.userName,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomText(
                          label: "${userInfo.bio}",
                          maxLines: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Joined $joinedDate"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CustomText(
                  label: "${userInfo.repos} Repositories",
                ),
                const SizedBox(width: 20),
                CustomText(
                  label: '${userInfo.followers} Followers',
                ),
                const SizedBox(width: 20),
                CustomText(
                  label: '${userInfo.followers}  following',
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 20,
              ),
              child: Row(
                children: [
                  CustomText(
                    label: "Top Repos",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 10),
                  CustomText(
                    label: "by",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(width: 10),
                  CustomText(
                    label: "Stars",
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 1 / 0.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: repoInfo.map((repo) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.repoWebview,
                        arguments: repo.repoLink,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.book_outlined,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomText(
                                  label: repo.name,
                                  maxLines: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                            label: repo.description != null
                                ? repo.description
                                : "",
                            maxLines: 10,
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
