import 'package:go_router/go_router.dart';
import 'package:medico/features/auth/presentation/views/forget_password_view.dart';
import 'package:medico/features/auth/presentation/views/login_view.dart';
import 'package:medico/features/auth/presentation/views/reset_password_view.dart';
import 'package:medico/features/auth/presentation/views/sign_up_view.dart';
import 'package:medico/features/auth/presentation/views/verify_otp_view.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/all_doctors_view.dart';
import 'package:medico/features/home/presentation/views/appointment_details_view.dart';
import 'package:medico/features/home/presentation/views/doctor_details_view.dart';
import 'package:medico/features/home/presentation/views/doctors_by_category_view.dart';
import 'package:medico/features/home/presentation/views/main_view.dart';
import 'package:medico/features/home/presentation/views/all_categories_view.dart';
import 'package:medico/features/home/presentation/views/my_favorites_view.dart';
import 'package:medico/features/home/presentation/views/notifications_view.dart';
import 'package:medico/features/payment/presentation/view/payment_view.dart';
import 'package:medico/features/profile/presentation/views/edit_profile_view.dart';
import 'package:medico/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:medico/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kAllForgetPasswordView = '/allForgetPasswordView';
  static const kVerifyOtpView = '/verifyOtpView';
  static const kResetPasswordView = '/resetPasswordView';
  static const kHomeView = '/homeView';
  static const kAllCategoriesView = '/allCategoriesView';
  static const kDoctorsByCategoryView = '/doctorsByCategotyView';
  static const kAllDoctorsView = '/allDoctorsView';
  static const kMyFavoritesView = '/myFavoritesView';
  static const kNotificationsView = '/notificationsView';
  static const kProfileViewBody = '/profileViewBody';
  static const kEditProfileView = '/editProfileView';
  static const kDoctorDetailsView = '/doctorDetailsView';
  static const kAppointmentDetailsView = '/appointmentDetailsView';
  static const kPaymentView = '/paymentView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
      GoRoute(
        path: kAllForgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: kVerifyOtpView,
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyOtpView(email: email);
        },
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) {
          final resetToken = state.extra as String;
          return ResetPasswordView(resetToken: resetToken);
        },
      ),
      GoRoute(path: kHomeView, builder: (context, state) => MainView()),
      GoRoute(
        path: kAllCategoriesView,
        builder: (context, state) => AllCategoriesView(),
      ),
      GoRoute(
        path: kDoctorsByCategoryView,
        builder: (context, state) {
          final category = state.extra as CategoryEntity;
          return DoctorsByCategoryView(categoryEntity: category);
        },
      ),
      GoRoute(
        path: kAllDoctorsView,
        builder: (context, state) => AllDoctorsView(),
      ),
      GoRoute(
        path: kMyFavoritesView,
        builder: (context, state) => MyFavoritesView(),
      ),
      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => NotificationsView(),
      ),
      GoRoute(
        path: kProfileViewBody,
        builder: (context, state) => ProfileViewBody(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => EditProfileView(),
      ),
      GoRoute(
        path: kDoctorDetailsView,
        builder: (context, state) {
          final doctor = state.extra as DoctorEntity;
          return DoctorDetailsView(doctorEntity: doctor);
        },
      ),
      GoRoute(
        path: kAppointmentDetailsView,
        builder: (context, state) {
          final appointmentSelection =
              state.extra as AppointmentSelectionEntity;
          return AppointmentDetailsView(
            appointmentSelection: appointmentSelection,
          );
        },
      ),
      GoRoute(
        path: kPaymentView,
        builder: (context, state) {
          final appointmentSelection =
              state.extra as AppointmentSelectionEntity;
          return PaymentView(appointmentSelection: appointmentSelection);
        },
      ),
    ],
  );
}
