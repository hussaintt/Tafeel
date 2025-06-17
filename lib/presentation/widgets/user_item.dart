import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tafeel/presentation/pages/user_details_screen.dart';
import 'package:tafeel/presentation/providers/user_detail_provider.dart';
import 'package:tafeel/presentation/widgets/avatar.dart';

class UserItem extends ConsumerStatefulWidget {
  const UserItem(
      {super.key,
      required this.user_name,
      required this.image_url,
      required this.second_name,
      required this.user_id});
  final String? user_name;
  final String? second_name;
  final String image_url;
  final int? user_id;
  @override
  LeaderboardItemC createState() => LeaderboardItemC();
}

class LeaderboardItemC extends ConsumerState<UserItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(userDetailsProvider.notifier).fetchUser(widget.user_id ?? 2);
        Timer(Duration(milliseconds: 200), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => UserDetailsScreen(userId: widget.user_id)),
          );
        });
      },
      child: Container(
          alignment: Alignment.topCenter,
          height: 100,
          child: Card(
            color: const Color.fromARGB(230, 99, 56, 56),
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(children: [
                      AvatarUI(
                        size: 70,
                        imageUrl: widget.image_url,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.user_name ?? '',
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.second_name ?? '',
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ]),
                  ],
                )),
          )),
    );
  }
}
