<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu...");

    if(isset($_GET['vijest'])) $vijest_id = $_GET['vijest'];

    $sql = "SELECT * FROM vijesti
            JOIN slike s ON s.id_slike = vijesti.slika_id
            WHERE vijesti.id = $vijest_id;";

    $result = $connection->query($sql);
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
                <li><a href="./unos.html">UNOS</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Ažurirajte podatke ili kompletno obrište vijest</h2>
            <?php
                if($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        $linkAkcije = './akcija.php?vijest=' . $row['id'] . '&slika=' . $row['slika_id'];
            ?>
            <form action="<?php echo $linkAkcije;?>" method="post">
                <div>
                    <?php
                                if($row['arhiva'] === '0') $checked = "";
                                else $checked = "checked";

                                switch($row['kategorija']) {
                                    case 'sport':
                                        $select = " <select name='kategorija' id='kategorija'>
                                                        <option value='sport' selected>Sport</option>
                                                        <option value='zabava'>Zabava</option>
                                                        <option value='politika'>Politika</option>
                                                        <option value='kultura'>Kultura</option>
                                                    </select><br> "; 
                                    break;
                                    case 'zabava':
                                        $select = " <select name='kategorija' id='kategorija'>
                                                        <option value='sport'>Sport</option>
                                                        <option value='zabava' selected>Zabava</option>
                                                        <option value='politika'>Politika</option>
                                                        <option value='kultura'>Kultura</option>
                                                    </select><br> "; 
                                    break;
                                    case 'politika':
                                        $select = " <select name='kategorija' id='kategorija'>
                                                        <option value='sport'>Sport</option>
                                                        <option value='zabava'>Zabava</option>
                                                        <option value='politika' selected>Politika</option>
                                                        <option value='kultura'>Kultura</option>
                                                    </select><br> "; 
                                    break;
                                    case 'kultura':
                                        $select = " <select name='kategorija' id='kategorija'>
                                                        <option value='sport'>Sport</option>
                                                        <option value='zabava'>Zabava</option>
                                                        <option value='politika'>Politika</option>
                                                        <option value='kultura' selected>Kultura</option>
                                                    </select><br> "; 
                                    break;
                                }

                                

                                echo "
                                    <label for='NewsTitle'>Naslov vijesti: </label><br>
                                    <input type='text' name='NewsTitle' id='NewsTitle' placeholder='...' value='" . $row['naslov'] . "'><br>
                                    <label for='NewsInformation'>Tekst vijesti: </label><br>
                                    <textarea name='NewsInformation' id='NewsInformation'>" . $row['tekst'] . "</textarea><br>
                                    <label for='arhiva'>Arhiva?</label><br>
                                    <input type='checkbox' name='arhiva' id='arhiva' " . $checked . "><br>   
                                    <label for='kategorija'>Kategorija: </label>
                                    " . $select . "
                                    <label for='NewsPicture'>Prikvaci sliku: </label><br>
                                    <input type='file' name='NewsPicture' id='NewsPicture'><br>
                                    <label for='brisanje'>BRISANJE VIJESTI? </label><br>
                                    <input type='checkbox' name='brisanje' id='brisanje'>
                                    <input type='submit' value='Unesi'><br>
                                ";
                            }
                        }
                    ?>
                </div>
            </form>
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