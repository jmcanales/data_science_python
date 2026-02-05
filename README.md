# 🐍 PyData Mastery Blog

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557c?style=for-the-badge)
![Seaborn](https://img.shields.io/badge/Seaborn-444876?style=for-the-badge)

**Blog profesional de Ciencia de Datos en Python** con contenido curado de las documentaciones oficiales de Pandas, NumPy, Matplotlib y Seaborn.

🌐 **[Ver Demo en Vivo](#)** ← *Agrega tu URL de GitHub Pages aquí*

---

## ✨ Características

- 📚 **Contenido de Calidad**: Basado directamente en documentaciones oficiales
- 🎨 **Diseño Único**: Estética editorial sofisticada con animaciones suaves
- 💻 **Código Interactivo**: Ejemplos prácticos con syntax highlighting
- 📱 **Responsive**: Optimizado para todos los dispositivos
- ⚡ **Rendimiento**: HTML puro, sin dependencias externas
- 🎯 **SEO Optimizado**: Meta tags y estructura semántica

---

## 🚀 Deploy Rápido en GitHub Pages

### Opción 1: Deploy Automático (Recomendado)

1. **Fork o clona este repositorio**
```bash
git clone https://github.com/TU-USUARIO/pydata-mastery-blog.git
cd pydata-mastery-blog
```

2. **Sube a tu GitHub**
```bash
git add .
git commit -m "Initial commit: PyData Mastery Blog"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/pydata-mastery-blog.git
git push -u origin main
```

3. **Habilita GitHub Pages**
   - Ve a tu repositorio en GitHub
   - Click en **Settings** → **Pages**
   - En **Source**, selecciona `main` branch y carpeta `/ (root)`
   - Click en **Save**
   - ¡Tu blog estará disponible en `https://TU-USUARIO.github.io/pydata-mastery-blog/`!

### Opción 2: Deploy con GitHub Actions

El repositorio incluye un workflow de GitHub Actions que despliega automáticamente en cada push.

1. **Habilita GitHub Pages** (igual que arriba)
2. **El workflow se ejecutará automáticamente** al hacer push
3. Verifica el deploy en la pestaña **Actions**

---

## 🛠️ Personalización

### Modificar Colores

Edita las variables CSS en `index.html`:

```css
:root {
    --deep-navy: #0a1628;      /* Color principal */
    --rich-teal: #1a4d5e;      /* Color secundario */
    --accent-gold: #d4af37;    /* Acento dorado */
    --accent-coral: #ff6b6b;   /* Acento coral */
    --soft-cream: #faf8f3;     /* Fondo claro */
}
```

### Agregar Nuevos Artículos

Copia y modifica un bloque de artículo existente:

```html
<article class="article-card" id="tu-tema">
    <div class="article-header">
        <span class="article-tag">Tu Biblioteca</span>
        <h3>Título del Artículo</h3>
    </div>
    <div class="article-content">
        <!-- Tu contenido aquí -->
    </div>
</article>
```

### Cambiar Tipografía

Modifica el `<link>` de Google Fonts y las variables `font-family`:

```html
<link href="https://fonts.googleapis.com/css2?family=TU-FUENTE&display=swap" rel="stylesheet">
```

---

## 📁 Estructura del Proyecto

```
pydata-mastery-blog/
├── index.html              # Blog principal
├── README.md              # Este archivo
├── LICENSE                # Licencia MIT
├── .gitignore            # Archivos ignorados
└── .github/
    └── workflows/
        └── deploy.yml     # GitHub Actions workflow
```

---

## 🎓 Contenido del Blog

### 🐼 Pandas
- Indexación eficiente (`.loc`, `.iloc`, `.at`, `.iat`)
- GroupBy y agregaciones avanzadas
- Técnicas de transformación de datos

### 🔢 NumPy
- Broadcasting y operaciones vectorizadas
- Indexación avanzada y fancy indexing
- Álgebra lineal y operaciones matriciales

### 📊 Matplotlib
- API orientada a objetos vs pyplot
- Personalización avanzada con rcParams
- Subplots y composiciones complejas

### 🎨 Seaborn
- FacetGrid y visualizaciones múltiples
- Paletas de colores profesionales
- Heatmaps y matrices de correlación

---

## 🔧 Desarrollo Local

Para previsualizar localmente:

### Con Python
```bash
python -m http.server 8000
# Visita http://localhost:8000
```

### Con Node.js
```bash
npx serve
```

### Con Live Server (VS Code)
Instala la extensión "Live Server" y haz clic derecho → "Open with Live Server"

---

## 📈 Próximas Mejoras

- [ ] Agregar artículos sobre Scikit-learn
- [ ] Sección de notebooks interactivos
- [ ] Sistema de búsqueda
- [ ] Modo oscuro/claro toggle
- [ ] Comentarios con GitHub Discussions
- [ ] RSS Feed
- [ ] Analytics con Google Analytics o Plausible

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Si quieres agregar contenido:

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/nuevo-articulo`)
3. Commit tus cambios (`git commit -m 'Agregar artículo sobre X'`)
4. Push a la rama (`git push origin feature/nuevo-articulo`)
5. Abre un Pull Request

---

## 📝 Recursos Oficiales

Todo el contenido está basado en las documentaciones oficiales:

- 📚 [Pandas Documentation](https://pandas.pydata.org/docs/)
- 🔢 [NumPy Documentation](https://numpy.org/doc/)
- 📈 [Matplotlib Documentation](https://matplotlib.org/stable/contents.html)
- 🎨 [Seaborn Documentation](https://seaborn.pydata.org/)

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

---

## 👤 Autor

**Tu Nombre**
- GitHub: [@tu-usuario](https://github.com/tu-usuario)
- LinkedIn: [Tu Perfil](https://linkedin.com/in/tu-perfil)
- Twitter: [@tu_handle](https://twitter.com/tu_handle)

---

## ⭐ Apoya el Proyecto

Si este blog te resulta útil:
- Dale una ⭐ al repositorio
- Comparte con otros data scientists
- Contribuye con nuevos artículos

---

<div align="center">

**[⬆ Volver arriba](#-pydata-mastery-blog)**

Hecho con ❤️ y Python

</div>
