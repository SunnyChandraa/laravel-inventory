<?php

namespace App\Exports;

use App\Models\Barang;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\Exportable;


class BarangExport implements FromView
{
    use Exportable;

    public function view() : View
    {
        return view('outdoor.laporanTersediaPdf',[
            'barangs' => Barang::where('devisi_id','=',3)->get()
        ]);
    }
}
