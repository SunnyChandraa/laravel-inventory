<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Barang;
use App\Models\BarangKeluar;
use App\Models\Devisi;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $user       = User::count();
        $docu       = Barang::where('devisi_id', '=', 1)->count();
        $indoor     = Barang::where('devisi_id', '=', 2)->count();
        $outdoor    = Barang::where('devisi_id', '=', 3)->count();

        $barangKeluars = Barang::get();
        $devisi        = Devisi::where('id','=',1,2,3);
        if(auth()->user()->devisi->nama_devisi == 'Administrator'){
            return view('admin.dashboard', compact('user','docu','indoor','outdoor','devisi','barangKeluars'));
        }else{
            return view('devisi.dashboard', compact('user','docu','indoor','outdoor','devisi','barangKeluars'));
        }  
    }
}
