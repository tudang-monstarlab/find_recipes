import 'package:flutter/cupertino.dart';

import '../../common_widgets/base/base_page_stateless.dart';
import 'widgets/detail_app_bar.dart';

class DetailPage extends BasePageStateless {
  const DetailPage({required this.id, Key? key}) : super(key: key);
  final String id;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const DetailAppBar();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(child: Text('Detail Page for $id'));
  }
}
