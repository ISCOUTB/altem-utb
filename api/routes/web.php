<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->group(['prefix' => 'api'], function () use ($router) {

    $router->post('login', 'ApiAuthController@authenticate');
    $router->get('riesgos_estudinate/{id}', 'EstudianteController@getRiesgosByEstudiante');
    $router->get('personal/{codigo}', 'ArchivoPersonalController@getRiesgosPersonalByEstudiantes');
    $router->get('reporte/config/anio', 'ReporteController@getAnios');
    $router->get('reporte/config/factores/', 'ReporteController@getRiesgos');
    $router->get('reporte/config/factores/{id}', 'ReporteController@getRiesgosByTipo');
    $router->get('reporte/config/tipos', 'ReporteController@getRiesgosName');
    $router->post('reporte/config/send', 'ReporteController@filtrarQuery');
    $router->get('personal/{codigo}', 'ArchivoPersonalController@getRiesgosPersonalByEstudiantes');
    $router->get('riesgos_archivo/{codigo}', 'ArchivoPersonalController@riesgoAgregado');
    $router->post('eliminar_intervencion', 'IntervencionController@deleteIntervencion');
    $router->post('eliminar_archivo', 'ArchivoPersonalController@deleteArchivo');
    $router->post('riesgo_by_archivo', 'RiesgoController@riesgo_by_archivo');
    //$router->resource('usuario', 'UsuarioController');
    //$router->resource('base_datos_estudiantes', 'BaseDatosEstudiantesController');
    //$router->resource('criterio', 'CriterioController');
    $router->post('base_datos_estudiantes/column', 'BaseDatosEstudiantesController@getColumn');
    $router->post('base_datos_estudiantes/column', 'BaseDatosEstudiantesController@getColumn');
    $router->get('anotacion/{codigo}', 'EstudianteController@getAnotacionesByCodigo');
    $router->post('anotacion/', 'EstudianteController@storeAnotaciones');
    $router->put('anotacion/{codigo}', 'EstudianteController@updateAnotaciones');
    $router->delete('anotacion/{codigo}', 'EstudianteController@deleteAnotaciones');


    // Adding JWT Auth Middleware to prevent invalid access
    $router->group(['middleware' => 'jwt.auth'], function () use ($router) {

        $router->group(['middleware' => ['role:ADMIN|CONSE|PSICO']], function () use ($router) {
            $router->post('estudiantes_all', 'EstudianteController@getEstudiantesByUser');
            $router->post('estudiantes_buscar', 'EstudianteController@buscar');
            //$router->resource('login', 'ApiAuthController', ['only' => ['index']]);
            $router->get('estudiante_filtro/{id}', 'EstudianteController@ejecutarFiltro');

            //$router->resource('intervencion', 'IntervencionController');
            //$router->resource('observacion', 'ObservacionController');
            //$router->resource('accion_aplicada', 'AccionAplicadaController');
            $router->post('get_accion_aplicada', 'AccionAplicadaController@getAccionAplicada');

            $router->get('estudiante_colums', 'EstudianteController@getColumn');
            //$router->resource('estudiante', 'EstudianteController');
            //$router->resource('tipo_riesgo', 'TipoRiesgoController');
            //$router->resource('estrategia', 'EstrategiaController');
            $router->post('estrategia_by_riesgo', 'EstrategiaController@estrategiaByRiesgoId');
            //$router->resource('accion', 'AccionController');
            $router->get('accion/acciones_estrategia/{id}', 'AccionController@getByEstrategia');
            //$router->resource('tipo_riesgo', 'TipoRiesgoController');
            //$router->resource('riesgo', 'RiesgoController');
            //$router->resource('filtro', 'FiltroController');
            //$router->resource('archivo_personal', 'ArchivoPersonalController');
            $router->get('filtro/filtros_riesgo/{id}', 'FiltroController@getByRiesgo');

            $router->post('role', 'UsuarioController@createRole');
            $router->get('role', 'UsuarioController@getRole');
            // Route to create a new permission
            $router->post('permission', 'UsuarioController@createPermission');
            // Route to assign role to user
            $router->post('assign_role', 'UsuarioController@assignRole');
            // Route to attache permission to a role
            $router->post('attach_permission', 'UsuarioController@attachPermission');
            $router->get('reporte/estudiante_riesgo_programa', 'ReporteController@archivo_personal');

        });

    });

});
