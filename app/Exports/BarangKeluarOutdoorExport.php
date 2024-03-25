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
        return view('outdoor.laporanExceloutdoor',[
            'barangKeluars' => BarangKeluar::where('devisi_id','=',3)->get()
        ]);
    }
}
