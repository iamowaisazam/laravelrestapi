@extends('admin.layouts.admin')
@section('title','Companies')

@section('css')


@endsection

@section('content')
<div class="container-fluid">
        <!-- start page title -->
    <div class="row">
      <div class="col-12">
          <div class="page-title-box d-flex align-items-center justify-content-between">
              <h4 class="mb-0 font-size-18">Company
              </h4>

              <div class="page-title-right">
                  <ol class="breadcrumb m-0">
                      <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Dashboard</a></li>
                      <li class="breadcrumb-item active"> companies</li>
                  </ol>
              </div>
              
          </div>
      </div>
  </div>
    <!-- end page title -->

      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-6">
                    <h4 class="card-title">Create</h4>
                  </div>
                  <div class="col-6 text-right ">
                    <a href="{{route('admin.companies.create')}}"><i class="fa fa-plus  fa-2x "></i></a>
                  </div>
                </div>
              </div>

                <form enctype="multipart/form-data" method="post" action="{{route('admin.companies.store')}}"  >
                  @csrf
                    <div class="form-group">
                        <label for="simpleinput">Title</label>
                        <input name="title" type="text"  class="form-control" />
                        @if($errors->has('title'))
                          <div class="error text-danger">{{ $errors->first('title') }}</div>
                        @endif
                    </div>
                    
                    <div class="form-group">
                        <label for="simpleinput">Logo</label>
                        <input name="logo" type="file"  class="form-control" />
                        @if($errors->has('logo'))
                          <div class="error text-danger">{{ $errors->first('logo') }}</div>
                        @endif
                    </div>

                    <div class="form-group">
                      <button type="submit" class="btn btn-info">Submit</button>
                   </div>
                </form>
            </div>
        </div>

         
        </div>
 </div>

@endsection

@section('js')

<script>

    $(document).ready(function () {

      
        // $(".title").keyup(function(){
        //     var Text = $(this).val();
        //     Text = Text.toLowerCase();
        //     Text = Text.replace(/[^a-zA-Z0-9]+/g,'-');
        //     $(".slug").val(Text);        
        // });

    });
      

</script>

@endsection