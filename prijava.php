<?php
    include 'connect.php';
    //echo "Id " . $_GET['id'];
    //$id=$_GET['id'];
    //echo $id;

    date_default_timezone_set('Europe/Ljubljana');
    $dateYmd = date('D, M j, Y');
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
    <title>Prijava</title>
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
        
        <div class="forma">
            <form method="post">

                <label for="kime">Korisničko ime</label><br />
                <input type="text" size="40" id="kime" name="kime"/><br />

                <label for="lozinka">Lozinka</label><br />
                <input type="password" size="40" id="lozinka" name="lozinka"/><br />

                <button type="submit" value="Submit" size="40" id="submit" name="submit" class="button-green">Prijavi se</button>
            </form>
        </div>
    
    <?php 
    
    if($dbc){
        if(isset($_POST['submit'])){
            $kime = $_POST['kime'];
            $lozinka = $_POST['lozinka'];
            //$hashed_lozinka = password_hash($lozinka, CRYPT_BLOWFISH);

            $query = "SELECT * FROM korisnik WHERE korisnicko_ime=?";
            $stmt = mysqli_stmt_init($dbc);

            if(mysqli_stmt_prepare($stmt, $query)){
                mysqli_stmt_bind_param($stmt,'s', $kime);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_bind_result($stmt, $id, $ime, $prezime, $kime, $pass, $razina);
                mysqli_stmt_store_result($stmt);
            }

            if (mysqli_stmt_num_rows($stmt) == 1){
                if($row=mysqli_stmt_fetch($stmt)){
                    if(password_verify($lozinka, $pass)){
                        //echo "$ime, uspješno ste prijavljeni";
                        if($razina==1){
                            //echo "admin ste";
                            session_start();
                            $_SESSION['$username'] = $ime;
                            $_SESSION['$level'] = $razina;
                            header("Location: administracija.php");
                            exit();
                        }else{
                            echo "$ime, uspješno ste prijavljeni, ali niste administrator."; 
                        }
                    }
                    
                }
            }else{
                //echo "Unijeli ste pogrešno korisničko ime ili lozinku";
                echo "Da biste se prijavili, prvo se morate registrirati na sljedećem <a href='registracija.php'>LINKU</a>";
            }
        }
    }
    mysqli_close($dbc);
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