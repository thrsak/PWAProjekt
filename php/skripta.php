<?php 
    ini_set('display_errors', '0');
    error_reporting(0);

    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("There has been a problem while connecting to the database: " . mysqli_connect_error());

    $prijavljen = false;
    if($_SESSION['admin'] !== null) $prijavljen = true;

    $naslov = mysqli_real_escape_string($connection, $_POST['NewsTitle']);
    $tekst = mysqli_real_escape_string($connection, $_POST['NewsInformation']);
    $kategorija = mysqli_real_escape_string($connection, $_POST['kategorija']);
    $arhiva = false;

    if(isset($_POST['arhiva'])) $arhiva = true;

    $slika = $_FILES['NewsPicture'];

    if (isset($slika) && $slika['error'] == 0) {
        $dstDir = 'uploads/';
        $dat = basename($_FILES['NewsPicture']['name']);
        $dstFile = $dstDir . $dat;

        if(!is_dir($dstFile)) mkdir($dstDir, 0777, true);

        if(!(move_uploaded_file($_FILES['NewsPicture']['tmp_name'], $dstFile))) echo "Dogodila se greška pri prijenosu slike...";
    }

    $filePath = $connection->real_escape_string($dstDir);
    $sql = "INSERT INTO slike(naziv, putanja) VALUES ('$dat', '$filePath');";
    $sql .= "INSERT INTO vijesti (naslov, tekst, slika_id, arhiva, kategorija) VALUES ('$naslov', '$tekst',
            (SELECT id_slike FROM slike WHERE slike.naziv = '$dat'), '$arhiva', '$kategorija');";     

    if($connection->multi_query($sql) === FALSE) echo "Error: " . $sql . "<br>" . $connection->error;

    mysqli_close($connection);
?>

<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='stylesheet' href='../css/mainstyle.css'>
    <link rel='stylesheet' href='../css/article.css'>
    <link rel='stylesheet' href='../css/media.css'>
    <link rel='preconnect' href='https://fonts.googleapis.com'>
    <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
    <link href='https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap' rel='stylesheet'>
    <title>LeParisien</title>
</head>
<body>
    <header>
        <div class="maxWidth">
            <div class="logo">
                <img src="./images/download.png" alt="">
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
        </div>
        <div class='logo'>
            <img src='../images/download.png' alt=''>
        </div>
        <hr>
        <nav>
            <ul>
                <li><a href="../index.php">HOME</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="../admin/administracija.php">ADMIN</a></li>
                <li><a href="../func/unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section style="text-align: center;">
            <h3><?php echo htmlspecialchars($naslov, ENT_QUOTES, 'UTF-8'); ?></h3>
            <?php 
                if($dstFile !== NULL) echo "<img style='width: 90%; margin: 0 auto;' src='$dstFile' >\n"; 
                else echo "<br>";
            ?>
            <p><?php echo nl2br(htmlspecialchars($tekst, ENT_QUOTES, 'UTF-8')); ?></p>
        </section>
    </main>
    <footer>
        <hr>
        <span>&copy;Le Parisien</span>
    </footer>
</body>
</html>