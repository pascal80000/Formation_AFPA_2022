//contrôle de la case à cocher pour éviter un DELETE intempestif

var CHECK = document.getElementById("check").checked;
var ok_delete = "";


if (CHECK == TRUE) {
    ok_delete = "OK";
    console.log ("OK pour delete");

}

console.log("PAS OK pour delete");

