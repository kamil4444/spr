1. Tworzymy acces token w sekretach na dockerhubie i kopiujemy string
2. tworzymy sekret nazwy uzytkownika podajac w polu id na dockerhubie
3. tworzymy sekret hasla podajac w polu skopiowany string z acces tokena na dockerhubie
4. puszczamy main.yaml, ktory zainstaluje server z dockerfile z githuba. Dodatkowo
instalacja pojdzie na kilka platform (tak jak w zadaniu1) poprzez dodatek qemu.
Wrzucilem screeny z secretow z githuba oraz budowania main.yaml.