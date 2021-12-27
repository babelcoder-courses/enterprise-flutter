import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

class ArticleQrView extends StatelessWidget {
  final ArticleItem article;

  const ArticleQrView({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = '${dotenv.env["FRONT_URL"]}/articles/${article.id}';

    return Row(
      children: [
        QrImage(
          data: url,
          version: QrVersions.auto,
          size: 150,
          gapless: false,
        ),
        Expanded(
          child: Text(
            'Scan QR Code to open $url',
            style: context.watch<SettingsProvider>().theme.textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
