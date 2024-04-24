<?php

namespace App\Http\Requests\Catalogos;

use Illuminate\Foundation\Http\FormRequest;

class UsuariosRequest extends FormRequest
{
    protected $rules= [

        'id_rol' =>'required|not_zero',
        'txtNombre'=>'required',
        'txtCorreo'=>'required',
        'txtNickname'=>'required',
        'txtPassword'=>'required'
    ];
    public function messages()
    {
        return [
                'id_rol.required' => 'Selecciona el rol',
                'id_rol.not_zero' => 'Selecciona el rol',
                'txtNombre.required' => 'Ingresa el nombre completo',
                'txtCorreo.required' => 'Ingresa el correo',
                'txtNickname.required' => 'Ingresa el nickname',
                'txtPassword.required' => 'Ingresa el password',
                
               ];
    }
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $rules= $this->rules;
        return $rules;
    }
}
