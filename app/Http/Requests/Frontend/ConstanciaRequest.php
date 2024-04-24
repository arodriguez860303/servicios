<?php

namespace App\Http\Requests\Frontend;

use Illuminate\Foundation\Http\FormRequest;

class ConstanciaRequest extends FormRequest
{

    protected $rules= [
                'txtFolioPago' => 'required',
    ];
    public function messages()
    {
        return [                
                'txtFolioPago.required' => 'El folio de hacienda es obligatorio',
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
