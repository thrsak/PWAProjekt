<?php

    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu");

    $username = $_POST['username'];
    $password = $_POST['password'];
    
    if(isset($_POST['admin'])) {
        $admin = 1;
    } else {
        $admin = 0;
    }

    $autentifikacija = bin2hex(random_bytes(16/2));

    $sql = "INSERT INTO korisnik (username, `password`, `admin`, autentifikacija) VALUES ('$username', '$password', '$admin', '$autentifikacija');";

    $result = $connection->prepare($sql);
    $result->execute();
    $result->store_result();

    if(!$result) {
        die("Registracija nije uspjesno prosla...");
    } else {
        session_start();
        $_SESSION['username'] = $username;
        $_SESSION['admin'] = $admin;
        $url = 'http://localhost/Website/index.php?korisnik=' . $autentifikacija;
        echo '<html>';
        echo '<head>';
        echo '<meta http-equiv="refresh" content="5;url=' . $url . '">';
        echo '</head>';
        echo '<body>';
        echo '<h3> Registracija je uspjesna </h3>';
        echo 'Vraćamo vas na početni zaslon nakon 5 sekundi.';
        echo '</body>';
        echo '</html>';
    }