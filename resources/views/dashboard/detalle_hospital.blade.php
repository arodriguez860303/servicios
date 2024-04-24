 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
	@include('helpers.cssTable')
   <link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">
@endsection

@section('title')
  DASHBOARD
@endsection

@section('descripcion')
  Detalles de las solicitudes

  @if($id_status==2)
  	proceso
  @elseif($id_status==8)
  	observadas
  @elseif($id_status==9)
  	solventadas
  @elseif($id_status==10)
  	con documentación aceptada
  @elseif($id_status==3)
  	concluidas
  @elseif($id_status==7)
  	canceladas
  @endif
@endsection

@section('buttons')
  <button id="ExportReporttoExcel" class="btn btn-outline-success" style="display: none;"><i class="fa fa-file-excel"></i> Exportar a EXCEL</button> 
  <button id="ExportReporttoPdf" class="btn btn-outline-danger" style="display: none;"><i class="fa fa-file-pdf"></i> Exportar a PDF</button> 
	<a class="btn btn-outline-secondary" href="{{ route('dashboard.index') }}"><i class="fa fa-fw fa-arrow-rotate-left"></i> Regresar</a>	
@endsection

@section('content')
	<style>
    	.dataTables_filter, .dataTables_info { display: none; } 
      .buttonsToHide{ display: none; }   
	</style>
	@include('helpers.headerWithSearchH')
	<input type="hidden" id="anio" name="anio" value="{{$anio}}">

	<div class="block-content block-content-full">
	    <div id="table-tramites" class="table-tramites"></div>
	</div>
@endsection

@section('js') 
	@include('helpers.jsTable')
  <script src="{{ asset('backend/dashboard/jsDetalleHospital.js') }}"></script>	
@endsection

@section('script')
	loadData({{$id_status}});	
@endsection