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
(47, '', '200 vojnika i mornara potpisalo je ugovor o vojnoj službi', 'Ministarstvo obrane potpisalo je ugovore o vojničkoj službi u trajanju od dvije godine s 200 vojnika, čime stječu status djelatne vojne osobe', 'Kako se navodi u priopćenju, nakon vojničke službe pruža im se mogućnost potpisivanja ugovora na neodređeno vrijeme.\r\n\r\nUgovori su potpisani u Središtu za obuku Hrvatske ratne mornarice u Splitu, Središtu za obuku Hrvatskog ratnog zrakoplovstva u Zemuniku Donjem, Inženjerijskoj pukovniji u Karlovcu, Topničko-raketnoj pukovniji u Bjelovaru, Središtu za obuku Zapovjedništva za kibernetički prostor i Bojnoj nuklearnoj biološkoj kemijskoj obrani na Plesu, Središtu za obuku i doktrinu logistike u Požegi i Središtu za obuku pješaštva i oklopništva u Đakovu.\r\n\r\nProbni rad traje šest mjeseci, a sastoji se od specijalističke vojne obuke u rodovskim postrojbama Hrvatske vojske i obuke na temelju obnašanja vojničke službe.\r\n\r\nPo završetku obuke djelatni vojnici/mornari bit će raspoređeni u postrojbe Hrvatske vojske u skladu sa stečenom vojnostručnom specijalnosti sukladno iskazanim potrebama prema mjestu službe: Benkovcu, Bjelovaru, Brijunima, Karlovcu, Kninu, Lastovu, Petrinji, Puli, Sinju, Splitu, Učki, Varaždinu, Velikoj Gorici, Zagrebu i Zemuniku Donjem.', 'gettyimages-804955956-big.png', 'World', 0),
(51, '', 'Nabavljamo rakete za Kiowe: Naša je obveza platiti 10,8 mil. kun', 'U suradnji sa SAD-om MORH nabavlja rakete Hydra. Zaprimili su pismo ponude čija je vrijednost šest milijuna i 182.248 američkih dolara. Obveza je RH da plati porez na dodanu vrijednost u 2023. i 2024. godini', 'Vlada je na današnjoj sjednici dala suglasnost Ministarstvu obrane za preuzimanje obveza na teret sredstava državnog proračuna Republike Hrvatske u 2023. i 2024. godini za nabavu raketa Hydra za helikoptere OH-58D Kiowa Warrior. \r\n- Helikopteri koji su donacija SAD-a isporučeni su RH 2016. godine, a do kraja 2017. uvedeni su u operativnu upotrebu HV-a. Time je HV dostigla novu helikoptersku sposobnost izvidničkog i površinskog borbenog djelovanja danju i noću. Nabavom zrakoplovno-ubojnih sredstva održava se dostignuta sposobnost površinskog borbenog djelovanja i zraka u svrhu potpore borbenog djelovanja kopnenih snaga - podsjetio je ministar obrane Mario Banožić. \r\n\r\nNabava raketa Hydra, dodao je, planira se provesti, također, u partnerstvu sa SAD-om. Pojasnio je kako Hrvatska plaća porez u iznosu 10,8 milijuna kuna. \r\n\r\n- Zaprimljeno je pismo ponude čija vrijednost iznosi šest milijuna i 182.248 američkih dolara. Obveza je RH da iz proračunskih sredstava plati porez na dodanu vrijednost prilikom isporuke ovih roba i usluga u 2023. i 2024. godini - istaknuo je dodavši kako su sredstva planirana na razini njegova ministarstva.\r\n\r\nU 2023. ćemo platiti milijun i 51.961 kunu, a u 2024. 9,8 milijuna kuna. Inače, u hrvatskom vlasništvu je 16 helikoptera OH-58D Kiowa Warrior. ', 'recession-americans-majority-poll.png', 'World', 0),
(52, '', 'Dan nakon odlaska američkog izaslanika iz Seula, Sjeverna Koreja', 'Sjeverna Koreja ispalila je osam balističkih projektila prema moru kod svoje istočne obale, objavila je južnokorejska vojska u nedjelju, dan nakon što je visoki američki izaslanik napustio Seul', 'Sjeverna Koreja je u nedjelju ispalila osam balističkih projektila kratkog dometa prema moru kod svoje istočne obale, dan nakon što su Južna Koreja i Sjedinjene Države okončale zajedničke vojne vježbe. U vježbama je prvi put u više od četiri godine sudjelovao i američki nosač zrakoplova.\r\n\r\nNajmanje osam projektila ispaljeno je iz područja Sunan u sjevernokorejskom glavnom gradu Pjongjangu, saopćio je Združeni stožer Južne Koreje.\r\n\r\nJapanski ministar obrane Nobuo Kishi također je rekao da je Sjeverna Koreja ispalila više projektila i da se taj čin \"ne može tolerirati\". Na brifingu je rekao da je barem jedan projektil imao promjenjivu putanju, što ukazuje da bi mogao manevrirati kako bi izbjegao raketnu obranu.\r\n\r\nAmeričko indo-pacifičko zapovjedništvo je u priopćenju navelo da je višestrukim lansiranje balističkih projektila Sjeverne Koreje naglasila destabilizirajući učinak svog programa ilegalnog naoružanja, ali da događaj nije predstavljao neposrednu prijetnju.\r\n\r\nSpecijalni predstavnik SAD-a Sung Kim sastao se u petak u Seulu sa svojim južnokorejskim i japanskim kolegama Kimom Gunnom i Funakoshijem Takehirom kako bi se pripremio za \"sve nepredviđene situacije\" slijedom naznaka da se Sjeverna Koreja sprema provesti nuklearni test prvi put od 2017. godine.\r\n\r\nWashington je Pjongjangu vrlo jasno dao do znanja da je otvoren za diplomaciju, rekao je Kim tijekom posjeta, ističući da je voljan razgovarati o stvarima koje su od interesa za Pjongjang, poput ublažavanja sankcija.\r\n\r\nProšlog tjedna Sjedinjene Države pozvale su na dodatne sankcije UN-a Sjevernoj Koreji zbog njezinih lansiranja balističkih projektila, ali su Kina i Rusija stavile veto na prijedlog.', 'korea.png', 'U.S', 0),
(53, '', 'Misterij ruskog sustava S-300 u Zagrebu: Tegljač MAN je pred Tuđ', 'Na vojnoj paradi 30. svibnja 1995. na Jarunu svi su uočili Tuđmanovu bijelu uniformu i uspoređivali je s Titovom, ali najžešća je poruka trebala biti upućena s prikolice golemoga tegljača MAN i četiri lansirne cijevi...', 'To što je veleposlanik Ruske Federacije u Zagrebu Anvar Azimov, koji je prije dva mjeseca žestoko pritisnuo hrvatsku Vladu i najavio da će se s Agrokorom dogoditi kaos, sada ostao u sjeni zbivanja s Agrokorom ? ne znači da nije aktivan. Ovih je dana pozvao u veleposlanstvo na razgovor Zvonka Zubaka, hrvatskog biznismena koji se bavi trgovinom oružja, koji je u vrijeme Domovinskog rata bio u grupi koja je putem njihove tvrtke Winsley Finance Limited bila glavni opskrbljivač Hrvatske oružjem.\r\n\r\nU cijelosti je bila riječ o naoružanju ruskog podrijetla pa je Azimov zvao Zubaka da mu sačini popis sveg oružja koje je preko Rusije od 1992. pa sve do 1997. godine stizalo Hrvatskoj. Azimov se, naime, očito i dalje ljuti na Hrvatsku, na njezinu geopolitičku opredijeljenost, a ne paše mu sada, čini se, ni način na koji hrvatski premijer Andrej Plenković rješava problem Agrokora, za rješavanje kojeg su jako zainteresirane i dvije ruske državne banke.\r\n\r\nU razgovoru sa Zubakom Azimov je kazao da je Rusija razočarana ponašanjem Hrvatske te da bi se Hrvati trebali podsjetiti tko ih je u vrijeme međunarodnog embarga naoružavao i spašavao. Stoga je i zatražio popis svih isporuka. Izgledno je da Rusija zna što je tih godina isporučivala zaraćenoj Hrvatskoj, no trebala im je i dodatna potvrda. U popisu, koji je u posjedu Večernjeg lista, navode se goleme količine tog naoružanja. Na popisu je i znameniti raketni sustav S-300 PMU koji je dijelom bio isporučen Republici Hrvatskoj uoči Oluje i koji je potom bio poslužio kao psihološka kočnica zračnim snagama SR Jugoslavije da ih odvrati od intervencije tijekom Oluje. Sustav, prema tvrdnjama Zvonka Zubaka, nikada nije otplaćen pa on još od 2001. vodi sudski proces u kojemu traži isplatu, povrat ili nagodbu.\r\n\r\nSve hrvatske vlade od tog su procesa bježale te su se ufale u beskonačan sudski proces. No, ta nonšalantnost sada bi Hrvatskoj mogla zakomplicirati život. Javna je tajna da je sustav, čini se 2004., otišao iz Hrvatske te da je dan na uvid najzainteresiranijima ? SAD-u i Izraelu. Kako nije bilo nikakvih čvrstih potvrda o tome, Rusija se sve ove godine pravila da je se to ne tiče. No sada, barem kako se može iščitati iz akcije Anvara Azimova, Rusija bi naglo mogla postati zainteresirana za postavljanje pitanja Hrvatskoj ? gdje se nalazi raketni sustav koji smo vam isporučili!? Azimov jest pokrenuo tu akciju, koja bi mogla rezultirati novim pritiskom Rusije na Hrvatsku, no odluka o pokretanju ?neugodnih pitanja? ipak nije na njemu, nego na njegovoj središnjici u Moskvi.\r\n\r\nČinjenica je, međutim, da je Rusija devedesetih godina prošlog stoljeća jako zadužila Hrvatsku i to u vrijeme kada joj je bilo najgore. Zubaka je, kao suvlasnika tvrtke osnovane na Kanalskim otocima, iza koje se tada krilo 20-ak osnivača, raznih poslovnih ljudi iz Engleske, Finske, Kanade, Švicarske, Češke, Njemačke, tada u razgovorima u Zagrebu angažirala hrvatska strana da pokuša nabaviti oružje koje drugi dobavljači nisu uspijevali nabaviti, a to se uglavnom odnosilo na borbene zrakoplove, helikoptere, razne protuavionske i protuoklopne rakete. Prvobitna je ideja bila da se za nabavu trgovci obrate SAD-u. I prvi kontakti, između Božića i Nove godine 1991., pokazivali su da Amerikanci žele pomoći. Jedan od savjetnika za obranu tadašnjeg predsjednika SAD-a Georgea Busha seniora došao je u Zagreb i izgledalo je da će RH dobiti zrakoplove (remontirane F-15). No, nekoliko tjedana poslije Zubaka je savjetnik pozvao na sastanak u Pariz i rekao mu da si SAD, nažalost, ?ne može dopustiti kršenje embarga?. No, ponudio je za RH drugo rješenje i kazao da će pomoći u tome da svoje vojne potrebe Hrvatska riješi preko Rusije te je dao kontakt prema tajnim agentima Finske koji su u to vrijeme imali najbolje izgrađene odnose s ruskim generalima. U Hrvatskoj su bili jako sumnjičavi prema ovom aranžmanu jer je vladalo mišljenje da su Rusi povezani sa Srbijom i da od tog posla neće biti ništa, nego da će Rusi pokupiti novac, a neće nam isporučiti ništa. Zubakov Winsley u akciju kreće sa svojim novcem i slijedi odlazak u Moskvu, preko Finske. Tamo su dogovoreni detalji, a kada je posao odobrio i ruski predsjednik Boris Jeljcin, počela je prva, oprezna isporuka dva transportna helikoptera Mi-8.\r\n\r\n', 'tito.png', 'U.S', 0),
(54, '', 'Čudesni Alonso odmah do Maxa, Verstappen kreće prvi', 'Pilot Red Bulla Sergio Perez zapeo je u barijeri tijekom druge runde, nije mogao nastaviti po jakoj kiši, pa su kvalifikacije bile prekinute. Kada su opet krenule, nevjerojatni Španjolac napravio je podvig', 'Aktualni svjetski prvak u Formuli 1 Nizozemac Max Verstappen (Red Bull) bio je najbrži na kišnim kvalifikacijama za Veliku nagradu Kanade u Montrealu, dok će njegov najveći konkurent za naslov Monegažanin Charles Leclerc (Ferrari) krenuti sa zadnje pozicije.\r\nNizozemac je u subotu u kišnom Montrealu osvojio svoj drugi pole position u sezoni i 15. u karijeri, a okoristio se pehom Leclerca.\r\n\r\nNaime, u Ferrariju su bili prisiljeni zamijeniti kompletnu pogonsku jedinicu na Leclercovom bolidu čime je Monegažanin zaradio kaznu za nedjeljnu utrku na kojoj će trećeplasirani u ukupnom redoslijedu vozača morati krenuti zadnji, iz posljednjeg reda zajedno s Yukijem Tsunodom.\r\nU teškim uvjetima na stazi briljirao je dvostruki svjetski prvak Španjolac Fernando Alonso koji je u svojem Alpineu napravio fantastičan podvig i u nedjelju će startati drugi dok treći kreće još jedan Španjolac, Carlos Sainz iz Ferrarija. Iako je u petak svojoj momčadi poručio da je \"bolid nevjerojatno loš\", Britanac Lewis Hamilton uspio je odvesti četvrto najbrže vrijeme.\r\nDrugoplasirani u ukupnom poretku i vozač Red Bulla Meksikanac Sergio Perez zapeo je u barijerama i nije mogao nastaviti tijekom druge kvalifikacijske runde pa će startati kao 13.', 'formula.png', 'World', 0),
(55, '', 'Nepoznato o Luki Modriću: Profesori, prijatelji i suigrači o stv', 'Sam je pobjeđivao tri godine starije dječake, trenirali su pod granatama, a po dolasku u Zagreb godinu je dana živio u sobici na Dinamovu stadionu, suigrači su nakon svojih izlazaka dolazili k njemu prespavati...', 'Bum, bum, bum, čuli bismo granate pa svi pod stol i onda u podrum škole. Često su nam napadi i uzbune prekidali nastavu, ali uspjeli smo više-manje odraditi sve prema programu.\r\n\r\nPričala nam je to Maja Grbić, učiteljica Luke Modrića u prva četiri razreda zadarske osnovne škole. Učiteljica koja je sačuvala i famozni Lukin sastavak o djedu, koji su 24sata ekskluzivno prvi objavili.\r\n\r\nLukine razrednice iz osnovne škole pričale su nam o mirnom dječaku velikih okica, koji je obožavao loptu. I kojeg su s prozora gledale kako dribla i puca na hotelskom parkiralištu.\r\n\r\n- Luka, ajde kući raditi domaći rad! - vikala bih mu, a on mi je odgovarao:\r\n\r\n- Evo, još sam zero!\r\n\r\nModrićev profesor tjelesnog odgoja otkrio nam je kako je maleni virtuoz sam pobjeđivao tri godine starije dječake, a prijatelji iz djetinjstva kako su u Zadru trenirali pod granatama i kako je Luka bio najbolji i u košarci i ostalim igrama.\r\n\r\nA po dolasku u Zagreb godinu je dana živio u sobici na Dinamovu stadionu, s kasnije slavnim cimerom. Izlazio nije, ali su suigrači nakon svojih izlazaka dolazili k njemu prespavati. U Zaprešiću je dres plesao oko njega, Inter mu i danas duguje novac, u Madridu je ikona, za Hrvatsku je jedini sakupio više od 150 nastupa, a Mostar je i danas ponosan na njega. Kao i cijela Hrvatska...\r\n\r\nPročitajte više u velikom specijalu 24sata u ponedjeljak.', 'modric.png', 'U.S', 0),
(60, '', 'Radnici Applea pristupili su sindikatu, prvi slučaj ', 'Više od stotinu radnika u Towsonu blizu Baltimorea \"velikom većinom glasalo je za pristupanje Međunarodnom udruženju strojara i radnika u zrakoplovstvu\", objavio je sindikat na svojoj internetskoj stranici', 'Radnici Applea u američkoj saveznoj državi Maryland u subotu su glasovanjem odlučili pristupiti sindikatu, postavši tako prvi zaposlenici u maloprodaji tog tehnološkog diva koji su se sindikalno organizirali u Sjedinjenim Američkim Državama.\r\n\r\nViše od stotinu radnika u Towsonu blizu Baltimorea \"velikom većinom glasalo je za pristupanje Međunarodnom udruženju strojara i radnika u zrakoplovstvu\", objavio je sindikat na svojoj internetskoj stranici.\r\nLokalni radnici, okupljeni u Koaliciju organiziranih radnika u maloprodaji, \"imaju podršku čvrste većine naših suradnika\", napisali su u pismu izvršnom upravitelju Applea Tim Cooku.\r\n\r\n\"Ovo ne činimo zato da bismo bili protiv ili kako bismo stvorili sukob s našom upravom\", napisali su.\r\n\r\nGlasnogovornik Applea je, odgovarajući na Reutersov zahtjev za komentarom, u e-mailu napisao da tvrtka nema \"ništa za dodati trenutno\".\r\n\r\nSindikalno organiziranje uzima maha u nekim velikim američkim korporacijama, uključujući Amazon i Starbucks.\r\nRadnici Applea u Atlanti koji su se namjeravali sindikalno organizirati povukli su takav zahtjev prošlog mjeseca, navodeći zastrašivanje kao razlog.\r\n\r\nNeki trenutni i bivši Appleovi radnici su prošle godine počeli na internetu kritizirati uvjete rada u toj tvrtki, koristeći ključnu riječ \"#AppleToo\", aludirajući na pokret protiv seksualnog zlostavljanja koji se proširio internetom 2017. godine koristeći ključnu riječ \"#MeToo\".', 'pxl-reu-030522-93285928.png', 'U.S', 0),
(84, '', 'Bazni kamp pod Everestom mora se preseliti, nesiguran je', 'Nepalski dužnosnik rekao je kako će se pronaći novo mjesto na nižoj nadmorskoj visini gdje neće biti cjelogodišnjeg leda', 'Nepal se priprema preseliti bazni kamp pod Everestom jer ga globalno zagrijavanje i ljudske aktivnosti čine sve više nesigurnim, piše BBC.\r\n\r\nBazni logor, koji koristi do 1500 ljudi u proljetnoj penjačkoj sezoni, nalazi se na ledenjaku Khumbu koji se ubrzano stanjuje.\r\n\r\nNepalski dužnosnik rekao je kako će se pronaći novo mjesto na nižoj nadmorskoj visini gdje neće biti cjelogodišnjeg leda.\r\n\r\nIstraživači kažu da voda destabilizira ledenjak, a penjači se žale da po noći nastaju nove pukotine u ledu u baznom logoru.\r\n\r\n\"Sada se pripremamo na premještanje i uskoro ćemo početi konzultacije sa svima uključenima\", rekao je Taranath Adhikari, glavni direktor nepalske turističke zajednice za BBC.\r\n\r\n\"Radi se o tome da je potrebno prilagoditi se promjenama koje uočavamo u baznom kampu i to je postalo ključno za održivost samog poslovanja vezanog uz uspone\".\r\n\r\nBazni logor trenutno se nalazi na visini od 5364 metra nadmorske visine, a novi bi bio 200 do 400 metara niže, rekao je Adhikari.\r\n\r\nLedenjak Khumbu, kao i mnogi drugi ledenjaci u Himalajama, ubrzano se topi i stanjuje zbog globalnog zagrijavanja, utvrdili su znanstvenici.\r\n\r\nStudija znanstvenika sa Sveučilišta u Leedsu iz 2018. pokazala je da se segment blizu baznog logora stanjuje jedan metar godišnje, a ledenjak gubi 9,5 milijuna kubičnih metara vode.\r\n\r\nPlaninari i nepalske vlasti kažu da se pukotine na površini ledenjaka pojavljuju češće nego prije.\r\n\r\n\"Neočekivano uočavamo da se noću na mjestima gdje spavamo pojavljuju pukotine\", rekao je Kishor Adhikari iz nepalske vojske koji je boravio u baznom logoru radi čišćenja.\r\n\r\n\"Ujutro, mnogi od nas imali su taj jezivi osjećaj da smo mogli pasti u pukotine tijekom noći. One se pojavljuju često, dosta je opasno\".\r\n\r\nVodeći član odbora koji je predložio preseljenje baznog logora, Khimlal Gautam, rekao je da nazočnost toliko puno ljudi doprinosi problemu.\r\n\r\n\"Primjerice, zaključili smo da ljudi uriniraju oko 4000 litara mokraće svaki dan\", rekao je.\r\n\r\n\"I velike količine goriva poput kerozina i plina koje palimo za kuhanje i grijanje definitivno će imati utjecaj na led glečera\".\r\n\r\nAdrian Ballinger, utemeljitelj tvrtke Alpenglow Expeditions, slaže se da taj potez ima smisla, jer predviđa da će u budućnosti biti više lavina, padova ledenih gromada i stijena.\r\n\r\n\"To bi trebalo biti neprihvatljivo vođama ekspedicija budući da se može izbjeći\", rekao je.\r\n\r\nJedini problem premještanja logora nešto niže bit će dodatna nadmorska visina koju će penjači morati preći iz baznog logora do sljedeće postaje na planini, kampa 1.\r\n\r\nPo sadašnjim procjenama, do premještanja logora moglo bi doći do 2024. godine.', 'everest2.png', 'World', 0);

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



