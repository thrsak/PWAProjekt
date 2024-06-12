<?php
    session_start();    

    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die('Prilikom spajanja na bazu nesto je poslo po zlu, probajte ponovno kasnije...');

    $prijavljen = false;
    if($_SESSION['username'] !== null) $prijavljen = true;

    if(isset($_GET['clanak'])) $clanak_id = $_GET['clanak'];

    $sql = "SELECT * FROM vijesti 
            JOIN slike s ON vijesti.slika_id = s.id_slike
            WHERE vijesti.id = $clanak_id";
    $result = $connection->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/mainstyle.css">
    <link rel="stylesheet" href="../css/article.css">
    <link rel="stylesheet" href="../css/media.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>LeParisien</title>
</head>
<body>
    <header>
        <div class="maxWidth">
            <div class="logo">
                <img src="../images/download.png" alt="">
            </div>
            <?php if(!$prijavljen) { ?>
            <div class="autent">
                <a href="./autentifikacija/login.html">LOGIN</a>
                <a href="./autentifikacija/registracija.html">REGISTRACIJA</a>
            </div>
            <?php } else { ?>
            <div class="prijava">
                <h4>Dobrodosli <?php echo $_SESSION['username']; ?>!</h4>
                <a href="http://localhost/Website/index.php?odjava=1">Odjava</a>
            </div>
            <?php } ?>
            <div class="clear"></div>
        </div>
        <hr>
        <nav>
            <ul>
                <li><a href="../index.php">HOME</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="../kategorije/admin/administracija.php">ADMIN</a></li>
                <li><a href="../func/unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <?php
            if($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<div>";
                    echo "<h1>" . $row['naslov'] . "</h1>";
                    echo "<img src='../php/" . $row['putanja'] . "/" . $row['naziv'].  "' />";
                    echo "</div>";
                    echo "<section>";
                    echo "<p>" . $row['tekst'] . "</p>";
                    echo "</section>";
                }
            }
        ?>
    </main>
    <footer>
        <hr>
        <span>&copy; Le Parisien</span>
    </footer>
</body>
</html>