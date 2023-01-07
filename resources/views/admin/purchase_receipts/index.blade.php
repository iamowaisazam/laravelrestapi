@extends('admin.layouts.admin')
@section('title','Good Receipts')
@section('css')
<link href="{{asset('admin/plugins/datatables/table.css')}}" rel="stylesheet">

<style>
  table{
    width: 100%!important;
  }
</style>
@endsection
@section('content')
<div class="container-fluid">

    <!-- start page title -->
      <div class="beard row">
        <div class="col-12">
              <div class="page-title-box d-flex align-items-center justify-content-between">
                  <h4 class="mb-0 font-size-18">Good Receipts</h4>
                  <div class="page-title-right">
                      <ol class="breadcrumb m-0">
                          <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Dashboard</a></li>
                          <li class="breadcrumb-item active"> Good Receipts</li>
                      </ol>
                  </div>
              </div>
          </div>
      </div>
    <!-- end page title -->


    <!--  -->
    <div class="card">
          <div class="card-body">
            <div class=" pt-1 pb-3 container-fluid">
              <div class="row">
                <div class="col-6"><h4 class="card-title">All Good Receipts</h4></div>
                <div class="col-6 text-right ">
                  <a class="btn btn-primary" href="{{route('admin.purchase_receipts.create')}}">Add Good Receipt </a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
                  <table class="data-table table mb-0">
                      <thead>
                          <tr>
                              <th class="text-left" >#</th>
                              <th class="text-left" >Order ID</th>
                              <th class="text-left" >Vendor</th>
                              <th class="text-left" >Date</th>
                              <th class="text-center" >Actions</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
      <!--  -->
      
</div>
@endsection


@section('js')
<script src="{{asset('admin/plugins/datatables/table.js')}}"></script>
<script>
  $(document).ready(function(){

      var table = $('.data-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: "{{route('admin.purchase_receipts.index') }}",
        columns: [
                    {
                      data: 'id', 
                      name: 'id'
                    },
                    {  
                      data: 'purchase', 
                      name: 'purchase'
                    },
                    {
                      data: 'vendor', 
                      name: 'vendor'
                    },
                    {
                      data: 'date', 
                      name: 'date'
                    },
                    { 
                      data: 'action', 
                      name: 'action', 
                      orderable: false, 
                      searchable: false
                    },
                  ]
            });
  });
</script>

@endsection