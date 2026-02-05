#!/bin/bash

# Script de Setup Rápido para PyData Mastery Blog
# Este script te ayuda a configurar y desplegar tu blog en GitHub Pages

echo "🐍 PyData Mastery Blog - Setup Script"
echo "======================================"
echo ""

# Verificar si git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado. Por favor instálalo primero."
    exit 1
fi

# Solicitar información del usuario
read -p "📝 Ingresa tu nombre de usuario de GitHub: " GITHUB_USER
read -p "📝 Ingresa el nombre del repositorio (default: pydata-mastery-blog): " REPO_NAME
REPO_NAME=${REPO_NAME:-pydata-mastery-blog}

# Solicitar información personal
read -p "📝 Ingresa tu nombre completo: " FULL_NAME
read -p "📝 Ingresa tu perfil de LinkedIn (opcional): " LINKEDIN_URL
read -p "📝 Ingresa tu Twitter (opcional): " TWITTER_HANDLE

echo ""
echo "📦 Configurando repositorio..."

# Inicializar git si no está inicializado
if [ ! -d .git ]; then
    git init
    echo "✅ Repositorio git inicializado"
fi

# Actualizar README con información del usuario
sed -i.bak "s/TU-USUARIO/$GITHUB_USER/g" README.md
sed -i.bak "s/Tu Nombre/$FULL_NAME/g" README.md
sed -i.bak "s/Tu Perfil/$LINKEDIN_URL/g" README.md
sed -i.bak "s/@tu_handle/@$TWITTER_HANDLE/g" README.md
rm README.md.bak 2>/dev/null

# Actualizar LICENSE con el nombre
sed -i.bak "s/\[Tu Nombre\]/$FULL_NAME/g" LICENSE
rm LICENSE.bak 2>/dev/null

# Actualizar URL del demo en README
DEMO_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}/"
sed -i.bak "s|Ver Demo en Vivo](#)|Ver Demo en Vivo]($DEMO_URL)|g" README.md
rm README.md.bak 2>/dev/null

echo "✅ Archivos actualizados con tu información"
echo ""

# Configurar git
git add .
git commit -m "Initial commit: PyData Mastery Blog"

# Preguntar si quiere crear el repositorio remoto
echo "🚀 Opciones de Deploy:"
echo "1) Ya tengo un repositorio creado en GitHub"
echo "2) Necesito crear el repositorio primero"
read -p "Selecciona una opción (1 o 2): " OPTION

if [ "$OPTION" = "1" ]; then
    git branch -M main
    git remote add origin "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
    
    read -p "¿Deseas hacer push ahora? (y/n): " PUSH_NOW
    if [ "$PUSH_NOW" = "y" ]; then
        git push -u origin main
        echo ""
        echo "✅ ¡Código subido exitosamente!"
        echo ""
        echo "📌 Próximos pasos:"
        echo "1. Ve a https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
        echo "2. En 'Source', selecciona la rama 'main' y carpeta '/ (root)'"
        echo "3. Haz clic en 'Save'"
        echo "4. Tu blog estará disponible en: ${DEMO_URL}"
    fi
elif [ "$OPTION" = "2" ]; then
    echo ""
    echo "📋 Instrucciones para crear el repositorio:"
    echo "1. Ve a https://github.com/new"
    echo "2. Nombre del repositorio: ${REPO_NAME}"
    echo "3. Selecciona 'Public'"
    echo "4. NO inicialices con README, .gitignore o licencia"
    echo "5. Crea el repositorio"
    echo ""
    echo "Después ejecuta estos comandos:"
    echo "git branch -M main"
    echo "git remote add origin https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
    echo "git push -u origin main"
fi

echo ""
echo "🎉 ¡Setup completado!"
echo ""
echo "📚 Para previsualizar localmente:"
echo "   python -m http.server 8000"
echo "   Luego visita: http://localhost:8000"
echo ""
echo "💡 Consulta el README.md para más información"
