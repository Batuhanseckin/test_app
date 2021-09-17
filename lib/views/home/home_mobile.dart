part of home_view;

// ignore: must_be_immutable
class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  BuildContext context;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return viewModel.hasError
        ? SomeThingWentWrong()
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: UIHelper.dynamicHeight(20)),
                _buildImage,
                SizedBox(height: UIHelper.dynamicHeight(24)),
                _buildDepartureTitle,
                SizedBox(height: UIHelper.dynamicHeight(16)),
                viewModel.isBusy
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: UIHelper.dynamicHeight(100)),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _buildDepartures,
              ],
            ),
          );
  }

  get _buildImage => Container(
        width: UIHelper.dynamicWidth(371),
        height: UIHelper.dynamicHeight(173),
        margin: EdgeInsets.symmetric(horizontal: UIHelper.dynamicWidth(16)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: viewModel.imageLink,
                width: UIHelper.dynamicWidth(371),
                height: UIHelper.dynamicHeight(173),
                boxFit: BoxFit.cover,
                errorWidget: Image.network(viewModel.noFountImageLink),
              ),
            ),
            Positioned(
              bottom: UIHelper.dynamicHeight(16),
              left: UIHelper.dynamicWidth(16),
              child: Text(
                "Explore our Destinations",
                style: Theme.of(context).primaryTextTheme.bodyText1.copyWith(
                      fontSize: UIHelper.dynamicSp(15),
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      );

  get _buildDepartureTitle => Container(
        margin: EdgeInsets.symmetric(horizontal: UIHelper.dynamicWidth(16)),
        child: Text(
          "Departure Times",
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: UIHelper.dynamicSp(20),
              ),
        ),
      );

  get _buildDepartures => Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (_, i) => Container(
            margin: EdgeInsets.symmetric(horizontal: UIHelper.dynamicWidth(16)),
            child: Divider(
              height: 0,
              thickness: 1,
            ),
          ),
          shrinkWrap: true,
          itemBuilder: (_, i) => _buildItem(i),
          itemCount: viewModel.data.length,
        ),
      );

  Widget _buildItem(int i) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: UIHelper.dynamicHeight(21.2)),
      child: Row(
        children: [
          SizedBox(width: UIHelper.dynamicWidth(17)),
          Icon(
            viewModel.data[i].tourType == "Night"
                ? Icons.dark_mode
                : Icons.wb_sunny,
            color: Color(0xFFFE5301),
            size: UIHelper.dynamicSp(27),
          ),
          SizedBox(width: UIHelper.dynamicWidth(11)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  viewModel.data[i].route +
                      " / " +
                      viewModel.data[i].departureTime +
                      "-" +
                      viewModel.data[i].arrivalTime,
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontSize: UIHelper.dynamicSp(14),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                ),
                SizedBox(height: UIHelper.dynamicHeight(6)),
                Text(
                  viewModel.getDays(viewModel.data[i].daysOfWeek),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontSize: UIHelper.dynamicSp(14),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.8,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
