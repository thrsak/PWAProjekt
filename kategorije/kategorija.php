<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Dogodila se greška pri spajanju na bazu...");

    $sql = "SELECT * FROM vijesti
            JOIN slike s ON s.id_slike = vijesti.slika_id;";
    $result = $connection->query($sql);

    $counter = 0;

    if(isset($_GET['kategorija'])) $kategorija = $_GET['kategorija'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/mainstyle.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/media.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>LeParisien</title>
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
                <li><a href="./kategorija.php?kategorija=zabava">AMUSANT</a></li>
                <li><a href="./kategorija.php?kategorija=sport">SPORT</a></li>
                <li><a href="./kategorija.php?kategorija=politika">POLITIQUE</a></li>
                <li><a href="./kategorija.php?kategorija=kultura">CULTURE</a></li>
                <li><a href="../admin/administracija.php">ADMIN</a></li>
                <li><a href="../func/unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <div class="title">
            <hr>
            <?php 
                switch($kategorija) {
                    case 'zabava':
                        echo "<h2>AMUSANT</h2>";
                    break;
                    case 'sport':
                        echo "<h2>SPORT</h2>";
                    break;
                    case 'kultura':
                        echo "<h2>CULTURE</h2>";
                    break;
                    case 'politika':
                        echo "<h2>POLITIQUE</h2>";
                    break;
                }
            ?>
        </div>
        <div class="news">
            <?php
                if($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        if($row['arhiva'] === '0') {
                            switch($kategorija) {
                                case 'zabava':
                                    if($row['kategorija'] === 'zabava') {
                                        echo "<section>";
                                        echo "<a href='../articles/clanak.php?clanak=" . $row['id'] ."'><img src='../php/" . $row['putanja'] . "/" . $row['naziv'].  "' /></a>";
                                        echo "<h4>" . $row['naslov'] . "</h4>";
                                        echo "</section>";
                                    }
                                break;
                                case 'sport':
                                    if($row['kategorija'] === 'sport') {
                                        echo "<section>";
                                        echo "<a href='../articles/clanak.php?clanak=" . $row['id'] ."'><img src='../php/" . $row['putanja'] . "/" . $row['naziv'].  "' /></a>";
                                        echo "<h4>" . $row['naslov'] . "</h4>";
                                        echo "</section>";
                                    }
                                break;
                                case 'kultura':
                                    if($row['kategorija'] === 'kultura') {
                                        echo "<section>";
                                        echo "<a href='../articles/clanak.php?clanak=" . $row['id'] ."'><img src='../php/" . $row['putanja'] . "/" . $row['naziv'].  "' /></a>";
                                        echo "<h4>" . $row['naslov'] . "</h4>";
                                        echo "</section>";
                                    }
                                break;
                                case 'politika':
                                    if($row['kategorija'] === 'politika') {
                                        echo "<section>";
                                        echo "<a href='../articles/clanak.php?clanak=" . $row['id'] ."'><img src='../php/" . $row['putanja'] . "/" . $row['naziv'].  "' /></a>";
                                        echo "<h4>" . $row['naslov'] . "</h4>";
                                        echo "</section>";
                                    }
                                break;
                            }
                        }
                    } 
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