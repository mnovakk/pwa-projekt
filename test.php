<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<h2>Prijavi se</h2>
    <form method="post">
        <label for="title">title</label><br />
        <input name="title" type="text" required/><br /><br />
        
        <label for="about">about</label><br />
        <input name="about" type="text" required/> <br /> <br />

        <label for="content">content</label><br />
        <input name="content" type="text" required/> <br /> <br />

        <select name="category" id="" class="form-field-textual">
            <option value="U.S">U.S</option>
            <option value="World">World</option>
         </select>

        <label for="archive">archive</label><br />
        <input type="checkbox" name="archive"><br />

        <input name="submit" type="submit" value="Pošalji" /> <br /><br /><br />
</form>

<
<?php
include 'connect.php';

if (isset($_POST['submit'])){
    
    $title = $_POST['title'];
    $about = $_POST['about'];
    $content = $_POST['content'];
    $category = $_POST['category'];
    if(isset($_POST['archive'])){
        $archive=1;
    }else{
        $archive=0;
    }


    $query = "INSERT INTO vijesti (naslov, sazetak, tekst, kategorija, arhiva) values ('$title','$about','$content','$category','$archive')";
    $result = mysqli_query($dbc,$query) or die ('Error querying datzabase!');
}
mysqli_close($dbc);

?>
</body>
</html>