import 'package:medico/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesHome,
    activeImage: Assets.imagesHomeSelected,
    name: 'Home',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesBooking,
    activeImage: Assets.imagesBookingSelected,
    name: 'Booking',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesSearchNotselected,
    activeImage: Assets.imagesSearchSelected,
    name: 'Search',
  ),
  BottomNavigationBarEntity(
    inActiveImage: Assets.imagesProfile,
    activeImage: Assets.imagesProfileSelected,
    name: 'Profile',
  ),
];
