var welcomeMsg = 'Music App'

document.querySelector('h1').innerText = welcomeMsg

//connection to SQL database json
fetch('/artists').then(resp => resp.json()).then(artists => { 
    document.querySelector('#artists').innerHTML = listArtists(artists);
    }
);

 
function listArtists(json) {
    return `${json.map(listArtist).join('\n')}`
};

let listArtists = function(artist) {
    return '<p>' + artist.artistid + ": " + artist.name + '</p>';
};

function postArtist() {
    let artist = {
        "artistId": document.getElementById("artistId").value,
        "name": document.getElementById("name").value
}    
    console.log(artist);
    fetch("/artists", {
        method: "POST",
        headers: {
            'Accept': 'application/java',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(artist)
    }).then((result) => {
        if (result.status != 200) {
            throw new Error("Bad Server Response");
        }
        console.log(result.text());
    }).catch((error) => { console.log(error); })
    fetch('/artists').then(resp => resp.json()).then(artists => { 
        document.querySelector('#artists').innerHTML = listArtists(artists);
        }
    );
}
