function navtoggle(){
    document.getElementById("nav-items").classList.toggle("active");
    console.log("Happened");
}

function copyXMR() {
  var copyText = document.getElementById("xmraddr");

  // /* Select the text field */
  // copyText.select();
  // copyText.setSelectionRange(0, 99999); /* For mobile devices */

  /* Copy the text inside the text field */
  clipboard = navigator.clipboard
  clipboard.writeText(copyText)
  /* Alert the copied text */
  alert("Copied the text: " + copyText.value);
}


function toggleAnonPepe(){
  document.getElementById("anon_pepe").classList.toggle("hidden");


}