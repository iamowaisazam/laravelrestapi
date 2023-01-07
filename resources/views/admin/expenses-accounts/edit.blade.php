@extends('admin.layouts.admin')
@section('title','Expense Accounts')
@section('css')
 <style>
        .normal-btn{
              background: white;
            border: none;
        }

</style>
@endsection
@section('content')
<div class="container-fluid">
    
      <!-- start page title -->
            <div class="row">
              <div class="col-12">
                  <div class="page-title-box d-flex align-items-center justify-content-between">
                      <h4 class="mb-0 font-size-18">Accounts</h4>
                      <div class="page-title-right">
                          <ol class="breadcrumb m-0">
                              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Dashboard</a></li>
                              <li class="breadcrumb-item active">expenses</li>
                          </ol>
                      </div>
                      
                  </div>
              </div>
          </div>
        <!-- end page title -->

          <div class="row">
            <div class="col-12">
             <form method="post" action="{{route('admin.expenses_accounts.update',$module->id)}}"  >
                @csrf
                
                <div class="card">
                  <div class="card-body">
                    <div class="container-fluid">
                        <div class="py-3 container-fluid">
                            <div class="row">
                                 <div class="form-group col-md-3">
                                        <label for="date">Date</label>
                                        <input value="{{$module->date->format('Y-m-d')}}" type="date" name="date" class="form-control date">
                                 </div>
                                
                                <div class="col-md-3">
                                     <div class="form-group">
                                        <label for="simpleinput">Account Name</label>
                                        <input required value="{{$module->account_name}}" name="account_name" class="form-control">
                                     </div>
                                </div>
                                
                                <div class="col-md-3">
                                     <div class="form-group">
                                        <label>Opening Balance</label>
                                        <select class="form-control opening_balance" name="opening_balance" >
                                                <option >No</option>
                                                <option @if($module->opening_balance > 0) {{'selected'}} @endif >Yes</option>
                                        </select>
                                     </div>
                                </div>
                                
                                 <div @if($module->opening_balance > 0) @else style="display:none;" @endif class="bal col-3">
                                     <div class="form-group">
                                        <label>Balance Type</label>
                                        <select class="form-control" name="balance_type" >
                                                <option @if($module->balance_type  == 'Credit') {{'selected'}} @endif >Credit</option>
                                                <option @if($module->balance_type  == 'Debit') {{'selected'}} @endif >Debit</option>
                                        </select>
                                     </div>
                                </div>
                                
                                <div @if($module->opening_balance > 0) @else style="display:none;" @endif class="bal form-group col-md-3">
                                    <label for="balance">Amount</label>
                                    <input type="number" id="amount" name="opening_balance" class="form-control amount" value="{{$module->opening_balance}}" >
                                </div>
                            </div>
                        </div>
                        
                       <div class="row" >   
                            <div class="col-md-12 pt-5 py-3 text-center" >
                                  <button type="submit" class="btn btn-info">Submit</button>
                            </div>
                        </div>
                      </div>
                  </div>
              </div>
              
           </form>
         </div>
     </div>
 </div>
@endsection
@section('js')
<script>
    $(document).ready(function () {
        
         $('.opening_balance').on('change', function() {
            
             if(this.value == 'Yes'){
                 $('.bal').show();
             }else{
                 $('.bal').hide();
                 $('.bal input').val(0);
             }
             
         });
     
    });
</script>
@endsection