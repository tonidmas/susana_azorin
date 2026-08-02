# Cómo activar la base de datos (Supabase) para tu app

Con esto, tu app pasará a guardar los datos en internet, y verás siempre lo mismo entres desde donde entres (móvil, portátil, tablet).

---

## Paso 1: Crear tu cuenta y proyecto en Supabase

1. Ve a **supabase.com** y haz clic en **Start your project**
2. Regístrate (puedes usar tu cuenta de GitHub, es lo más rápido)
3. Haz clic en **New Project**
4. Ponle un nombre, por ejemplo `gestion-alquileres`
5. Te pedirá una **contraseña de base de datos** — genera una y guárdala en un lugar seguro (no la necesitarás para la app, pero consérvala por si acaso)
6. Elige la región más cercana (por ejemplo, "West EU (Ireland)" si estás en España)
7. Haz clic en **Create new project** y espera 1-2 minutos mientras se prepara

---

## Paso 2: Crear la tabla de datos

1. Dentro de tu proyecto de Supabase, en el menú de la izquierda, haz clic en **SQL Editor**
2. Haz clic en **New query**
3. Abre el archivo `supabase_setup.sql` que te he dado, copia todo su contenido y pégalo ahí
4. Haz clic en **Run** (o pulsa Ctrl+Enter / Cmd+Enter)
5. Debería aparecer "Success. No rows returned" — ya tienes la tabla creada

---

## Paso 3: Copiar tus claves de conexión

1. En el menú de la izquierda, ve a **Project Settings** (el icono de engranaje) → **API**
2. Copia estos dos valores, los necesitarás en el siguiente paso:
   - **Project URL** (algo como `https://abcdefgh.supabase.co`)
   - **anon public** key (una clave larga de letras y números, en la sección "Project API keys")

---

## Paso 4: Añadir esas claves a Vercel

1. Ve a tu proyecto en **vercel.com**
2. Entra en **Settings** → **Environment Variables**
3. Añade dos variables:
   - Nombre: `VITE_SUPABASE_URL` → Valor: (pega tu Project URL)
   - Nombre: `VITE_SUPABASE_ANON_KEY` → Valor: (pega tu anon public key)
4. Para ambas, deja marcado que apliquen a **Production**, **Preview** y **Development**
5. Guarda cada una con **Save**

---

## Paso 5: Actualizar el código en GitHub y volver a desplegar

1. Sube (o reemplaza) en tu repositorio de GitHub estos archivos actualizados: `App.jsx` y `package.json` (los nuevos que te he dado)
2. Vercel detectará el cambio y volverá a desplegar automáticamente
3. **Importante**: como las variables de entorno se añadieron después, puede que necesites forzar un nuevo despliegue para que las tome. Ve a la pestaña **Deployments** en Vercel, entra en el último despliegue, pulsa el menú **"..."** → **Redeploy**

---

## Paso 6: Comprobarlo

1. Abre tu app desde el ordenador y añade o edita algo (por ejemplo, marca un pago)
2. Abre la misma URL desde el móvil (o desde otro navegador)
3. Deberías ver ese mismo cambio reflejado

Si al abrir la app ves un mensaje de "Falta configurar la base de datos", significa que las variables de entorno del Paso 4 no se guardaron bien o falta volver a desplegar (Paso 5).

---

## Nota sobre el acceso sin contraseña

Elegiste no poner contraseña, así que cualquier persona que tenga el enlace de tu app puede ver y modificar los datos (inquilinos, rentas, fianzas). Es la opción más sencilla, pero ten en cuenta:

- No compartas la URL públicamente (redes sociales, etc.)
- Si más adelante quieres añadir una contraseña sencilla, dímelo y te preparo esa versión — es un cambio pequeño.

## Uso diario a partir de ahora

- Ya no hace falta exportar a Excel como copia de seguridad obligatoria (aunque nunca está de más), porque los datos viven en Supabase, no en tu navegador.
- En el panel de la izquierda de la app verás si los datos están "Guardados en la nube" o si hay algún problema de conexión.
- Hay un botón "Refrescar" en la parte inferior izquierda por si quieres forzar que se traigan los últimos datos guardados desde otro dispositivo.
