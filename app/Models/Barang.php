<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_barang',
        'jumlah_barang',
        'user_id',
        'devisi_id'
    ];

    public function BarangKeluars()
    {
        return $this->hasMany(BarangKeluar::class);
    }

    public function devisi()
    {
        return $this->belongsTo(Devisi::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
