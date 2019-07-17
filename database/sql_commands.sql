CREATE DATABASE `petclinic`;

CREATE TABLE `petclinic`.`types`
(
  `id`   INT         NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `petclinic`.`owners`
(
  `id`         INT          NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30)  NOT NULL,
  `last_name`  VARCHAR(30)  NOT NULL,
  `address`    VARCHAR(255) NOT NULL,
  `city`       VARCHAR(80)  NOT NULL,
  `telephone`  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `petclinic`.`pets`
(
  `id`         INT         NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(45) NOT NULL,
  `birth_date` DATE        NOT NULL,
  `type_id`    INT         NOT NULL,
  `owner_id`   INT         NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `type_fk_idx` (`type_id` ASC) VISIBLE,
  INDEX `owner_fk_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `type_fk`
    FOREIGN KEY (`type_id`)
      REFERENCES `petclinic`.`types` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  CONSTRAINT `owner_fk`
    FOREIGN KEY (`owner_id`)
      REFERENCES `petclinic`.`owners` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


CREATE TABLE `petclinic`.`vets`
(
  `id`         INT         NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name`  VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `petclinic`.`specialties`
(
  `id`   INT         NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `petclinic`.`vet_specialties`
(
  `vet_id`       INT NOT NULL,
  `specialty_id` INT NOT NULL,
  INDEX `vet_fk_idx` (`vet_id` ASC) VISIBLE,
  INDEX `specialty_fk_idx` (`specialty_id` ASC) VISIBLE,
  CONSTRAINT `vet_fk`
    FOREIGN KEY (`vet_id`)
      REFERENCES `petclinic`.`vets` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  CONSTRAINT `specialty_fk`
    FOREIGN KEY (`specialty_id`)
      REFERENCES `petclinic`.`specialties` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE `petclinic`.`visits`
(
  `id`          INT          NOT NULL AUTO_INCREMENT,
  `pet_id`      INT          NOT NULL,
  `vet_id`      INT          NOT NULL,
  `visit_date`  DATE         NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `pet_fk_idx` (`pet_id` ASC) VISIBLE,
  INDEX `vet_fk_idx` (`vet_id` ASC) VISIBLE,
  CONSTRAINT `pet_fk`
    FOREIGN KEY (`pet_id`)
      REFERENCES `petclinic`.`pets` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  CONSTRAINT `vet_pet_fk`
    FOREIGN KEY (`vet_id`)
      REFERENCES `petclinic`.`vets` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

# ========================================

insert into `petclinic`.`types` (`id`, `name`) values (1, 'cat');
insert into `petclinic`.`types` (`id`, `name`) values (2, 'dog');
insert into `petclinic`.`types` (`id`, `name`) values (3, 'snake');
insert into `petclinic`.`types` (`id`, `name`) values (4, 'rabbit');
insert into `petclinic`.`types` (`id`, `name`) values (5, 'pig');
insert into `petclinic`.`types` (`id`, `name`) values (6, 'owl');
insert into `petclinic`.`types` (`id`, `name`) values (7, 'cow');

# ========================================

insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (1, 'Amory', 'Shilburne', '46574 Truax Circle', 'Zhangqiang', '800-229-3417');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (2, 'Rhea', 'Alfwy', '58 Starling Alley', 'Palocabildo', '221-307-6545');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (3, 'Rees', 'Bakeup', '67 Ridgeview Street', 'Weixin', '478-481-4134');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (4, 'Nada', 'Gealle', '66 Di Loreto Road', 'San Pablo', '370-344-4864');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (5, 'Samuele', 'Leatherland', '70164 Utah Pass', 'Clermont-Ferrand', '732-833-5928');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (6, 'Ermin', 'Avon', '822 Ridgeview Alley', 'Helsingborg', '119-223-2520');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (7, 'Fulton', 'Scading', '93982 Superior Court', 'Isiolo', '767-926-3407');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (8, 'Lief', 'Stathor', '08 Corscot Circle', 'Pakham', '263-103-9425');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (9, 'Taryn', 'Wanden', '803 Caliangt Terrace', 'Cuenca', '734-149-7981');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (10, 'Florrie', 'McElhinney', '626 Caliangt Place', 'Tanggung', '948-393-9991');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (11, 'Jonell', 'Spalding', '871 Fremont Court', 'Sypniewo', '520-323-9224');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (12, 'Rosalie', 'Peddel', '250 Anniversary Parkway', 'Castlebridge', '224-310-7001');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (13, 'Wait', 'Pablo', '75 Duke Plaza', 'Fīrūzābād', '209-239-1992');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (14, 'Violet', 'Brockie', '9357 Huxley Parkway', 'Coolock', '461-593-3355');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (15, 'Cory', 'Landell', '8790 Lighthouse Bay Court', 'Luotang', '411-189-0990');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (16, 'Jethro', 'Taborre', '119 Grim Center', 'Dinahican', '192-590-0031');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (17, 'Seward', 'Wilshaw', '96096 Lindbergh Center', 'Baishi', '459-270-8737');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (18, 'Nina', 'Temblett', '01 Leroy Parkway', 'Beishan', '637-906-0781');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (19, 'Scarlett', 'Brunetti', '3720 Loftsgordon Crossing', 'Zhatay', '467-460-5474');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (20, 'Benjy', 'Pyatt', '9 Logan Trail', 'Sarāvān', '736-991-8370');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (21, 'Bealle', 'Finci', '00297 Northwestern Way', 'Blagoveshchensk', '238-345-2906');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (22, 'Billy', 'Di Ruggiero', '42181 Elmside Park', 'Fatuhilik', '495-109-0594');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (23, 'Carlos', 'Gibbons', '73052 Nobel Lane', 'Dodola', '604-126-4542');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (24, 'Humberto', 'Kleinstub', '4 3rd Drive', 'Stari Grad', '689-121-2633');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (25, 'Shauna', 'Napolitano', '27 8th Way', 'Krynki', '702-856-3025');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (26, 'Amelina', 'Fipp', '9 Crescent Oaks Trail', 'Salinas', '831-662-1048');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (27, 'Rodge', 'Orable', '09682 Kinsman Place', 'Maredakalada', '591-429-8592');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (28, 'Jedediah', 'Binnall', '82927 Scofield Crossing', 'Namangan Shahri', '755-342-5232');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (29, 'May', 'Packman', '0 Pierstorff Junction', 'Caballococha', '342-576-9125');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (30, 'Bourke', 'Petr', '51485 Kenwood Point', 'Sarandi', '457-513-4742');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (31, 'Jannelle', 'Fullick', '06 Kedzie Terrace', 'Saint-Lô', '938-335-6053');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (32, 'Jsandye', 'Cham', '1 Banding Place', 'Lappeenranta', '123-266-9237');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (33, 'Inna', 'Mutton', '3 Schiller Circle', 'Klenje', '743-286-3953');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (34, 'Letisha', 'Varty', '39 Algoma Circle', 'Chinhoyi', '835-763-7571');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (35, 'Hilary', 'Jedrzejczak', '084 Sunnyside Center', 'San Antonio Oeste', '565-308-6866');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (36, 'Rudolph', 'Junkinson', '22221 Weeping Birch Parkway', 'Vrtojba', '770-823-4100');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (37, 'Dixie', 'Muddiman', '77 Atwood Crossing', 'Chikola', '382-850-7160');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (38, 'Corrie', 'Mortlock', '0 Merchant Parkway', 'Lingdong', '673-919-1560');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (39, 'Sid', 'Whitworth', '36182 Myrtle Place', 'Uničov', '693-658-7234');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (40, 'Monika', 'Titcumb', '58 Buhler Pass', 'Färjestaden', '656-781-5087');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (41, 'Brandice', 'Langhor', '6 Ramsey Hill', 'Boyu', '702-166-6960');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (42, 'Nerty', 'Easen', '459 Colorado Pass', 'Viline', '401-638-7539');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (43, 'Kamillah', 'Bensusan', '4 3rd Way', 'Phultala', '930-482-5783');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (44, 'Kikelia', 'Rowlson', '4 Bonner Plaza', 'Libice nad Cidlinou', '596-127-3760');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (45, 'Alfred', 'Bridgstock', '0 Northwestern Circle', 'Jianchang', '975-432-5551');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (46, 'Hallie', 'Cleyburn', '3 Novick Crossing', 'Kinna', '560-621-9088');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (47, 'Shaina', 'Melato', '697 Brown Crossing', 'Altona', '137-110-4772');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (48, 'Ame', 'Malloch', '0087 Elgar Junction', 'Dalududalu', '328-132-6907');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (49, 'Kerry', 'Climer', '452 Meadow Valley Park', 'Santol', '700-369-1874');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (50, 'Elliot', 'Mackie', '66023 Brickson Park Alley', 'Fuenlabrada', '627-905-7034');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (51, 'Dorelle', 'Kimbury', '86 Helena Circle', 'Buda-Kashalyova', '792-189-4883');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (52, 'Olympe', 'de Werk', '14 Anderson Place', 'Fengyang Fuchengzhen', '440-856-8630');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (53, 'Nomi', 'Bimson', '416 Old Shore Hill', 'Malibong East', '411-696-0086');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (54, 'Ware', 'Langdale', '10 Kings Point', 'Saint-Tite', '102-686-8707');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (55, 'Blondelle', 'Westmore', '2 Coolidge Place', 'Pagnag', '551-517-8700');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (56, 'Reta', 'Burbury', '09934 Dexter Hill', 'Saint-Félicien', '546-601-2906');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (57, 'Brannon', 'Bram', '02069 Starling Center', 'Mazatenango', '452-981-1668');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (58, 'Goddard', 'Dinneges', '4612 Sachtjen Hill', 'Yacuíba', '423-287-2670');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (59, 'Mari', 'Longworthy', '1 Alpine Way', 'Partille', '590-200-5868');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (60, 'Tracee', 'Figura', '8 Darwin Crossing', 'Xishui', '751-800-1230');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (61, 'Taryn', 'Poad', '47 Karstens Point', 'Śliwice', '874-974-8506');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (62, 'Norrie', 'Allard', '19837 Grasskamp Junction', 'Buang', '544-816-7096');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (63, 'Lelah', 'Charette', '70109 Menomonie Junction', 'Alaverdi', '854-191-5731');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (64, 'Salomo', 'Rediers', '51 Autumn Leaf Park', 'Erjiegou', '155-615-8412');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (65, 'Ashley', 'Coppock.', '606 Lyons Junction', 'Samaipata', '903-189-5739');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (66, 'Emmalynn', 'de Keyser', '1 Badeau Crossing', 'Jabinyānah', '319-526-2483');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (67, 'Marylynne', 'Dat', '73908 Buhler Center', 'Sundsvall', '271-975-8691');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (68, 'Dewain', 'Renoden', '2 Hayes Road', 'Hà Tĩnh', '404-216-7232');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (69, 'Spenser', 'Berard', '0 3rd Place', 'Kanoni', '593-337-3025');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (70, 'Frankie', 'Emslie', '9111 Cottonwood Way', 'Jerusalem', '778-775-9081');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (71, 'Deni', 'Riden', '60 Grayhawk Junction', 'Göteborg', '983-686-7682');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (72, 'Torrey', 'Blaszczak', '8325 Luster Road', 'Dasha', '669-159-9858');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (73, 'Tracy', 'Muzzollo', '44 Drewry Way', 'Jindu', '552-378-5361');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (74, 'Cindelyn', 'Dohrmann', '0 Schmedeman Court', 'Tempe', '480-168-7461');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (75, 'Helli', 'Hertwell', '6970 Red Cloud Road', 'Sumberagung', '431-290-8689');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (76, 'Ruprecht', 'Klimkowski', '268 Namekagon Street', 'Rizal', '673-990-0265');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (77, 'Ortensia', 'Charkham', '3 Havey Street', 'Centurion', '276-615-9815');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (78, 'Saunder', 'Covotto', '7586 Helena Place', 'Itapaci', '202-336-4130');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (79, 'Clarance', 'Honnicott', '074 Roxbury Place', 'Havirga', '429-666-1405');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (80, 'Hakim', 'Cheese', '677 East Avenue', 'Zhongtong', '261-710-7906');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (81, 'Claudianus', 'Jennaroy', '9 Schlimgen Hill', 'Maojiagang', '891-897-7602');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (82, 'Morse', 'Kernocke', '14 Mallory Alley', 'Gbadolite', '287-816-3060');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (83, 'Pyotr', 'Bunting', '994 Weeping Birch Lane', 'Shenzhong', '648-362-0903');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (84, 'Jobyna', 'Cribbins', '794 Evergreen Crossing', 'Boliney', '448-833-4598');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (85, 'Karry', 'Ryam', '0 Swallow Point', 'Atlanta', '404-458-6934');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (86, 'Catarina', 'McCorkell', '64764 Basil Point', 'Hyesan-si', '792-773-3121');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (87, 'Tod', 'Croizier', '549 Pennsylvania Center', 'Javhlant', '774-483-8845');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (88, 'Ramsey', 'Semiras', '430 Fremont Junction', 'Smokvica', '611-560-8606');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (89, 'Laurie', 'Matczak', '55 Vera Circle', 'Harbin', '966-705-0905');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (90, 'Leonerd', 'Fendlen', '4 Redwing Pass', 'Longzhong', '713-773-5699');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (91, 'Chrissie', 'Ramalhete', '605 Arkansas Alley', 'Frutal', '390-780-4739');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (92, 'Hetti', 'Buncher', '59 Hanson Drive', 'Guchang', '100-358-4969');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (93, 'Brittney', 'Calvard', '786 Pine View Court', 'Jagna', '633-632-1397');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (94, 'Georg', 'Iacovaccio', '611 Drewry Trail', 'Compiègne', '794-241-8732');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (95, 'Deanne', 'Hammerberger', '75 Emmet Avenue', 'Kalloní', '951-530-1816');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (96, 'Collete', 'Ellice', '2 Bellgrove Way', 'Lisiy Nos', '614-662-9344');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (97, 'Ellyn', 'Lyst', '189 Green Ridge Pass', 'Gentilly', '121-983-8218');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (98, 'Jaquith', 'Lufkin', '39 Glacier Hill Pass', 'Yëlkino', '312-715-3322');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (99, 'Filberto', 'Geddis', '220 David Trail', 'Minyue', '778-389-6536');
insert into `petclinic`.`owners` (id, first_name, last_name, address, city, telephone) values (100, 'Billie', 'Fike', '79 Fairfield Crossing', 'Tílisos', '285-135-1050');

# ========================================

insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (1, 'Zechariah', '2017-03-27', 7, 85);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (2, 'Aguie', '2016-08-08', 5, 51);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (3, 'Adams', '2016-12-29', 2, 35);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (4, 'Andrey', '2015-10-31', 5, 89);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (5, 'Keven', '2017-09-14', 2, 52);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (6, 'Ansell', '2016-10-19', 4, 25);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (7, 'Gerik', '2017-12-27', 2, 75);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (8, 'Travers', '2016-06-01', 1, 19);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (9, 'Mill', '2017-03-22', 2, 68);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (10, 'Olenolin', '2018-03-15', 5, 24);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (11, 'Charlie', '2015-09-08', 7, 19);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (12, 'Isac', '2015-06-23', 5, 7);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (13, 'Adolpho', '2017-05-20', 2, 76);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (14, 'Grannie', '2016-12-08', 7, 47);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (15, 'Roman', '2016-10-24', 5, 100);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (16, 'Dwain', '2015-07-27', 6, 32);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (17, 'Conny', '2017-12-12', 2, 97);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (18, 'Jo', '2017-12-25', 2, 62);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (19, 'Sholom', '2018-01-11', 5, 5);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (20, 'Talbot', '2017-05-03', 4, 93);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (21, 'Ulysses', '2016-04-03', 1, 96);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (22, 'Elihu', '2017-11-16', 6, 78);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (23, 'Kip', '2017-06-15', 2, 77);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (24, 'Kermie', '2015-05-19', 7, 36);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (25, 'Byrom', '2016-04-15', 1, 78);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (26, 'Itch', '2017-09-24', 7, 3);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (27, 'Claudell', '2017-06-27', 5, 5);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (28, 'Blayne', '2018-07-13', 3, 81);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (29, 'Alessandro', '2017-11-15', 7, 33);
insert into `petclinic`.`pets` (id, name, birth_date, type_id, owner_id) values (30, 'Krishnah', '2018-05-02', 4, 52);
# ========================================

insert into `petclinic`.`vets` (id, first_name, last_name) values (1, 'Susann', 'Soppitt');
insert into `petclinic`.`vets` (id, first_name, last_name) values (2, 'Shaine', 'Appleyard');
insert into `petclinic`.`vets` (id, first_name, last_name) values (3, 'Janella', 'Upcraft');
insert into `petclinic`.`vets` (id, first_name, last_name) values (4, 'Jess', 'Derges');
insert into `petclinic`.`vets` (id, first_name, last_name) values (5, 'Shelba', 'Simonazzi');

# ========================================

insert into `petclinic`.`specialties` (id, name) values (1, 'Anaesthesiology');
insert into `petclinic`.`specialties` (id, name) values (2, 'Animal behavior');
insert into `petclinic`.`specialties` (id, name) values (3, 'Animal welfare');
insert into `petclinic`.`specialties` (id, name) values (4, 'Birds (pet and ornamental)');
insert into `petclinic`.`specialties` (id, name) values (5, 'Bovine');
insert into `petclinic`.`specialties` (id, name) values (6, 'Canine');
insert into `petclinic`.`specialties` (id, name) values (7, 'Cardiology');
insert into `petclinic`.`specialties` (id, name) values (8, 'Clinical pathology');
insert into `petclinic`.`specialties` (id, name) values (9, 'Clinical pharmacology');
insert into `petclinic`.`specialties` (id, name) values (10, 'Dentistry');
insert into `petclinic`.`specialties` (id, name) values (11, 'Dermatology');
insert into `petclinic`.`specialties` (id, name) values (12, 'Diagnostic imaging');
insert into `petclinic`.`specialties` (id, name) values (13, 'Equine');
insert into `petclinic`.`specialties` (id, name) values (14, 'Emergency and critical care');
insert into `petclinic`.`specialties` (id, name) values (15, 'Honey bee');
insert into `petclinic`.`specialties` (id, name) values (16, 'Fish');
insert into `petclinic`.`specialties` (id, name) values (17, 'Food');
insert into `petclinic`.`specialties` (id, name) values (18, 'Agro diagnostics in veterinary');
insert into `petclinic`.`specialties` (id, name) values (19, 'Forensic veterinary');
insert into `petclinic`.`specialties` (id, name) values (20, 'Feline');
insert into `petclinic`.`specialties` (id, name) values (21, 'Veterinary immunology');
insert into `petclinic`.`specialties` (id, name) values (22, 'Internal medicine');
insert into `petclinic`.`specialties` (id, name) values (23, 'Laboratory animal medicine');
insert into `petclinic`.`specialties` (id, name) values (24, 'Microbiology');
insert into `petclinic`.`specialties` (id, name) values (25, 'Neurology and neurosurgery');
insert into `petclinic`.`specialties` (id, name) values (26, 'Nutrition');
insert into `petclinic`.`specialties` (id, name) values (27, 'Oncology');
insert into `petclinic`.`specialties` (id, name) values (28, 'Ophthalmology');
insert into `petclinic`.`specialties` (id, name) values (29, 'Orthopaedics');
insert into `petclinic`.`specialties` (id, name) values (30, 'Parasitology');
insert into `petclinic`.`specialties` (id, name) values (31, 'Pathology');
insert into `petclinic`.`specialties` (id, name) values (32, 'Porcine');
insert into `petclinic`.`specialties` (id, name) values (33, 'Poultry');
insert into `petclinic`.`specialties` (id, name) values (34, 'Preventive medicine');
insert into `petclinic`.`specialties` (id, name) values (35, 'Radiology');
insert into `petclinic`.`specialties` (id, name) values (36, 'Reptile and amphibian');
insert into `petclinic`.`specialties` (id, name) values (37, 'Shelter medicine');
insert into `petclinic`.`specialties` (id, name) values (38, 'Sports medicine');
insert into `petclinic`.`specialties` (id, name) values (39, 'Surgery');
insert into `petclinic`.`specialties` (id, name) values (40, 'Theriogenology');
insert into `petclinic`.`specialties` (id, name) values (41, 'Toxicology');
insert into `petclinic`.`specialties` (id, name) values (42, 'Zoological medicine');

# ========================================

insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 1);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 1);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 36);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 35);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 3);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (2, 24);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 18);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 33);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 39);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 3);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 11);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 18);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (2, 15);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 18);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 38);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 17);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (1, 40);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (5, 38);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (2, 26);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 37);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 7);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (2, 37);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 14);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 1);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (4, 24);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (1, 30);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 26);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (2, 36);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (3, 4);
insert into `petclinic`.`vet_specialties` (vet_id, specialty_id) values (1, 33);

# ========================================


insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (1, 22, 2, '2019-06-15', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (2, 3, 5, '2019-05-31', 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (3, 2, 3, '2019-06-27', 'cubilia curae nulla dapibus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (4, 17, 5, '2019-06-12', 'aliquam lacus morbi quis tortor id nulla ultrices');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (5, 9, 3, '2019-05-12', 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (6, 16, 4, '2019-07-07', 'at turpis donec posuere metus vitae ipsum aliquam non mauris');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (7, 16, 3, '2019-05-26', 'nunc rhoncus dui');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (8, 24, 1, '2019-04-24', 'eget massa tempor convallis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (9, 24, 3, '2019-06-08', 'nec sem duis aliquam convallis nunc');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (10, 3, 5, '2019-05-31', 'donec ut dolor morbi vel lectus in quam fringilla rhoncus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (11, 14, 2, '2019-07-12', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (12, 2, 5, '2019-07-09', 'integer ac neque duis bibendum morbi non quam nec');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (13, 19, 2, '2019-04-28', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (14, 26, 3, '2019-04-04', 'natoque penatibus et magnis dis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (15, 14, 5, '2019-04-15', 'ligula suspendisse ornare consequat lectus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (16, 23, 3, '2019-06-20', 'eros vestibulum ac est lacinia nisi venenatis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (17, 1, 4, '2019-04-04', 'ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (18, 19, 5, '2019-06-20', 'morbi sem mauris laoreet');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (19, 22, 5, '2019-06-19', 'eleifend donec ut dolor morbi');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (20, 11, 3, '2019-05-28', 'nunc commodo placerat praesent blandit nam nulla integer');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (21, 15, 2, '2019-06-06', 'tortor duis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (22, 12, 3, '2019-05-05', 'nisi');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (23, 2, 4, '2019-06-01', 'dui vel sem sed sagittis nam congue risus semper porta');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (24, 17, 2, '2019-06-14', 'elementum nullam varius');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (25, 16, 2, '2019-04-18', 'at dolor quis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (26, 13, 5, '2019-04-14', 'augue vestibulum rutrum rutrum neque aenean auctor gravida');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (27, 5, 2, '2019-05-24', 'convallis eget eleifend luctus ultricies eu nibh');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (28, 22, 3, '2019-05-20', 'pretium quis lectus suspendisse potenti in eleifend');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (29, 27, 2, '2019-06-09', 'maecenas tincidunt lacus at velit vivamus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (30, 10, 5, '2019-05-13', 'vestibulum proin eu mi nulla');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (31, 11, 2, '2019-04-24', 'ante vivamus tortor duis mattis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (32, 28, 2, '2019-04-22', 'sit amet nulla quisque arcu');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (33, 21, 1, '2019-07-02', 'lectus pellentesque eget nunc donec quis orci');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (34, 29, 4, '2019-05-02', 'turpis elementum ligula vehicula');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (35, 6, 2, '2019-05-05', 'nulla ultrices aliquet maecenas leo odio condimentum id');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (36, 23, 5, '2019-05-24', 'id nulla ultrices aliquet');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (37, 17, 2, '2019-04-08', 'molestie sed justo pellentesque viverra pede ac diam cras');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (38, 21, 5, '2019-04-08', 'lectus vestibulum');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (39, 17, 2, '2019-07-08', 'ac lobortis vel dapibus at diam nam tristique tortor eu');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (40, 3, 1, '2019-07-16', 'nulla justo aliquam quis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (41, 4, 1, '2019-06-09', 'fringilla rhoncus mauris enim leo rhoncus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (42, 19, 2, '2019-06-04', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (43, 15, 2, '2019-06-27', 'augue vestibulum');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (44, 23, 1, '2019-05-12', 'etiam faucibus cursus urna ut');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (45, 27, 5, '2019-05-26', 'enim');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (46, 13, 1, '2019-07-15', 'penatibus et magnis dis parturient montes nascetur ridiculus mus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (47, 1, 3, '2019-07-12', 'nibh in lectus pellentesque');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (48, 28, 2, '2019-06-30', 'faucibus orci luctus et ultrices posuere cubilia curae nulla');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (49, 10, 1, '2019-06-22', 'proin risus praesent');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (50, 24, 5, '2019-06-28', 'aenean fermentum donec ut');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (51, 21, 5, '2019-04-11', 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (52, 12, 4, '2019-05-28', 'in');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (53, 22, 3, '2019-06-19', 'mauris eget massa');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (54, 30, 1, '2019-04-19', 'interdum eu tincidunt in leo maecenas');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (55, 10, 2, '2019-07-03', 'imperdiet nullam orci pede venenatis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (56, 29, 4, '2019-06-04', 'maecenas tristique est et tempus semper est quam pharetra magna');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (57, 26, 1, '2019-05-24', 'ut massa quis augue');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (58, 21, 1, '2019-06-20', 'pretium quis lectus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (59, 19, 5, '2019-06-27', 'justo');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (60, 23, 1, '2019-06-19', 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (61, 22, 5, '2019-07-12', 'lectus pellentesque');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (62, 21, 5, '2019-05-17', 'eu');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (63, 22, 1, '2019-06-21', 'pede justo lacinia eget tincidunt eget tempus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (64, 26, 4, '2019-07-13', 'habitasse platea dictumst');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (65, 2, 2, '2019-07-08', 'posuere cubilia');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (66, 27, 2, '2019-07-06', 'sed tincidunt eu felis fusce posuere felis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (67, 28, 5, '2019-06-15', 'odio curabitur convallis duis consequat dui nec');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (68, 17, 4, '2019-06-12', 'ligula suspendisse ornare consequat lectus in');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (69, 16, 3, '2019-04-21', 'maecenas leo odio condimentum id luctus nec molestie');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (70, 22, 1, '2019-05-16', 'natoque penatibus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (71, 13, 2, '2019-05-12', 'nunc nisl duis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (72, 28, 2, '2019-07-02', 'purus sit amet nulla quisque');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (73, 24, 3, '2019-06-08', 'dis parturient');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (74, 13, 4, '2019-04-30', 'ultrices vel augue vestibulum ante ipsum primis in');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (75, 26, 5, '2019-06-11', 'hac habitasse platea dictumst etiam faucibus cursus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (76, 14, 3, '2019-07-09', 'eget');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (77, 8, 5, '2019-04-29', 'dui');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (78, 22, 1, '2019-06-20', 'tristique');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (79, 25, 2, '2019-04-02', 'lectus pellentesque');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (80, 27, 1, '2019-04-14', 'a libero nam');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (81, 9, 3, '2019-04-04', 'augue a suscipit nulla elit ac nulla sed vel');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (82, 27, 5, '2019-07-05', 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (83, 7, 5, '2019-06-06', 'cras in purus eu magna vulputate luctus cum sociis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (84, 23, 2, '2019-04-29', 'pretium iaculis justo in hac habitasse platea');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (85, 4, 4, '2019-06-14', 'ut nunc vestibulum ante ipsum');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (86, 14, 5, '2019-05-23', 'est et tempus semper est quam');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (87, 21, 5, '2019-07-07', 'quisque porta volutpat erat quisque erat eros viverra');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (88, 2, 1, '2019-04-04', 'ante vivamus tortor duis mattis egestas metus aenean fermentum');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (89, 23, 5, '2019-05-23', 'congue elementum in hac habitasse platea');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (90, 21, 3, '2019-04-26', 'in felis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (91, 27, 3, '2019-05-12', 'nulla neque libero convallis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (92, 14, 4, '2019-05-01', 'lectus');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (93, 3, 2, '2019-04-24', 'in felis donec semper sapien a libero');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (94, 30, 4, '2019-06-12', 'consequat');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (95, 18, 1, '2019-05-12', 'sed accumsan felis ut at dolor quis');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (96, 28, 5, '2019-05-19', 'imperdiet nullam orci');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (97, 23, 1, '2019-04-24', 'tellus semper interdum mauris ullamcorper purus sit amet nulla');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (98, 13, 5, '2019-05-19', 'donec posuere metus vitae ipsum aliquam non mauris');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (99, 14, 3, '2019-05-28', 'donec');
insert into `petclinic`.`visits` (id, pet_id, vet_id, visit_date, description) values (100, 11, 2, '2019-04-17', 'penatibus et');
# ========================================

