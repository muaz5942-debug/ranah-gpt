<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RanahGPT - Budaya Minangkabau</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        :root {
            --blue-dark:  #1a56db;
            --blue-mid:   #3b82f6;
            --blue-light: #eff6ff;
            --blue-pale:  #dbeafe;
            --white:      #ffffff;
            --gray-100:   #f8fafc;
            --gray-200:   #e2e8f0;
            --gray-400:   #94a3b8;
            --gray-700:   #334155;
            --gray-900:   #0f172a;
        }

        body {
            background: var(--gray-100);
            height: 100dvh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .header {
            background: var(--white);
            border-bottom: 1px solid var(--gray-200);
            padding: 12px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--blue-dark), var(--blue-mid));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .header-text h1 {
            font-size: 16px;
            font-weight: 700;
            color: var(--gray-900);
            letter-spacing: -0.3px;
        }

        .header-text span {
            font-size: 12px;
            color: var(--gray-400);
            font-weight: 400;
        }

        .status-dot {
            margin-left: auto;
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 12px;
            color: #22c55e;
            font-weight: 500;
        }

        .status-dot::before {
            content: '';
            width: 7px;
            height: 7px;
            background: #22c55e;
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.4; }
        }

        .topik-bar {
            display: flex;
            gap: 7px;
            padding: 10px 14px;
            overflow-x: auto;
            background: var(--white);
            border-bottom: 1px solid var(--gray-200);
            scrollbar-width: none;
        }

        .topik-bar::-webkit-scrollbar { display: none; }

        .topik-bar button {
            flex-shrink: 0;
            padding: 6px 13px;
            border: 1.5px solid var(--blue-pale);
            border-radius: 999px;
            background: var(--blue-light);
            color: var(--blue-dark);
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s;
            white-space: nowrap;
        }

        .topik-bar button:active {
            background: var(--blue-dark);
            color: var(--white);
            border-color: var(--blue-dark);
        }

        .chat-box {
            flex: 1;
            overflow-y: auto;
            padding: 16px 14px 8px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .msg-row {
            display: flex;
            flex-direction: column;
            gap: 2px;
            animation: fadeUp 0.25s ease;
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(8px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .msg-row.user { align-items: flex-end; }
        .msg-row.bot  { align-items: flex-start; }

        .msg-label {
            font-size: 10px;
            color: var(--gray-400);
            font-weight: 500;
            padding: 0 4px;
            margin-bottom: 2px;
        }

        .message {
            max-width: 82%;
            padding: 11px 15px;
            border-radius: 16px;
            font-size: 14px;
            line-height: 1.65;
            color: var(--gray-700);
        }

        .msg-row.bot .message {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-bottom-left-radius: 4px;
        }

        .msg-row.user .message {
            background: linear-gradient(135deg, var(--blue-dark), var(--blue-mid));
            color: var(--white);
            border-bottom-right-radius: 4px;
        }

        .typing-row {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 2px;
            animation: fadeUp 0.25s ease;
        }

        .typing-bubble {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: 16px;
            border-bottom-left-radius: 4px;
            padding: 13px 18px;
            display: flex;
            gap: 5px;
            align-items: center;
        }

        .typing-bubble span {
            width: 7px;
            height: 7px;
            background: var(--blue-mid);
            border-radius: 50%;
            animation: typingBounce 1.1s infinite;
        }

        .typing-bubble span:nth-child(2) { animation-delay: 0.18s; }
        .typing-bubble span:nth-child(3) { animation-delay: 0.36s; }

        @keyframes typingBounce {
            0%, 60%, 100% { transform: translateY(0); opacity: 0.5; }
            30% { transform: translateY(-5px); opacity: 1; }
        }

        .tag {
            display: inline-block;
            background: var(--blue-light);
            color: var(--blue-dark);
            border-radius: 6px;
            padding: 2px 9px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 7px;
            letter-spacing: 0.2px;
        }

        ul {
            padding-left: 16px;
            margin-top: 6px;
        }

        li { margin-bottom: 3px; }

        .input-area {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 14px 14px;
            background: var(--white);
            border-top: 1px solid var(--gray-200);
        }

        .input-area input {
            flex: 1;
            padding: 11px 16px;
            border: 1.5px solid var(--gray-200);
            border-radius: 999px;
            font-size: 14px;
            background: var(--gray-100);
            color: var(--gray-900);
            outline: none;
            transition: border 0.2s, background 0.2s;
        }

        .input-area input:focus {
            border-color: var(--blue-mid);
            background: var(--white);
        }

        .input-area input::placeholder {
            color: var(--gray-400);
        }

        .send-btn {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            border: none;
            background: linear-gradient(135deg, var(--blue-dark), var(--blue-mid));
            color: white;
            font-size: 18px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            transition: opacity 0.15s;
        }

        .send-btn:active { opacity: 0.8; }
        .send-btn:disabled { opacity: 0.5; cursor: not-allowed; }

        .gap { height: 8px; }
    </style>
</head>
<body>

<div class="header">
    <div class="header-icon">🏔️</div>
    <div class="header-text">
        <h1>RanahGPT</h1>
        <span>Asisten Budaya Minangkabau</span>
    </div>
    <div class="status-dot">Online</div>
</div>

<div class="topik-bar">
    <button onclick="askTopic('Rumah Gadang')">🏠 Rumah Gadang</button>
    <button onclick="askTopic('Tari Piring')">💃 Tari Piring</button>
    <button onclick="askTopic('Rendang')">🍖 Rendang</button>
    <button onclick="askTopic('Adat Minangkabau')">📜 Adat</button>
    <button onclick="askTopic('Bahasa Minang')">🗣️ Bahasa</button>
    <button onclick="askTopic('Randai')">🎭 Randai</button>
    <button onclick="askTopic('Saluang')">🎵 Saluang</button>
    <button onclick="askTopic('Silek')">🥋 Silek</button>
    <button onclick="askTopic('Sejarah Minangkabau')">📚 Sejarah</button>
    <button onclick="askTopic('Talempong')">🥁 Talempong</button>
    <button onclick="askTopic('Pakaian Adat')">👘 Pakaian Adat</button>
    <button onclick="askTopic('Upacara Adat')">🎊 Upacara Adat</button>
    <button onclick="askTopic('Pepatah Minang')">💬 Pepatah</button>
    <button onclick="askTopic('Kuliner Minang')">🍜 Kuliner</button>
    <button onclick="askTopic('Merantau')">🧳 Merantau</button>
    <button onclick="askTopic('Nagari')">🏘️ Nagari</button>
    <button onclick="askTopic('Tokoh Minangkabau')">👤 Tokoh</button>
</div>

<div class="chat-box" id="chatBox">
    <div class="msg-row bot">
        <div class="msg-label">🏔️ RanahGPT</div>
        <div class="message">
            Assalamu'alaikum dunsanak! 👋<br><br>
            Ambo <b>RanahGPT</b>, asisten budaya Minangkabau bertenaga AI. Silakan tanyakan apa saja tentang adat, kuliner, seni, bahasa, dan sejarah Minangkabau!
        </div>
    </div>
    <div class="gap"></div>
</div>

<div class="input-area">
    <input type="text" id="userInput" placeholder="Tanya tentang budaya Minangkabau...">
    <button class="send-btn" id="sendBtn" onclick="sendMessage()">➤</button>
</div>

<script>
const chatBox = document.getElementById("chatBox");
const sendBtn = document.getElementById("sendBtn");

// ── Knowledge Base ────────────────────────────────────────────────────────────
const knowledge = {
    "rumah gadang": `<span class="tag">🏠 Rumah Gadang</span><br>
Rumah adat Minangkabau dengan atap <b>gonjong</b> berbentuk tanduk kerbau, simbol identitas masyarakat Minangkabau.<br><br>
Ciri khas:
<ul>
    <li>Atap gonjong melengkung ke atas, jumlahnya menunjukkan status sosial</li>
    <li>Dinding berukir motif alam (flora & fauna Sumatra)</li>
    <li>Diwariskan secara matrilineal (garis ibu)</li>
    <li>Biasanya menghadap ke utara atau selatan</li>
    <li>Bagian dapur selalu di sisi timur (arah matahari terbit)</li>
    <li>Tidak menggunakan paku, hanya pasak kayu</li>
</ul>
Jenis gonjong: Gonjong 2 (rumah biasa), Gonjong 4 (rumah bangsawan), Gonjong 6+ (Istana/Balairung).`,

    "tari piring": `<span class="tag">💃 Tari Piring</span><br>
Tari tradisional yang dimainkan dengan <b>piring di kedua tangan</b>, melambangkan rasa syukur atas hasil panen.<br><br>
Fakta menarik:
<ul>
    <li>Berasal dari Solok, Sumatera Barat</li>
    <li>Diiringi musik talempong & saluang</li>
    <li>Penari bergerak cepat sambil memutar piring tanpa jatuh</li>
    <li>Diakhiri dengan menginjak pecahan piring (simbol keberanian)</li>
    <li>Diakui sebagai warisan budaya tak benda nasional</li>
    <li>Ditampilkan dalam upacara penyambutan tamu kehormatan</li>
</ul>`,

    "rendang": `<span class="tag">🍖 Rendang</span><br>
Masakan khas Minangkabau yang <b>dinobatkan sebagai makanan terlezat di dunia</b> oleh CNN Travel.<br><br>
Fakta rendang:
<ul>
    <li>Bahan utama: daging sapi + santan + rempah (jahe, lengkuas, kunyit, cabai, serai, dll)</li>
    <li>Dimasak berjam-jam hingga kering dan berwarna cokelat gelap</li>
    <li>Tahan berhari-hari tanpa kulkas — cocok untuk perjalanan jauh</li>
    <li>Setiap daerah punya variasi: Rendang Padang, Rendang Payakumbuh, Rendang Pesisir</li>
    <li>Ada dua jenis: Rendang Kering & Kalio (rendang setengah basah)</li>
</ul>
Filosofi rendang mencerminkan empat unsur masyarakat Minang: <b>dagiang</b> (ninik mamak), <b>karambia</b> (cadiak pandai), <b>lado</b> (alim ulama), <b>pemasak</b> (bundo kanduang).`,

    "adat minangkabau": `<span class="tag">📜 Adat Minangkabau</span><br>
Menganut sistem <b>matrilineal</b> — garis keturunan dari pihak ibu. Salah satu masyarakat matrilineal terbesar di dunia.<br><br>
Filosofi utama:<br>
<i>"Adat Basandi Syarak, Syarak Basandi Kitabullah"</i><br>
Adat berlandaskan Islam, Islam berlandaskan Al-Qur'an.<br><br>
Struktur sosial:
<ul>
    <li><b>Kaum</b> — kelompok keluarga satu nenek</li>
    <li><b>Suku</b> — gabungan beberapa kaum (ada 4 suku induk: Koto, Piliang, Bodi, Caniago)</li>
    <li><b>Nagari</b> — unit pemerintahan adat setingkat desa</li>
    <li><b>Ninik Mamak</b> — pemimpin adat (paman dari ibu)</li>
    <li><b>Bundo Kanduang</b> — perempuan pemimpin, penjaga adat</li>
</ul>
Prinsip: <i>"Nan Mudo Mambari Hormat, Nan Tuo Mambari Tuah"</i>`,

    "bahasa minang": `<span class="tag">🗣️ Bahasa Minang</span><br>
Bahasa daerah rumpun Austronesia yang kaya ungkapan dan pepatah. Kosakata dasar:
<ul>
    <li><b>Dunsanak</b> = Saudara/kerabat</li>
    <li><b>Ambo</b> = Saya</li>
    <li><b>Ang / Waang</b> = Kamu</li>
    <li><b>Baa kabar?</b> = Apa kabar?</li>
    <li><b>Elok bana</b> = Bagus sekali</li>
    <li><b>Lah</b> = Sudah</li>
    <li><b>Manga?</b> = Kenapa?</li>
    <li><b>Kok lai</b> = Kalau ada</li>
    <li><b>Indak</b> = Tidak</li>
    <li><b>Iyo</b> = Iya/Ya</li>
    <li><b>Dima?</b> = Di mana?</li>
    <li><b>Bara?</b> = Berapa?</li>
    <li><b>Lamo nyo?</b> = Sudah lama?</li>
</ul>`,

    "randai": `<span class="tag">🎭 Randai</span><br>
Seni pertunjukan yang memadukan <b>teater, tari, musik, silat, dan sastra</b> dalam satu panggung melingkar.<br><br>
Ciri khas:
<ul>
    <li>Pemain membentuk lingkaran besar (galombang)</li>
    <li>Bercerita tentang kehidupan Minangkabau (kaba/cerita rakyat)</li>
    <li>Diiringi musik saluang, rebab, dan dendang</li>
    <li>Mengandung gerakan silek (silat Minang)</li>
    <li>Dimainkan di lapangan terbuka malam hari</li>
    <li>Diakui UNESCO sebagai warisan budaya tak benda</li>
</ul>
Cerita populer: Malin Kundang, Anggun Nan Tongga, Cindua Mato.`,

    "saluang": `<span class="tag">🎵 Saluang</span><br>
Alat musik tiup dari <b>bambu tipis (talang)</b>, ikon musik tradisional Minangkabau.<br><br>
Keunikan:
<ul>
    <li>Pemain meniup tanpa berhenti — teknik <b>maniup suruik</b> (circular breathing)</li>
    <li>Mengiringi dendang (lagu Minang) dan pertunjukan randai</li>
    <li>Panjang ±40–60 cm dengan 4 lubang nada</li>
    <li>Terbuat dari bambu talang pilihan yang tipis dindingnya</li>
</ul>
Varian: Saluang Darek (pedalaman), Saluang Pauah, Saluang Jo Dendang.`,

    "silek": `<span class="tag">🥋 Silek Minang</span><br>
Seni bela diri khas Minangkabau, <b>akar dari Pencak Silat</b> Nusantara. Berfungsi sebagai pertahanan diri sekaligus seni budaya.<br><br>
Aliran terkenal:
<ul>
    <li><b>Silek Tuo</b> — aliran tertua, gerak lambat penuh filosofi</li>
    <li><b>Silek Harimau</b> — meniru gerakan harimau, banyak gerakan bawah</li>
    <li><b>Silek Lintau</b> — dari Lintau, terkenal keras dan cepat</li>
    <li><b>Silek Kumango</b> — dari Batusangkar, dikenal dengan kuncian</li>
    <li><b>Silek Sitaralak</b> — aliran dari daerah pesisir</li>
</ul>
Silek diajarkan di <i>surau</i> (mushola) secara turun-temurun oleh tuo silek (guru silat).`,

    "talempong": `<span class="tag">🥁 Talempong</span><br>
Alat musik pukul berbentuk <b>gong kecil dari kuningan/perunggu</b>, dimainkan secara berkelompok.<br><br>
Fakta:
<ul>
    <li>Dimainkan 3–6 orang sekaligus, setiap pemain memegang 2 talempong</li>
    <li>Teknik interlocking — setiap pemain memukul bergantian membentuk melodi utuh</li>
    <li>Mengiringi tari adat, upacara pernikahan, dan penyambutan tamu</li>
    <li>Talempong pacik: dimainkan sambil berdiri/berjalan</li>
    <li>Nada mirip gamelan Jawa namun cara main berbeda</li>
</ul>`,

    "pakaian adat": `<span class="tag">👘 Pakaian Adat Minangkabau</span><br><br>
<b>Pakaian Wanita (Bundo Kanduang):</b>
<ul>
    <li><b>Tingkuluak Tanduk</b> — hiasan kepala berbentuk tanduk kerbau</li>
    <li><b>Baju Kurung</b> — baju longgar motif sulaman benang emas</li>
    <li><b>Kain Songket</b> — kain tenun bermotif emas/perak dari Silungkang/Pandai Sikek</li>
    <li><b>Selendang</b> — dililitkan di bahu</li>
</ul>
<b>Pakaian Pria (Penghulu):</b>
<ul>
    <li><b>Deta/Saluak</b> — ikat kepala khas</li>
    <li><b>Baju Hitam</b> — baju lengan panjang berwarna hitam</li>
    <li><b>Sarawa</b> — celana panjang hitam</li>
    <li><b>Sandang/Cawek</b> — selempang di bahu</li>
    <li><b>Keris atau Karih</b> — senjata tradisional di pinggang</li>
</ul>`,

    "upacara adat": `<span class="tag">🎊 Upacara Adat Minangkabau</span><br><br>
Upacara penting dalam siklus kehidupan:
<ul>
    <li><b>Batagak Pangulu</b> — pengangkatan kepala adat (penghulu), upacara terbesar & termahal</li>
    <li><b>Perkawinan Adat</b> — pihak perempuan yang meminang laki-laki (manjapuik marapulai)</li>
    <li><b>Turun Mandi</b> — ritual memperkenalkan bayi baru lahir ke dunia</li>
    <li><b>Sunat Rasul</b> — khitanan anak laki-laki dengan upacara meriah</li>
    <li><b>Khatam Qur'an</b> — syukuran selesai membaca Al-Qur'an</li>
    <li><b>Makan Bajamba</b> — makan bersama di atas tikar/meja panjang, simbol kebersamaan</li>
    <li><b>Baralek</b> — pesta pernikahan adat lengkap</li>
</ul>`,

    "pepatah minang": `<span class="tag">💬 Pepatah & Pantun Minang</span><br><br>
Pepatah (Petatah Petitih):
<ul>
    <li><i>"Alam takambang jadi guru"</i> — alam terkembang jadi guru (belajar dari alam)</li>
    <li><i>"Nan buto pahambuih lasuang, nan pakak palapeh badie"</i> — setiap orang punya peran sesuai kemampuan</li>
    <li><i>"Dima bumi dipijak, di situ langik dijunjuang"</i> — di mana bumi dipijak, di situ langit dijunjung (hormati adat setempat)</li>
    <li><i>"Karatau madang di hulu, babuah babungo balun; marantau bujang dahulu, di rumah paguno balun"</i> — dorongan merantau untuk mencari pengalaman</li>
    <li><i>"Indak ado rotan, akarpun jadi"</i> — tidak ada rotan, akar pun jadi (improvise dengan yang ada)</li>
    <li><i>"Bak kato pepatah: nan elok dicontoh, nan buruak dijauahi"</i> — ambil yang baik, tinggalkan yang buruk</li>
</ul>`,

    "kuliner minang": `<span class="tag">🍜 Kuliner Minangkabau</span><br>
Masakan Minang terkenal penuh rempah dan kaya cita rasa:<br><br>
<b>Masakan Wajib Dicoba:</b>
<ul>
    <li><b>Rendang</b> — daging sapi masak rempah kering (#1 dunia)</li>
    <li><b>Soto Padang</b> — soto bening dengan daging sapi & bihun</li>
    <li><b>Gulai Kepala Ikan</b> — kepala ikan kakap dalam kuah gulai kental</li>
    <li><b>Dendeng Balado</b> — daging sapi tipis goreng berbumbu cabai</li>
    <li><b>Sate Padang</b> — sate dengan kuah kuning kental dari tepung beras</li>
    <li><b>Pical</b> — gado-gado khas Minang dengan saus kacang pedas</li>
    <li><b>Katupek Pitalah</b> — ketupat dengan gulai nangka</li>
</ul>
<b>Kue Tradisional:</b>
<ul>
    <li><b>Kue Sapik / Kue Semprong</b> — kue renyah tipis gulung</li>
    <li><b>Lamang Tapai</b> — ketan bakar dalam bambu + tapai</li>
    <li><b>Bika Minang</b> — kue berbahan santan & telur</li>
    <li><b>Randang Baluik</b> — rendang belut</li>
</ul>`,

    "merantau": `<span class="tag">🧳 Tradisi Merantau</span><br>
Merantau adalah tradisi unik Minangkabau — pergi meninggalkan kampung halaman untuk mencari ilmu, pengalaman, dan rejeki.<br><br>
Fakta merantau:
<ul>
    <li>Dianggap sebagai kewajiban moral bagi laki-laki Minang</li>
    <li>Tujuan: belajar agama, mencari nafkah, menuntut ilmu</li>
    <li>Orang Minang tersebar di seluruh Indonesia bahkan dunia</li>
    <li>Rumah Makan Padang ada di hampir seluruh nusantara — bukti merantau</li>
    <li>Perantau tetap terikat dengan kampung & adat (balik untuk acara penting)</li>
</ul>
Pepatah: <i>"Karatau madang di hulu, babuah babungo balun; marantau bujang dahulu, di rumah paguno balun"</i>`,

    "nagari": `<span c