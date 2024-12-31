document.addEventListener("DOMContentLoaded", () => {

    const registerForm = document.querySelector("#register-details form");
    const loginForm = document.querySelector("#login-details form");

    registerForm.addEventListener("submit", registerUser);
    loginForm.addEventListener("submit", loginUser);

    function loginUser(e) {
        e.preventDefault();
        const email = loginForm.username.value.trim();
        const password = loginForm.password.value;
        const user = JSON.parse(localStorage.getItem(email));
        console.log("user=====",user)
        if(user){
            if (user.email === email && user.password === password) {
                sessionStorage.setItem("session", JSON.stringify(user));
                showAlert("Success", "Registration successful!");
                window.location.href = "home.html";
            }
            else{
                showAlert("Error", "Invalid username or password.");
            }
        }
        else{
            showAlert("Error", "User not found.");
        }
    }

    function registerUser(e) {
        e.preventDefault();

        const username = registerForm.username.value.trim();
        const email = registerForm.email.value.trim();
        const password = registerForm.password.value;

        if (username && email && password) {
            const user = { username, email, password };
            localStorage.setItem(email, JSON.stringify(user));
            showAlert("Success", "Registration successful!");
            registerForm.reset();
        } else {
            showAlert("Error", "Please fill in all fields.");
        }
    }
});

function setupHomePage() {
    document.addEventListener("DOMContentLoaded", () => {
        const user = JSON.parse(sessionStorage.getItem("session"));

        if (!user) {
            window.location.href = "page.html";
            return;
        }

        const sessionStartTime = Date.now();
        const sessionDuration = 42000;

        function updateRemainingTime() {
            const currentTime = Date.now();
            const elapsedTime = currentTime - sessionStartTime;
            const remainingTime = sessionDuration - elapsedTime;
            if (remainingTime <= 0) {
                sessionStorage.clear();
                window.location.href = "page.html";
            } else {
                const remainingSeconds = Math.floor(remainingTime / 1000);
                document.getElementById("remainingTime").textContent = `Remaining time: ${ remainingSeconds } seconds`;
            }
        }

        const closeInterval = setInterval(updateRemainingTime, 1000);
        const usernameElement = document.getElementById("username");
        const emailElement = document.getElementById("email");

        usernameElement.textContent = user.username;
        emailElement.textContent = user.email;

        setTimeout(() => {
            sessionStorage.clear();
            clearInterval(closeInterval);
            showAlert("Session Expired", "Your session has expired. Please log in again.");
            window.location.href = "page.html";
        }, sessionDuration);

        document.getElementById("deleteSession").addEventListener("click", () => {
            sessionStorage.clear();
            localStorage.clear();
            clearInterval(closeInterval);
            showAlert("Session Deleted", "Your session has been deleted. Please log in again.");
            window.location.href = "page.html";
        });
    });
}
function showAlert(title, message) {
    const alert = document.getElementById('alert');
    const alertTitle = document.getElementById('alert-title');
    const alertMessage = document.getElementById('alert-message');

    alertTitle.textContent = title;
    alertMessage.textContent = message;
    alert.style.display = 'block';

    // Auto-hide after 5 seconds
    setTimeout(closeAlert, 5000);
}

function closeAlert() {
    const alert = document.getElementById('alert');
    alert.style.display = 'none';
}

if (window.location.pathname.includes("home.html")) {
    setupHomePage();
}