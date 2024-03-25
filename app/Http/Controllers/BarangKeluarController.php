<?php

namespace App\Http\Controllers;

use App\Exports\BarangKeluarExport;
use App\Models\Barang;
use Illuminate\Http\Request;
use App\Models\BarangKeluar;
use PDF;

class BarangKeluarController extends Controller
{
    public function docu()
    {
        return view('docu.barangKeluar',[
            'barangs'           => Barang::where('devisi_id','=',1)->get(),
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',1)->get()
        ]);
    }

    public function indoor()
    {
        return view('indoor.barangKeluar',[
            'barangs'           => Barang::where('devisi_id','=',2)->get(),
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',2)->get()
        ]);
    }

    public function outdoor()
    {
        return view('outdoor.barangKeluar',[
            'barangs'           => Barang::where('devisi_id','=',3)->get(),
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',3)->get()
        ]);
    }

    public function store(Request $request)
    {
        $barang = $request->validate([
            'barang_id'     => 'required',
            'qty'           => 'required',
            'user_id'       => 'required',
            'devisi_id'     => 'required'
        ],[
            'barang_id.required'    => 'Wajib Diisi!!!',
            'qty.required'          => 'Wajib Diisi!!!'
        ]);

        BarangKeluar::create($barang);
        session()->flash('success');
        return redirect()->back();
    }

    public function destroy(BarangKeluar $barang)
    {
        $barang->delete();
        session()->flash('success-delete');
        return redirect()->back();
    }

    public function detailLaporanDocu()
    {
        return view('docu.detailLaporanDocu',[
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',1)->get()
        ]);
    }

    public function detailLaporanIndoor()
    {
        return view('indoor.detailLaporanIndoor',[
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',2)->get()
        ]);
    }

    public function detailLaporanOutdoor()
    {
        return view('outdoor.detailLaporanOutdoor',[
            'barangKeluars'     => BarangKeluar::where('devisi_id','=',3)->get()
        ]);
    }

    public function laporanPDFdocu()
    {
        $barangKeluars = BarangKeluar::where('devisi_id','=',1)->get();
        
        $pdf = PDF::loadview('docu.laporanPdf',['barangKeluars' => $barangKeluars]);
        return $pdf->download('laporan-barang-keluar-docu-pdf');
    }

    public function laporanPDFindoor()
    {
        $barangKeluars = BarangKeluar::where('devisi_id','=',2)->get();
        
        $pdf = PDF::loadview('indoor.laporanPdf',['barangKeluars' => $barangKeluars]);
        return $pdf->download('laporan-barang-keluar-indoor-pdf');
    }

    public function laporanPDFoutdoor()
    {
        $barangKeluars = BarangKeluar::where('devisi_id','=',3)->get();
        
        $pdf = PDF::loadview('outdoor.laporanPdf',['barangKeluars' => $barangKeluars]);
        return $pdf->download('laporan-barang-keluar-outdoor-pdf');
    }

    public function laporanExceldocu()
    {
        return (new BarangKeluarExport)->download('Laporan_Excel_docu.xlsx');
    }

    public function laporanExcelindoor()
    {
        return (new BarangKeluarExport)->download('Laporan_Excel_Indoor.xlsx');
    }

    public function laporanExceloutdoor()
    {
        return (new BarangKeluarExport)->download('Laporan_Excel_Outdoor.xlsx');
    }
    
}

