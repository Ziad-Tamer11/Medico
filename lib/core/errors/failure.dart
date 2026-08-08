class Failure {
  final String errMeesage;

  Failure({required this.errMeesage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMeesage});
}
