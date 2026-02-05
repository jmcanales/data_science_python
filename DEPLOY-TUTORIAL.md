# 🚀 Tutorial Completo: Deploy en GitHub Pages

## 📋 Tabla de Contenidos
1. [Preparación](#preparación)
2. [Método Rápido con Script](#método-1-script-automático-recomendado)
3. [Método Manual Paso a Paso](#método-2-manual-paso-a-paso)
4. [Configuración de GitHub Pages](#configurar-github-pages)
5. [Verificación](#verificación)
6. [Personalización](#personalización-post-deploy)
7. [Solución de Problemas](#solución-de-problemas)

---

## Preparación

### Requisitos Previos
- ✅ Cuenta de GitHub ([crear una aquí](https://github.com/signup))
- ✅ Git instalado ([descargar aquí](https://git-scm.com/downloads))
- ✅ Editor de código (VS Code, Sublime, etc.)

### Verificar que Git está instalado
Abre tu terminal y ejecuta:
```bash
git --version
```
Deberías ver algo como: `git version 2.x.x`

---

## Método 1: Script Automático (Recomendado) ⚡

El script `setup.sh` automatiza todo el proceso.

### En Mac/Linux:

```bash
# 1. Navega a la carpeta del proyecto
cd pydata-mastery-blog

# 2. Dale permisos de ejecución al script
chmod +x setup.sh

# 3. Ejecuta el script
./setup.sh
```

### En Windows:

Usa Git Bash (instalado con Git) y sigue los mismos pasos de arriba.

### ¿Qué hace el script?

1. Verifica que Git esté instalado
2. Te pide tu información de GitHub
3. Actualiza automáticamente:
   - README.md con tu usuario
   - LICENSE con tu nombre
   - URLs con tu repositorio
4. Inicializa Git
5. Te guía para crear el repositorio

**Sigue las instrucciones en pantalla** y el script hará el resto.

---

## Método 2: Manual Paso a Paso 🛠️

### Paso 1: Crear Repositorio en GitHub

1. Ve a [github.com/new](https://github.com/new)
2. Llena el formulario:
   - **Repository name**: `pydata-mastery-blog`
   - **Description**: "Blog profesional de Ciencia de Datos en Python"
   - **Public** ✓ (necesario para GitHub Pages gratis)
   - **NO** marques "Initialize with README"
3. Click en **Create repository**

### Paso 2: Configurar Git Local

Abre tu terminal en la carpeta del proyecto:

```bash
# Inicializar repositorio Git
git init

# Añadir todos los archivos
git add .

# Hacer el primer commit
git commit -m "Initial commit: PyData Mastery Blog"

# Renombrar rama a main
git branch -M main
```

### Paso 3: Conectar con GitHub

```bash
# Conectar tu repo local con GitHub
# Reemplaza TU-USUARIO con tu nombre de usuario
git remote add origin https://github.com/TU-USUARIO/pydata-mastery-blog.git

# Verificar que se conectó correctamente
git remote -v
```

Deberías ver:
```
origin  https://github.com/TU-USUARIO/pydata-mastery-blog.git (fetch)
origin  https://github.com/TU-USUARIO/pydata-mastery-blog.git (push)
```

### Paso 4: Subir el Código

```bash
# Hacer push al repositorio
git push -u origin main
```

Si te pide credenciales:
- **Username**: Tu usuario de GitHub
- **Password**: Un Personal Access Token (no tu contraseña)

#### Crear Personal Access Token:
1. Ve a [github.com/settings/tokens](https://github.com/settings/tokens)
2. Click en "Generate new token" → "Classic"
3. Dale un nombre: "PyData Blog"
4. Marca el checkbox: `repo` (Full control of private repositories)
5. Click en "Generate token"
6. **Copia el token** (no lo perderás, se muestra solo una vez)
7. Úsalo como contraseña cuando Git te lo pida

---

## Configurar GitHub Pages

### Opción A: Desde la Web (Más Fácil)

1. Ve a tu repositorio en GitHub
2. Click en **Settings** (⚙️ arriba a la derecha)
3. En el menú lateral izquierdo, busca **Pages**
4. En la sección **Build and deployment**:
   - **Source**: Deploy from a branch
   - **Branch**: `main`
   - **Folder**: `/ (root)`
5. Click en **Save**

Verás un mensaje:
> "Your site is live at https://TU-USUARIO.github.io/pydata-mastery-blog/"

### Opción B: Con GitHub CLI

Si tienes [GitHub CLI](https://cli.github.com/) instalado:

```bash
# Autenticarte
gh auth login

# Crear y subir el repo
gh repo create pydata-mastery-blog --public --source=. --push

# Configurar GitHub Pages
gh repo edit --enable-pages --pages-branch main
```

---

## Verificación

### 1. Verificar que el Código Está en GitHub

Ve a: `https://github.com/TU-USUARIO/pydata-mastery-blog`

Deberías ver todos tus archivos.

### 2. Verificar GitHub Actions

1. En tu repositorio, click en la pestaña **Actions**
2. Deberías ver un workflow llamado "Deploy to GitHub Pages"
3. Debe tener una marca verde ✓ (significa que se ejecutó correctamente)

Si tiene una X roja:
- Click en el workflow
- Lee el error
- Busca en la sección "Solución de Problemas" más abajo

### 3. Verificar el Sitio

Espera 2-3 minutos después del deploy, luego:

1. Ve a: `https://TU-USUARIO.github.io/pydata-mastery-blog/`
2. El blog debería cargar completamente
3. Verifica:
   - ✅ Los estilos se aplican
   - ✅ Las animaciones funcionan
   - ✅ La navegación funciona
   - ✅ No hay errores en la consola (F12)

### 4. Probar en Móvil

- Abre el sitio en tu teléfono
- Verifica que sea responsive
- La navegación debería funcionar bien

---

## Personalización Post-Deploy

### 1. Actualizar tu Información

Edita estos archivos:

**README.md:**
```markdown
**Tu Nombre Real**
- GitHub: [@tu-usuario](https://github.com/tu-usuario)
- LinkedIn: [Tu Perfil](https://linkedin.com/in/tu-perfil)
```

**index.html** (en el footer):
```html
<p>PyData Mastery — Por Tu Nombre</p>
```

**LICENSE:**
```
Copyright (c) 2025 Tu Nombre Real
```

### 2. Actualizar URLs

**robots.txt:**
```
Sitemap: https://TU-USUARIO.github.io/pydata-mastery-blog/sitemap.xml
```

**README.md:**
Busca y reemplaza todas las ocurrencias de `TU-USUARIO` con tu usuario real.

### 3. Subir los Cambios

```bash
git add .
git commit -m "Personalizar información del blog"
git push
```

Espera 1-2 minutos y los cambios estarán en vivo.

---

## Solución de Problemas

### ❌ Error: "fatal: not a git repository"

**Problema:** No estás en la carpeta correcta o no has inicializado Git.

**Solución:**
```bash
cd pydata-mastery-blog
git init
```

### ❌ Error: "Permission denied (publickey)"

**Problema:** No tienes acceso SSH configurado.

**Solución:** Usa HTTPS en su lugar:
```bash
git remote set-url origin https://github.com/TU-USUARIO/pydata-mastery-blog.git
```

### ❌ Error 404 al visitar el sitio

**Problema:** GitHub Pages no está habilitado o mal configurado.

**Solución:**
1. Ve a Settings → Pages
2. Verifica que **Source** sea `main` y `/ (root)`
3. Guarda y espera 5 minutos
4. Recarga la página con Ctrl+Shift+R

### ❌ El sitio carga pero sin estilos

**Problema:** El CSS no se está aplicando.

**Solución:**
1. Abre la consola del navegador (F12)
2. Busca errores rojos
3. Haz un hard refresh: Ctrl+Shift+R (Windows) o Cmd+Shift+R (Mac)
4. Verifica que `index.html` tenga el CSS embebido

### ❌ GitHub Actions falla

**Problema:** El workflow de deploy tiene errores.

**Solución:**
1. Ve a Actions → Click en el workflow que falló
2. Lee el error específico
3. Común: Permisos. Ve a Settings → Actions → General
4. En "Workflow permissions", selecciona "Read and write permissions"
5. Re-ejecuta el workflow

### ❌ Cambios no se reflejan en el sitio

**Problema:** Caché del navegador o deploy pendiente.

**Solución:**
1. Verifica que hiciste `git push`
2. Ve a Actions y espera que el workflow termine
3. Haz hard refresh: Ctrl+Shift+R
4. Prueba en modo incógnito
5. Espera 5 minutos y vuelve a intentar

---

## Comandos Git Útiles

### Ver estado de cambios
```bash
git status
```

### Ver historial de commits
```bash
git log --oneline
```

### Deshacer cambios no guardados
```bash
git checkout -- archivo.html
```

### Ver diferencias antes de commit
```bash
git diff
```

### Actualizar desde GitHub
```bash
git pull origin main
```

---

## Próximos Pasos 🎯

Una vez que tu blog está en línea:

1. **Agregar más contenido**
   - Lee [docs/ADDING-CONTENT.md](ADDING-CONTENT.md)
   - Agrega artículos sobre Scikit-learn, Plotly, etc.

2. **Mejorar SEO**
   - Configura Google Search Console
   - Agrega sitemap.xml
   - Optimiza meta descriptions

3. **Analytics**
   - Agrega Google Analytics
   - O prueba Plausible (más privado)

4. **Dominio personalizado** (opcional)
   - Compra un dominio en Namecheap, GoDaddy, etc.
   - Configura CNAME
   - Actualiza DNS

5. **Compartir**
   - Publica en LinkedIn
   - Comparte en Twitter con #Python #DataScience
   - Agrégalo a tu portfolio

---

## Recursos Adicionales 📚

- [Documentación oficial de GitHub Pages](https://docs.github.com/pages)
- [Tutorial de Git en español](https://git-scm.com/book/es/v2)
- [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)
- [GitHub Actions Documentation](https://docs.github.com/actions)

---

## ¿Necesitas Ayuda? 💬

- Abre un [Issue](https://github.com/TU-USUARIO/pydata-mastery-blog/issues)
- Pregunta en [GitHub Discussions](https://github.com/TU-USUARIO/pydata-mastery-blog/discussions)
- Busca en [Stack Overflow](https://stackoverflow.com/questions/tagged/github-pages)

---

**¡Felicitaciones! 🎉 Tu blog de Data Science está en línea.**

URL: https://TU-USUARIO.github.io/pydata-mastery-blog/
