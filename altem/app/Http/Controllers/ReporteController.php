<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Models\ArchivoPersonal;
use App\Models\Riesgo;
use App\Models\TipoRiesgo;

use Illuminate\Http\Request;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Auth;

class ReporteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //D

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function filtrarQuery(Request $request)
    {

        $anio = $request->input('anio');
        $periodo = $request->input('periodo');
        $riesgo = $request->input('riesgo');
        $factor = $request->input('factor');
        
        if($periodo == 1)
        {
            $fecha='7';
            $operator='<';
        }else{
            if($periodo == 2)
            {
                $fecha='6';
                $operator='>';
            }
        }

        //abc
        if ($anio!=null and $periodo != null and $riesgo != null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->whereYear('fecha_reporte', '=', $anio)
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->get();
        }
        
        //ab
        if ($anio != null and $periodo != null and $riesgo == null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->whereYear('fecha_reporte', '=', $anio)
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->get();
        }

        //a
        if($anio != null and $periodo == null and $riesgo ==null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->whereYear('fecha_reporte', '=', $anio)
                ->get();
        }

        //b
        if ($anio==null and $periodo != null and $riesgo == null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->get();
        }

        //c
        if ($anio==null and $periodo == null and $riesgo != null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->get();
        }

        //ac
        if ($anio!=null and $periodo == null and $riesgo != null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->whereYear('fecha_reporte', '=', $anio)
                ->where('riesgos_id', '=', $factor)
                ->get();
        }

        //bc
        if ($anio==null and $periodo != null and $riesgo != null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->get();
        }

        //cd
        if ($anio==null and $periodo == null and $riesgo != null and $factor != null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->where('riesgos_id', '=', $factor)
                ->get();
        }

        //acd
        if ($anio!=null and $periodo == null and $riesgo != null and $factor != null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->whereYear('fecha_reporte', '=', $anio)
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->where('riesgos_id', '=', $factor)
                ->get();
        }

        //bcd
        if ($anio==null and $periodo != null and $riesgo != null and $factor != null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->where('riesgos_id', '=', $factor)
                ->get();
        }

        //abcd
        if ($anio!=null and $periodo != null and $riesgo != null and $factor != null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->whereYear('fecha_reporte', '=', $anio)
                ->where(\DB::raw('MONTH(fecha_reporte) '), $operator, $fecha)
                ->where('tipo_riesgos_id', '=', $riesgo)
                ->where('riesgos_id', '=', $factor)
                ->get();
        }

        if ($anio==null and $periodo == null and $riesgo == null and $factor == null) {

            $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias')
                ->join('riesgos', 'riesgos.id', '=', 'archivo_personal.riesgos_id')
                ->get();
        }

        return response()->json($result);

    }

    public function archivo_personal()
    {
        $user = Auth::user();
        $result = ArchivoPersonal::with('estudiante_altem', 'riesgo.tiporiesgo', 'intervenciones.estrategias', 'usuario')
            ->where('usuarios_codigo', '=', $user->codigo)
            ->get();

        return response()->json($result);
    }

    public function getRiesgos()
    {
        //Misaji

        $result = Riesgo::select('*')->get();

        return response()->json($result);


    }

    public function getRiesgosByTipo($id)
    {
        //Misaji

        $result = Riesgo::select('*')->where('tipo_riesgos_id', $id)->get();

        return response()->json($result);


    }

    public function tipoRiesgos_programas()
    {

    }

    public function getAnios()
    {
        $result = ArchivoPersonal::select((\DB::raw('YEAR(fecha_reporte) as anio')))->groupby(\DB::raw('YEAR(fecha_reporte)'))->get();

        return response()->json($result);
    }

    public function getRiesgosName()
    {

        $nombres_riesgo = TipoRiesgo::select('id', 'nombre')->get();

        return response()->json($nombres_riesgo);

    }

    public function getFactoresRiesgo()
    {

        $factores_riesgo = Riesgo::select('nombre')->get();

        return response()->json($factores_riesgo);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
