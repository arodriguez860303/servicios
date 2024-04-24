<?php

namespace App\Http\Requests\Frontend;

use Illuminate\Foundation\Http\FormRequest;

class CrearCuentaHospitalRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
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
        $rules=[             
            'nombre' =>'required', 
            'ap_paterno' =>'required', 
            'ap_materno' =>'required', 
            'curp' =>'required',             
            'id_hospital' => 'required|not_in:0',
            'nickname'=>'required',
            'password_confirmation'=>'required',
            'password'=>[
                'required',
                'string',
                'confirmed',
                'min:10',             // must be at least 10 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#?&.]/', // must contain a special character
            ],             
        ];        

        return $rules;
    }
}
