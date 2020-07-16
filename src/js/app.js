if (document.getElementById("form")) {
  const form = document.getElementById("form");
  const username = document.getElementById("username");
  const password = document.getElementById("password");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    if (username.value === "sajalBain" && password.value === "password") {
      window.location.href = "./switch.html";
    } else {
      alert("Username or password error");
    }
  });
}
