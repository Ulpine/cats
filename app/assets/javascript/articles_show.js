console.log("File loaded - outside any event listener");

// On essaie les deux types d'événements
document.addEventListener('turbo:load', () => {
  console.log("Turbo:load fired");
});

document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded fired");
});
  // Création de la table des matières
//   function createTableOfContents() {
//     const article = document.querySelector('.article-body');
//     if (!article) return;

//     const headings = article.querySelectorAll('h2');
//     if (headings.length === 0) return;

//     const toc = document.createElement('div');
//     toc.className = 'table-of-contents';
//     toc.innerHTML = '<h4>Dans cet article</h4>';

//     const list = document.createElement('ul');
//     headings.forEach((heading, index) => {
//       const id = `section-${index}`;
//       heading.id = id;

//       const li = document.createElement('li');
//       li.innerHTML = `<a href="#${id}">${heading.textContent}</a>`;
//       list.appendChild(li);
//     });

//     toc.appendChild(list);
//     article.insertBefore(toc, article.firstChild);
//   }

//   // Animation au scroll
//   function animateOnScroll() {
//     const elements = document.querySelectorAll('.article-body h2, .article-body .info-box');

//     const observer = new IntersectionObserver((entries) => {
//       entries.forEach(entry => {
//         if (entry.isIntersecting) {
//           entry.target.style.opacity = '1';
//           entry.target.style.transform = 'translateX(0)';
//         }
//       });
//     });

//     elements.forEach(element => {
//       element.style.opacity = '0';
//       element.style.transform = 'translateX(-20px)';
//       element.style.transition = 'all 0.5s ease';
//       observer.observe(element);
//     });
//   }

//   // Estimation du temps de lecture
//   function addReadingTime() {
//     const article = document.querySelector('.article-body');
//     if (!article) return;

//     const words = article.textContent.trim().split(/\s+/).length;
//     const minutes = Math.ceil(words / 200); // 200 mots par minute en moyenne

//     const readingTime = document.createElement('div');
//     readingTime.className = 'reading-time';
//     readingTime.innerHTML = `<i class="fas fa-clock"></i> Temps de lecture : ${minutes} min`;

//     const metaSection = document.querySelector('.article-meta');
//     if (metaSection) {
//       metaSection.appendChild(readingTime);
//     }
//   }

//   createTableOfContents();
//   animateOnScroll();
//   addReadingTime();
// });
