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
    <link rel="stylesheet" href="style.css?v=2">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cd3e76bd85.js" crossorigin="anonymous"></script>
    <title>Naslovna</title>
    <style>
        /* .slika{
            width: 100%;
        } */
        
    </style>
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
        
        <!-- ovo je kôd za sekciju članci kategorija U.S-->
        <section class="article">
        <p class="kategorija">U.S</p>
        <div class="row">
        <?php 
        $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='U.S' LIMIT 3";
        $result = mysqli_query($dbc, $query);
        
        while($row = mysqli_fetch_array($result)) {
            //$picture = $row['slika'];
            echo '<div class="article-col">';
            echo '<img src="images/'.$row['slika'].'" alt="" class="slika"  >';
            echo '<a href="clanak.php?id='.$row['id'].'"><h3 class="title">'.$row['naslov'].'</h3></a>';
            echo '</div>';
        }
        ?>
        </div>
        </section>
        <hr>

        <!-- ovo je kôd za sekciju članci kategorija World-->
        <section class="article">
        <p class="kategorija">World</p>
        <div class="row">
        <?php 
        $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='World' LIMIT 3";
        $result = mysqli_query($dbc, $query);
        
        while($row = mysqli_fetch_array($result)) {
            //$picture = $row['slika'];
            echo '<div class="article-col">';
            echo '<img src="images/'.$row['slika'].'" alt="" class="slika"  >';
            echo '<a href="clanak.php?id='.$row['id'].'"><h3 class="title">'.$row['naslov'].'</h3></a>';
            echo '</div>';
        }
        ?>
        </div>
        </section>
        <hr>


        
        <!-- ovo je kôd za sekciju članci HARDKODIRANO -->
        <!-- <section class="article">
            <p class="kategorija">U.S</p>
            <div class="row">
                <div class="article-col">
                    <a href="vijest.html"><img src="images/bil-maher.png" alt=""></a>
                    <a href="vijest.html"><h3>Bill Maher Tears Into Restrictive New Anti-Abortion Laws</h3></a>
            
                </div>
                <div class="article-col">
                    <a href="vijest.html"><img src="images/gettyimages-182272233.png" alt=""></a>
                    <a href="vijest.html"><h3>John McAfee Is Running for President and Wants You to 'Wake the F*** Up'</h3></a>
                    
                </div>
                <div class="article-col">
                    <a href="vijest.html"><img src="images/gettyimages-182272233.png" alt=""></a>
                    <a href="vijest.html"><h3>John McAfee Is Running for President and Wants You to 'Wake the F*** Up'</h3></a>
                    
                </div>
            </div>
            <hr>
        </section>

        <section class="article2">
            <p class="kategorija">World</p>
            <div class="row">
                <div class="article-col">
                    <a href="vijest.html"><img src="images/gettyimages-1144056587.png" alt=""></a>
                    <a href="vijest.html"><h3>Eurovision 2019: Israelis and Palestinians Fight to Be Heard</h3></a>
                    
                </div>
                <div class="article-col">
                    <a href="vijest.html"><img src="images/gettyimages-804955956.png" alt=""></a>
                    <a href="vijest.html"><h3>Could U.S. Defeat Iran's Navy? This Exercise Shows War Would Not Be Easy</h3></a>
                    
                </div>
                <div class="article-col">
                    <a href="vijest.html"><img src="images/gettyimages-804955956.png" alt=""></a>
                    <a href="vijest.html"> <h3>Could U.S. Defeat Iran's Navy? This Exercise Shows War Would Not Be Easy</h3></a>
                    
                </div>
            </div>
            <hr>
        </section> -->



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