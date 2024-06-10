import 'dart:developer';

class ExeptionHandler {
  static addTryCatch(Function function) async {
    try {
      await function();
    } on Exception catch (e) {
      log(e.toString()); // Only catches an exception of type `Exception`.
    } catch (e) {
      log(e.toString()); // Catches all types of `Exception` and `Error`.
    }
  }
}
