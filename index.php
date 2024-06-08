<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Dogodila se greška pri spajanju na bazu...");

    $sql = "SELECT * FROM vijesti
            JOIN slike s ON s.id_slike = vijesti.slika_id;";
    $result = $connection->query($sql);

    $counterZ = 0;
    $counterP = 0;
    $counterS = 0;
    $counterK = 0;
    $zabava = [];
    $kultura = [];
    $politika = [];
    $sport = [];

    if($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            if($row['arhiva'] === '0') {
                if ($row['kategorija'] === 'zabava') $zabava[$counterZ++] = $row;
                else if ($row['kategorija'] === 'politika') $politika[$counterP++] = $row;
                else if ($row['kategorija'] === 'sport') $sport[$counterS++] = $row;
                else if ($row['kategorija'] === 'kultura') $kultura[$counterK++] = $row;
                else echo "Nema te kategorije";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mainstyle.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/media.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>LeParisien</title>
</head>
<body>
    <header>
        <div class="logo">
            <img src="./images/download.png" alt="">
        </div>
        <hr>
        <nav>
            <ul>
                <li><a href="./index.php">HOME</a></li>
                <li><a href="./kategorije/kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="./kategorije/kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="./kategorije/kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="./kategorije/kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="./admin/administracija.php">ADMIN</a></li>
                <li><a href="./func/unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <div class="title">
            <hr>
            <h2>POLITIQUE</h2>
        </div>
        <div class="news">
            <?php
                for($i = 0; $i < $counterP; $i++) {
                    echo "<section>";
                    echo "<a href='./articles/clanak.php?clanak=" . $politika[$i]['id'] . "'><img src='./php/" . $politika[$i]['putanja'] . "/" . $politika[$i]['naziv'].  "' /></a>";
                    echo "<h4>" . $politika[$i]['naslov'] . "</h4>";
                    echo "</section>"; 
                }
            ?>
        </div>

        <div class="title">
            <hr>
            <h2>AMUSANT</h2>
        </div>
        <div class="news">
            <?php
                for($i = 0; $i < $counterZ; $i++) {
                    echo "<section>";
                    echo "<a href='./articles/clanak.php?clanak=" . $zabava[$i]['id'] . "'><img src='./php/" . $zabava[$i]['putanja'] . "/" . $zabava[$i]['naziv'].  "' /></a>";
                    echo "<h4>" . $zabava[$i]['naslov'] . "</h4>";
                    echo "</section>"; 
                }
            ?>
        </div>

        <div class="title">
            <hr>
            <h2>SPORT</h2>
        </div>
        <div class="news">
            <?php
                for($i = 0; $i < $counterS; $i++) {
                    echo "<section>";
                    echo "<a href='./articles/clanak.php?clanak=" . $sport[$i]['id'] . "'><img src='./php/" . $sport[$i]['putanja'] . "/" . $sport[$i]['naziv'].  "' /></a>";
                    echo "<h4>" . $sport[$i]['naslov'] . "</h4>";
                    echo "</section>"; 
                }
            ?>
        </div>

        <div class="title">
            <hr>
            <h2>CULTURE</h2>
        </div>
        <div class="news">
            <?php
                for($i = 0; $i < $counterK; $i++) {
                    echo "<section>";
                    echo "<a href='./articles/clanak.php?clanak=" . $kultura[$i]['id'] . "'><img src='./php/" . $kultura[$i]['putanja'] . "/" . $kultura[$i]['naziv'].  "' /></a>";
                    echo "<h4>" . $kultura[$i]['naslov'] . "</h4>";
                    echo "</section>"; 
                }
            ?>
        </div>
    </main>
    <footer>
        <hr>
        <span>&copy; Le Parisien</span>
    </footer>

    <?php 
        $connection->close();
    ?>
</body>
</html>