<?php
include 'connect.php';

date_default_timezone_set('Europe/Ljubljana');
$dateYmd = date('D, M j, Y');

//define('UPLPATH', 'img/');
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
    <title>Administracija</title>
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
                        <li><a href="administracija.php">Administracija</a></li>
                        <li><a href="unos.php">Unos</a></li>
                    </ul>
                </div>
                <i class="fa-solid fa-bars" onclick="showMenu()"></i>
            </nav>
            <hr>
        </section>
        
        <form method="post">
            <label for="username">Korisničko ime</label><br />
            <input type="text" id="username" name="username"/><br />

            <label for="lozinka">Lozinka</label><br />
            <input type="password" id="lozinka" name="lozinka"/><br />

            <button type="submit" value="Submit" id="prijava" name="prijava">Submit</button>
        </form>
        
        <?php
        session_start();
        //include 'connect.php';
        // Putanja do direktorija sa slikama
        define('UPLPATH', 'img/');
        // Provjera da li je korisnik došao s login forme
        if (isset($_POST['prijava'])) {
            // Provjera da li korisnik postoji u bazi uz zaštitu od SQL injectiona
            $prijavaImeKorisnika = $_POST['username'];
            $prijavaLozinkaKorisnika = $_POST['lozinka'];
            $sql = "SELECT korisnicko_ime, lozinka, razina FROM korisnik WHERE korisnicko_ime = ?";
            $stmt = mysqli_stmt_init($dbc);
            if (mysqli_stmt_prepare($stmt, $sql)) {
                mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);
            }
            mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
            mysqli_stmt_fetch($stmt);

            //Provjera lozinke
            if (password_verify($_POST['lozinka'], $lozinkaKorisnika) && mysqli_stmt_num_rows($stmt) > 0) {
                $uspjesnaPrijava = true;

                // Provjera da li je admin
                if($levelKorisnika == 1) {
                    $admin = true;
                }else {
                    $admin = false;
                }

                //postavljanje session varijabli
                $_SESSION['$username'] = $imeKorisnika;
                $_SESSION['$level'] = $levelKorisnika;
            } else {
                $uspjesnaPrijava = false;
            }
        }
        // Brisanje i promijena arhiviranosti
        ?>

<?php
    // Pokaži stranicu ukoliko je korisnik uspješno prijavljen i administrator je
    if (($uspjesnaPrijava == true && $admin == true) || (isset($_SESSION['$username'])) && $_SESSION['$level'] == 1) {
        $query = "SELECT * FROM vijesti";
        $result = mysqli_query($dbc, $query);
        while($row = mysqli_fetch_array($result)) {
            //forma za administraciju
            
            $query = "SELECT * FROM vijesti";
            $result = mysqli_query($dbc, $query);
            while($row = mysqli_fetch_array($result)) {
                $picture = $row['slika'];
                echo '<div class="forma">
                        <form enctype="multipart/form-data" action="" method="POST">
                            <div class="form-item">
                                <label for="title">Naslov vjesti:</label>
                                <div class="form-field">
                                    <input type="text" size="97" name="title" class="form-field-textual" value="'.$row['naslov'].'">
                                </div>
                            </div>
                            <div class="form-item">
                                <label for="about">Kratki sadržaj vijesti (do 50 znakova):</label>
                                <div class="form-field">
                                    <textarea name="about" id="" cols="100" rows="10" class="formfield-textual">'.$row['sazetak'].'</textarea>
                                </div>
                            </div>
                            <div class="form-item">
                                <label for="content">Sadržaj vijesti:</label>
                                <div class="form-field">
                                    <textarea name="content" id="" cols="100" rows="10" class="formfield-textual">'.$row['tekst'].'</textarea>
                                </div>
                            </div>
                            <div class="form-item">
                                <label for="pphoto">Slika:</label>
                                <div class="form-field">
                                    
                                    <input type="file" class="input-text" id="pphoto" value="'.$row['slika'].'" name="pphoto"/> <br><img src="images/'.$picture.'" width=150px>
                                </div>
                            </div>
                            <div class="form-item">
                                <label for="category">Kategorija vijesti:</label>
                                <div class="form-field">
                                    <select name="category" id="" class="form-field-textual" value="'.$row['kategorija'].'">
                                        <option value="U.S">U.S</option>
                                        <option value="World">World</option>
                                    </select>
                                </div>
                            </div>
                                <div class="form-item">
                                    <label>Spremiti u arhivu:
                                        <div class="form-field">';
                                            if($row['arhiva'] == 0) {
                                                echo '<input type="checkbox" name="archive" id="archive"/> Arhiviraj?';
                                            } else {
                                                echo '<input type="checkbox" name="archive" id="archive" checked/> Arhiviraj?';
                                            }
                                        echo '</div>
                                    </label>
                                </div>
                            </div>
                            <div class="forma">
                                <input type="hidden" name="id" class="form-field-textual" value="'.$row['id'].'">
                                <button type="submit" name="update" value="Prihvati" class="button-green">Izmjeni</button>
                                <button type="submit" name="delete" value="Izbriši" class="button-red">Izbriši</button>
                            </div>
                        </form>
                    </div>';
            }

            //ovaj kod briše određeni članak nakon klika na gumb
            if(isset($_POST['delete'])){
                $id=$_POST['id'];
                $query = "DELETE FROM vijesti WHERE id=$id ";
                $result = mysqli_query($dbc, $query);
            }

            //ovaj kod updejta određeni članak nakon klika na gumb
            //define('UPLPATH', 'img/');
            if(isset($_POST['update'])){
                $picture = $_FILES['pphoto']['name'];
                $title=$_POST['title'];
                $about=$_POST['about'];
                $content=$_POST['content'];
                $category=$_POST['category'];

                if(isset($_POST['archive'])){
                    $archive=1;
                }else{
                    $archive=0;
                }

                $target_dir = 'img/'.$picture;
                //move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
                $id=$_POST['id'];
                $query = "UPDATE vijesti SET naslov='$title', sazetak='$about', tekst='$content', slika='$picture', kategorija='$category', arhiva='$archive' WHERE id=$id ";
                $result = mysqli_query($dbc, $query);
            }

        
        }
            // Pokaži poruku da je korisnik uspješno prijavljen, ali nije administrator
    } else if ($uspjesnaPrijava == true && $admin == false) {
        echo '<p>Bok ' . $imeKorisnika . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
    } else if (isset($_SESSION['$username']) && $_SESSION['$level'] == 0) {
        echo '<p>Bok ' . $_SESSION['$username'] . '! Uspješno ste prijavljeni, ali niste administrator.</p>';
    } else if ($uspjesnaPrijava == false) {
    ?>
    <!-- Forma za prijavu -->
    

    <script type="text/javascript">
    //javascript validacija forme
    </script>

    <?php
    }
    ?>
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