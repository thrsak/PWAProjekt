<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu...");

    if(isset($_GET['vijest'])) $vijest_id = $_GET['vijest'];

    if(isset($_GET['slika'])) $slika_id = $_GET['slika'];

    $brisanje = false;
    if(isset($_POST['brisanje'])) $brisanje = true;

    if(!$brisanje) {
        // Kod za ažuriranje 
        $naslov = mysqli_real_escape_string($connection, $_POST['NewsTitle']);
        $tekst = mysqli_real_escape_string($connection, $_POST['NewsInformation']);
        $kategorija = mysqli_real_escape_string($connection, $_POST['kategorija']);
        $arhiva = false;

        if(isset($_POST['arhiva'])) $arhiva = true;

        if(isset($_FILES['NewsPicture'])) $slika = $_FILES['NewsPicture'];

        $multiquery = true;

        if (isset($slika) && $slika['error'] == 0) {
            $dstDir = 'uploads/';
            $dat = basename($_FILES['NewsPicture']['name']);
            $dstFile = $dstDir . $dat;

            if(!is_dir($dstFile)) mkdir($dstDir, 0777, true);

            if(!(move_uploaded_file($_FILES['NewsPicture']['tmp_name'], $dstFile))) echo "Dogodila se greška pri prijenosu slike...";
            
            $filePath = $connection->real_escape_string($dstDir);
            $sql = "UPDATE slike SET naziv = '$dat', putanja = '$filePath' WHERE slike.id_slike = '" . $slika_id . "';";
            $sql .= "UPDATE vijesti SET naslov = '$naslov', tekst = '$tekst', arhiva = '$arhiva', kategorija = '$kategorija' 
                    WHERE vijesti.id = '" . $vijest_id . "';";
        } else {
            $multiquery = false;
            $sql = "UPDATE vijesti SET naslov = '$naslov', tekst = '$tekst', arhiva = '$arhiva', kategorija = '$kategorija' 
                    WHERE vijesti.id = '" . $vijest_id . "';";
        }
    } else {
        // Kod za brisanje
        $sql = "DELETE FROM vijesti WHERE vijesti.id=" . $vijest_id . ";";
        $sql .= "DELETE FROM slike WHERE slike.id_slike=" . $slika_id . ";";

        $multiquery = true;
    }
    

    if($multiquery) { if($connection->multi_query($sql) === FALSE) echo "Error: " . $sql . "<br>" . $connection->error; }
    else { if($connection->query($sql) === FALSE) echo "Error: " . $sql . "<br>" . $connection->error; }

    mysqli_close($connection);

    header("Location: http://localhost/Website/index.php", true, 302);
    exit();
?>