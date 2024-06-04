import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev2/kisiler.dart';

class Ui extends StatelessWidget {
  List<Kisiler> kisilerListesi = [
    Kisiler(
        nameLastName: "Vladamir Putin",
        situation: "Başkan",
        avatar:
            "https://www.politico.eu/cdn-cgi/image/width=1160,height=773,fit=crop,quality=80,onerror=redirect,format=auto/wp-content/uploads/2017/08/GettyImages-826469180.jpg"),
    Kisiler(
        nameLastName: "Sokakçı",
        situation: "asfgvg",
        avatar:
            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/04/13/14/Putin-Ukraine-meme.jpg?width=1200"),
    Kisiler(
        nameLastName: "Akadas",
        situation: "sdghdgfh",
        avatar:
            "https://i.guim.co.uk/img/media/0302575de4b243c13b9289e198008157486bed5b/0_289_2899_1740/master/2899.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=007ccc04527454b95f1626177f9daea1"),
    Kisiler(
        nameLastName: "Amalos",
        situation: "zxcvzxcv",
        avatar:
            "https://media.cnn.com/api/v1/images/stellar/prod/151220115531-vladimir-putin-goggles.jpg?q=w_2182,h_1626,x_0,y_0,c_fill"),
    Kisiler(
        nameLastName: "Ghost",
        situation: "adfadsf",
        avatar:
            "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDmeV0wEeq3g/v1/-1x-1.jpg"),
    Kisiler(
        nameLastName: "Vladamir",
        situation: "qerqwer",
        avatar:
            "https://cdn.openart.ai/stable_diffusion/53455c72f30b55453c2ef0a246120251bd7803d1_2000x2000.webp"),
    Kisiler(
        nameLastName: "qwerqere",
        situation: "fghjkfg",
        avatar:
            "https://dakiniland.files.wordpress.com/2016/01/vladimir-putin-man-bun-funny-meme-hair.png"),
    Kisiler(
        nameLastName: "sdfvgsdf",
        situation: "ghjklghjk",
        avatar:
            "https://moscowrussian.com/images/%D0%9F%D1%83%D1%82%D0%B8%D0%BD-%D1%81%D0%BC%D0%B5%D1%88%D0%BD%D0%BE%D0%B9.jpg"),
    Kisiler(
        nameLastName: "xcvbxcvb",
        situation: "vbnmvbnm",
        avatar:
            "https://www.caricaturemaster.com/assets/images/putin/putin-caricature-9.jpg"),
    Kisiler(
        nameLastName: "ertyety",
        situation: "fjhftj",
        avatar:
            "https://arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/QGPYN4WIVRCFHBQ6O6UOHY2ANM.jpg"),
    Kisiler(
        nameLastName: "qwer",
        situation: "Bayuloyuşkan",
        avatar:
            "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2014_52/824456/141227-putin-mn-1235.jpg"),
    Kisiler(
        nameLastName: "zxcv",
        situation: "Başytıkyjukkan",
        avatar:
            "https://media.newyorker.com/photos/62262766a5dfad61b91b14e4/3:2/w_2559,h_1706,c_limit/Borowitz-UkrainiansPutinTrump.jpg"),
    Kisiler(
        nameLastName: "nömç",
        situation: "Başytjftjkan",
        avatar:
            "https://www.creativefabrica.com/wp-content/uploads/2022/11/06/Putin-Funny-Cartoon-45094026-1.png"),
    Kisiler(
        nameLastName: "glktyu",
        situation: "Baştyjkan",
        avatar:
            "https://media.wired.com/photos/65c628b761734289c31e3d81/master/w_2560%2Cc_limit/GettyImages-1988744753.jpg"),
    Kisiler(
        nameLastName: "qerqewr",
        situation: "Btyjytytaşkan",
        avatar:
            "https://ichef.bbci.co.uk/news/976/cpsprodpb/4EEA/production/_104820202_gettyimages-1048897934.jpg"),
    Kisiler(
        nameLastName: "uoıpyu",
        situation: "Başkavbcxxn",
        avatar:
            "https://external-preview.redd.it/aCSjNmpUMRxHwB7SA5XNPWKjeMV3yFLLwuukMxwJ13o.jpg?auto=webp&s=9dc6a581f176b11974e7db71d8bd00a63c47fea0"),
    Kisiler(
        nameLastName: "nmç.bnmv",
        situation: "Bxcvbxcvbaşkan",
        avatar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShDY8qVRtrtC43_zky2sCOOWW6xshkoUMpR2um_KZ0JQ&s"),
    Kisiler(
        nameLastName: "asdfzxcv",
        situation: "Baxxcvbşkan",
        avatar:
            "https://static.srpcdigital.com/styles/1037xauto/public/2022/03/02/ubudebvdu.jpg"),
    Kisiler(
        nameLastName: "zfcbs",
        situation: "Başxcvbxvckan",
        avatar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrDNyKtKgu6W2TiKliHAhfWwo-XBVwn-IvnfIXfr9C-g&s"),
    Kisiler(
        nameLastName: "bnmövbnvc",
        situation: "ytoıytuıtry",
        avatar:
            "https://cdn.openart.ai/stable_diffusion/f985c38113833f6e2b07b2479fe465164b15af5c_2000x2000.webp"),
    Kisiler(
        nameLastName: "<xcAS>",
        situation: "gklgjhk",
        avatar:
            "https://qph.cf2.quoracdn.net/main-qimg-c159df873510c92c4a36676c87383add-lq"),
    Kisiler(
        nameLastName: "awryyr",
        situation: "ryuwertfds",
        avatar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRy7myT1qzjNXXVVXYK8nm7JDGQnAJaAOxUnvpbuMYzg&s"),
    Kisiler(
        nameLastName: "rtukcbn",
        situation: "zxcvzxcv",
        avatar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiub4Gn7UYycPTS_l9eAE26Dv52OCd9jZiK6NRME1WWA&s"),
    Kisiler(
        nameLastName: "bmnövbncvvx",
        situation: "Başkaxvbvbn",
        avatar:
            "https://i2-prod.dailystar.co.uk/incoming/article29201093.ece/ALTERNATES/s615/1_image.jpg"),
    Kisiler(
        nameLastName: "<zcvzcxvzcxv>",
        situation: "sdfgwergt",
        avatar:
            "https://www.newsnationnow.com/wp-content/uploads/sites/108/2022/08/03ddf62516ca4ccc9e42940bcb3a4e58.jpg?w=2560&h=1440&crop=1"),
    Kisiler(
        nameLastName: "ytuıytuı",
        situation: "gjhklgh",
        avatar:
            "https://a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2018/09/1200/675/putin2.png?ve=1&tl=1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 128, 128, 128),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        child: const Icon(CupertinoIcons.pencil),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: const Color.fromARGB(255, 128, 128, 128),
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Contacts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Kisiler k1 = kisilerListesi[index];
          return _item(
              nameLastName: k1.nameLastName,
              situation: k1.situation,
              avatar: k1.avatar);
        },
        itemCount: kisilerListesi.length,
      ),
    );
  }

  Widget _item(
      {required String nameLastName,
      required String situation,
      required String avatar}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("$avatar", scale: 1),
      ),
      title: Text(nameLastName),
      subtitle: Text(situation),
    );
  }
}
