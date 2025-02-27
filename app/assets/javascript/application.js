import { Application } from './stimulus.js'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

console.log("Stimulus initialized!")

// Importez vos autres fichiers
import "./home"
import "./cart"
import "./navbar"
import "./articles"
import "./articles_show"
import "./controllers/article_controller"
import "./controllers/about_controller"

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
