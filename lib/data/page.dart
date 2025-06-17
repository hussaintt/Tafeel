import 'package:tafeel/data/user.dart';

class Page {
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final bool isLoading;

  Page({
    this.users = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.isLoading = false,
  });

  Page copyWith(
          {List<User>? users,
          int? currentPage,
          int? totalPages,
          bool? isLoading}) =>
      Page(
        users: users ?? this.users,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        isLoading: isLoading ?? this.isLoading,
      );
}
