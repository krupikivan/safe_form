import 'failure.dart';

class ItemNotExistFailure extends Failure {
  const ItemNotExistFailure() : super('Item not exist');
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure() : super('No internet connection');
}
