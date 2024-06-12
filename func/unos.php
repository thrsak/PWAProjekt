<?php 
    $prijava = false;
    $admin = '0';

    if(isset($_GET['korisnik'])) {
        $korisnik_aut = $_GET['korisnik'];

        $sql1 = "SELECT username, `admin` FROM korisnik WHERE korisnik.autentifikacija = '$korisnik_aut'";
        $result1 = $connection->query($sql1);

        if($result1->num_rows > 0) {
            while($row = $result1->fetch_assoc()) {
                $korisnik = $row['username'];
                $admin = $row['admin'];
            }

            $prijava = true;
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/mainstyle.css">
    <link rel="stylesheet" href="../css/unos.css">
    <link rel="stylesheet" href="../css/media.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>LeParisien - Unos</title>
</head>
<body>
    <header>
        <div class="maxWidth">
            <div class="logo">
                <img src="./images/download.png" alt="">
            </div>
            <?php if($prijava) { ?>
            <div class="prijava">
                <h4>Dobrodosli <?php echo $korisnik; ?>!</h4>
                <a href="http://localhost/Website/index.php">Odjava</a>
            </div>
            <?php } ?>
        </div>
        <div class="clear"></div>
        <hr>
        <nav>
            <ul>
                <li><a href="../index.php">HOME</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="#">ADMIN</a></li>
                <li><a href="./unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h1>Unos novih vijesti</h1>
            <form action="../php/skripta.php" method="post" enctype="multipart/form-data" id="unos">
                <div>
                    <label for="NewsTitle">Naslov vijesti: </label><br>
                    <input type="text" name="NewsTitle" id="NewsTitle" placeholder="..." required><br>
                    <span class="error-message" id="NewsTitleError"></span><br>

                    <label for="NewsInformation">Tekst vijesti: </label><br>
                    <textarea name="NewsInformation" placeholder="..." id="NewsInformation" required></textarea><br>
                    <span class="error-message" id="NewsInformationError"></span><br>

                    <label for="arhiva">Arhiva?</label><br>
                    <input type="checkbox" name="arhiva" id="arhiva"><br>
   
                    <label for="kategorija">Kategorija: </label>
                    <select name="kategorija" id="kategorija">
                        <option value=""></option>
                        <option value="sport">Sport</option>
                        <option value="zabava">Zabava</option>
                        <option value="politika">Politika</option>
                        <option value="kultura">Kultura</option>
                    </select><br>   
                    <span class="error-message" id="kategorijaError"></span><br>

                    <label for="NewsPicture">Prikvaci sliku: </label><br>
                    <input type="file" name="NewsPicture" id="NewsPicture" required><br>
                    <span class="error-message" id="NewsPictureError"></span><br>

                    <input type="submit" value="Unesi"><br>
                </div>
            </form>
        </section>
        <script src="./provjera.js"></script>
    </main>
    <footer>
        <hr>
        <span>&copy; Le Parisien</span>
    </footer>
</body>
</html>