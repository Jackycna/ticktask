class AuthState {
  final bool isLogin;
  final bool isLoading;
  final bool isAuthendicated;
  final String error;
  AuthState({
    this.isLogin = true,
    this.isLoading = false,
    this.isAuthendicated = false,
    this.error = "",
  });
  AuthState copyWith({
    bool? isLogin,
    bool? isLoading,
    bool? isAuthendicated,
    String? error,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
      isLoading: isLogin ?? this.isLoading,
      isAuthendicated: isAuthendicated ?? this.isAuthendicated,
      error: error ?? this.error,
    );
  }
}
