# 📊 GUÍA COMPLEMENTARIA: MATPLOTLIB Y SEABORN AVANZADO

## Esta guía contiene contenido adicional y ejemplos prácticos profundos
## que puedes agregar a tu sitio web o usar como referencia

================================================================
SECCIÓN 1: MATPLOTLIB - TÉCNICAS AVANZADAS
================================================================

### 1.1 PERSONALIZACIÓN DE EJES

```python
import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots(figsize=(12, 7))

# Datos
x = np.linspace(0, 10, 100)
y1 = np.sin(x)
y2 = np.cos(x)

# Plot principal
ax.plot(x, y1, label='sin(x)', linewidth=2.5, color='#2E86AB')
ax.plot(x, y2, label='cos(x)', linewidth=2.5, color='#A23B72')

# PERSONALIZACIÓN AVANZADA DE EJES
# Limitar ejes
ax.set_xlim(0, 10)
ax.set_ylim(-1.5, 1.5)

# Etiquetas cada π
ax.set_xticks([0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi, 5*np.pi/2, 3*np.pi])
ax.set_xticklabels(['0', 'π/2', 'π', '3π/2', '2π', '5π/2', '3π'])

# Mover spines (bordes)
ax.spines['left'].set_position('zero')
ax.spines['bottom'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')

# Flechas en los ejes
ax.plot(1, 0, ">k", transform=ax.get_yaxis_transform(), clip_on=False)
ax.plot(0, 1, "^k", transform=ax.get_xaxis_transform(), clip_on=False)

ax.legend(loc='upper right', framealpha=0.9)
ax.grid(True, alpha=0.3)
plt.title('Funciones Trigonométricas', fontsize=14, fontweight='bold', pad=20)
plt.show()
```

### 1.2 ANOTACIONES Y TEXTO AVANZADO

```python
# Ejemplo: Anotar puntos importantes en un gráfico
fig, ax = plt.subplots(figsize=(12, 7))

# Datos de ventas
meses = np.arange(1, 13)
ventas = np.array([120, 135, 148, 162, 158, 172, 185, 193, 187, 201, 215, 228])

ax.plot(meses, ventas, marker='o', linewidth=2.5, markersize=8, color='#2E86AB')

# TÉCNICA 1: Anotar máximo
max_idx = np.argmax(ventas)
ax.annotate('Pico de ventas\n$228K',
            xy=(meses[max_idx], ventas[max_idx]),
            xytext=(9, 240),
            arrowprops=dict(arrowstyle='->', lw=2, color='red'),
            fontsize=12,
            fontweight='bold',
            bbox=dict(boxstyle='round,pad=0.5', facecolor='yellow', alpha=0.7))

# TÉCNICA 2: Anotar mínimo relativo
min_local_idx = 4
ax.annotate('Baja estacional',
            xy=(meses[min_local_idx], ventas[min_local_idx]),
            xytext=(2, 150),
            arrowprops=dict(arrowstyle='->', lw=1.5, color='blue', 
                           connectionstyle='arc3,rad=0.3'),
            fontsize=11,
            bbox=dict(boxstyle='round,pad=0.4', facecolor='lightblue', alpha=0.7))

# TÉCNICA 3: Añadir banda de objetivo
objetivo = 175
ax.axhline(y=objetivo, color='green', linestyle='--', linewidth=2, alpha=0.7)
ax.text(12.2, objetivo, 'Objetivo', va='center', fontsize=10, color='green')

# TÉCNICA 4: Área sombreada
ax.fill_between(meses, ventas, objetivo, where=(ventas >= objetivo),
                alpha=0.3, color='green', label='Sobre objetivo')
ax.fill_between(meses, ventas, objetivo, where=(ventas < objetivo),
                alpha=0.3, color='red', label='Bajo objetivo')

ax.set_xlabel('Mes', fontsize=12)
ax.set_ylabel('Ventas (miles)', fontsize=12)
ax.set_title('Análisis de Ventas con Anotaciones', fontsize=14, fontweight='bold')
ax.legend(loc='upper left')
ax.grid(True, alpha=0.3)
plt.tight_layout()
plt.show()
```

### 1.3 GRÁFICOS DE CONTORNO Y SUPERFICIES 3D

```python
from mpl_toolkits.mplot3d import Axes3D

# Crear datos
x = np.linspace(-5, 5, 100)
y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(x, y)
Z = np.sin(np.sqrt(X**2 + Y**2))

# GRÁFICO DE CONTORNO
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 6))

# Contour filled
contour = ax1.contourf(X, Y, Z, levels=20, cmap='viridis')
plt.colorbar(contour, ax=ax1, label='Valor')
ax1.contour(X, Y, Z, levels=20, colors='black', linewidths=0.5, alpha=0.3)
ax1.set_title('Gráfico de Contorno', fontsize=14, fontweight='bold')
ax1.set_xlabel('X')
ax1.set_ylabel('Y')

# 3D Surface
ax2 = fig.add_subplot(122, projection='3d')
surf = ax2.plot_surface(X, Y, Z, cmap='plasma', alpha=0.8, 
                        edgecolor='none', antialiased=True)
ax2.set_title('Superficie 3D', fontsize=14, fontweight='bold')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')
ax2.set_zlabel('Z')
fig.colorbar(surf, ax=ax2, shrink=0.5, aspect=5)

plt.tight_layout()
plt.show()
```

### 1.4 ANIMACIONES (GIF)

```python
from matplotlib.animation import FuncAnimation, PillowWriter

# Crear figura
fig, ax = plt.subplots(figsize=(10, 6))
x = np.linspace(0, 2*np.pi, 100)
line, = ax.plot([], [], linewidth=2.5, color='#2E86AB')

ax.set_xlim(0, 2*np.pi)
ax.set_ylim(-1.5, 1.5)
ax.set_xlabel('x')
ax.set_ylabel('sin(x + φ)')
ax.grid(True, alpha=0.3)

# Función de inicialización
def init():
    line.set_data([], [])
    return line,

# Función de animación
def animate(frame):
    y = np.sin(x + frame/10)
    line.set_data(x, y)
    ax.set_title(f'Onda Sinusoidal (φ = {frame/10:.2f})', 
                fontsize=14, fontweight='bold')
    return line,

# Crear animación
anim = FuncAnimation(fig, animate, init_func=init, 
                    frames=100, interval=50, blit=True)

# Guardar como GIF
# anim.save('seno_animado.gif', writer=PillowWriter(fps=20))
plt.show()
```

================================================================
SECCIÓN 2: SEABORN - CASOS DE USO REALES
================================================================

### 2.1 ANÁLISIS DE A/B TESTING

```python
import seaborn as sns
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

# Simular datos de A/B test
np.random.seed(42)
n_users = 1000

ab_data = pd.DataFrame({
    'variant': np.random.choice(['A', 'B'], n_users),
    'conversion': np.random.binomial(1, 0.12, n_users),  # Tasa base 12%
    'time_on_page': np.random.gamma(2, 30, n_users),
    'clicks': np.random.poisson(3, n_users)
})

# Ajustar conversión para variante B (simular mejora)
ab_data.loc[ab_data['variant'] == 'B', 'conversion'] = \
    np.random.binomial(1, 0.15, (ab_data['variant'] == 'B').sum())

# VISUALIZACIÓN COMPLETA
fig, axes = plt.subplots(2, 2, figsize=(15, 12))

# 1. Tasa de conversión
ax1 = axes[0, 0]
conversion_rate = ab_data.groupby('variant')['conversion'].mean()
bars = ax1.bar(conversion_rate.index, conversion_rate.values, color=['#4ECDC4', '#FF6B6B'])
ax1.set_ylabel('Tasa de Conversión')
ax1.set_title('Conversión por Variante', fontsize=13, fontweight='bold')
ax1.set_ylim(0, 0.20)

# Añadir valores en las barras
for bar in bars:
    height = bar.get_height()
    ax1.text(bar.get_x() + bar.get_width()/2, height,
            f'{height:.1%}',
            ha='center', va='bottom', fontsize=12, fontweight='bold')

# Test estadístico
conv_a = ab_data[ab_data['variant'] == 'A']['conversion']
conv_b = ab_data[ab_data['variant'] == 'B']['conversion']
_, p_value = stats.ttest_ind(conv_a, conv_b)
ax1.text(0.5, 0.18, f'p-value: {p_value:.4f}', 
        transform=ax1.transAxes, fontsize=11,
        bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))

# 2. Distribución de tiempo en página
ax2 = axes[0, 1]
sns.violinplot(data=ab_data, x='variant', y='time_on_page', ax=ax2, palette='Set2')
ax2.set_title('Tiempo en Página por Variante', fontsize=13, fontweight='bold')
ax2.set_ylabel('Segundos')

# 3. Distribución de clicks
ax3 = axes[1, 0]
sns.boxplot(data=ab_data, x='variant', y='clicks', ax=ax3, palette='pastel')
sns.stripplot(data=ab_data, x='variant', y='clicks', ax=ax3, 
             color='black', alpha=0.2, size=3)
ax3.set_title('Clicks por Variante', fontsize=13, fontweight='bold')

# 4. Conversión vs tiempo en página
ax4 = axes[1, 1]
for variant in ['A', 'B']:
    data = ab_data[ab_data['variant'] == variant]
    converted = data[data['conversion'] == 1]['time_on_page']
    not_converted = data[data['conversion'] == 0]['time_on_page']
    
    ax4.hist([converted, not_converted], bins=20, alpha=0.6, 
            label=[f'{variant} - Convertido', f'{variant} - No convertido'])

ax4.set_xlabel('Tiempo en Página (segundos)')
ax4.set_ylabel('Frecuencia')
ax4.set_title('Tiempo en Página: Convertidos vs No Convertidos', 
             fontsize=13, fontweight='bold')
ax4.legend()

fig.suptitle('Dashboard de A/B Testing', fontsize=16, fontweight='bold', y=0.995)
plt.tight_layout()
plt.show()

# RESUMEN ESTADÍSTICO
print("\n=== RESULTADOS DEL A/B TEST ===")
print(f"\nVariante A:")
print(f"  Conversión: {ab_data[ab_data['variant']=='A']['conversion'].mean():.2%}")
print(f"  Tiempo promedio: {ab_data[ab_data['variant']=='A']['time_on_page'].mean():.1f}s")

print(f"\nVariante B:")
print(f"  Conversión: {ab_data[ab_data['variant']=='B']['conversion'].mean():.2%}")
print(f"  Tiempo promedio: {ab_data[ab_data['variant']=='B']['time_on_page'].mean():.1f}s")

print(f"\nSignificancia estadística: {'Sí ✓' if p_value < 0.05 else 'No ✗'} (p={p_value:.4f})")
```

### 2.2 ANÁLISIS DE COHORTES (RETENTION)

```python
# Crear datos de retención de cohortes
dates = pd.date_range('2024-01-01', periods=12, freq='W')
cohorts = pd.DataFrame({
    'cohort': np.repeat(dates, 12),
    'week': np.tile(range(12), 12),
    'users': 0
})

# Simular retención realista
for i, cohort_date in enumerate(dates):
    initial_users = np.random.randint(800, 1200)
    for week in range(12):
        # Retención decae exponencialmente
        retention = 1 * np.exp(-week * 0.15) + np.random.normal(0, 0.05)
        retention = max(0.05, min(1, retention))  # Limitar entre 5% y 100%
        users = int(initial_users * retention)
        mask = (cohorts['cohort'] == cohort_date) & (cohorts['week'] == week)
        cohorts.loc[mask, 'users'] = users

# Calcular tasas de retención
cohorts['retention_rate'] = cohorts.groupby('cohort')['users'].transform(
    lambda x: x / x.iloc[0]
)

# Crear pivot para heatmap
retention_pivot = cohorts.pivot_table(
    values='retention_rate',
    index='cohort',
    columns='week'
)

# VISUALIZACIÓN
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(16, 12))

# 1. Heatmap de retención
sns.heatmap(retention_pivot, annot=True, fmt='.1%', cmap='RdYlGn',
           vmin=0, vmax=1, ax=ax1, cbar_kws={'label': 'Tasa de Retención'})
ax1.set_title('Análisis de Retención por Cohorte', fontsize=14, fontweight='bold')
ax1.set_xlabel('Semana desde Registro')
ax1.set_ylabel('Cohorte (Fecha de Registro)')

# 2. Curvas de retención
ax2_data = cohorts[cohorts['cohort'].isin(dates[:6])]  # Primeras 6 cohortes
for cohort in dates[:6]:
    data = cohorts[cohorts['cohort'] == cohort]
    ax2.plot(data['week'], data['retention_rate'], 
            marker='o', label=cohort.strftime('%Y-%m-%d'), linewidth=2)

ax2.set_xlabel('Semana', fontsize=12)
ax2.set_ylabel('Tasa de Retención', fontsize=12)
ax2.set_title('Curvas de Retención por Cohorte', fontsize=14, fontweight='bold')
ax2.legend(title='Cohorte', bbox_to_anchor=(1.05, 1), loc='upper left')
ax2.grid(True, alpha=0.3)
ax2.set_ylim(0, 1.1)

# Añadir línea de retención objetivo
ax2.axhline(y=0.3, color='red', linestyle='--', linewidth=2, alpha=0.7, label='Objetivo (30%)')

plt.tight_layout()
plt.show()

print("\n=== INSIGHTS DE RETENCIÓN ===")
print(f"Retención promedio semana 1: {retention_pivot[0].mean():.1%}")
print(f"Retención promedio semana 4: {retention_pivot[3].mean():.1%}")
print(f"Retención promedio semana 12: {retention_pivot[11].mean():.1%}")
```

### 2.3 PAIRPLOT AVANZADO PARA EDA

```python
# Dataset más completo
from sklearn.datasets import load_wine

wine = load_wine()
wine_df = pd.DataFrame(wine.data, columns=wine.feature_names)
wine_df['target'] = wine.target
wine_df['target_name'] = wine_df['target'].map({0: 'Class_0', 1: 'Class_1', 2: 'Class_2'})

# Seleccionar variables de interés
features = ['alcohol', 'malic_acid', 'ash', 'total_phenols', 'flavanoids']
wine_subset = wine_df[features + ['target_name']]

# PAIRPLOT AVANZADO
g = sns.pairplot(wine_subset, hue='target_name', palette='Set1',
                diag_kind='kde', plot_kws={'alpha': 0.6, 's': 50},
                diag_kws={'alpha': 0.7, 'linewidth': 2},
                height=2.5, aspect=1.2)

g.fig.suptitle('Pairplot de Características del Vino', 
              fontsize=16, fontweight='bold', y=1.01)

# Personalizar
for ax in g.axes.flatten():
    ax.set_xlabel(ax.get_xlabel(), fontsize=10)
    ax.set_ylabel(ax.get_ylabel(), fontsize=10)
    ax.grid(True, alpha=0.2)

plt.show()
```

### 2.4 JOINTPLOT - ANÁLISIS BIVARIADO PROFUNDO

```python
# Cargar datos
penguins = sns.load_dataset('penguins').dropna()

# JOINTPLOT con regresión
g = sns.jointplot(data=penguins, x='flipper_length_mm', y='body_mass_g',
                 kind='reg', height=8, ratio=4,
                 marginal_kws=dict(bins=30, fill=True),
                 joint_kws=dict(scatter_kws={'alpha': 0.5, 's': 50}))

g.plot_joint(sns.kdeplot, cmap='Reds', alpha=0.5, levels=5)

# Calcular y mostrar correlación
corr = penguins['flipper_length_mm'].corr(penguins['body_mass_g'])
g.fig.suptitle(f'Relación Aleta-Masa (r = {corr:.3f})', 
              fontsize=14, fontweight='bold', y=1.01)

plt.show()

# JOINTPLOT hexbin - para muchos datos
g2 = sns.jointplot(data=penguins, x='bill_length_mm', y='bill_depth_mm',
                  kind='hex', height=8, cmap='YlOrRd',
                  marginal_kws=dict(bins=20, fill=True, color='coral'))

g2.fig.suptitle('Densidad de Dimensiones del Pico', 
               fontsize=14, fontweight='bold', y=1.01)
plt.show()
```

================================================================
SECCIÓN 3: TRUCOS Y MEJORES PRÁCTICAS
================================================================

### 3.1 CREAR PALETAS DE COLORES PERSONALIZADAS

```python
# MÉTODO 1: Colores específicos
colores_custom = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8']
sns.set_palette(sns.color_palette(colores_custom))

# MÉTODO 2: Paletas de seaborn
sns.set_palette('husl')  # Colores espaciados uniformemente
# Otras: 'Set1', 'Set2', 'Paired', 'tab10', 'pastel', 'dark', 'colorblind'

# MÉTODO 3: Paletas divergentes para datos con centro
sns.set_palette('RdBu_r', n_colors=10)  # Rojo-Azul invertido

# MÉTODO 4: Crear degradado personalizado
from matplotlib.colors import LinearSegmentedColormap
colors = ['#2E86AB', '#A23B72', '#F18F01']
n_bins = 100
cmap = LinearSegmentedColormap.from_list('custom', colors, N=n_bins)
```

### 3.2 EXPORTAR GRÁFICOS EN ALTA CALIDAD

```python
# Configuración para publicación
plt.rcParams['figure.dpi'] = 300
plt.rcParams['savefig.dpi'] = 300
plt.rcParams['savefig.bbox'] = 'tight'

fig, ax = plt.subplots(figsize=(12, 8))
# ... tu código aquí ...

# Guardar en múltiples formatos
fig.savefig('grafico.png', dpi=300, bbox_inches='tight', transparent=False)
fig.savefig('grafico.pdf', bbox_inches='tight')  # Vectorial para LaTeX
fig.savefig('grafico.svg', bbox_inches='tight')  # Vectorial para web
```

### 3.3 ESTILOS PROFESIONALES PREDEFINIDOS

```python
# ESTILO 1: Científico (papers)
import scienceplots  # pip install SciencePlots
plt.style.use(['science', 'no-latex'])

# ESTILO 2: The Economist
plt.style.use('fivethirtyeight')

# ESTILO 3: Seaborn moderno
sns.set_style('whitegrid')
sns.set_context('paper')  # Opciones: paper, notebook, talk, poster

# ESTILO 4: Dark mode
plt.style.use('dark_background')
```

### 3.4 FUNCIÓN HELPER PARA GRÁFICOS RÁPIDOS

```python
def quick_plot(data, x=None, y=None, kind='scatter', hue=None, 
               title='', figsize=(10, 6), **kwargs):
    """
    Función helper para crear gráficos rápidos con configuración profesional.
    
    Parámetros:
    -----------
    data : DataFrame
    kind : str - 'scatter', 'line', 'bar', 'hist', 'box', 'violin'
    """
    
    fig, ax = plt.subplots(figsize=figsize)
    
    plot_functions = {
        'scatter': sns.scatterplot,
        'line': sns.lineplot,
        'bar': sns.barplot,
        'hist': sns.histplot,
        'box': sns.boxplot,
        'violin': sns.violinplot
    }
    
    if kind in plot_functions:
        plot_functions[kind](data=data, x=x, y=y, hue=hue, ax=ax, **kwargs)
    
    ax.set_title(title, fontsize=14, fontweight='bold', pad=15)
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    
    return fig, ax

# Uso
# fig, ax = quick_plot(df, x='age', y='salary', kind='scatter', 
#                      hue='department', title='Salario vs Edad')
```

================================================================
RECURSOS ADICIONALES
================================================================

LIBROS RECOMENDADOS:
1. "Python Data Science Handbook" - Jake VanderPlas
2. "Storytelling with Data" - Cole Nussbaumer Knaflic
3. "Fundamentals of Data Visualization" - Claus O. Wilke

DOCUMENTACIÓN OFICIAL:
- Matplotlib: https://matplotlib.org/stable/gallery/index.html
- Seaborn: https://seaborn.pydata.org/examples/index.html

PALETAS DE COLORES:
- ColorBrewer: https://colorbrewer2.org/
- Coolors: https://coolors.co/

INSPIRACIÓN:
- r/dataisbeautiful
- Observable HQ
- The Pudding
