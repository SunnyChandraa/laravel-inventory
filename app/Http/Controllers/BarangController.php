<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barang;
use App\Models\Devisi;
use PDF;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

class BarangController extends Controller
{
    public function docu()
    {
        return view('docu.barang',[
            'barangs'    => Barang::where('devisi_id','=', 1)->orderBy('id', 'desc')->get()
        ]);
    }

    public function indoor()
    {
        return view('indoor.barang',[
            'barangs'    => Barang::where('devisi_id','=', 2)->orderBy('id', 'desc')->get()
        ]);
    }

    public function outdoor()
    {
        return view('outdoor.barang',[
            'barangs'    => Barang::where('devisi_id','=', 3)->orderBy('id', 'desc')->get()
        ]);
    }

    public function create()
    {
        return view('barang.form-create',[
            'devisis'       => Devisi::get()
        ]);
    }

    public function store(Request $request)
    {
        $barang = $request->validate([
            'nama_barang'       =>  'required|unique:barangs',
            'jumlah_barang'     =>  'required',
            'user_id'           =>  'required',
            'devisi_id'         =>  'required'
        ],[
            'nama_barang.required'      =>  'Wajib Diisi!!',
            'nama_barang.unique'        =>  'Nama Barang Sudah Tersedia!!',
            'jumlah_barang.required'    =>  'Wajib Diisi!!',
            'user_id.required'          =>  'Wajib Diisi!!',
            'devisi_id.required'        =>  'Wajib Diisi!!'
        ]);

        Barang::create($barang);
        session()->flash('success');
        return redirect()->back();
    }

    public function edit(Barang $barang)
    {
        return view('barang.form-edit', compact('barang'));
    }

    public function update(Request $request, Barang $barang)
    {
        $update = $request->validate([
            'nama_barang'       =>  'required',
            'jumlah_barang'     =>  'required',
        ],[
            'nama_barang.required'      =>  'Wajib Diisi!!',
            'jumlah_barang.required'    =>  'Wajib Diisi!!'
        ]);

        $barang->update($update);
        session()->flash('success-update');
        return redirect('/dashboard');  
    }

    public function destroy(Barang $barang)
    {
        $barang->delete();
        session()->flash('success-delete');
        return redirect()->back();
    }
    
    public function barangTersediaDocu()
    {
        return view('docu.barangTersedia',[
            'barangs'    => Barang::where('devisi_id','=', 1)->orderBy('id', 'desc')->get()
        ]);
    }

    public function barangTersediaindoor()
    {
        return view('docu.barangTersedia',[
            'barangs'    => Barang::where('devisi_id','=', 2)->orderBy('id', 'desc')->get()
        ]);
    }

    public function barangTersediaOutdoor()
    {
        return view('docu.barangTersedia',[
            'barangs'    => Barang::where('devisi_id','=', 3)->orderBy('id', 'desc')->get()
        ]);
    }

    public function laporanPDFdocu()
    {
        $barangs = Barang::where('devisi_id','=',1)->get();
        
        $pdf = PDF::loadview('docu.laporanTersediaPdf',['barangs' => $barangs]);
        return $pdf->download('laporan-barang-tersedia-docu-pdf');
    }

    public function laporanPDFindoor()
    {
        $barangs = Barang::where('devisi_id','=',1)->get();
        
        $pdf = PDF::loadview('indoor.laporanTersediaPdf',['barangs' => $barangs]);
        return $pdf->download('laporan-barang-tersedia-indoor-pdf');
    }

    public function laporanPDFoutdoor()
    {
        $barangs = Barang::where('devisi_id','=',1)->get();
        
        $pdf = PDF::loadview('outdoor.laporanTersediaPdf',['barangs' => $barangs]);
        return $pdf->download('laporan-barang-tersedia-outdoor-pdf');
    }

    
}
