document.addEventListener('DOMContentLoaded', () => {
  // Filtrage dynamique des catégories
  const categoryLinks = document.querySelectorAll('.category-link');
  const articleCards = document.querySelectorAll('.article-card');

  categoryLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      const selectedCategory = e.target.dataset.category;

      // Mise à jour visuelle des liens de catégorie
      categoryLinks.forEach(l => l.classList.remove('active'));
      e.target.classList.add('active');

      // Filtrage des articles
      articleCards.forEach(card => {
        const cardCategory = card.dataset.category;

        if (selectedCategory === 'all' || cardCategory === selectedCategory) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });

  // Animation de survol des cartes
  articleCards.forEach(card => {
    card.addEventListener('mouseenter', () => {
      card.style.transform = 'translateY(-10px)';
      card.style.boxShadow = '0 6px 12px rgba(0,0,0,0.15)';
    });

    card.addEventListener('mouseleave', () => {
      card.style.transform = 'translateY(0)';
      card.style.boxShadow = '0 4px 6px rgba(0,0,0,0.1)';
    });
  });
});
