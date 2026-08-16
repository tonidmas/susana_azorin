# Cómo activar el acceso con usuario y contraseña

Hasta ahora la app estaba abierta: cualquiera con el enlace podía ver y modificar tus datos. A partir de este
cambio, hará falta iniciar sesión con correo y contraseña para entrar. No hay registro público — los usuarios
se dan de alta manualmente por ti, desde el panel de Supabase.

---

## Paso 1: Restringir el acceso a la base de datos

1. Ve a tu proyecto de Supabase → **SQL Editor → New query**
2. Abre el archivo `supabase_add_auth.sql` (incluido en este mismo zip), copia todo su contenido y pégalo
3. Pulsa **Run**

Esto sustituye las políticas "abiertas" que tenías por otras que solo permiten leer y escribir a quien haya
iniciado sesión — tanto en los datos (inquilinos, gastos...) como en los documentos subidos.

---

## Paso 2: Crear tu usuario (y el de quien más necesite entrar)

1. En Supabase, ve a **Authentication → Users**
2. Pulsa **Add user → Create new user**
3. Introduce el correo y una contraseña segura
4. **Importante:** marca la casilla **"Auto Confirm User"** antes de guardar — así el usuario queda activo
   al momento, sin tener que confirmar por email
5. Pulsa **Create user**

Repite este mismo paso por cada persona a la que quieras dar acceso (por ejemplo, si en el futuro una gestora
también necesita entrar).

<div></div>

**Para cambiar una contraseña más adelante:** en esa misma pantalla, haz clic sobre el usuario → **Reset Password**, o edítala directamente ahí.

---

## Paso 3: Subir el código actualizado

1. Sube el nuevo `App.jsx` (incluido en este zip) a tu repositorio de GitHub, reemplazando el anterior
2. Vercel volverá a desplegar automáticamente en 1-2 minutos

---

## Paso 4: Probar el acceso

1. Abre tu app publicada
2. Deberías ver una pantalla de acceso pidiendo correo y contraseña, con el nombre **Susalquia**
3. Entra con el usuario que creaste en el Paso 2
4. Deberías acceder con normalidad a tus datos

Para salir, usa el botón **"Cerrar sesión"** en la parte inferior de la barra lateral.

---

## Preguntas frecuentes

**¿Puedo recuperar la contraseña si la olvido?**
Sí — como no hay pantalla pública de "olvidé mi contraseña" en esta primera versión, el cambio se hace desde
el panel de Supabase (Paso 2). Si más adelante quieres que cualquier usuario pueda recuperarla por sí mismo
desde la propia app, es una mejora sencilla que podemos añadir cuando la necesites.

**¿Y si quiero volver a dejarlo sin contraseña?**
No es recomendable una vez que hay datos reales cargados, pero técnicamente bastaría con volver a ejecutar
las políticas originales de `supabase_setup.sql` y `supabase_setup_documentos.sql`.

**¿Esto tiene algún coste extra en Supabase?**
No. La autenticación por email y contraseña está incluida en el plan gratuito de Supabase sin límite
significativo para el número de usuarios que vas a necesitar aquí.
