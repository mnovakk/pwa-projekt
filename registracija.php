<?php
//include 'connect.php';
date_default_timezone_set('Europe/Ljubljana');
$dateYmd = date('D, M j, Y');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css?v2">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cd3e76bd85.js" crossorigin="anonymous"></script>
    <title>Registracija</title>
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
        
    <?php
        //Registracija je prošla uspješno
        /*if($registriranKorisnik == true) {
            echo '<p>Korisnik je uspješno registriran!</p>';
        } else {*/
            //registracija nije protekla uspješno ili je korisnik prvi put došao na stranicu
    ?>

    <section role="main">
        <div class="forma">
            <form enctype="multipart/form-data" action="" method="POST">
                <div class="form-item">
                    <span id="porukaIme" class="bojaPoruke"></span>
                    <label for="title">Ime: </label>
                    <div class="form-field">
                        <input type="text" size="40" name="ime" id="ime" class="form-fieldtextual">
                    </div>
                </div>
                <div class="form-item">
                    <span id="porukaPrezime" class="bojaPoruke"></span>
                    <label for="about">Prezime: </label>
                    <div class="form-field">
                        <input type="text" size="40" name="prezime" id="prezime" class="formfield-textual">
                    </div>
                </div>
                <div class="form-item">
                    <span id="porukaUsername" class="bojaPoruke"></span>
                    <label for="content">Korisničko ime:</label>
                    <!-- Ispis poruke nakon provjere korisničkog imena u bazi -->
                    <!-- <?php echo '<br><span class="bojaPoruke">'.$msg.'</span>'; ?> -->
                    <div class="form-field">
                        <input type="text" size="40" name="username" id="username" class="formfield-textual">
                    </div>
                </div>
                <div class="form-item">
                    <span id="porukaPass" class="bojaPoruke"></span>
                    <label for="pphoto">Lozinka: </label>
                    <div class="form-field">
                        <input type="password" size="40" name="pass" id="pass" class="formfield-textual">
                    </div>
                </div>
                <div class="form-item">
                    <span id="porukaPassRep" class="bojaPoruke"></span>
                    <label for="pphoto">Ponovite lozinku: </label>
                    <div class="form-field">
                        <input type="password" size="40" name="passRep" id="passRep" class="form-field-textual">
                    </div>
                </div>
                <div class="form-item">
                    <button type="submit" value="Prijava" id="slanje" name="slanje" class="button-blue">Registracija</button>
                </div>
            </form>
        </div>
    </section>
    
    <?php 
        
        $servername = "localhost";
        $username = "root";
        $password = "";
        $basename = "projekt";
    
        $dbc = mysqli_connect($servername, $username, $password, $basename) or 
        die("Connection failed".mysqli_connect_error());

        if($dbc){
            if(isset($_POST['slanje'])){
                $ime = $_POST['ime'];
                $prezime = $_POST['prezime'];
                $username = $_POST['username'];
                $lozinka = $_POST['pass'];
                $hashed_password = password_hash($lozinka, CRYPT_BLOWFISH);
                $razina = 0;
                $registriranKorisnik = '';

                //Provjera postoji li u bazi već korisnik s tim korisničkim imenom
                $sql = "SELECT korisnicko_ime FROM korisnik WHERE korisnicko_ime = ?";
                $stmt = mysqli_stmt_init($dbc);
                if (mysqli_stmt_prepare($stmt, $sql)) {
                    mysqli_stmt_bind_param($stmt, 's', $username);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);
                }
                if(mysqli_stmt_num_rows($stmt) > 0){
                    $msg='Korisnik s istim korisničkim imenom već postoji!';
                    echo '<br><span class="bojaPoruke" style="color: red">'.$msg.'</span>';
                }else{
                    // Ako ne postoji korisnik s tim korisničkim imenom - Registracija korisnika u bazi pazeći na SQL injection
                    $sql = "INSERT INTO korisnik (ime, prezime, korisnicko_ime, lozinka, razina)VALUES (?, ?, ?, ?, ?)";
                    $stmt = mysqli_stmt_init($dbc);
                    if (mysqli_stmt_prepare($stmt, $sql)) {
                        mysqli_stmt_bind_param($stmt, 'ssssd', $ime, $prezime, $username, $hashed_password, $razina);
                        mysqli_stmt_execute($stmt);
                        $registriranKorisnik = true;
                        if($registriranKorisnik == true) {
                            echo '<p style = "color: green">Korisnik je uspješno registriran!</p>';
                            echo "Da biste se prijavili, klikniti <a href='prijava.php'>OVDJE</a>";
                        }
                    }
                }
            }
        }
        mysqli_close($dbc);
    ?>

    <script type="text/javascript">
        document.getElementById("slanje").onclick = function(event) {
            var slanjeForme = true;

            // Ime korisnika mora biti uneseno
            var poljeIme = document.getElementById("ime");
            var ime = document.getElementById("ime").value;
            if (ime.length == 0) {
                slanjeForme = false;
                poljeIme.style.border="1px dashed red";
                document.getElementById("porukaIme").innerHTML="<br>Unesite ime!<br>";
            } else {
                poljeIme.style.border="1px solid green";
                document.getElementById("porukaIme").innerHTML="";
            }

            // Prezime korisnika mora biti uneseno
            var poljePrezime = document.getElementById("prezime");
            var prezime = document.getElementById("prezime").value;
            if (prezime.length == 0) {
                slanjeForme = false;
                poljePrezime.style.border="1px dashed red";
                document.getElementById("porukaPrezime").innerHTML="<br>Unesite Prezime!<br>";
            } else {
                poljePrezime.style.border="1px solid green";
                document.getElementById("porukaPrezime").innerHTML="";
            }

            // Korisničko ime mora biti uneseno
            var poljeUsername = document.getElementById("username");
            var username = document.getElementById("username").value;
            if (username.length == 0) {
                slanjeForme = false;
                poljeUsername.style.border="1px dashed red";
                document.getElementById("porukaUsername").innerHTML="<br>Unesite korisničko ime!<br>";
            } else {
                poljeUsername.style.border="1px solid green";
                document.getElementById("porukaUsername").innerHTML="";
            }

            // Provjera podudaranja lozinki
            var poljePass = document.getElementById("pass");
            var pass = document.getElementById("pass").value;
            var poljePassRep = document.getElementById("passRep");
            var passRep = document.getElementById("passRep").value;
            if (pass.length == 0 || passRep.length == 0 || pass != passRep) {
                slanjeForme = false;
                poljePass.style.border="1px dashed red";
                poljePassRep.style.border="1px dashed red";
                document.getElementById("porukaPass").innerHTML="<br>Lozinke nisu iste!<br>";
                document.getElementById("porukaPassRep").innerHTML="<br>Lozinke nisu iste!<br>";
            } else {
                poljePass.style.border="1px solid green";
                poljePassRep.style.border="1px solid green";
                document.getElementById("porukaPass").innerHTML="";
                document.getElementById("porukaPassRep").innerHTML="";
            }

            if (slanjeForme != true) {
                event.preventDefault();
            }
        };
    </script>

    <?php
    //}
    ?>


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

</body>
</html>