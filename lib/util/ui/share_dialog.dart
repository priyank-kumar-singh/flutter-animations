import 'package:flutter/material.dart';

import '../../constants/const.dart';
import '../../widgets/widgets.dart';
import '../util.dart';

void showShareDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) {
      return const ShareDialog();
    }
  );
}

class ShareDialog extends StatelessWidget {
  const ShareDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Flutter Animations',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 8.0),
            InteractiveText(
              text: [
                InteractiveTextItem('Get source code, '),
                InteractiveTextItem(
                  'click here.',
                  onTap: () {
                    URLHelper.open(ExternalLinks.sourceCode);
                  },
                ),
              ],
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Connect with me',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Wrap(
              children: const [
                SocialMediaButton(
                  SocialMediaIcons.github,
                  url: ExternalLinks.github,
                ),
                SocialMediaButton(
                  SocialMediaIcons.linkedIn,
                  url: ExternalLinks.linkedin,
                ),
                SocialMediaButton(
                  SocialMediaIcons.twitter,
                  url: ExternalLinks.twitter,
                ),
                SocialMediaButton(
                  SocialMediaIcons.youtube,
                  url: ExternalLinks.youtube,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
