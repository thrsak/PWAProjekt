<?php 
    $connection = mysqli_connect('localhost', 'root', '', 'leparisien');

    if(!$connection) {
        die("There has been a problem while connecting to the database");
    }

    $naslov = $_POST['NewsTitle'];
    $tekst = $_POST['NewsInformation'];
    $slika = $_FILES['NewsPicture'];
    $srcPath = $slika['tmp_name'];
    $dstFileName = $slika['name'];
    $dst = __DIR__ . '../images/' . $dstFileName;

    move_uploaded_file($srcPath, $dst);

    echo "
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
            <div class='logo'>
                <img src='../images/download.png' alt=''>
            </div>
            <hr>
            <nav>
                <ul>
                    <li><a href='../index.html'>HOME</a></li>
                    <li><a href='#'>PARISIEN</a></li>
                    <li><a href='#'>VIVRE</a></li>
                    <li><a href='#'>ADMINISTRACIJA</a></li>
                    <li><a href='../func/unos.html'>UNOS</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <section>
                <h3>$naslov</h3>
                <img src='./$slika' />
                <p>$tekst</p>
            </section>
        </main>
        <footer>
            <hr>
            <span>&copy; Le Parisien</span>
        </footer>
    </body>
    </html>";


    /* UNOS U BAZU
    $sql = "INSERT INTO vijesti(Naslov, Tekst) VALUES ('$naslov', '$tekst')";

    $result = mysqli_query($connection, $sql);

    if($result === true) {
        echo "Data successfully imported";
    } else {
        echo "There has been a problem while importing data";
    }

    mysqli_close($connection);

    */