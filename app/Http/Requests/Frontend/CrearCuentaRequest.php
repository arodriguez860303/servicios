<?php

namespace App\Http\Requests\Frontend;

use Illuminate\Foundation\Http\FormRequest;

class CrearCuentaRequest extends FormRequest
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
            //'rfc' =>'required',            
            'telefono' =>'required', 
            'correo' =>'required|email', 
            
            'id_municipio'=>'required',
            'calle'=>'required',
            'entre_calle'=>'required',
            'y_calle'=>'required',
            'num_exterior'=>'required',
            'codigo_postal'=>'required',
            'colonia'=>'required',

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

        $tipoTramite=$this->input('id_tipo_tramite');

        if($tipoTramite == 2)
        {
            $ruleHospital = [
                'id_hospital' => 'required|not_in:0',
            ];

            $rules= array_merge($rules, $ruleHospital);
        }

        return $rules;
    }

    // public function messages()
    // {       
    //     $msg= [
    //             /*'codigo_activacion.required' => 'Este campo es obligatorio',*/
    //             'id_tipo_tramite.required' => 'Este campo es obligatorio',
    //             'nombre.required' => 'Este campo es obligatorio',
    //             'ap_paterno.required' => 'Este campo es obligatorio',
    //             'ap_materno.required' => 'Este campo es obligatorio',
    //             'curp.required' => 'Este campo es obligatorio',
    //             //'rfc.required' => 'Este campo es obligatorio',                
    //             'telefono.required' => 'Este campo es obligatorio',
    //             'correo.required' => 'Este campo es obligatorio',
    //             'correo.email' => 'Este campo no tiene el formato de un correo electrónico',
                
    //             'nickname.required' => 'Este campo es obligatorio',
    //             'password.required' => 'Este campo es obligatorio',
    //             'password_confirmation.required' => 'Este campo es obligatorio',
    //             'password.min' => 'El campo debe contener al menos 10 caracteres',
    //             'password.regex' => 'El campo no cumple con el formato establecido',
    //             'password.confirmed' => 'El password de confirmación no es el mismo',
    //            ];

    //     $tipoTramite=$this->input('id_tipo_tramite');

    //     if($tipoTramite == 2)
    //     {
    //         $msgHospital = [
    //             'id_hospital.required' => 'Este campo es obligatorio',
    //         ];

    //         $msg= array_merge($msg, $msgHospital);
    //     }
    //     return $msg;
    // }    
}
