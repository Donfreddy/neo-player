import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../constants/constants.dart';
import 'icon_btn.dart';

class SongItem extends StatelessWidget {
  final int songId;
  final String title;
  final String? artist;

  // final SongModel song;

  const SongItem({
    Key? key,
    required this.songId,
    required this.title,
    this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Neumorphic(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
              child: Padding(
                padding: const EdgeInsets.all(kImagePadding / 2),
                child: QueryArtworkWidget(
                  id: songId,
                  type: ArtworkType.AUDIO,
                  artworkBorder: const BorderRadius.all(
                    Radius.circular(kRadius),
                  ),
                  artworkFit: BoxFit.cover,
                  keepOldArtwork: true,
                  artworkRepeat: ImageRepeat.noRepeat,
                  nullArtworkWidget: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(kRadius),
                    ),
                    child: Image.asset(
                      "assets/images/artist.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    artist == '<unknown>' ? 'Artiste inconnu' : artist!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: IconBtn(
            icon: Icons.more_horiz_rounded,
            label: 'Option',
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

// ListTile(
// onTap: () {},
// dense: true,
// title: Text(
// title,
// style: Theme.of(context).textTheme.titleMedium,
// maxLines: 1,
// ),
// subtitle: Opacity(
// opacity: 0.6,
// child: Text(
// artist == '<unknown>' ? 'Artiste inconnu' : artist!,
// style: Theme.of(context).textTheme.bodyLarge,
// maxLines: 1,
// ),
// ),
// ),
