import 'package:attendify/src/controller/result_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderHelper {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ResultsProvider>(
      create: (_) => ResultsProvider(),
    ),
  ];
}
