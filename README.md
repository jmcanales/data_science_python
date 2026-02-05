# 📚 Documentación de Ciencia de Datos en Python

Una guía completa y práctica de las bibliotecas fundamentales para Data Science en Python, con un diseño limpio tipo documentación técnica.

## 🎯 Características

- ✅ **Diseño profesional estilo Read the Docs** - Sin apariencia de IA
- ✅ **Contenido humanizado** - Explicaciones claras como si te las contara un colega
- ✅ **Ejemplos del mundo real** - Casos de uso prácticos y aplicables
- ✅ **Navegación intuitiva** - Sidebar con todas las secciones
- ✅ **Responsive** - Funciona en todos los dispositivos
- ✅ **100% estático** - HTML puro, sin dependencias

## 📖 Contenido Incluido

### Pandas
- Estructuras de datos (Series y DataFrame)
- Indexación avanzada (.loc, .iloc, .at, .iat)
- GroupBy y agregaciones
- Ejemplos prácticos de análisis de ventas

### NumPy  
- Arrays y operaciones matriciales
- Broadcasting explicado con ejemplos reales
- Indexación booleana y fancy indexing
- Normalización y transformación de datos

### Matplotlib
- API orientada a objetos (la forma profesional)
- Subplots y layouts complejos
- Personalización con rcParams
- Ejemplos completos de visualizaciones

### Seaborn
- Gráficos de distribución
- Análisis de correlaciones con heatmaps
- FacetGrid para visualizaciones múltiples
- Ejemplo completo de EDA (Exploratory Data Analysis)

## 🚀 Deploy en GitHub Pages

### Opción 1: Rápido

```bash
cd documentation-site
git init
git add .
git commit -m "Initial commit: Data Science Docs"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/python-data-science-docs.git
git push -u origin main
```

Luego ve a Settings → Pages → Branch: main → Save

### Opción 2: Con GitHub CLI

```bash
gh repo create python-data-science-docs --public --source=. --push
gh repo edit --enable-pages --pages-branch main
```

Tu sitio estará en: `https://TU-USUARIO.github.io/python-data-science-docs/`

## 🎨 Características del Diseño

- **Paleta profesional**: Azules y grises tipo documentación técnica
- **Tipografía**: IBM Plex Sans para texto, IBM Plex Mono para código
- **Layout**: Sidebar fija + contenido scrollable
- **Código**: Syntax highlighting personalizado
- **Callouts**: Notas, tips y warnings para resaltar información

## 🔒 Sobre Seguridad

**Tranquilo, nadie puede hackear o robar tus datos** porque GitHub Pages solo sirve archivos estáticos. No hay:
- Base de datos
- Backend
- Contraseñas
- Información personal

Es como tener un libro publicado - cualquiera puede leerlo, pero nadie puede modificarlo o acceder a tu cuenta de GitHub a través de él.

Para proteger tu cuenta de GitHub:
- Usa contraseña fuerte
- Activa 2FA (Two-Factor Authentication)
- No compartas tu Personal Access Token

## 📝 Personalización

### Cambiar colores

Edita las variables CSS al inicio de `index.html`:

```css
:root {
    --primary: #2c5aa0;
    --accent: #0ea5e9;
    /* etc... */
}
```

### Agregar secciones

1. Agrega el enlace en el sidebar
2. Crea una nueva `<section id="tu-seccion">`
3. Sigue la estructura existente

### Modificar contenido

Todo el contenido está en HTML semántico, fácil de editar. Los bloques de código usan:

```html
<div class="code-toolbar">
    <span class="code-lang">python</span>
</div>
<pre><code>
<!-- Tu código aquí -->
</code></pre>
```

## 📁 Estructura

```
documentation-site/
├── index.html          # Todo el sitio (HTML + CSS + JS)
└── README.md          # Esta documentación
```

Sí, es un solo archivo. Esto hace que sea:
- ✅ Fácil de desplegar
- ✅ Súper rápido de cargar
- ✅ No requiere build process
- ✅ Funciona offline

## 🎓 Filosofía del Contenido

Esta documentación NO es una copia de la documentación oficial. Es:

1. **Práctica primero**: Ejemplos reales antes que teoría
2. **Humanizada**: Escrita como si te lo explicara un colega
3. **Errores comunes**: Te advierte de los errores que todos cometemos
4. **Por qué, no solo cómo**: Explica el razonamiento detrás de las decisiones

## 🔄 Actualizar

Cuando hagas cambios:

```bash
git add .
git commit -m "Actualizar contenido de Pandas"
git push
```

Los cambios se reflejan automáticamente en 1-2 minutos.

## 🤝 Contribuir

¿Encontraste un error? ¿Tienes una mejor explicación? 

1. Fork el repo
2. Haz tus cambios
3. Abre un Pull Request

## 📚 Recursos Citados

Todo el contenido técnico está basado en:
- [Pandas Official Docs](https://pandas.pydata.org/docs/)
- [NumPy Reference](https://numpy.org/doc/stable/)
- [Matplotlib Gallery](https://matplotlib.org/stable/gallery/index.html)
- [Seaborn Tutorial](https://seaborn.pydata.org/tutorial.html)

## 📄 Licencia

MIT License - Usa, modifica y comparte libremente.

---

**Hecho con ❤️ para la comunidad de Data Science**

Si te resulta útil, dale una ⭐ al repositorio.
