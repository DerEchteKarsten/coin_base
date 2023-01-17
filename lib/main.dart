import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';
import 'flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Coin> coins = [
    Coin(null, "test", DateTime.now()),
    Coin(null, "test2", DateTime.now())
  ];

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 13,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: List.generate(coins.length, (index) {
                      return CoinViewWidget(coin: coins[index]);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Coin {
  Image? image;
  String name = "New Coin";
  DateTime Date = DateTime.now();
  Coin(this.image, this.name, this.Date);
}

class CoinViewWidget extends StatefulWidget {
  final Coin coin;
  const CoinViewWidget({Key? key, required this.coin}) : super(key: key);

  @override
  _CoinViewWidgetState createState() => _CoinViewWidgetState();
}

class _CoinViewWidgetState extends State<CoinViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          const BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(3),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Text(
              widget.coin.name,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 38,
                  ),
            ),
          ),
          Text(
            widget.coin.Date.year.toString(),
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/test.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
