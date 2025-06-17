import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tafeel/presentation/providers/user_list_provider.dart';
import 'package:tafeel/presentation/widgets/user_item.dart';
import 'package:tafeel/utils/constants.dart';

class ListOfUsers extends ConsumerStatefulWidget {
  const ListOfUsers({super.key});

  @override
  ConsumerState<ListOfUsers> createState() => _ListOfUsersState();
}

class _ListOfUsersState extends ConsumerState<ListOfUsers> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 100) {
      final usersList = ref.read(userListProvider);
      if (usersList.currentPage < usersList.totalPages) {
        ref.read(userListProvider.notifier).loadMore();
      }
    }
    return false; // allow other handlers to receive notifications
  }

  @override
  Widget build(BuildContext context) {
    final usersList = ref.watch(userListProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        decoration: const BoxDecoration(gradient: mainBackground),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Users List',
              style: GoogleFonts.cairo(
                color: const Color.fromARGB(255, 50, 4, 4),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: ListView.builder(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: usersList.users.length,
                  itemBuilder: (context, index) {
                    final user = usersList.users[index];
                    return UserItem(
                      user_name: user.firstName,
                      second_name: user.lastName,
                      user_id: user.id,
                      image_url: user.avatar ?? backupImage,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
