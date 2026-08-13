class DoctorOverviewItemEntity {
  const DoctorOverviewItemEntity({required this.title, required this.value});

  final String title;
  final String value;

  static List<DoctorOverviewItemEntity> getItems() {
    return const [
      DoctorOverviewItemEntity(title: 'Experience', value: '8 Years'),
      DoctorOverviewItemEntity(title: 'Treated', value: '50+'),
      DoctorOverviewItemEntity(title: 'Hourly Rate', value: '\$50'),
    ];
  }
}
