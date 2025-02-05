import "./home";
import "./cart";
import "./navbar";

document.addEventListener('DOMContentLoaded', () => {
  const socialIcons = document.querySelectorAll('.social-icon');

  socialIcons.forEach(icon => {
    icon.addEventListener('mouseenter', () => {
      icon.style.transform = 'translateY(-3px) rotate(5deg)';
    });

    icon.addEventListener('mouseleave', () => {
      icon.style.transform = 'translateY(0) rotate(0)';
    });
  });
})
