# Architektury na dockerhub -->  kamil4/spr


# Kod Index.php

# Zatrzymujemy czas w zmiennej $date, wyswietlamy port, date w formacie y-m-d h-i-s. Potem korzystamy z tablicy $_SERVER i pobieramy ip. KOlejnym krokiem jest przypisanie (wiem ze nie o to pytali ale nie # wiedzialem ja k to zrobic) do zmiennej $zone defaultowej przestrzeni czasowej i z pomoca funkcji 
date_create wyswietlamy czas w danej przestrzeni czasowej


<!DOCTYPE html>
<html>
<body>
<?php
$date = new DateTime('now'); 
echo "Autor : Kamil Rytel, Port : 80, Data uruchomienia : ";
echo $date->format('Y-m-d H:i:s');
echo "<br />Your IP address is ".$_SERVER['REMOTE_ADDR']."<br />";
$zone = date_default_timezone_get();
echo $zone;
$date1 = date_create($date->format('Y-m-d H:i:s'), timezone_open($zone));
echo "<br />" . date_format($date1, 'Y-m-d H:i:s') . "\n";
?>
</body>
</html>



# Kod dockerfile 

# (dodajemy do alpine phpv7 i apache2 nastpenie podmieniamy pliki index.php i nadajemy mu uprawnienia, 
wystawiamy na sluchanie na port 80

FROM alpine:latest
LABEL maintainer="Kamil Rytel"
ENV PHPVERSION=7
RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \ 
rm -rf /var/cache/apk/* && \
mkdir /run/apache/ && \
rm -rf /var/www/localhost/htdocs/index.html
COPY index.php /var/www/localhost/htdocs/index.php
RUN chmod 755 /var/www/localhost/htdocs/index.php && \
echo "Port 80, Kamil Rytel"
EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]


# Polecenia [kontener o registry myapp]

a) docker build -t myapp .
b) docker run -p 80:80 -d myapp 
c) -- NIe wiem jak to zrobić ale myślałem o docker history myapp, tylko ze nie wiem jak zapisac te wartosci do logow
d) docker inspect myapp  [Komentarz : W wynikach u dołu ekranu mamy, że są 4 warstwy i wypisane ich sha256]

# Architektury

# Logujemy sie na dockera, konfigurujemy buildxa i budujemy dockerfile (jest tam gdzie jest terminal 
# otwarty) okreslamy platformy oraz konto na dockerhubie
#

![VirtualBox_PAwCO2022_05_05_2022_17_53_58](https://user-images.githubusercontent.com/103449118/166967302-888228d2-6d6a-41a8-8af5-6ea3f19fad72.png)

1. docker login
2. docker buildx create --name builder1
3. docker buildx use builder1
4. docker buildx build -t kamil4/spr:tag1 --platform linux/amd64,linux/arm64,linux/arm/v7 --push .


![Untitled](https://user-images.githubusercontent.com/103449118/166967122-19098869-a1e8-4c83-a706-ebf458bbe109.png)
