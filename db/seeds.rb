puts "Destruction des anciennes données..."
OrderItem.destroy_all
Product.destroy_all
Article.destroy_all
Category.destroy_all

puts "Création des catégories..."
nutrition = Category.create!(
  name: 'Nutrition',
  description: 'Conseils alimentaires pour chats'
)

comportement = Category.create!(
  name: 'Comportement',
  description: 'Comprendre le comportement félin'
)

bien_etre = Category.create!(
  name: 'Bien-être',
  description: 'Produits et conseils pour le bien-être de votre chat'
)

puts "Catégories créées !"

# Produits avec leur catégorie associée
products = [
  {
    name: "Grotte-Lit Chat Cocon",
    price: 34.99,
    short_description: "Nid douillet et confortable en forme de grotte pour chat",
    description: "Cette grotte-lit offre à votre chat un espace cosy et sécurisant pour se reposer...",
    image_url: "grotte-chat.jpg",
    featured: true,
    category: bien_etre
  },
  {
    name: "Fontaine à Eau Chat LED",
    price: 29.99,
    short_description: "Fontaine à eau silencieuse avec LED et filtration",
    description: "Fontaine à eau pour chat avec LED apaisante et système de filtration à charbon actif...",
    image_url: "fontaine-chat.jpg",
    featured: true,
    category: nutrition
  },
  {
    name: "Arbre à Chat XL Premium",
    price: 89.99,
    short_description: "Grand arbre à chat avec multiples plateformes et griffoirs",
    description: "Arbre à chat luxueux de 165cm avec plusieurs niveaux...",
    image_url: "arbre-chat.jpg",
    featured: true,
    category: bien_etre
  },
  {
    name: "Jouet Interactif LED",
    price: 19.99,
    short_description: "Balle interactive lumineuse auto-rotative",
    description: "Jouet intelligent qui roule et s'illumine automatiquement...",
    image_url: "jouet-led.jpg",
    featured: true,
    category: comportement
  },
  {
    name: "Hamac de Fenêtre Chat",
    price: 24.99,
    short_description: "Hamac ventouse pour fenêtre, supporte jusqu'à 10kg",
    description: "Hamac de fenêtre avec ventouses ultra-résistantes...",
    image_url: "hamac-fenetre.jpg",
    featured: true,
    category: bien_etre
  },
  {
    name: "Brosse Auto-Nettoyante",
    price: 22.99,
    short_description: "Brosse avec système de nettoyage one-touch",
    description: "Brosse de toilettage avec bouton d'auto-nettoyage...",
    image_url: "brosse-chat.jpg",
    featured: true,
    category: bien_etre
  }
]

puts "Création des produits..."
products.each do |product|
  Product.create!(product)
  puts "Produit créé : #{product[:name]}"
end

puts "Création des produits terminée !"

# Fonction pour attacher une image à un article
def attach_image(article, filename)
  path = Rails.root.join('db', 'images', filename)

  if File.exist?(path)
    article.image.attach(
      io: File.open(path),
      filename: filename
    )
  else
    puts "Fichier image manquant : #{path}"
  end
end

# Articles avec attachement d'image
articles_data = [
  {
    title: 'Pourquoi votre chat miaule et frotte sa tête contre vous',
    content: "Introduction

Votre chat vous regarde avec ses grands yeux perçants, miaule doucement, puis s’approche et frotte sa tête contre votre main ou votre jambe. Ce comportement attendrissant est l’un des plus répandus chez les chats, mais que signifie-t-il vraiment ? Est-ce un simple geste d’affection, un besoin, ou un message codé ? Comprendre ces signes peut renforcer votre lien avec votre compagnon félin et vous aider à mieux répondre à ses besoins.

1. Pourquoi votre chat miaule-t-il ?

Contrairement à ce que l’on pourrait penser, les chats ne miaulent presque jamais entre eux. Ce moyen de communication est principalement réservé aux humains. Il existe plusieurs raisons à ces miaulements :

a) Un besoin essentiel

Votre chat miaule souvent pour exprimer un besoin immédiat :

Il a faim ou soif : Le miaulement peut signaler que sa gamelle est vide ou que son eau n’est pas fraîche.

Il veut sortir ou entrer : Si votre chat a accès à l’extérieur, il miaulera probablement pour vous faire comprendre qu’il veut franchir la porte.

Il a besoin d’attention : Certains chats demandent de l’affection ou du jeu en miaulant.

b) Une habitude et un langage unique

Chaque chat développe un langage propre avec son humain. Certains sont plus bavards que d’autres (comme le Siamois, très expressif). Si votre chat miaule plus que d’habitude, cela peut indiquer un changement d’humeur ou une attente spécifique.

c) Un signe de stress ou d’inconfort

Un miaulement excessif peut être le signe d’un stress, d’une douleur ou d’un problème de santé. Un chat plus agé peut miauler davantage à cause de l’anxiété ou de troubles cognitifs.

2. Pourquoi votre chat frotte-t-il sa tête contre vous ?

Le frottement de la tête est une des plus belles marques d’affection que peut vous offrir un chat. Mais au-delà de la tendresse, ce geste a plusieurs significations profondes.

a) Un marquage territorial

Les chats possèdent des glandes odorantes sur leur tête (autour des joues et du menton). En se frottant contre vous, ils déposent leurs phéromones, signalant ainsi que vous faites partie de leur territoire et de leur famille.

b) Une preuve d’affection et de confiance

Lorsqu’un chat frotte sa tête contre vous, c’est une manière de vous dire qu’il vous fait confiance et qu’il vous considère comme un être proche. Les chats ne font pas cela avec tout le monde !

c) Une recherche de contact et de chaleur

Ce geste peut aussi être une simple recherche de contact physique et de chaleur. Un chat qui vous frotte la tête peut avoir envie d’une caresse ou simplement d’un moment de proximité.

3. Comment réagir face à ces comportements ?

a) Répondre aux miaulements

Si votre chat miaule par faim, assurez-vous que sa nourriture est adaptée et servie à horaires réguliers.

Si c’est un besoin de jeu ou d’attention, consacrez-lui quelques minutes pour jouer.

Si les miaulements sont inhabituels et persistants, une visite chez le vétérinaire peut être nécessaire.

b) Accepter les frottements et renforcer le lien

Si votre chat vous frotte la tête, laissez-le faire et répondez-lui par des caresses douces. Vous pouvez aussi lui parler doucement pour renforcer votre complicité.

Conclusion

Le langage des chats est riche et fascinant. Le miaulement et le frottement de la tête sont des moyens pour eux d’exprimer des besoins, des émotions et un profond attachement envers vous. En apprenant à les interpréter, vous répondrez mieux à ses attentes et renforcerez votre relation. La prochaine fois que votre chat viendra frotter sa tête contre vous, n’oubliez pas que c’est une marque d’amour unique !",
    category: comportement,
    image: 'chat_tete.jpg',
    meta_description: 'Comprenez pourquoi votre chat vous miaule dessus et frotte sa tête contre vous'
  },
  {
    title: 'Quelle alimentation privilégier pour les chats ?',
    content: "Introduction

L'alimentation de votre chat est un facteur essentiel pour sa santé, sa longévité et son bien-être quotidien. Face à la multitude d'options disponibles en animalerie et en supermarché, il peut être difficile de s'y retrouver. Faut-il opter pour des croquettes, de la pâtée ou une alimentation maison ? Quels sont les aliments à proscrire ? Dans cet article, nous allons vous guider pour choisir la meilleure alimentation pour votre compagnon félin.

1. Les besoins nutritionnels fondamentaux du chat

Contrairement aux chiens, les chats sont des carnivores stricts. Cela signifie qu'ils ont besoin d'un apport élevé en protéines animales pour rester en bonne santé.

a) Les protéines animales : un besoin vital

Les chats ont besoin de protéines de haute qualité, issues principalement de viande, de poisson ou d’abats. La taurine, un acide aminé présent uniquement dans les produits d'origine animale, est indispensable à leur bonne santé. Une carence en taurine peut entraîner des troubles cardiaques et une dégénérescence de la rétine.

b) Les lipides : une source d'énergie essentielle

Les graisses fournissent de l'énergie et participent à la santé de la peau et du pelage. Il est préférable que les lipides proviennent de sources animales (saumon, volaille) plutôt que de végétaux.

c) Les glucides : à limiter

Contrairement aux humains, les chats n'ont pas un besoin physiologique de glucides. Une alimentation trop riche en glucides peut favoriser l'obésité et le diabète.

d) L'hydratation : un élément crucial

Les chats ont une tendance naturelle à boire peu. C’est pourquoi une alimentation humide (pâtée, rations ménagères) est souvent préférable aux croquettes seules.

2. Croquettes ou alimentation humide : que choisir ?

Il existe deux grands types d'alimentation industrielle : les croquettes et la nourriture humide.

a) Les croquettes : pratiques mais à surveiller

Faciles à stocker et à distribuer.

Peuvent contenir trop de glucides et des additifs.

Doivent être de haute qualité, riches en protéines animales.

b) La nourriture humide (pâtée, mousses)

Contient plus d’eau, ce qui aide à prévenir les problèmes urinaires.

Riche en protéines, souvent plus proche du régime naturel du chat.

Plus chère et doit être consommée rapidement après ouverture.

c) Le mix-feeding : le compromis idéal

Alterner croquettes et nourriture humide permet de bénéficier des avantages des deux régimes. Cela favorise une meilleure hydratation et un apport nutritionnel équilibré.

3. L'alimentation maison et le régime BARF : une option saine ?

Certains propriétaires choisissent de préparer eux-mêmes les repas de leur chat pour mieux contrôler la qualité des ingrédients.

a) La ration ménagère

Composée de viande cuite, de compléments (huiles, vitamines) et parfois de légumes.

Doit être formulée avec un vétérinaire pour éviter les carences.

b) Le régime BARF (viande crue)

Se rapproche du régime naturel du chat.

Doit être parfaitement équilibré pour éviter les déséquilibres nutritionnels.

Risque bactérien si la viande n’est pas bien conservée.

4. Les aliments toxiques pour les chats

Certains aliments sont dangereux, voire mortels, pour les chats. Parmi eux :

Le chocolat : contient de la théobromine, toxique pour leur système nerveux.

L'oignon et l'ail : peuvent provoquer une anémie.

Les produits laitiers : la plupart des chats sont intolérants au lactose.

Les raisins et raisins secs : peuvent causer une insuffisance rénale.

Conclusion

Choisir la bonne alimentation pour votre chat est un engagement pour sa santé et son bien-être. Optez pour une nourriture riche en protéines animales, pauvre en glucides et veillez à son hydratation. En combinant nourriture humide et croquettes de qualité, ou en préparant vous-même ses repas avec l'aide d'un vétérinaire, vous lui garantissez une vie longue et en pleine forme !",
    category: nutrition,
    image: 'nutrition_chat.jpg',
    meta_description: 'Guide complet pour choisir la meilleure alimentation pour votre chat'
  },
  {
    title: 'Pourquoi une fontaine à eau est essentielle pour votre chat',
    content: "Introduction

L'hydratation est un facteur clé de la santé de votre chat, mais saviez-vous que la plupart des chats ne boivent pas assez d'eau ? En tant que propriétaire attentif, vous avez peut-être déjà remarqué que votre compagnon félin préfère boire au robinet plutôt que dans son bol. Ce comportement n'est pas anodin : il révèle un besoin naturel d'eau fraîche et en mouvement. C'est là qu'intervient la fontaine à eau, une solution idéale pour encourager votre chat à s'hydrater correctement.

1. Les besoins en eau du chat

a) Pourquoi l'hydratation est cruciale

Le chat est un carnivore strict dont les ancêtres étaient habitués à obtenir l'essentiel de leur hydratation à partir de leur nourriture. Cependant, avec une alimentation majoritairement composée de croquettes, de nombreux chats domestiques souffrent d'un manque chronique d'hydratation, ce qui peut entraîner des problèmes de santé graves, notamment :

Problèmes urinaires : cystites, calculs urinaires, insuffisance rénale.

Déshydratation chronique : fatigue, digestion difficile, baisse d'énergie.

Surpoids et diabète : un manque d'eau peut influencer la régulation de la glycémie.

b) Combien d'eau un chat doit-il boire ?

Un chat a besoin d'environ 40 à 60 ml d'eau par kilo de poids corporel par jour. Si votre chat pèse 4 kg, il doit consommer en moyenne 200 ml d'eau quotidiennement. Toutefois, les chats ne ressentent pas toujours bien la soif, d'où la nécessité de leur proposer une source d'eau attractive.

2. Pourquoi une fontaine à eau est la meilleure solution

a) Une eau toujours propre et oxygénée

Contrairement à une gamelle statique où l'eau peut rapidement devenir stagnante et accumuler des impuretés, une fontaine à eau assure un renouvellement constant. L'eau en mouvement est plus attirante pour les chats et leur rappelle les sources naturelles comme les ruisseaux.

b) Une incitation à boire davantage

Les chats sont instinctivement attirés par l'eau courante, car ils associent cela à une source propre et sûre. Une fontaine stimule donc leur intérêt et les encourage à s'hydrater plus régulièrement.

c) Réduction des risques de maladies urinaires

Un chat bien hydraté est moins susceptible de souffrir d'infections urinaires ou de calculs rénaux. En effet, une consommation suffisante d'eau dilue les urines et prévient la formation de cristaux.

d) Praticité et confort pour les propriétaires

Une fontaine à eau avec filtre permet de maintenir une qualité optimale sans avoir à changer l'eau plusieurs fois par jour. Elle réduit également les éclaboussures et préserve un environnement propre autour du point d'eau de votre chat.

3. Comment choisir la meilleure fontaine à eau pour votre chat ?

a) Matériaux : plastique, céramique ou acier inoxydable ?

Plastique : léger et abordable, mais peut retenir des bactéries si non nettoyé régulièrement.

Céramique : plus hygiénique, facile à nettoyer et esthétiquement agréable.

Acier inoxydable : très résistant, antibactérien et idéal pour les chats sensibles aux allergies.

b) Capacité et niveau sonore

Si vous avez plusieurs chats, optez pour une fontaine avec une grande capacité d'eau (minimum 2 litres). Le bruit peut être un facteur de stress pour certains chats, il est donc préférable de choisir un modèle silencieux.

c) Type de filtration

Privilégiez une fontaine avec un filtre à charbon actif qui élimine les impuretés, le chlore et les mauvaises odeurs. Certains modèles offrent également une filtration supplémentaire contre les poils et les dépôts.

Conclusion

Une fontaine à eau est bien plus qu'un simple gadget : c'est un investissement pour la santé et le bien-être de votre chat. En stimulant son instinct naturel à boire de l'eau en mouvement, elle prévient de nombreuses maladies et favorise une hydratation optimale. Si vous souhaitez offrir le meilleur à votre compagnon à quatre pattes, n'attendez plus pour adopter cette solution bienfaisante !",
    category: nutrition,
    image: 'fontaine_chat.jpg',
    meta_description: 'Découvrez pourquoi une fontaine à eau est un investissement santé pour votre chat'
  },
  {
    title: 'Litière autonettoyante : un investissement intelligent',
    content: "Introduction

Qui n'a jamais redouté le moment de nettoyer la litière de son chat ? Une corvée répétitive, souvent odorante, qui peut rapidement devenir un véritable fardeau au quotidien. Heureusement, une solution innovante existe pour simplifier la vie des propriétaires de chats : la litière autonettoyante. Mais cette technologie vaut-elle vraiment l'investissement ? Dans cet article, nous allons détailler pourquoi une litière autonettoyante est bien plus qu'un simple gadget et comment elle peut transformer votre quotidien tout en améliorant le bien-être de votre compagnon à quatre pattes.

1. Qu'est-ce qu'une litière autonettoyante ?

Une litière autonettoyante est une litière équipée d'un système mécanique ou électronique permettant d'éliminer automatiquement les déchets solides et liquides. Contrairement à une litière classique qui nécessite un nettoyage manuel quotidien, ces modèles filtrent et retiennent les déchets dans un compartiment séparé, réduisant ainsi les mauvaises odeurs et limitant l'exposition aux bactéries.

a) Les différents types de litières autonettoyantes

Litières manuelles : Elles possèdent un système de tamisage qui permet de séparer les déchets agglomérés des granulés propres en activant un mécanisme simple.

Litières électriques : Fonctionnant souvent avec des capteurs, elles activent un râteau ou un tambour rotatif qui retire automatiquement les déchets peu après le passage du chat.

Litières avec système de vidange : Certains modèles avancés sont connectés à une évacuation d'eau, permettant une hygiène quasi parfaite en lavant et séchant les granulés après chaque usage.

2. Pourquoi investir dans une litière autonettoyante ?

a) Un gain de temps considérable

Avec une litière traditionnelle, il est nécessaire de retirer quotidiennement les déchets et de changer régulièrement la litière pour éviter les mauvaises odeurs. Une litière autonettoyante réduit cette fréquence et permet souvent un entretien rapide, en vidant simplement le bac de collecte une fois par semaine.

b) Une réduction des mauvaises odeurs

Les déchets sont retirés immédiatement après utilisation, limitant ainsi la fermentation des urines et la propagation des odeurs. Certains modèles sont équipés de filtres à charbon actif ou de systèmes de ventilation pour une neutralisation encore plus efficace des odeurs.

c) Une meilleure hygiène pour vous et votre chat

Une litière sale est un nid à bactéries pouvant être nocif pour la santé de votre chat et la vôtre. En assurant un nettoyage régulier et automatique, ces litières réduisent le risque de propagation de germes dans votre maison.

d) Une solution idéale pour les foyers avec plusieurs chats

Si vous avez plusieurs chats, l'entretien d'une litière classique peut devenir très contraignant. Une litière autonettoyante s'adapte parfaitement à ces situations en assurant un nettoyage constant, garantissant ainsi un espace propre pour chaque animal.

3. Points à considérer avant l'achat

a) Le coût initial et l'entretien

Le principal frein à l'achat d'une litière autonettoyante est son prix, qui varie entre 100 et 500 euros selon les modèles. Toutefois, cet investissement est amorti par la réduction de la consommation de litière et du temps gagné. Certains modèles nécessitent également l'achat de consommables (sacs de collecte, filtres, granulés spécifiques).

b) L'adaptation de votre chat

Tous les chats ne s'habituent pas immédiatement à une litière autonettoyante, surtout si elle est équipée d'un mécanisme bruyant. Il est conseillé d'effectuer une transition progressive en plaçant la nouvelle litière à côté de l'ancienne et en encourageant votre chat à l'utiliser en y ajoutant un peu de sa litière habituelle.

Conclusion

Investir dans une litière autonettoyante peut être un changement radical pour les propriétaires de chats, transformant une corvée quotidienne en une tâche simplifiée et occasionnelle. En offrant une hygiène optimale, une réduction des odeurs et un confort accru pour votre compagnon félin, cet équipement se révèle être un investissement intelligent et durable. Si vous recherchez un moyen efficace d'améliorer votre quotidien tout en garantissant le bien-être de votre chat, la litière autonettoyante est sans aucun doute une option à considérer.",
    category: comportement,
    image: 'litiere_chat.jpg',
    meta_description: 'Pourquoi une litière autonettoyante est un investissement gagnant'
  }
]

puts "Création des articles..."
articles_data.each do |article_info|
  article = Article.create!(
    title: article_info[:title],
    content: article_info[:content],
    category: article_info[:category],
    published: true,
    published_at: Time.current,
    meta_description: article_info[:meta_description]
  )

  attach_image(article, article_info[:image])
  puts "Article créé : #{article.title}"
end

puts "Création des articles terminée !"
