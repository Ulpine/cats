document.addEventListener('DOMContentLoaded', () => {
  // Animation au scroll pour les cartes de produits
  const productCards = document.querySelectorAll('.product-card');

  const observerOptions = {
    threshold: 0.1,
    rootMargin: '50px'
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  productCards.forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = 'all 0.6s ease-out';
    observer.observe(card);
  });

  // Animation du banner
  const bannerContent = document.querySelector('.banner__content');
  if (bannerContent) {
    bannerContent.style.opacity = '0';
    bannerContent.style.transform = 'translateY(20px)';

    setTimeout(() => {
      bannerContent.style.transition = 'all 1s ease-out';
      bannerContent.style.opacity = '1';
      bannerContent.style.transform = 'translateY(0)';
    }, 300);
  }
});
