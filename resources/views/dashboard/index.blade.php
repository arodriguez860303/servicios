 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
@endsection

@section('title')
  DASHBOARD
@endsection

@section('descripcion')
  Estadisticas
@endsection

@section('buttons') 	
@endsection

@section('dash-content')
	@include('dashboard.head_anio')
	@include('dashboard.targets_status')
	@include('dashboard.targets_graph')
	@include('dashboard.targets_recent')
@endsection

@section('js') 	
	<script src="{{ asset('template_backend/js/plugins/chart.js/chart.min.js') }}"></script>
	<script src="{{ asset('backend/dashboard/jsIndex.js') }}"></script>
@endsection

@section('script')	
@endsection