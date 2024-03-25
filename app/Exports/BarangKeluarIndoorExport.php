<?php

namespace App\Exports;

use App\Models\BarangKeluar;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;


class BarangKeluarExport implements FromView
{
    use Exportable;

    public function view() : View
    {
        return view('indoor.laporanExcelindoor',[
            'barangKeluars' => BarangKeluar::where('devisi_id','=',2)->get()
        ]);
    }
}
