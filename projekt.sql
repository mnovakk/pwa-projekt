-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220618.41c48b423e
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2022 at 11:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--
CREATE DATABASE IF NOT EXISTS `projekt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projekt`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(32) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'matej', 'novak', 'mnovak', '$2y$10$oKOahFx73j74ZvhoeqGBh.VHj.hXdd.FR0XQQb5by2s/48kjHcnV6', 1),
(2, 'branko', 'brankovic', 'bbrankovic', '$2y$10$K0t7IwWtrF9Na5KTFwwsfu/1ReYRRgzx2X9YOI1/kW7vZn2iLvrBe', 0),
(3, 'ante', 'antic', 'aantic', '$2y$10$DH5/Dbtb.5JfPN2ksItMDOR9DGN50MtRSuhnbUqTZoHKNtrARZE66', 0),
(4, 'mate', 'matic', 'mmatic', '$2y$10$MkFFpe4ZGjq.52j0wKdh6ee7wFHS.hQgPU4DYyoUQYoRwDVatQR.O', 0),
(5, 'marija', 'marijic', 'mmarijic', '$2y$10$bbl9VrLVGoTR53Bh9tTeI.2oiAbiATodrrXHYtN4YuZwDpnfvXeNu', 0),
(6, 'ivica', 'ivic', 'iivic', '$2y$10$iIoBDcwc5wWHpSzFOFTLAekuw/yVfn2B2ksYzb/cXeoUQdYdvOsfO', 0),
(7, 'nikolina', 'nikolinic', 'nnikolinic', '$2y$10$fxCgZiPWJjcUHflO6eZ./eWjqknxKQ.KvCxyZvd/Ov69N1UB4i7Ou', 0),
(8, 'pero', 'peric', 'pperic', '$2y$10$7b2gkJvTUipu8wU2Fxhy5.wEJ7TQrx494r7tKe6sWhcgiXLFQ.oJS', 0),
(10, 'marko', 'markic', 'mmarkic', '$2y$10$qVzUm39k3hqA8vqVNO3cUOVNsR5bVAOu/LJV5PwZz05q.dBCRAARa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `naslov` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `sazetak` text CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `tekst` text CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `slika` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `kategorija` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `arhiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(47, '', '200 vojnika i mornara potpisalo je ugovor o vojnoj slu??bi', 'Ministarstvo obrane potpisalo je ugovore o vojni??koj slu??bi u trajanju od dvije godine s 200 vojnika, ??ime stje??u status djelatne vojne osobe', 'Kako se navodi u priop??enju, nakon vojni??ke slu??be pru??a im se mogu??nost potpisivanja ugovora na neodre??eno vrijeme.\r\n\r\nUgovori su potpisani u Sredi??tu za obuku Hrvatske ratne mornarice u Splitu, Sredi??tu za obuku Hrvatskog ratnog zrakoplovstva u Zemuniku Donjem, In??enjerijskoj pukovniji u Karlovcu, Topni??ko-raketnoj pukovniji u Bjelovaru, Sredi??tu za obuku Zapovjedni??tva za kiberneti??ki prostor i Bojnoj nuklearnoj biolo??koj kemijskoj obrani na Plesu, Sredi??tu za obuku i doktrinu logistike u Po??egi i Sredi??tu za obuku pje??a??tva i oklopni??tva u ??akovu.\r\n\r\nProbni rad traje ??est mjeseci, a sastoji se od specijalisti??ke vojne obuke u rodovskim postrojbama Hrvatske vojske i obuke na temelju obna??anja vojni??ke slu??be.\r\n\r\nPo zavr??etku obuke djelatni vojnici/mornari bit ??e raspore??eni u postrojbe Hrvatske vojske u skladu sa ste??enom vojnostru??nom specijalnosti sukladno iskazanim potrebama prema mjestu slu??be: Benkovcu, Bjelovaru, Brijunima, Karlovcu, Kninu, Lastovu, Petrinji, Puli, Sinju, Splitu, U??ki, Vara??dinu, Velikoj Gorici, Zagrebu i Zemuniku Donjem.', 'gettyimages-804955956-big.png', 'World', 0),
(51, '', 'Nabavljamo rakete za Kiowe: Na??a je obveza platiti 10,8 mil. kun', 'U suradnji sa SAD-om MORH nabavlja rakete Hydra. Zaprimili su pismo ponude ??ija je vrijednost ??est milijuna i 182.248 ameri??kih dolara. Obveza je RH da plati porez na dodanu vrijednost u 2023. i 2024. godini', 'Vlada je na dana??njoj sjednici dala suglasnost Ministarstvu obrane za preuzimanje obveza na teret sredstava dr??avnog prora??una Republike Hrvatske u 2023. i 2024. godini za nabavu raketa Hydra za helikoptere OH-58D Kiowa Warrior. \r\n- Helikopteri koji su donacija SAD-a isporu??eni su RH 2016. godine, a do kraja 2017. uvedeni su u operativnu upotrebu HV-a. Time je HV dostigla novu helikoptersku sposobnost izvidni??kog i povr??inskog borbenog djelovanja danju i no??u. Nabavom zrakoplovno-ubojnih sredstva odr??ava se dostignuta sposobnost povr??inskog borbenog djelovanja i zraka u svrhu potpore borbenog djelovanja kopnenih snaga - podsjetio je ministar obrane Mario Bano??i??. \r\n\r\nNabava raketa Hydra, dodao je, planira se provesti, tako??er, u partnerstvu sa SAD-om. Pojasnio je kako Hrvatska pla??a porez u iznosu 10,8 milijuna kuna. \r\n\r\n- Zaprimljeno je pismo ponude ??ija vrijednost iznosi ??est milijuna i 182.248 ameri??kih dolara. Obveza je RH da iz prora??unskih sredstava plati porez na dodanu vrijednost prilikom isporuke ovih roba i usluga u 2023. i 2024. godini - istaknuo je dodav??i kako su sredstva planirana na razini njegova ministarstva.\r\n\r\nU 2023. ??emo platiti milijun i 51.961 kunu, a u 2024. 9,8 milijuna kuna. Ina??e, u hrvatskom vlasni??tvu je 16 helikoptera OH-58D Kiowa Warrior. ', 'recession-americans-majority-poll.png', 'World', 0),
(52, '', 'Dan nakon odlaska ameri??kog izaslanika iz Seula, Sjeverna Koreja', 'Sjeverna Koreja ispalila je osam balisti??kih projektila prema moru kod svoje isto??ne obale, objavila je ju??nokorejska vojska u nedjelju, dan nakon ??to je visoki ameri??ki izaslanik napustio Seul', 'Sjeverna Koreja je u nedjelju ispalila osam balisti??kih projektila kratkog dometa prema moru kod svoje isto??ne obale, dan nakon ??to su Ju??na Koreja i Sjedinjene Dr??ave okon??ale zajedni??ke vojne vje??be. U vje??bama je prvi put u vi??e od ??etiri godine sudjelovao i ameri??ki nosa?? zrakoplova.\r\n\r\nNajmanje osam projektila ispaljeno je iz podru??ja Sunan u sjevernokorejskom glavnom gradu Pjongjangu, saop??io je Zdru??eni sto??er Ju??ne Koreje.\r\n\r\nJapanski ministar obrane Nobuo Kishi tako??er je rekao da je Sjeverna Koreja ispalila vi??e projektila i da se taj ??in \"ne mo??e tolerirati\". Na brifingu je rekao da je barem jedan projektil imao promjenjivu putanju, ??to ukazuje da bi mogao manevrirati kako bi izbjegao raketnu obranu.\r\n\r\nAmeri??ko indo-pacifi??ko zapovjedni??tvo je u priop??enju navelo da je vi??estrukim lansiranje balisti??kih projektila Sjeverne Koreje naglasila destabiliziraju??i u??inak svog programa ilegalnog naoru??anja, ali da doga??aj nije predstavljao neposrednu prijetnju.\r\n\r\nSpecijalni predstavnik SAD-a Sung Kim sastao se u petak u Seulu sa svojim ju??nokorejskim i japanskim kolegama Kimom Gunnom i Funakoshijem Takehirom kako bi se pripremio za \"sve nepredvi??ene situacije\" slijedom naznaka da se Sjeverna Koreja sprema provesti nuklearni test prvi put od 2017. godine.\r\n\r\nWashington je Pjongjangu vrlo jasno dao do znanja da je otvoren za diplomaciju, rekao je Kim tijekom posjeta, isti??u??i da je voljan razgovarati o stvarima koje su od interesa za Pjongjang, poput ubla??avanja sankcija.\r\n\r\nPro??log tjedna Sjedinjene Dr??ave pozvale su na dodatne sankcije UN-a Sjevernoj Koreji zbog njezinih lansiranja balisti??kih projektila, ali su Kina i Rusija stavile veto na prijedlog.', 'korea.png', 'U.S', 0),
(53, '', 'Misterij ruskog sustava S-300 u Zagrebu: Teglja?? MAN je pred Tu??', 'Na vojnoj paradi 30. svibnja 1995. na Jarunu svi su uo??ili Tu??manovu bijelu uniformu i uspore??ivali je s Titovom, ali naj??e????a je poruka trebala biti upu??ena s prikolice golemoga teglja??a MAN i ??etiri lansirne cijevi...', 'To ??to je veleposlanik Ruske Federacije u Zagrebu Anvar Azimov, koji je prije dva mjeseca ??estoko pritisnuo hrvatsku Vladu i najavio da ??e se s Agrokorom dogoditi kaos, sada ostao u sjeni zbivanja s Agrokorom ? ne zna??i da nije aktivan. Ovih je dana pozvao u veleposlanstvo na razgovor Zvonka Zubaka, hrvatskog biznismena koji se bavi trgovinom oru??ja, koji je u vrijeme Domovinskog rata bio u grupi koja je putem njihove tvrtke Winsley Finance Limited bila glavni opskrbljiva?? Hrvatske oru??jem.\r\n\r\nU cijelosti je bila rije?? o naoru??anju ruskog podrijetla pa je Azimov zvao Zubaka da mu sa??ini popis sveg oru??ja koje je preko Rusije od 1992. pa sve do 1997. godine stizalo Hrvatskoj. Azimov se, naime, o??ito i dalje ljuti na Hrvatsku, na njezinu geopoliti??ku opredijeljenost, a ne pa??e mu sada, ??ini se, ni na??in na koji hrvatski premijer Andrej Plenkovi?? rje??ava problem Agrokora, za rje??avanje kojeg su jako zainteresirane i dvije ruske dr??avne banke.\r\n\r\nU razgovoru sa Zubakom Azimov je kazao da je Rusija razo??arana pona??anjem Hrvatske te da bi se Hrvati trebali podsjetiti tko ih je u vrijeme me??unarodnog embarga naoru??avao i spa??avao. Stoga je i zatra??io popis svih isporuka. Izgledno je da Rusija zna ??to je tih godina isporu??ivala zara??enoj Hrvatskoj, no trebala im je i dodatna potvrda. U popisu, koji je u posjedu Ve??ernjeg lista, navode se goleme koli??ine tog naoru??anja. Na popisu je i znameniti raketni sustav S-300 PMU koji je dijelom bio isporu??en Republici Hrvatskoj uo??i Oluje i koji je potom bio poslu??io kao psiholo??ka ko??nica zra??nim snagama SR Jugoslavije da ih odvrati od intervencije tijekom Oluje. Sustav, prema tvrdnjama Zvonka Zubaka, nikada nije otpla??en pa on jo?? od 2001. vodi sudski proces u kojemu tra??i isplatu, povrat ili nagodbu.\r\n\r\nSve hrvatske vlade od tog su procesa bje??ale te su se ufale u beskona??an sudski proces. No, ta non??alantnost sada bi Hrvatskoj mogla zakomplicirati ??ivot. Javna je tajna da je sustav, ??ini se 2004., oti??ao iz Hrvatske te da je dan na uvid najzainteresiranijima ? SAD-u i Izraelu. Kako nije bilo nikakvih ??vrstih potvrda o tome, Rusija se sve ove godine pravila da je se to ne ti??e. No sada, barem kako se mo??e i????itati iz akcije Anvara Azimova, Rusija bi naglo mogla postati zainteresirana za postavljanje pitanja Hrvatskoj ? gdje se nalazi raketni sustav koji smo vam isporu??ili!? Azimov jest pokrenuo tu akciju, koja bi mogla rezultirati novim pritiskom Rusije na Hrvatsku, no odluka o pokretanju ?neugodnih pitanja? ipak nije na njemu, nego na njegovoj sredi??njici u Moskvi.\r\n\r\n??injenica je, me??utim, da je Rusija devedesetih godina pro??log stolje??a jako zadu??ila Hrvatsku i to u vrijeme kada joj je bilo najgore. Zubaka je, kao suvlasnika tvrtke osnovane na Kanalskim otocima, iza koje se tada krilo 20-ak osniva??a, raznih poslovnih ljudi iz Engleske, Finske, Kanade, ??vicarske, ??e??ke, Njema??ke, tada u razgovorima u Zagrebu anga??irala hrvatska strana da poku??a nabaviti oru??je koje drugi dobavlja??i nisu uspijevali nabaviti, a to se uglavnom odnosilo na borbene zrakoplove, helikoptere, razne protuavionske i protuoklopne rakete. Prvobitna je ideja bila da se za nabavu trgovci obrate SAD-u. I prvi kontakti, izme??u Bo??i??a i Nove godine 1991., pokazivali su da Amerikanci ??ele pomo??i. Jedan od savjetnika za obranu tada??njeg predsjednika SAD-a Georgea Busha seniora do??ao je u Zagreb i izgledalo je da ??e RH dobiti zrakoplove (remontirane F-15). No, nekoliko tjedana poslije Zubaka je savjetnik pozvao na sastanak u Pariz i rekao mu da si SAD, na??alost, ?ne mo??e dopustiti kr??enje embarga?. No, ponudio je za RH drugo rje??enje i kazao da ??e pomo??i u tome da svoje vojne potrebe Hrvatska rije??i preko Rusije te je dao kontakt prema tajnim agentima Finske koji su u to vrijeme imali najbolje izgra??ene odnose s ruskim generalima. U Hrvatskoj su bili jako sumnji??avi prema ovom aran??manu jer je vladalo mi??ljenje da su Rusi povezani sa Srbijom i da od tog posla ne??e biti ni??ta, nego da ??e Rusi pokupiti novac, a ne??e nam isporu??iti ni??ta. Zubakov Winsley u akciju kre??e sa svojim novcem i slijedi odlazak u Moskvu, preko Finske. Tamo su dogovoreni detalji, a kada je posao odobrio i ruski predsjednik Boris Jeljcin, po??ela je prva, oprezna isporuka dva transportna helikoptera Mi-8.\r\n\r\n', 'tito.png', 'U.S', 0),
(54, '', '??udesni Alonso odmah do Maxa, Verstappen kre??e prvi', 'Pilot Red Bulla Sergio Perez zapeo je u barijeri tijekom druge runde, nije mogao nastaviti po jakoj ki??i, pa su kvalifikacije bile prekinute. Kada su opet krenule, nevjerojatni ??panjolac napravio je podvig', 'Aktualni svjetski prvak u Formuli 1 Nizozemac Max Verstappen (Red Bull) bio je najbr??i na ki??nim kvalifikacijama za Veliku nagradu Kanade u Montrealu, dok ??e njegov najve??i konkurent za naslov Monega??anin Charles Leclerc (Ferrari) krenuti sa zadnje pozicije.\r\nNizozemac je u subotu u ki??nom Montrealu osvojio svoj drugi pole position u sezoni i 15. u karijeri, a okoristio se pehom Leclerca.\r\n\r\nNaime, u Ferrariju su bili prisiljeni zamijeniti kompletnu pogonsku jedinicu na Leclercovom bolidu ??ime je Monega??anin zaradio kaznu za nedjeljnu utrku na kojoj ??e tre??eplasirani u ukupnom redoslijedu voza??a morati krenuti zadnji, iz posljednjeg reda zajedno s Yukijem Tsunodom.\r\nU te??kim uvjetima na stazi briljirao je dvostruki svjetski prvak ??panjolac Fernando Alonso koji je u svojem Alpineu napravio fantasti??an podvig i u nedjelju ??e startati drugi dok tre??i kre??e jo?? jedan ??panjolac, Carlos Sainz iz Ferrarija. Iako je u petak svojoj mom??adi poru??io da je \"bolid nevjerojatno lo??\", Britanac Lewis Hamilton uspio je odvesti ??etvrto najbr??e vrijeme.\r\nDrugoplasirani u ukupnom poretku i voza?? Red Bulla Meksikanac Sergio Perez zapeo je u barijerama i nije mogao nastaviti tijekom druge kvalifikacijske runde pa ??e startati kao 13.', 'formula.png', 'World', 0),
(55, '', 'Nepoznato o Luki Modri??u: Profesori, prijatelji i suigra??i o stv', 'Sam je pobje??ivao tri godine starije dje??ake, trenirali su pod granatama, a po dolasku u Zagreb godinu je dana ??ivio u sobici na Dinamovu stadionu, suigra??i su nakon svojih izlazaka dolazili k njemu prespavati...', 'Bum, bum, bum, ??uli bismo granate pa svi pod stol i onda u podrum ??kole. ??esto su nam napadi i uzbune prekidali nastavu, ali uspjeli smo vi??e-manje odraditi sve prema programu.\r\n\r\nPri??ala nam je to Maja Grbi??, u??iteljica Luke Modri??a u prva ??etiri razreda zadarske osnovne ??kole. U??iteljica koja je sa??uvala i famozni Lukin sastavak o djedu, koji su 24sata ekskluzivno prvi objavili.\r\n\r\nLukine razrednice iz osnovne ??kole pri??ale su nam o mirnom dje??aku velikih okica, koji je obo??avao loptu. I kojeg su s prozora gledale kako dribla i puca na hotelskom parkirali??tu.\r\n\r\n- Luka, ajde ku??i raditi doma??i rad! - vikala bih mu, a on mi je odgovarao:\r\n\r\n- Evo, jo?? sam zero!\r\n\r\nModri??ev profesor tjelesnog odgoja otkrio nam je kako je maleni virtuoz sam pobje??ivao tri godine starije dje??ake, a prijatelji iz djetinjstva kako su u Zadru trenirali pod granatama i kako je Luka bio najbolji i u ko??arci i ostalim igrama.\r\n\r\nA po dolasku u Zagreb godinu je dana ??ivio u sobici na Dinamovu stadionu, s kasnije slavnim cimerom. Izlazio nije, ali su suigra??i nakon svojih izlazaka dolazili k njemu prespavati. U Zapre??i??u je dres plesao oko njega, Inter mu i danas duguje novac, u Madridu je ikona, za Hrvatsku je jedini sakupio vi??e od 150 nastupa, a Mostar je i danas ponosan na njega. Kao i cijela Hrvatska...\r\n\r\nPro??itajte vi??e u velikom specijalu 24sata u ponedjeljak.', 'modric.png', 'U.S', 0),
(60, '', 'Radnici Applea pristupili su sindikatu, prvi slu??aj ', 'Vi??e od stotinu radnika u Towsonu blizu Baltimorea \"velikom ve??inom glasalo je za pristupanje Me??unarodnom udru??enju strojara i radnika u zrakoplovstvu\", objavio je sindikat na svojoj internetskoj stranici', 'Radnici Applea u ameri??koj saveznoj dr??avi Maryland u subotu su glasovanjem odlu??ili pristupiti sindikatu, postav??i tako prvi zaposlenici u maloprodaji tog tehnolo??kog diva koji su se sindikalno organizirali u Sjedinjenim Ameri??kim Dr??avama.\r\n\r\nVi??e od stotinu radnika u Towsonu blizu Baltimorea \"velikom ve??inom glasalo je za pristupanje Me??unarodnom udru??enju strojara i radnika u zrakoplovstvu\", objavio je sindikat na svojoj internetskoj stranici.\r\nLokalni radnici, okupljeni u Koaliciju organiziranih radnika u maloprodaji, \"imaju podr??ku ??vrste ve??ine na??ih suradnika\", napisali su u pismu izvr??nom upravitelju Applea Tim Cooku.\r\n\r\n\"Ovo ne ??inimo zato da bismo bili protiv ili kako bismo stvorili sukob s na??om upravom\", napisali su.\r\n\r\nGlasnogovornik Applea je, odgovaraju??i na Reutersov zahtjev za komentarom, u e-mailu napisao da tvrtka nema \"ni??ta za dodati trenutno\".\r\n\r\nSindikalno organiziranje uzima maha u nekim velikim ameri??kim korporacijama, uklju??uju??i Amazon i Starbucks.\r\nRadnici Applea u Atlanti koji su se namjeravali sindikalno organizirati povukli su takav zahtjev pro??log mjeseca, navode??i zastra??ivanje kao razlog.\r\n\r\nNeki trenutni i biv??i Appleovi radnici su pro??le godine po??eli na internetu kritizirati uvjete rada u toj tvrtki, koriste??i klju??nu rije?? \"#AppleToo\", aludiraju??i na pokret protiv seksualnog zlostavljanja koji se pro??irio internetom 2017. godine koriste??i klju??nu rije?? \"#MeToo\".', 'pxl-reu-030522-93285928.png', 'U.S', 0),
(84, '', 'Bazni kamp pod Everestom mora se preseliti, nesiguran je', 'Nepalski du??nosnik rekao je kako ??e se prona??i novo mjesto na ni??oj nadmorskoj visini gdje ne??e biti cjelogodi??njeg leda', 'Nepal se priprema preseliti bazni kamp pod Everestom jer ga globalno zagrijavanje i ljudske aktivnosti ??ine sve vi??e nesigurnim, pi??e BBC.\r\n\r\nBazni logor, koji koristi do 1500 ljudi u proljetnoj penja??koj sezoni, nalazi se na ledenjaku Khumbu koji se ubrzano stanjuje.\r\n\r\nNepalski du??nosnik rekao je kako ??e se prona??i novo mjesto na ni??oj nadmorskoj visini gdje ne??e biti cjelogodi??njeg leda.\r\n\r\nIstra??iva??i ka??u da voda destabilizira ledenjak, a penja??i se ??ale da po no??i nastaju nove pukotine u ledu u baznom logoru.\r\n\r\n\"Sada se pripremamo na premje??tanje i uskoro ??emo po??eti konzultacije sa svima uklju??enima\", rekao je Taranath Adhikari, glavni direktor nepalske turisti??ke zajednice za BBC.\r\n\r\n\"Radi se o tome da je potrebno prilagoditi se promjenama koje uo??avamo u baznom kampu i to je postalo klju??no za odr??ivost samog poslovanja vezanog uz uspone\".\r\n\r\nBazni logor trenutno se nalazi na visini od 5364 metra nadmorske visine, a novi bi bio 200 do 400 metara ni??e, rekao je Adhikari.\r\n\r\nLedenjak Khumbu, kao i mnogi drugi ledenjaci u Himalajama, ubrzano se topi i stanjuje zbog globalnog zagrijavanja, utvrdili su znanstvenici.\r\n\r\nStudija znanstvenika sa Sveu??ili??ta u Leedsu iz 2018. pokazala je da se segment blizu baznog logora stanjuje jedan metar godi??nje, a ledenjak gubi 9,5 milijuna kubi??nih metara vode.\r\n\r\nPlaninari i nepalske vlasti ka??u da se pukotine na povr??ini ledenjaka pojavljuju ??e????e nego prije.\r\n\r\n\"Neo??ekivano uo??avamo da se no??u na mjestima gdje spavamo pojavljuju pukotine\", rekao je Kishor Adhikari iz nepalske vojske koji je boravio u baznom logoru radi ??i????enja.\r\n\r\n\"Ujutro, mnogi od nas imali su taj jezivi osje??aj da smo mogli pasti u pukotine tijekom no??i. One se pojavljuju ??esto, dosta je opasno\".\r\n\r\nVode??i ??lan odbora koji je predlo??io preseljenje baznog logora, Khimlal Gautam, rekao je da nazo??nost toliko puno ljudi doprinosi problemu.\r\n\r\n\"Primjerice, zaklju??ili smo da ljudi uriniraju oko 4000 litara mokra??e svaki dan\", rekao je.\r\n\r\n\"I velike koli??ine goriva poput kerozina i plina koje palimo za kuhanje i grijanje definitivno ??e imati utjecaj na led gle??era\".\r\n\r\nAdrian Ballinger, utemeljitelj tvrtke Alpenglow Expeditions, sla??e se da taj potez ima smisla, jer predvi??a da ??e u budu??nosti biti vi??e lavina, padova ledenih gromada i stijena.\r\n\r\n\"To bi trebalo biti neprihvatljivo vo??ama ekspedicija budu??i da se mo??e izbje??i\", rekao je.\r\n\r\nJedini problem premje??tanja logora ne??to ni??e bit ??e dodatna nadmorska visina koju ??e penja??i morati pre??i iz baznog logora do sljede??e postaje na planini, kampa 1.\r\n\r\nPo sada??njim procjenama, do premje??tanja logora moglo bi do??i do 2024. godine.', 'everest2.png', 'World', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



