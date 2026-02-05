# 🚀 Guía de Inicio Rápido

Despliega tu blog de Ciencia de Datos en menos de 5 minutos.

## Método 1: Script Automático (Recomendado) ⚡

```bash
# 1. Descarga el proyecto
git clone https://github.com/TU-USUARIO/pydata-mastery-blog.git
cd pydata-mastery-blog

# 2. Ejecuta el script de setup
chmod +x setup.sh
./setup.sh

# 3. Sigue las instrucciones en pantalla
```

El script te guiará paso a paso y configurará todo automáticamente.

## Método 2: Manual 🛠️

### Paso 1: Sube a GitHub

```bash
# Clona o crea tu repositorio
git init
git add .
git commit -m "Initial commit: PyData Mastery Blog"

# Conecta con GitHub (reemplaza TU-USUARIO y NOMBRE-REPO)
git branch -M main
git remote add origin https://github.com/TU-USUARIO/NOMBRE-REPO.git
git push -u origin main
```

### Paso 2: Habilita GitHub Pages

1. Ve a tu repositorio en GitHub
2. Click en **Settings** (⚙️)
3. En el menú lateral, click en **Pages**
4. En **Source**:
   - Branch: `main`
   - Folder: `/ (root)`
5. Click en **Save**

### Paso 3: ¡Listo! 🎉

Tu blog estará disponible en:
```
https://TU-USUARIO.github.io/NOMBRE-REPO/
```

GitHub tarda 1-2 minutos en desplegar.

## Método 3: Con GitHub CLI 🖥️

```bash
# Instala GitHub CLI: https://cli.github.com/

# Crea y sube el repositorio
gh repo create pydata-mastery-blog --public --source=. --push

# Habilita GitHub Pages
gh repo edit --enable-pages --pages-branch main
```

## Previsualizar Localmente 👀

### Con Python
```bash
python -m http.server 8000
# Visita: http://localhost:8000
```

### Con Node.js
```bash
npx serve
# O instala globalmente:
npm install -g serve
serve
```

### Con PHP
```bash
php -S localhost:8000
```

### Con VS Code
Instala la extensión "Live Server" y haz click derecho → "Open with Live Server"

## Personalización Rápida ✏️

### 1. Actualiza tu información

Edita `README.md`:
```markdown
**Tu Nombre**
- GitHub: [@tu-usuario](https://github.com/tu-usuario)
- LinkedIn: [Tu Perfil](https://linkedin.com/in/tu-perfil)
```

### 2. Cambia colores

Edita `index.html`, busca `:root` y modifica:
```css
:root {
    --deep-navy: #0a1628;      /* Tu color principal */
    --accent-gold: #d4af37;    /* Tu color de acento */
}
```

### 3. Agrega tu dominio (opcional)

Si tienes un dominio personalizado:
1. Renombra `CNAME.example` a `CNAME`
2. Agrega tu dominio: `www.tu-dominio.com`
3. Configura DNS en tu proveedor de dominio

## Solución de Problemas 🔧

### El blog no se muestra después de 5 minutos

1. Verifica la pestaña **Actions** en GitHub
2. Asegúrate de que el workflow se ejecutó correctamente
3. Revisa **Settings → Pages** que la fuente sea correcta

### Error 404

- Verifica que `index.html` esté en la raíz del repositorio
- El repositorio debe ser público
- La rama debe ser `main` o `master`

### Los estilos no se cargan

- Abre la consola del navegador (F12)
- Verifica que no haya errores de carga
- Espera unos minutos y recarga con Ctrl+Shift+R

## Próximos Pasos 📚

1. Lee la [Guía de Contribución](CONTRIBUTING.md)
2. Revisa [Cómo Agregar Contenido](docs/ADDING-CONTENT.md)
3. Personaliza el diseño a tu gusto
4. Comparte tu blog en redes sociales

## Recursos Útiles 🔗

- [Documentación de GitHub Pages](https://pages.github.com/)
- [Guía de Markdown](https://www.markdownguide.org/)
- [GitHub Actions](https://docs.github.com/en/actions)

---

¿Problemas? Abre un [issue](https://github.com/TU-USUARIO/pydata-mastery-blog/issues) y te ayudaremos.
