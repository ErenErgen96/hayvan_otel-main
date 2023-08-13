import 'package:get/get.dart';

class LocalString extends Translations {  

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR, 
      };

  final enUS = {
    'welcome': 'Welcome',
  };

  final trTR = {
    'welcome': 'Hoş geldiniz',
    'hello': 'Merhaba dünya',
    'Animal Hotel' : "Hayvan Oteli",
    'QR Time' : 'QR Saat',
    'Welcome' : 'Hoş Geldiniz',
    'Cameras' : "Kameralar",
    'Advertisement' : 'Tanıtım',
    'Contact' : 'İletişim',
    'Could\'t load the page' :'Bağlantı açılamadı',
    'Login failed':'Giriş Başarısız',
    'Login' : 'Giriş Yap',
    'Username' : 'Kullanıcı Adı',
    'Enter Your Username' : 'Kullanıcı Adınızı Giriniz',
    'Enter Your Password' : 'Parolanınızı Giriniz',
    'Password' : "Parola",
    'You do not have an account?' : 'Hesabınız yok mu?',
    'Sign Up' : "Kayıt Ol",
    'Accommodation' : 'Konaklama',
    'Happy Ending' :'Mutlu Son',
    'Name' : 'isim',
    'Surname' : 'Soyisim',
    'Phone Number' : 'Telefon Numarası',
    'Number of the Days' : 'Gün Sayısı',
    'Top Package' : 'Üst Paket',
    'Total Price' : 'Toplam Fiyat',
    'days for' : 'gün için',
    'Live Camera' : 'Canlı Kamera',
    'Virtual Tour' : 'Sanal Tur',
    'Roof' : 'Çatı',
    'Room' : 'Oda',
    'Horse' : 'At',
    'Cat' : 'Kedi',
    'Dog' : 'Köpek',
    'Bird' : 'Kuş',
    'Welcome to the Animal Hotel app! By exploring our app, you can easily take advantage of all our services.': 'Hayvan Oteli uygulamasına hoş geldiniz! Uygulamamızı keşfederek tüm hizmetlerimizden kolayca faydalanabilirsiniz.',
    'We welcome your pets with luxury accommodation and specialized care services.' : 'Hayvanınızı teslim ederken güvenle bırakabilirsiniz. Tatilinizden döndüğünüzde mutlu ve sağlıklı bir evcil dost sizi bekliyor olacak!',
    'You can confidently leave your animal with us upon delivery. When you return from your vacation, a happy and healthy pet will be waiting for you!' : 'Hayvanınızı teslim ederken güvenle bırakabilirsiniz. Tatilinizden döndüğünüzde mutlu ve sağlıklı bir evcil dost sizi bekliyor olacak!',

    
    

  };
}