# AddToBasket

AddToBasket uygulamsı  Anasayfada API den çektiğimiz ürünleri listelediğimiz .Daha Sonra bu ürünleri sepete eklediğimiz ve sepete eklediğimiz ürünleri satın aldığımız bir mobil alışveriş  uygulamsıdır.

Anasayfada ve sepet ekranında verileri alışverişi  için  "Alamofire" kütüphanesi kullanılmıştır.Aşağıda linki bulunmaktadır.
https://github.com/Alamofire/Alamofire


Anasayfada ve sepet  ekranında kullanığımız JSON verilerinin parse edilmesi işlemini bizim için kolay bir halebir diğer kütüphane de  " SwiftyJSON" kütüphanesidir.Linki aşağıda bulunmaktadır.
https://github.com/SwiftyJSON/SwiftyJSON

Anasayfa ve sepet ekranlarındaki resimleri imageView de görüntülemek için "Kingfisher" kütüphanesi kullanılmıştur. Bu kütüphane  görüntüyü url'den indirecek, hem bellek önbelleğine hem de disk önbelleğine gönderecek ve imageView'da görüntüleyecektir. Daha sonra aynı URL ile ayarladığınızda, resim önbellekten alınır ve hemen gösterilir. Kingfisher kütüphanesi ile resimleri hızlı bir şekilde indirme işlemi yapıldı.

API den indirdiğimiz verileri tutmak için "ShoppingModel" modeli oluşturuldu ve verilerimi düzenli bir şekilde bu modelde tutuldu ve gerektiği yerlerde kullanıldı.

Uygulama da sepetteki ürünlerin alınması aşamasında API den dönen değere göre işlemin gerçekleşip gerçekleştirilemediği bilgisi alert ile ekranda gösterildi.


