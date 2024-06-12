<?php
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) die("Nešto je pošlo po zlu pri spajanju na bazu");

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT username, autentifikacija, admin FROM korisnik WHERE korisnik.username = '$username' AND korisnik.password = '$password'";

    $result = $connection->query($sql);

    if($result->num_rows > 0) {
        session_start();
        while($row = $result->fetch_assoc()) {
            $_SESSION['username'] = $row['username'];
            $_SESSION['admin'] = $row['admin'];
            $url = 'http://localhost/Website/index.php?korisnik=' . $row['autentifikacija'];
            echo '<html>';
            echo '<head>';
            echo '<meta http-equiv="refresh" content="5;url=' . $url . '">';
            echo '</head>';
            echo '<body>';
            echo '<h3> Prijava je uspjesna </h3>';
            echo 'Vraćamo vas na početni zaslon nakon 5 sekundi.';
            echo '</body>';
            echo '</html>';
        }
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