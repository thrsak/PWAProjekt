function showError(element, message) {
    element.classList.add('error');
    const errorElement = document.getElementById(element.id + 'Error');
    console.log(message);
    errorElement.textContent = message;
}

function resetErrors() {
    const errorElements = document.querySelectorAll('.error');
    errorElements.forEach(function(element) {
        element.classList.remove('error');
    });

    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(function(element) {
        element.textContent = '';
    });
}


document.getElementById('unos').addEventListener('submit', function(event) {
    event.preventDefault();
    
    resetErrors();
    
    let dobarUnos = true;

    const naslov = document.getElementById('NewsTitle');
    const tekst = document.getElementById('NewsInformation');
    const slika = document.getElementById('NewsPicture');
    const kategorija = document.getElementById('kategorija');

    let msg = "";
    
    if (naslov.value.length < 5 || naslov.value.length > 30) {
        dobarUnos = false;
        msg = 'Naslov mora imati između 5 i 30 znakova.';
        showError(naslov, msg);
    }
    
    if (tekst.value.trim() === '') {
        dobarUnos = false;
        msg = 'Tekst vijesti nesmije biti prazan.'
        showError(tekst, msg);
    }
    
    if (slika.files.length === 0) {
        dobarUnos = false;
        msg = 'Morate odabrati sliku.';
        showError(slika, msg);
    }
    
    if (kategorija.value === '') {
        dobarUnos = false;
        msg = 'Morate odabrati kategoriju.';
        showError(kategorija, msg);
    }

    if (dobarUnos) {
        this.submit();
    }
});
