puts "Destroy"
Product.destroy_all

products = [
  {
    name: "Grotte-Lit Chat Cocon",
    price: 34.99,
    short_description: "Nid douillet et confortable en forme de grotte pour chat",
    description: "Cette grotte-lit offre à votre chat un espace cosy et sécurisant pour se reposer. Fabriquée en feutre doux et résistant, elle est parfaite pour les chats qui aiment se cacher. Dimensions : 40x40x35cm. Lavable en machine. Disponible en gris clair.",
    image_url: "grotte-chat.jpg",
    featured: true
  },
  {
    name: "Fontaine à Eau Chat LED",
    price: 29.99,
    short_description: "Fontaine à eau silencieuse avec LED et filtration",
    description: "Fontaine à eau pour chat avec LED apaisante et système de filtration à charbon actif. Capacité de 2,4L, ultra-silencieuse avec 3 modes d'écoulement. Encourage votre chat à boire plus d'eau. Facile à nettoyer et économe en énergie.",
    image_url: "fontaine-chat.jpg",
    featured: true
  },
  {
    name: "Arbre à Chat XL Premium",
    price: 89.99,
    short_description: "Grand arbre à chat avec multiples plateformes et griffoirs",
    description: "Arbre à chat luxueux de 165cm avec plusieurs niveaux, comprenant 2 grottes, 3 plateformes d'observation, des griffoirs en sisal naturel et des jouets suspendus. Structure stable et matériaux de qualité supérieure.",
    image_url: "arbre-chat.jpg",
    featured: true
  },
  {
    name: "Jouet Interactif LED",
    price: 19.99,
    short_description: "Balle interactive lumineuse auto-rotative",
    description: "Jouet intelligent qui roule et s'illumine automatiquement, stimulant l'instinct de chasse de votre chat. Rechargeable par USB, avec arrêt automatique. Idéal pour garder votre chat actif même en votre absence.",
    image_url: "jouet-led.jpg",
    featured: true
  },
  {
    name: "Hamac de Fenêtre Chat",
    price: 24.99,
    short_description: "Hamac ventouse pour fenêtre, supporte jusqu'à 10kg",
    description: "Hamac de fenêtre avec ventouses ultra-résistantes. Offre à votre chat un point d'observation confortable au soleil. Installation facile, tissu lavable en machine. Dimensions : 55x35cm.",
    image_url: "hamac-fenetre.jpg",
    featured: true
  },
  {
    name: "Brosse Auto-Nettoyante",
    price: 22.99,
    short_description: "Brosse avec système de nettoyage one-touch",
    description: "Brosse de toilettage avec bouton d'auto-nettoyage. Retire efficacement les poils morts et les nœuds. Design ergonomique avec picots souples adaptés aux chats sensibles. Idéale pour les poils courts et longs.",
    image_url: "brosse-chat.jpg",
    featured: true
  }
]

products.each do |product|
  Product.create!(product)
  puts "Produit créé : #{product[:name]}"
end

puts "Création des produits terminée !"
