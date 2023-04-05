import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/providers/repo_provider.dart';
import 'package:super_sushi/ui/widgets/base_widgets/loading_widget.dart';
import 'package:super_sushi/ui/widgets/dev_task/select_action_pop_up.dart';
import 'package:super_sushi/utils/constants/colors_palette.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Repo card design
class RepoCard extends StatelessWidget {
  /// Constructor of repo card
  const RepoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<RepoProvider>().repo;
    return InkWell(
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => SelectActionPopUp(
          repoUrl: repo.htmlUrl ?? '',
          ownerUrl: repo.owner?.htmlUrl ?? '',
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MagicNumbers.PADDING_SIZE_SMALL,
          vertical: MagicNumbers.PADDING_SIZE_DEFAULT,
        ),
        margin: const EdgeInsets.only(bottom: MagicNumbers.MARGIN_SIZE_SMALL),
        decoration: BoxDecoration(
          color: repo.fork
              ? Theme.of(context).scaffoldBackgroundColor
              : ColorsPalette.forkLightGreen,
          border: Border.all(
            color: Theme.of(context).backgroundColor,
          ),
          borderRadius: BorderRadius.circular(
            MagicNumbers.smallBorderRadius,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(MagicNumbers.smallBorderRadius),
              child: CachedNetworkImage(
                imageUrl: repo.owner?.avatarUrl ?? '',
                width: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => Container(
                  width: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                  height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'sushi'.toImage,
                    fit: BoxFit.cover,
                    width: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                    height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                  ),
                ),
              ),
            ),
            MagicNumbers.MARGIN_SIZE_SOME_SMALL.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.owner?.username ?? '',
                    style: repo.fork
                        ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            )
                        : Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            ),
                  ),
                  MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.ph,
                  Text(
                    repo.name ?? '',
                    style: repo.fork
                        ? Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            )
                        : Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            ),
                  ),
                  MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.ph,
                  Text(
                    repo.description ?? '',
                    style: repo.fork
                        ? Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            )
                        : Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                              fontWeight: FontWeight.w400,
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
