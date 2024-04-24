<?php

namespace App\Http\Requests\Catalogos;

use Illuminate\Foundation\Http\FormRequest;

class FoliosRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $array1=[];       
          
        
            $chkMultiple=$this->input('chkRango');
            if(isset($chkMultiple))
            {
                $array2=
                [  
                    'txtRangoDe' => 'required',
                    'txtRangoA' => 'required',                   
                ];
                    $array1= array_merge($array1, $array2);

            }
            else
            {
                $array3=
                [  
                    'txtFolio' => 'required',
                ];
                    $array1= array_merge($array1, $array3);
            }        

        return $array1;
    }
}
