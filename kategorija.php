<?php
include 'connect.php';

date_default_timezone_set('Europe/Ljubljana');
$dateYmd = date('D, M j, Y');

define('UPLPATH', 'img/');

$id=$_GET['id'];
//echo $id;
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
    <title><?php echo $id ?></title>
    <style>
        .slika{
            width: 50%;
        }
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
        
        <!-- ovo je kôd za sekciju članci -->
        <?php 
            $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='$id'";
            $result = mysqli_query($dbc, $query);
            //$i=0;
            echo '<p class="kategorija">'.$id.'</p>';
            while($row = mysqli_fetch_array($result)) {
                $picture = $row['slika'];
                //echo '<p class="kategorija">'.$row['kategorija'].'</p>';
                echo '<section class=\"article\">';
                echo '<div class=\"row\">';
                //echo "<a href='vijest.html'><img src='images/$picture' alt='' class=\'slika\'></a>";
                echo '<div class=\"article-col\">';
                echo '<img src="images/'.$picture.'" alt="" class="slika" >';
                echo '<a href="clanak.php?id='.$row['id'].'"><h3 class="title">'.$row['naslov'].'</h3></a>';
                echo '</div>';
                echo '</div>';
                echo '</section>';
            }
            echo '<hr>';
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