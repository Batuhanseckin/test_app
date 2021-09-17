part of main_view;

// ignore: must_be_immutable
class _MainMobile extends StatelessWidget {
  final MainViewModel viewModel;

  _MainMobile(this.viewModel);
  BuildContext context;

  List<String> titles = [
    "TEST APP",
    "Tickets",
  ];

  bool isLoginUser =
      LocaleManager.instance.getBoolValue(PreferencesKeys.IS_LOGIN);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: CustomBottomNavBar(
        onPress: (index) {
          if (isLoginUser) {
            viewModel.setIndex(index);
          } else {
            showDialog(
              context: context,
              builder: (_) {
                return MyDialogView(
                  isLogin: (loginSuccess) {
                    if (loginSuccess) {
                      viewModel.setIndex(index);
                    }
                  },
                );
              },
            );
          }
        },
        currentIndex: viewModel.currentIndex,
      ),
      appBar: _buildAppBar,
    );
  }

  get _buildAppBar => AppBar(
        actions: isLoginUser
            ? [
                IconButton(
                  onPressed: () async {
                    await LocaleManager.instance.sharedClear();
                    viewModel.setIndex(0);
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    size: UIHelper.dynamicSp(32),
                  ),
                )
              ]
            : null,
        toolbarHeight: UIHelper.dynamicHeight(75),
        leading: Icon(
          Icons.directions_bus_rounded,
          size: UIHelper.dynamicSp(32),
        ),
        title: Text(
          titles[viewModel.currentIndex],
          style: Theme.of(context).primaryTextTheme.headline5.copyWith(
                fontSize: UIHelper.dynamicSp(20),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
      );

  get _buildBody {
    switch (viewModel.currentIndex) {
      case 0:
        return HomeView();
        break;
      case 1:
        return TicketView();
        break;
      default:
        return Center(
          child: Text("Page not found"),
        );
    }
  }
}
