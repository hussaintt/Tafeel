import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafeel/data/page.dart';
import 'package:tafeel/domain/api_data_source.dart';

class UserListNotifier extends StateNotifier<Page> {
  final ApiDataSource _api;

  UserListNotifier(this._api) : super(Page()) {
    fetchUsers(1);
  }

  Future<void> fetchUsers(int page) async {
    if (state.isLoading || (page > 1 && state.currentPage >= state.totalPages))
      return;
    state = state.copyWith(isLoading: true);
    try {
      final response = await _api.getUsers(page);
      state = state.copyWith(
        users: page == 1
            ? response['users']
            : [...state.users, ...response['users']],
        currentPage: page,
        totalPages: response['totalPages'],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void loadMore() => fetchUsers(state.currentPage + 1);
}

final userListProvider = StateNotifierProvider<UserListNotifier, Page>(
  (ref) => UserListNotifier(ApiDataSource()),
);
