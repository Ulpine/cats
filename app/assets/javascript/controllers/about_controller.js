// app/javascript/controllers/about_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["header", "title", "section", "catCard", "valueCard", "socialLink", "text"]

  connect() {
    console.log("About controller connected!")
    this.initAnimations()
    this.observeSections()
    this.createPawPrints()
  }

  initAnimations() {
    this.element.querySelectorAll('.about-us-cat-card').forEach(card => {
      card.addEventListener('mouseenter', () => {
        card.style.transform = 'scale(1.05) translateY(-10px)'
      })
      card.addEventListener('mouseleave', () => {
        card.style.transform = 'scale(1) translateY(0)'
      })
    })
  }

  observeSections() {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('visible')
          }
        })
      },
      { threshold: 0.1 }
    )

    this.element.querySelectorAll('section').forEach(section => {
      observer.observe(section)
    })
  }

  createPawPrints() {
    const header = this.element.querySelector('.about-us-header')
    if (header) {
      for (let i = 0; i < 5; i++) {
        const paw = document.createElement('div')
        paw.className = 'about-us-paw-print'
        paw.style.left = `${Math.random() * 100}%`
        paw.style.top = `${Math.random() * 100}%`
        paw.style.animationDelay = `${Math.random() * 2}s`
        header.appendChild(paw)
      }
    }
  }
}
