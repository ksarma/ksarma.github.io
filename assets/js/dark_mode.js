document.addEventListener('DOMContentLoaded', function() {
    const mode_toggle = document.getElementById("light-toggle");
    if (!mode_toggle) return;

    mode_toggle.addEventListener("click", function() {
        toggleTheme(localStorage.getItem("theme"));
    });

    // keyboard activation (Enter / Space) for the link-based toggle
    mode_toggle.addEventListener("keydown", function(e) {
        if (e.key === "Enter" || e.key === " " || e.key === "Spacebar") {
            e.preventDefault();
            toggleTheme(localStorage.getItem("theme"));
        }
    });
});

