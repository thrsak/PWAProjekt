<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu...");

    $sql = "SELECT * FROM vijesti
            JOIN slike s ON s.id_slike = vijesti.slika_id;";

    $result = $connection->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/mainstyle.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/media.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>LeParisien - Admin</title>
</head>
<body>
    <header>
        <div class="logo">
            <img src="../images/download.png" alt="">
        </div>
        <hr>
        <nav>
            <ul>
                <li><a href="../index.php">HOME</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="../kategorije/kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="./administracija.php">ADMIN</a></li>
                <li><a href="../func/unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Odaberite vijest koju želite ažurirati/obrisati</h2>
            <?php
                if($result->num_rows > 0) {
                    $counter = 0;
                    while($row = $result->fetch_assoc()) {

                        if($counter === 0) {
                            echo "<div>\n";
                        }

                        if($counter < 3) {
                            echo "<article><a href='radnja.php?vijest=" . $row['id'] . "'>";
                            echo "<img src='../php/uploads/" . $row['naziv'] . "' />";
                            echo "<h4>" . $row['naslov'] . "</h4>\n";
                            echo "</a></article>";
                            $counter++;
                        }

                        if($counter === 3) {
                            echo "</div>\n";
                            $counter = 0;
                        }

                    }
                }
            ?>
        </section>
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