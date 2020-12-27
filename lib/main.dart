import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> data = [
    'Sushi',
    'Oseng Sayur',
    'Beef',
    'Jus Orange',
    'Jus Avocado',
    'Jus Apple',
    'Seblak',
    'Baso',
    'Ikan Bakar',
    'Ayam Geprek',
  ];

  List<String> gambar = [
    'gambar/sushi.jpg',
    'gambar/oseng_sayur.jpg',
    'gambar/beef.jpg',
    'gambar/jus_orange.jpg',
    'gambar/jus_avocado.jpg',
    'gambar/jus_apple.jpg',
    'gambar/seblak.jpg',
    'gambar/baso.jpg',
    'gambar/ikan_bakar.jpeg',
    'gambar/ayam_geprek.jpg',
  ];

  List<String> detail = [
    """3 cup beras khusus sushi , 1/2 cuka beras, 2 sdt garam , 2 sdt gula, 3 lembar nori/rumput laut kering, 5 sdm mayonaise (pedas/original sesuai selera), 1 buah alpukat/ timun(bisa ditambah/kurangi sesuai selera), 250gr ikan salmon/tuna (bisa ditambah/kurangi sesuai selera) , 5 sdt kecap asin (bisa ditambah/kurangi sesuai selera), 2 sdt wasabi (bisa ditambah/kurangi sesuai selera)""",
    """5 potong Tahu putih, 5 ikat Sawi sendok yg kecil, 3 wortel sedang, 2 kentang, 2 siung bawang putih, 5 siung bawang merah, sesuai selera Cabe rawit + merah, 2 helai daun salam, Lengkuas kecil, secukupnya Garam, gula, penyedap rasa secukupnya, Kecap""",
    """500 g daging fillet sapi, iris melintang serat tipis, 1 sdm kecap Inggris, 1 sdm kecap manis, ½ sdt merica bubuk, 1 sdm mentega, 1 siung bawang putih, cincang, 75 g bawang bombay, iris tipis, 1 sdm tepung terigu, 200 cc air, Lada hitam secukupnya, sesuai selera""",
    """3 Buah Jeruk, 1 cup susu kental manis, Es Batu, Air gula (jika diinginkan)""",
    """Buah alpukat yang sudah matang, Air matang, Gula pasir secukupnya, Es batu secukupnya""",
    """1 apel merah atau hijau masih segar, 2 sendok makan gula pasir, susu kental manis secukupnya, air secukupnya, es batu secukupnya""",
    """Kerupuk kanji mentah 50 g, Telur ayam 1 butir. Kocok, Daun bawang 1 batang. Iris halus, Seledri 1 batang. Iris halus, Garam sdt, Penyedap rasa sdt,Kecap manis 1 sdm, cabe rawit 3 buah, Bawang merah 2 siung, Bawang putih 1 siung, Kencur 2 ruas jari""",
    """1 buah tahu sutera, 1 buah tahu sutera, 100 gr udang, 100 gr udang, 1 buah wortel, 1 buah wortel, Buah telur, Buah telur, 2 siung bawang putih, 2 siung bawang putih, 4 sdm sagu, 4 sdm sagu, 2.5 ml himalayan salt, 2.5 ml himalayan salt, 1 sdt lada, 1 sdt lada""",
    """500 gram ikan jenis apa saja (kira-kira 3 ekor), 4 sendok makan kecap manis, 1 buah jeruk nipis, 1 sendok makan air asam Jawa kental, 1 sendok makan minyak goreng, 5 butir bawang merah, 3 siung bawang putih, 2 cm jahe, 1 buah cabai merah besar, 1/2 sendok teh ketumbar sangrai, garam secukupnya""",
    """Ayam kampung: 1 ekor, Bumbu ayam grprek sederhana, Bawang putih: 2 siung, Ketumbar bubuk: 1 sendok makan, Garam: 2 sendok teh, Merica: 1 sendok teh, Bahan Pelapis, Tepung terigu: 4 sendok makan, Baking powder: 1/2 sendok teh, Telur: 1 butir, Lada secukupnya, Garam secukupnya, Merica secukupnya, Cabe rawit: 10 buah (sesuai selera), Bawang merah: 4 buah, Bawang putih: 3 siung, Tomat: 1 buah, Garam secukupnya, Gula secukupnya"""
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Bahan Makanan',
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Daftar Makanan'),
          ),
          body: new GridView.builder(
              itemCount: data.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, index) => Center(
                      child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetailMakanan(
                                item: data[index],
                                itemgambar: gambar[index],
                                itemdetail: detail[index]),
                          ));
                    },
                    title: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            gambar[index],
                          ),
                          width: 380.0,
                          height: 160.0,
                          fit: BoxFit.cover,
                        ),
                        Text(data[index]),
                      ],
                    ),
                  )))),
    );
  }
}

class DetailMakanan extends StatelessWidget {
  DetailMakanan({Key key, this.item, this.itemgambar, this.itemdetail})
      : super(key: key);
  final String item;
  final String itemgambar;
  final String itemdetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Makanan'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(itemgambar),
              width: 380.0,
              height: 160.0,
              fit: BoxFit.cover,
            ),
            Text(item, style: TextStyle(fontSize: 30.0)),
            Center(
                child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Text(
                      itemdetail,
                      textAlign: TextAlign.justify,
                    ))),
          ],
        ),
      ),
    );
  }
}
