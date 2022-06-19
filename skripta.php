<?php 
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
    <title>Unešena vijest</title>
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
        include 'connect.php';
    
        if (isset($_POST['submit'])){
            $picture = $_FILES['pphoto']['name'];
            $title = $_POST['title'];
            $about = $_POST['about'];
            $content = $_POST['content'];
            $category = $_POST['category'];
            if(isset($_POST['archive'])){
                $archive=1;
            }else{
                $archive=0;
            }
    
            $target_dir = 'images/'.$picture;
            move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir);
    
            $query = "INSERT INTO vijesti (naslov, sazetak, tekst, slika, kategorija, arhiva) values ('$title','$about','$content','$picture','$category','$archive')";
            $result = mysqli_query($dbc, $query) or die ('Error querying datzabase!');
        }
        mysqli_close($dbc);
        ?>


        <?php
        //$category = $_POST['category'];
        //$title = $_POST['title'];

        date_default_timezone_set('Europe/Ljubljana');
        $dateYmd = date('Y/m/d');

        //$pphoto = $_POST['pphoto'];
        //$about = $_POST['about'];
        //$content = $_POST['content'];
        ?>

        <!-- ovo je kôd za otvoreni članak -->
        <section class="article">
            <p class="kategorija"></p>
            <h1><?php echo $title ?></h1>
            <p class="datum-clanak"><?php echo $dateYmd ?></p>
            <?php echo "<img src='images/$picture'";?>
            <?php echo $picture ;?>
            <!-- <img src="images/gettyimages-804955956.webp" alt="" class="glavna-slika"> -->
            <div class="article-body">
                <p><?php echo $content;?></p>
                <?php 
                
                ?>
                <!-- <p>The United States is widely cited as the world's foremost military power, but the country has a spotty record when it comes to asymmetrical warfare. Now-infamous war games conducted nearly 17 years ago showed a maritime matchup against tactics similar to those of Iran would likely prove extremely deadly for the Navy.</p>
                <p>A new wave of tensions between longtime foes Washington and Tehran was set off by alleged reports of Iran pursuing new missile activity in the region, just as it prepared to commemorate the U.S.' unilateral pullout from a 2015 nuclear deal by stepping back from some of its own commitments to the historic agreement. Among these alleged threats were satellite imagery purporting to show small traditional sailing vessels known as dhows being fitted with cruise missiles.</p>
                <p>Iran's ambassador to the United Nations Majid Takht Ravanchi dismissed these assessments, telling CBS News on Friday that "we do not fire missiles out of small boats." He rejected such "fake intelligence" as deliberate attempts to set up the pretext for conflict—not unlike the false claims that led up to the 2003 invasion of Iraq.</p>
                <p>Iran's two maritime forces—its conventional navy and the navy of the elite Revolutionary Guards—do, however, maintain a missile-equipped fleet of fast attack craft that it claims could take out even the most advanced U.S. warships although some have dismissed the capabilities of such assets. In a mixed computer and live-fire simulation in 2002, a "Red Team" armed with vessels and strategies not unlike those known to be employed by Iran once pummeled a "Blue Team" representing the U.S. to the point where the Pentagon needed to step in to ensure a friendly victory.</p>
                <p>The U.S. was already on the path to war with Iraq in 2002, after it accused the country of possessing weapons of mass destructions and threatening regional stability through missile activity and support for militant groups. From July 24 through August 15, the since-dismantled Joint Forces Command conducted a $250 million dollar exercise known as Millennial Challenge that pitted the U.S.' Blue Team led by Army General Lieutenant General Burwell B. Bell III against a Red Team representing an oil-rich Persian Gulf nation, most associated with either Iran or Iraq, but in actuality led by retired Marine Corps Lieutenant General Paul Van Riper.</p>
                <p>Despite being significantly outgunned by a much more technologically-advanced adversary, Van Riper launched a massive shock cruise missile salvo that overwhelmed the Blue Team' Aegis Ballistic Missile Defense System radars, sinking a significant portion of what was the equivalent to a strike carrier group. He then led a shock guerilla-like assault of fast attack craft that finished off much of what remained using missiles and suicide charges.</p>
                <p>As Micah Zenko recounted in his 2015 book Red Team: How to Succeed by Thinking Like the Enemy, Bell admitted that Van Riper's forces had "sunk my damn navy," and had inflicted "an extremely high rate of attrition, and a disaster, from which we all learned a great lesson."</p>
                <p>Rather than concede the losses, however, the Pentagon's control team overseeing the exercise simply chose to bring the fallen back to life and then further artificially constrain the Red Team's abilities in a way that it could not possibly succeed, a disgruntled Van Riper later recounted in a private e-mail leaked by the Army Times. "Instead of a free-play, two-sided game," he argued, "it simply became a scripted exercise."</p>
                <p>While the Pentagon justified its decision by wanting to employ the full extent of what was a costly, complex undertaking involving multiple real-life U.S. forces that had been scheduled to appear in the war games, many felt the "great lesson" was lost as casualties mounted during the Iraq War. Speaking to Newsweek just two weeks after the 2003 invasion, the late U.S. career diplomat and Red Team civilian leader for Millennial Challenge 2002 Robert Oakley said Pentagon officials "felt that it was unimportant," something he felt was a mistake.</p>
                <p>Oakley warned of a U.S. "temptation to overestimate our sophistication, our superiority in technology, our superiority in weapons"—citing examples in Vietnam and Lebanon. "I think we do this frequently. We get carried away by our weapons, firepower, superiority, technology, all this kind of stuff, and we fail to look at the human factor. People will look for a chink in our armor, the same way David found a chink in Goliath's armor."</p>
                <p>Fast forward 16 years—during which the U.S. has seen its troops only further entrenched in more murky post-9/11 conflicts—Arkansas Senator Tom Cotton told PBS on Tuesday that the U.S. would defeat Iran in "two strikes"—"the first strike and the last strike." Many other officials and experts disagreed, as Cotton's assessment came despite the fact that Iran was a much larger country, with the Middle East's largest standing army and missile arsenal, as well as countless Shiite Muslim militia fighters aligned to its revolutionary Shiite Muslim ideology across the region.</p>
                <p>While many have compared the Trump administration's Iran approach to that of former President George W. Bush's ahead of the Iraq War—including the hawkish influence of John Bolton—both Trump and various Iranian leaders have expressed the fact that they did not seek a war between their two countries.</p>
                <p>Still, the White House's decision to unilaterally leave the landmark 2015 nuclear deal has left Tehran skeptical of further diplomacy and Newsweek confirmed a National Security Council meeting last week in which Acting Defense Secretary Patrick Shanahan drew up offensive and retaliatory military options for Iran at Bolton's request, further escalating an already tense situation in the Persian Gulf.</p> -->
            </div>
            <hr>
        </section>

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