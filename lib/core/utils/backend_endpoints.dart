class BackendEndpoints {
  static const signup = 'auth/signup';
  static const login = 'auth/login';
  static const googleLogin = 'auth/google';
  static const logout = 'auth/logout';
  static const refresh = 'auth/refresh';
  static const updateProfile = 'users/me';
  static const changePassword = 'users/me/password';
  static const forgotPassword = 'auth/forgot-password';
  static const verifyOtp = 'auth/verify-otp';
  static const resetPassword = 'auth/reset-password';

  static const categories = 'categories/';
  static const doctors = 'doctors/';
  static String doctorsByCategory(int categoryId) =>
      'doctors/category/$categoryId';
  static String doctorAvailability(int doctorId) =>
      'doctors/$doctorId/availability';
  static const createAppointment = 'appointments';
  static const myAppointments = 'appointments/me';

  static const favorites = 'favorites';
  static String favorite(int doctorId) => 'favorites/$doctorId';
}
