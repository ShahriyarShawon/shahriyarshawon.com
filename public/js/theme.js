const root = document.documentElement;

// apply theme immediately before DOM loads to avoid flash
const saved = localStorage.getItem("theme");
const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
const initial = saved ?? (prefersDark ? "dark" : "light");
root.dataset.theme = initial;

// wait for DOM before touching elements
document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("theme-toggle");
  const icon   = document.getElementById("theme-icon");

  icon.textContent = initial === "dark" ? "☀" : "☾";

  toggle.addEventListener("click", () => {
    const next = root.dataset.theme === "dark" ? "light" : "dark";
    root.dataset.theme = next;
    icon.textContent = next === "dark" ? "☀" : "☾";
    localStorage.setItem("theme", next);
  });
});
