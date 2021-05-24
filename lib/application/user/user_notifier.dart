import 'package:nocia/application/user/user_state.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:state_notifier/state_notifier.dart';

class UserNotifier extends StateNotifier<UserState> {
  final FirebaseAuthRepositoryBase _authRepository;

  UserNotifier({
    required FirebaseAuthRepositoryBase authRepository
  })  : _authRepository = authRepository,
        super(const UserState()) {
    fetchUser();
  }

  void fetchUser() {
    state = state.copyWith(user: _authRepository.getSignedInUser());
  }
}