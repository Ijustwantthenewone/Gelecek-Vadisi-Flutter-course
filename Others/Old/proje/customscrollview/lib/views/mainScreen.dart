import 'package:customscrollview/model/cars.dart';
import 'package:customscrollview/views/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mainScreen extends StatelessWidget {
  mainScreen({super.key});

  List<Cars> carsList = [
    Cars(
        title: "Bugatti Veyron",
        content:
            """The main carry over component from the Veyron is the 7,993 cc (8.0 L; 487.8 cu in) quad-turbocharged W16 engine, though it is heavily updated. The engine in the Chiron has a peak power output of 1,103 kW (1,479 hp; 1,500 PS) at 6,700 rpm and 1,600 N⋅m (1,180 lb⋅ft) of torque starting from 2,000 to 6,000 rpm.[14] The engine in the most powerful variant of its predecessor, the Veyron Super Sport generates 221 kW (296 hp; 300 PS) less than the new Chiron, while the engine in the original Veyron generates 367 kW (492 hp; 499 PS) less power.[15][16]
Like its predecessor, the Veyron, the Chiron utilises a carbon fibre body structure, independent suspension and a Haldex All-wheel drive system.[17][18][19] The carbon fibre body has a stiffness of 50,000 Nm per degree.[20]
The Chiron can accelerate from 0–100 km/h (0–62 mph) in 2.4 seconds according to the manufacturer, 0–200 km/h (0–124 mph) in 6.5 seconds and 0–300 km/h (0–186 mph) in 13.6 seconds. In a world-record-setting test at the time in 2017, the Chiron reached 400 km/h (249 mph) in 32.6 seconds, after which it needed 9.4 seconds to brake to standstill.[21]
The Chiron's top speed is electronically limited to 420 km/h (261 mph), or 375–380 km/h (233–236 mph) without the specific key, for safety reasons, mainly arising from the tyres as Bugatti concluded that no tyre currently manufactured would be able to handle the stress at the top speed the Chiron is capable of achieving.[4][22] Independent testing by an owner has indicated that the Chiron can easily attain its limited top speed.[23] Mixed fuel consumption is 22.5 L/100 km (12.55 mpg‑imp; 10.45 mpg‑US).[24]""",
        imgURL:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Bugatti_Chiron_1.jpg/1920px-Bugatti_Chiron_1.jpg"),
    Cars(
        title: """Volvo""",
        content:
            """The brand name Volvo was originally registered as a trademark in May 1911, with the intention to be used for a new series of SKF ball bearings. It means "I roll" in Latin, conjugated from "volvere". The idea was short-lived, and SKF decided to simply use its initials as the trademark for all its bearing products.[9]
In 1924, Assar Gabrielsson, an SKF sales manager, and Gustav Larson, a KTH educated engineer, decided to start construction of a Swedish car. They intended to build cars that could withstand the rigours of the country's rough roads and cold temperatures.[10]
AB Volvo began activities on 10 August 1926. After one year of preparations involving the production of ten prototypes, the firm was ready to commence the car-manufacturing business within the SKF group. The Volvo Group itself considers it started in 1927, when the first car, a Volvo ÖV 4, rolled off the production line at the factory in Hisingen, Gothenburg.[11] Only 280 cars were built that year.[12] The first truck, the "Series 1", debuted in January 1928, as an immediate success and attracted attention outside the country.[9] In 1930, Volvo sold 639 cars,[12] and the export of trucks to Europe started soon after; the cars did not become well known outside Sweden until after World War II.[12] AB Volvo was introduced at the Stockholm Stock Exchange in 1935 and SKF then decided to sell its shares in the company. By 1942, Volvo acquired the Swedish precision engineering company Svenska Flygmotor (later renamed as Volvo Aero).[9]
Pentaverken, which had manufactured engines for Volvo, was acquired in 1935, providing a secure supply of engines and entry into the marine engine market.[13]
The first bus, named B1, was launched in 1934, and aircraft engines were added to the growing range of products at the beginning of the 1940s. Volvo was also responsible for producing the Stridsvagn m/42. In 1963, Volvo opened the Volvo Halifax Assembly plant, the first assembly plant in the company's history outside of Sweden in Halifax, Nova Scotia, Canada.
In 1950, Volvo acquired the Swedish construction and agricultural equipment manufacturer Bolinder-Munktell.[14] Bolinder-Munktell was renamed as Volvo BM in 1973.[15] In 1979, Volvo BM's agricultural equipment business was sold to Valmet.[16] Later, through restructuring and acquisitions, the remaining construction equipment business became Volvo Construction Equipment.[14]
In the 1970s, Volvo started to move away from car manufacturing to concentrate more on heavy commercial vehicles. The car division focused on models aimed at upper middle-class customers to improve its profitability.[17]""",
        imgURL:
            "https://i.guim.co.uk/img/media/5e1f4118dcf18493afac0a8a8e55326d115b1709/647_543_3841_2305/master/3841.jpg?width=1900&dpr=1&s=none"),
    Cars(
        title: "Wolswagen",
        content:
            """Volkswagen is giving its iconic compact car a facelift. To remain competitive in a segment dominated by crossovers, the Mk8.5 Golf spices things up with a sharper exterior design, a new infotainment system, and some much-needed mechanical improvements. While the US will only get the GTI and Golf R, the standard Golf will still be available in hatchback and wagon body styles throughout Europe.
VW is showing the updated Golf in several flavors. The hatchback comes in eHybrid and GTE plug-in hybrid forms, as well as the America-bound GTI. The more practical Variant estate is shown in the R-Line guise. The only ones missing from the lineup are the all-wheel-drive R and the GTD performance diesel.
The biggest changes on the outside are the redesigned LED light fixtures, with the more expensive Golfs featuring a full-LED headlight setup with an illuminated VW badge. At an additional cost, customers will be able to opt for a more sophisticated matrix LED setup with a high beam almost twice as powerful as the regular high beam. At the rear, the fancier taillights feature 3D-like graphics with three selectable patterns – similar to what Audi offers on some of its models.""",
        imgURL:
            "https://cdn.motor1.com/images/mgl/Kb1e0M/s1/2024-volkswagen-golf-gte.webp")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView.builder(
        itemCount: carsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: kartim(c1: carsList[index], context: context),
          );
        },
      ),
    );
  }
}

Widget? kartim({required Cars c1, required context}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return Detay(
            ces: c1,
            context: context,
          );
        },
      ));
    },
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            c1.imgURL,
            height: 265,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  c1.title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(c1.content),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.amber[50],
    title: Text("Ödev"),
    leading: Icon(Icons.workspaces_filled),
    actions: [
      Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 7,
          ),
        ],
      ),
    ],
    centerTitle: true,
  );
}
