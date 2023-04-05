import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:super_sushi/providers/repo_provider.dart';
import 'package:super_sushi/providers/repos_provider.dart';
import 'package:super_sushi/services/api/dio_error_extension.dart';
import 'package:super_sushi/services/db_services/db_handler.dart';
import 'package:super_sushi/ui/screens/dev_task/search_screen.dart';
import 'package:super_sushi/ui/widgets/base_widgets/error_pop_up.dart';
import 'package:super_sushi/ui/widgets/base_widgets/loading_widget.dart';
import 'package:super_sushi/ui/widgets/base_widgets/my_text_form_field.dart';
import 'package:super_sushi/ui/widgets/dev_task/repo_card.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Dev task repos screen
class ReposScreen extends StatefulWidget {
  /// Constructor of repos screen
  const ReposScreen({Key? key}) : super(key: key);

  @override
  State<ReposScreen> createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  final _refreshController = RefreshController(
    initialRefresh: false,
  );
  int _page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getData();
    });
  }

  _getData() async {
    try {
      final reposPerPage = await context.read<ReposProvider>().getRepos(1);
      if (!mounted) return;
      await context.read<DBHandler>().batchRepos(reposPerPage);
      _refreshController.refreshCompleted();
    } on DioError catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => ErrorPopUp(
          message: e.readableError,
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => ErrorPopUp(
          message: tr('server_error'),
        ),
      );
    }
  }

  void _onLoading() async {
    try {
      final reposPerPage =
          await context.read<ReposProvider>().getRepos(++_page);
      if (!mounted) return;
      await context.read<DBHandler>().batchRepos(reposPerPage);
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  Future<void> _showSearch() async {
    final repos = context.read<ReposProvider>().repos;

    await showSearch(
      context: context,
      delegate: SearchScreen(
        context: context,
        initialList: (repos ?? []),
      ),
      query: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    final repos = context.watch<ReposProvider>().repos;

    return Scaffold(
      body: Column(
        children: [
          MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'forward_arrow'.toSvg,
                    matchTextDirection: true,
                  ),
                ),
                MagicNumbers.MARGIN_SIZE_DEFAULT.pw,
                Expanded(
                  child: MyTextFormField(
                    onChanged: (v) {},
                    onTap: _showSearch,
                    readOnly: true,
                    prefixIcon: SvgPicture.asset(
                      'search'.toSvg,
                    ),
                    hintText: tr('search_repo'),
                  ),
                ),
              ],
            ),
          ),
          MagicNumbers.PADDING_SIZE_DEFAULT.ph,
          Expanded(
            child: repos == null
                ? const Center(
                    child: LoadingWidget(),
                  )
                : SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus? mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = const SizedBox();
                        } else if (mode == LoadStatus.loading) {
                          body = const CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text(
                            tr('load_failed'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: MagicNumbers.MARGIN_SIZE_DEFAULT,
                                    fontWeight: FontWeight.w400),
                          );
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text(
                            tr('release_load'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: MagicNumbers.MARGIN_SIZE_DEFAULT,
                                    fontWeight: FontWeight.w400),
                          );
                        } else {
                          body = Text(
                            tr('no_more_data'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    fontSize: MagicNumbers.MARGIN_SIZE_DEFAULT,
                                    fontWeight: FontWeight.w400),
                          );
                        }
                        return SizedBox(
                          height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                          child: Center(child: body),
                        );
                      },
                    ),
                    onRefresh: _getData,
                    onLoading: _onLoading,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        vertical: MagicNumbers.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: repos
                                .map(
                                  (repo) =>
                                      ChangeNotifierProvider<RepoProvider>(
                                    create: (_) => RepoProvider(repo),
                                    child: const RepoCard(),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
