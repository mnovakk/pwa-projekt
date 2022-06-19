<?php
include 'connect.php';

date_default_timezone_set('Europe/Ljubljana');
$dateYmd = date('D, M j, Y');

define('UPLPATH', 'img/');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cd3e76bd85.js" crossorigin="anonymous"></script>
    <title>Unos podataka</title>
</head>
<body>
    <div class="main">
        <!-- ovo je kôd za header sekciju -->
        <section class="header">
            <a href="index.php"><div class="logo"><img src="images/logo.PNG" alt=""></div></a>
            <p class="datum"><?php echo $dateYmd ?></p>
            <nav>
                <div class="nav-links" id="navLinks">
                    <i class="fa-solid fa-xmark" onclick="hideMenu()"></i>
                    <ul>
                        <li><a href="index.php">Home</a></li>
                        <li><a href="kategorija.php?id=U.S">U.S</a></li>
                        <li><a href="kategorija.php?id=World">World</a></li>
                        <li><a href="prijava.php">Administracija</a></li>
                        <li><a href="unos.php">Unos</a></li>
                    </ul>
                </div>
                <i class="fa-solid fa-bars" onclick="showMenu()"></i>
            </nav>
            <hr>
        </section>
        
        <!-- ovo je kôd za formu/unos -->
        <div class="forma">
            <form enctype="multipart/form-data" action="skripta.php" method="POST" name="form">
                <div class="form-item">
                    <label for="title">Naslov vijesti</label>
                    <div class="form-field">
                        <input type="text" name="title" id="title" class="form-field-textual" size="97">
                    </div>
                    <span id="porukaTitle" class="bojaPoruke"></span>
                </div>
                <div class="form-item">
                    <label for="about">Kratki sadržaj vijesti</label>
                    <div class="form-field">
                        <textarea name="about" id="about" cols="100" rows="5" class="formfield-textual"></textarea>
                    </div>
                    <span id="porukaAbout" class="bojaPoruke"></span>
                </div>
                <div class="form-item">
                    <label for="content">Sadržaj vijesti</label>
                    <div class="form-field">
                        <textarea name="content" id="content" cols="100" rows="10" class="form-field-textual"></textarea>
                    </div>
                    <span id="porukaContent" class="bojaPoruke"></span>
                </div>
                <div class="form-item">
                    <label for="category">Kategorija vijesti</label>
                    <div class="form-field">
                        <select name="category" id="category" class="form-field-textual">
                            <option selected disabled hidden style='display: none' value=""></option>
                            <option value="U.S">U.S</option>
                            <option value="World">World</option>
                        </select>
                    </div>
                    <span id="porukaKategorija" class="bojaPoruke"></span>
                </div>
                <div class="form-item">
                    <label for="pphoto">Slika: </label>
                    <div class="form-field">
                        <input type="file" accept="image/jpg,image/gif,image/png" class="input-text" name="pphoto" id="pphoto"/>
                    </div>
                    <span id="porukaSlika" class="bojaPoruke"></span>
                </div>
                <div class="form-item">
                    <label>Spremiti u arhivu:
                        <div class="form-field">
                            <input type="checkbox" name="archive">
                        </div>
                    </label>
                </div>
                <div class="form-item">
                    <!-- <button type="reset" value="Poništi" class="button">Poništi</button> -->
                    <button type="submit" value="Pošalji" class="button-green" name="submit" id="submit">Pošalji</button>
                </div>
            </form>
            <hr>
        </div>

        <!-- ovo je kôd za footer sekciju -->
        <section class="footer">
            <p class="godina">&copy; 2022 NEWSWEEK</p>
        </section>
    </div>
    
    <!-- ovo je JS kôd za prikazivanje/skrivanje menija na manjim ekranima -->
    <script>
        var navLinks = document.getElementById("navLinks");

        function showMenu(){
            navLinks.style.right = "0";
        }

        function hideMenu(){
            navLinks.style.right = "-200px";
        }
    </script>

<script type="text/javascript">
    // Provjera forme prije slanja
    document.getElementById("submit").onclick = function(event) {
        var slanjeForme = true;

        // Naslov vjesti (5-30 znakova)
        var poljeTitle = document.getElementById("title");
        var title = document.getElementById("title").value;
        if (title.length < 5 || title.length > 30) {
        slanjeForme = false;
        poljeTitle.style.border="2px dashed red";
        porukaTitle.style.color="red";
        document.getElementById("porukaTitle").innerHTML="Naslov vjesti mora imati između 5 i 30 znakova!<br>";
        } else {
        poljeTitle.style.border="2px solid green";
        document.getElementById("porukaTitle").innerHTML="";
        }

        // Kratki sadržaj (10-100 znakova)
        var poljeAbout = document.getElementById("about");
        var about = document.getElementById("about").value;
        if (about.length < 10 || about.length > 100) {
        slanjeForme = false;
        poljeAbout.style.border="2px dashed red";
        porukaAbout.style.color="red";
        document.getElementById("porukaAbout").innerHTML="Kratki sadržaj mora imati između 10 i 100 znakova!<br>";
        } else {
        poljeAbout.style.border="2px solid green";
        document.getElementById("porukaAbout").innerHTML="";
        }

        // Sadržaj mora biti unesen
        var poljeContent = document.getElementById("content");
        var content = document.getElementById("content").value;
        if (content.length == 0) {
        slanjeForme = false;
        poljeContent.style.border="2px dashed red";
        porukaContent.style.color="red";
        document.getElementById("porukaContent").innerHTML="Sadržaj mora biti unesen!<br>";
        } else {
        poljeContent.style.border="2px solid green";10
        document.getElementById("porukaContent").innerHTML="";
        }

        // Kategorija mora biti odabrana
        var poljeCategory = document.getElementById("category");
        if(document.getElementById("category").selectedIndex == 0) {
        slanjeForme = false;
        poljeCategory.style.border="2px dashed red";
        porukaKategorija.style.color="red";
        document.getElementById("porukaKategorija").innerHTML="Kategorija mora biti odabrana!<br>";
        } else {
        poljeCategory.style.border="2px solid green";
        document.getElementById("porukaKategorija").innerHTML="";
        }

        // Slika mora biti unesena
        var poljeSlika = document.getElementById("pphoto");
        var pphoto = document.getElementById("pphoto").value;
        if (pphoto.length == 0) {
        slanjeForme = false;
        poljeSlika.style.border="2px dashed red";
        porukaSlika.style.color="red";
        document.getElementById("porukaSlika").innerHTML="Slika mora biti unesena!<br>";
        } else {
        poljeSlika.style.border="2px solid green";
        document.getElementById("porukaSlika").innerHTML="";
        }

        if (slanjeForme != true) {
        event.preventDefault();
        }
    };
</script>

    
</body>
</html>