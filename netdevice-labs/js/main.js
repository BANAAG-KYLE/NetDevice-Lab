/* js/main.js - General Functions */

// 1. Check if user is logged in
function checkLogin() {
    // We will connect this to PHP later. 
    // For now, let's pretend we are logged in so the page works.
    console.log("Checking login status...");
    
    // Simulate a user name for the display
    const userDisplay = document.getElementById('userDisplay');
    if(userDisplay) {
        userDisplay.textContent = "Student";
    }
}

// 2. Toggle Mobile Menu (Optional for later)
function toggleMenu() {
    const nav = document.querySelector('nav');
    nav.classList.toggle('active');
}