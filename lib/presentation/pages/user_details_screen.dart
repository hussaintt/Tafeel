import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tafeel/presentation/providers/user_detail_provider.dart';
import 'package:tafeel/presentation/widgets/avatar.dart';
import 'package:tafeel/utils/constants.dart';

class UserDetailsScreen extends HookConsumerWidget {
  UserDetailsScreen({super.key, required userId});
  int? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider directly in the build method
    final user = ref.watch(userDetailsProvider);

    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      decoration: const BoxDecoration(gradient: mainBackground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarUI(size: 150, imageUrl: user.avatar),
          // Assuming user has properties like name, email, etc.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ${user.firstName} ',
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.lastName,
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Email: ${user.email}',
            style: GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 200,
          )
          // Add more user details as needed
        ],
      ),
    ));
  }
}
