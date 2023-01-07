<?php

if(!function_exists('uploaded_files')) {

    function uploaded_files($id) {

      return asset('/admin/uploads/'.$id);
    }

  }








?>