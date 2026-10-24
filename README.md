# Omega · Biblioteca de katas

Proyecto estático para repasar karate Shitō-ryū. Diseño en azul #1c90bb, adaptable a móvil y escritorio. HTML, CSS y JavaScript nativos; sin compilación, cuentas, claves API ni paquetes que instalar.

## Probar en local

1. Descomprime el ZIP.
2. Abre una terminal dentro de la carpeta `omega-kata`.
3. Ejecuta uno de estos comandos (necesitas Python 3):

   ```bash
   # macOS / Linux
   python3 -m http.server 8000 --bind 127.0.0.1
   # Windows
   py -m http.server 8000 --bind 127.0.0.1
   ```

4. Visita **http://localhost:8000**. Para detenerlo, pulsa Ctrl+C.

Atajos incluidos: `INICIAR.bat` en Windows y `INICIAR.command` en macOS (si hace falta, ejecuta `chmod +x INICIAR.command` antes). También sirve cualquier servidor estático, como Live Server de VS Code.

**No abras index.html con doble clic para probar YouTube**: el protocolo `file://` no aporta el origen/referente HTTP que requiere el reproductor. La web detecta esta situación y muestra instrucciones.

## ¿Hacen falta los vídeos en local?

No. Los enlaces `youtu.be` contienen los identificadores necesarios para el reproductor oficial de YouTube. Los parámetros de compartir `?is=...` no hacen falta. Necesitas internet. El proyecto no descarga vídeos, y no incluye sus archivos ni sus derechos.

No se ha podido verificar la reproducción de los seis enlaces aportados desde el entorno de creación. No se afirma que todos permitan inserción: vídeos privados, retirados, con restricciones de edad/región o con inserción desactivada pueden fallar. La app muestra errores y mantiene «YouTube ↗» como alternativa. El error 153 suele indicar falta de identificación del sitio; usa HTTP local o GitHub Pages y evita políticas que eliminen el referente.

YouTube ofrece velocidad y saltos mediante su IFrame API. Las velocidades disponibles dependen del vídeo: la app consulta las admitidas y confirma el cambio mediante el evento oficial. Al repetir un fragmento, se usa un pequeño intervalo; el corte no es exacto al fotograma. YouTube puede mostrar publicidad, recomendaciones propias o pedir consentimiento; la web solo controla sus propias tarjetas relacionadas, que pertenecen al kata seleccionado.

## Contenido inicial

- 10 katas, 28 referencias de vídeo.
- Básicos: Pinan Nidan, Shodan, Sandan, Yondan y Godan.
- Intermedios: Naifanchin Shodan, Bassai Dai y Seienchin.
- Altos: Kururunfa y Suparinpei (buscable también como «Suparempai»).
- Los seis vídeos enviados están en su orden original: los tres primeros en Kururunfa, los siguientes en Suparinpei. Sus títulos son etiquetas provisionales y su enfoque está «Por clasificar».

La asignación de cinturones es una **propuesta editable para el dummy**, no un programa oficial de Omega ni una norma universal de Shitō-ryū. Verde y marrón pueden aparecer en los grupos adyacentes porque tus rangos se solapan. El filtro de cinturón muestra etiquetas exactas de nivel recomendado, no todos los katas de grados anteriores.

La rama (Naha/Higaonna o Shuri/Itosu) es independiente del enfoque del vídeo (tradicional/didáctico o actual/competición). El enfoque es una etiqueta editorial orientativa. El catálogo inicial no pretende contener todos los katas del estilo.

## Funciones

- Navegación a la izquierda, agrupada por dificultad; búsqueda por nombre y variantes.
- Filtros combinables y discretos en «Filtrar biblioteca».
- Vídeo principal central y panel de práctica a la derecha en pantallas amplias. En pantallas pequeñas el panel pasa debajo y la navegación se abre con «Katas».
- Selección de velocidad; puntos con salto directo, velocidad propia y bucle de 2–120 segundos.
- Crear, editar o eliminar marcas; cada marca pertenece a un vídeo concreto.
- Dos **puntos de ejemplo** por vídeo para probar los controles. No son un desglose técnico validado. Sustitúyelos por marcas revisadas por el profesor.
- Guardar katas favoritos. Puntos y favoritos persisten en localStorage, sin servidor ni sincronización entre dispositivos.
- Exportación/importación JSON de puntos y favoritos. La importación combina las marcas y reemplaza únicamente las que tienen el mismo ID; valida el archivo antes de aplicarlo. Las marcas de vídeos que ya no estén en el catálogo se rechazan.
- Enlaces compartibles por kata (`#kururunfa`) y por vídeo (`#kururunfa?video=8CRMimNzRfQ`).
- YouTube se carga al pulsar reproducir. Las miniaturas sí se solicitan a YouTube al mostrar la página. Se usa el dominio de inserción youtube-nocookie.com.

## Publicar en GitHub Pages

Opción sencilla:

1. Crea un repositorio en GitHub.
2. Sube **el contenido** de `omega-kata` a la raíz del repositorio (index.html debe quedar en la raíz).
3. En **Settings → Pages → Build and deployment**, elige **Deploy from a branch**, rama `main`, carpeta `/ (root)` y guarda.
4. GitHub mostrará la URL de tu página cuando termine el despliegue.

Opción con Actions: el proyecto incluye `.github/workflows/pages.yml`. En Settings → Pages elige **GitHub Actions**. El flujo se ejecuta al subir a `main` o manualmente. El repositorio tiene que permitir Actions y la configuración de Pages debe estar habilitada. No necesitas las dos opciones a la vez.

Todas las rutas son relativas, por lo que funciona tanto en `usuario.github.io` como en `usuario.github.io/nombre-repositorio/`. No hay router de servidor ni hace falta un 404 personalizado. No se ha creado ningún repositorio ni se ha publicado esta entrega.

## Editar el catálogo

Abre `data.js`. Cada kata tiene:

```js
{
  id: 'nombre-url',
  name: 'Nombre visible',
  aliases: ['Otro nombre'],
  difficulty: 'basico', // basico | intermedio | alto
  belts: ['Blanco', 'Amarillo'],
  branch: 'Shuri', // Shuri | Naha (catálogo inicial)
  lineage: 'Itosu',
  description: 'Texto del kata',
  videos: [
    { id: 'ID_YOUTUBE_11', title: 'Vista frontal', author: 'Canal o autor',
      approach: 'tradicional', // tradicional | actual | pendiente
      source: 'https://pagina-de-referencia.example', start: 0 }
  ]
}
```

Usa identificadores de YouTube reales de 11 caracteres (el ejemplo `ID_YOUTUBE_11` es solo un marcador). `start` es opcional y representa segundos desde el inicio del vídeo. En Seienchin, la segunda referencia procede de una compilación enlazada por Fuji Karaté Vercors y comienza en 02:25; no es un archivo exclusivo de ese kata. Revísala antes de fijarla como referencia definitiva.

Para incorporar otras ramas, añade también sus opciones al filtro en `index.html`. Los colores y tamaños están en `styles.css`; los textos y grupos son editables en `index.html` y `app.js`.

Las marcas se identifican por `id de kata/id de vídeo`; conserva esos IDs al cambiar etiquetas. Si sustituyes un vídeo, sus marcas antiguas no se aplicarán al nuevo.

## Verificación de esta entrega

- Sintaxis de JavaScript y coherencia de catálogo, rutas y referencias comprobables con Node.
- Pruebas de lógica con un reproductor simulado: filtros, cambio de kata/vídeo, velocidad, marcas y bucle. Ejecuta `node tests/verify.mjs` si tienes Node instalado; no es necesario para usar la web.
- La infraestructura de vista previa no estaba disponible en el entorno de creación. No se ha realizado inspección visual en navegador ni reproducción real de los vídeos. Comprueba ambos puntos en tu prueba local.

Consulta `FUENTES.md` para procedencia y límites de la selección. La licencia MIT cubre el código original, no los vídeos, marcas o contenido de terceros.
