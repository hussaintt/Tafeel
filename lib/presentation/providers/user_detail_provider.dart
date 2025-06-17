import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafeel/data/user.dart';
import 'package:tafeel/domain/api_data_source.dart';

class UserListNotifier extends StateNotifier<User> {
  final ApiDataSource _api;

  UserListNotifier(this._api)
      : super(User(
            id: 2,
            firstName: 'User Data not Avalible',
            lastName: '',
            email: 'Please Check data source',
            avatar: ''));

  Future<void> fetchUser(int userId) async {
    try {
      final userData = await _api.getUserDetail(userId);
      state = userData['user'];
    } catch (e, stack) {
      state = User(
          id: 2,
          firstName: 'User Data not Avalible',
          lastName: '',
          email: 'Please Check data source or try another user',
          avatar: '');
    }
  }
}

final userDetailsProvider = StateNotifierProvider<UserListNotifier, User>(
  (ref) => UserListNotifier(ApiDataSource()),
);
