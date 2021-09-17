part of ticket_view;

// ignore: must_be_immutable
class _TicketMobile extends StatelessWidget {
  BuildContext context;
  final TicketViewModel viewModel;

  _TicketMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return viewModel.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : viewModel.hasError
            ? SomeThingWentWrong()
            : Container(
                margin: EdgeInsets.symmetric(
                  vertical: UIHelper.dynamicHeight(33),
                  horizontal: UIHelper.dynamicWidth(36),
                ),
                width: UIHelper.dynamicWidth(331),
                height: UIHelper.dynamicHeight(382),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIHelper.dynamicWidth(20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      stops: [0.0, 0.93, 1.39],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(254, 83, 1, 0.2),
                        Color.fromRGBO(196, 196, 196, 0),
                        Color.fromRGBO(162, 198, 190, 0.040625),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: UIHelper.dynamicHeight(19)),
                      _buildDepartureAndArrivalTime,
                      SizedBox(height: UIHelper.dynamicHeight(18)),
                      _buildCities,
                      SizedBox(height: UIHelper.dynamicHeight(10)),
                      _buildCitiesNames,
                      SizedBox(height: UIHelper.dynamicHeight(23)),
                      _buildPassenger,
                      SizedBox(height: UIHelper.dynamicHeight(20)),
                      _buildTourNumberAndDate,
                      SizedBox(height: UIHelper.dynamicHeight(20)),
                      _buildTicketNumberAndBarcode,
                    ],
                  ),
                ),
              );
  }

  Widget _buildTitleAndContent(String title, String content,
      {CrossAxisAlignment crossAxisAlignment}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.workSans().copyWith(
              fontWeight: FontWeight.w400,
              fontSize: UIHelper.dynamicSp(14),
              color: Color(0xFF939290),
              letterSpacing: 0.3),
        ),
        SizedBox(height: UIHelper.dynamicHeight(8)),
        Text(
          content,
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontSize: UIHelper.dynamicSp(16),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }

  get _buildCities => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAbbreviation("STU"),
          _buildArrow,
          _buildAbbreviation("BER"),
        ],
      );

  Widget _buildAbbreviation(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: UIHelper.dynamicSp(24),
          color: Color(
            0xFFFE5301,
          )),
    );
  }

  get _buildArrow => Row(
        children: [
          _buildDashBorder,
          Icon(
            Icons.arrow_forward,
            color: Color(0xFFFE5301),
            size: UIHelper.dynamicSp(25),
          ),
          _buildDashBorder,
        ],
      );

  get _buildDashBorder => Text(
        "- - - - - - - -",
        style: TextStyle(
          color: Color(0xFFFE5301),
        ),
      );
  get _buildCitiesNames => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCityName(viewModel.data.departureBusStop),
            _buildCityName(viewModel.data.arrivalBusStop),
          ],
        ),
      );

  Widget _buildCityName(cityName) {
    return Text(
      cityName,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: UIHelper.dynamicSp(12),
          color: Color(0xFF323232),
          letterSpacing: 0.7),
    );
  }

  get _buildPassenger => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitleAndContent(
            "Passenger",
            viewModel.data.passengerName,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Seat",
                style: GoogleFonts.workSans().copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: UIHelper.dynamicSp(14),
                    color: Color(0xFF939290),
                    letterSpacing: 0.3),
              ),
              SizedBox(height: UIHelper.dynamicHeight(12)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: UIHelper.dynamicWidth(12),
                  vertical: UIHelper.dynamicHeight(2),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFE5301),
                ),
                child: Text(
                  viewModel.data.seatNu,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: UIHelper.dynamicSp(16),
                        color: Color(0xFFFAFBFC),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              )
            ],
          ),
        ],
      );

  get _buildTourNumberAndDate => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitleAndContent(
            "Tour Number",
            viewModel.data.tourNumber,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          _buildTitleAndContent(
            "Date",
            viewModel.data.date,
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ],
      );

  get _buildBarcode => Container(
        width: UIHelper.dynamicWidth(89),
        height: UIHelper.dynamicHeight(89),
        child: SfBarcodeGenerator(
          value: viewModel.data.qrCode,
          symbology: QRCode(),
        ),
      );
  get _buildTicketNumberAndBarcode => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndContent(
                "Ticket Number",
                viewModel.data.ticketNumber,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              SizedBox(height: UIHelper.dynamicHeight(20)),
              _buildTitleAndContent(
                "Booking Number",
                viewModel.data.bookingNumber,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          _buildBarcode,
        ],
      );
  get _buildDepartureAndArrivalTime => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitleAndContent(
            "Departure time",
            viewModel.data.departureTime,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          _buildTitleAndContent(
            "Arrival time",
            viewModel.data.arrivalTime,
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ],
      );
}
