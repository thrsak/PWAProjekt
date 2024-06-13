<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu");

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT username, autentifikacija, `admin` FROM korisnik WHERE korisnik.username = ? AND korisnik.password = ?";

    $result = $connection->prepare($sql);
    $result->bind_param('ss', $username, $password);
    $result->execute();
    $result->store_result();

    if($result->num_rows > 0) {
        session_start();
        if($result->num_rows > 0) {
            $result->bind_result($Username, $autentifikacija, $Admin);
            $result->fetch();
        } 
        $_SESSION['username'] = $Username;
        $_SESSION['admin'] = $Admin;
        $url = 'http://localhost/Website/index.php?korisnik=' . $autentifikacija;
        echo '<html>';
        echo '<head>';
        echo '<meta http-equiv="refresh" content="5;url=' . $url . '">';
        echo '</head>';
        echo '<body>';
        echo '<h3> Prijava je uspjesna </h3>';
        echo 'Vraćamo vas na početni zaslon nakon 5 sekundi.';
        echo '</body>';
        echo '</html>';
        
    } else {
        $url = 'http://localhost/Website/autentifikacija/login.html';
        echo '<html>';
        echo '<head>';
        echo '<meta http-equiv="refresh" content="5;url=' . $url . '">';
        echo '</head>';
        echo '<body>';
        echo '<h3> Taj korisnik ne postoji </h3>';
        echo 'Vraćamo vas na zaslon za prijavu nakon 5 sekundi.';
        echo '</body>';
        echo '</html>';
    }