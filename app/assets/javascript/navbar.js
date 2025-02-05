// app/javascript/navbar.js

document.addEventListener('DOMContentLoaded', () => {
  // Mini Cart Toggle
  const cartToggle = document.querySelector('[data-cart-toggle]');
  const miniCart = document.querySelector('[data-mini-cart]');

  if (cartToggle && miniCart) {
    cartToggle.addEventListener('click', () => {
      miniCart.classList.toggle('active');
    });

    // Close mini cart when clicking outside
    document.addEventListener('click', (e) => {
      if (!cartToggle.contains(e.target) && !miniCart.contains(e.target)) {
        miniCart.classList.remove('active');
      }
    });
  }

  // Mobile Menu Toggle
  const mobileToggle = document.querySelector('[data-mobile-toggle]');
  const navLinks = document.querySelector('.navbar__links');

  if (mobileToggle && navLinks) {
    mobileToggle.addEventListener('click', () => {
      mobileToggle.classList.toggle('active');
      navLinks.classList.toggle('active');
    });
  }

  // Update Cart Counter
  function updateCartCounter(count, total) {
    const cartCount = document.querySelector('.cart-count');
    const cartTotal = document.querySelector('.cart-total');

    if (cartCount) cartCount.textContent = count;
    if (cartTotal) cartTotal.textContent = total;
  }

  // Add to Cart Animation
  function animateAddToCart(productImage) {
    const cart = document.querySelector('.cart-toggle');
    if (!cart || !productImage) return;

    const imgClone = productImage.cloneNode(true);
    const rect = productImage.getBoundingClientRect();
    const cartRect = cart.getBoundingClientRect();

    imgClone.style.position = 'fixed';
    imgClone.style.top = `${rect.top}px`;
    imgClone.style.left = `${rect.left}px`;
    imgClone.style.width = `${rect.width}px`;
    imgClone.style.height = `${rect.height}px`;
    imgClone.style.transition = 'all 0.8s ease-in-out';
    imgClone.style.zIndex = '1000';

    document.body.appendChild(imgClone);

    setTimeout(() => {
      imgClone.style.transform = `translate(${cartRect.left - rect.left}px, ${cartRect.top - rect.top}px) scale(0.1)`;
      imgClone.style.opacity = '0';
    }, 0);

    setTimeout(() => {
      imgClone.remove();
      cart.classList.add('shake');
      setTimeout(() => cart.classList.remove('shake'), 500);
    }, 800);
  }

  // Add event listeners for add to cart buttons
  document.querySelectorAll('[data-add-to-cart]').forEach(button => {
    button.addEventListener('click', (e) => {
      const productCard = button.closest('.product-card');
      const productImage = productCard?.querySelector('img');
      if (productImage) {
        animateAddToCart(productImage);
      }
    });
  });
});
