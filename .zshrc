# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jbergantine"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
)
source $ZSH/oh-my-zsh.sh

# ===== USER CONFIGURATION =====

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# ===== CUSTOM ALIASES =====
alias chromium='chromium --ozone-platform=wayland'
alias jam='tty-clock -c -C 7 -f "%A %B %d %Y" -s -S -b'
alias vim='nvim'
alias vi='nvim'
alias fastfetch='fastfetch --logo none --config mycustom'
alias neofetch='fastfetch'
alias cava='~/cava-start.sh'
alias ls='ls --color=auto'
alias Hyprland='dbus-run-session Hyprland'

export PATH=$PATH:$HOME/.config/emacs/bin
alias emacs='doom emacs'

# ===== .NET CONFIGURATION =====
# Set .NET 9 as default
export DOTNET_ROOT=/opt/dotnet9
export PATH="/opt/dotnet9:$PATH"

# Function to switch to .NET 8 when needed
dotnet8() {
  export DOTNET_ROOT=/opt/dotnet
  export PATH="/opt/dotnet:${PATH//\/opt\/dotnet9:/}"
  echo "Switched to .NET 8"
  dotnet --version
}

# Function to switch back to .NET 9
dotnet9() {
  export DOTNET_ROOT=/opt/dotnet9
  export PATH="/opt/dotnet9:${PATH//\/opt\/dotnet:/}"
  echo "Switched to .NET 9"
  dotnet --version
}

# ===== XDG RUNTIME DIRECTORY =====
# if [ -z "$XDG_RUNTIME_DIR" ]; then
#   export XDG_RUNTIME_DIR="/run/user/$(id -u)"
# fi

# ===== WAYLAND SPECIFIC =====
#export XDG_SESSION_TYPE=wayland
#export XDG_CURRENT_DESKTOP=Hyprland
#export XDG_SESSION_DESKTOP=Hyprland

# ===== FLUTTER CONFIGURATION =====
export PATH="$HOME/development/flutter/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium

# ===== STARSHIP PROMPT =====
# Uncomment the line below if you want to use Starship instead of Oh My Zsh themes
# If you enable this, set ZSH_THEME="" at the top of this file
# eval "$(starship init zsh)"

# ===== GO CONFIGURATION =====
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ===== ARRAY OF COWSAY ======
  messages=(
    "Perusakan alam bukanlah akibat kapitalisme global, industrialisasi, 'peradaban Barat', atau cacat apa pun dalam institusi manusia. Perusakan adalah konsekuensi dari keberhasilan evolusi primata yang luar biasa rakus."
    "Seperti yang dikemukakan Lovelock, perubahan iklim mungkin merupakan mekanisme yang digunakan planet ini untuk meringankan beban manusianya."
    "Manusia, seperti hewan lainnya, merespons stres. Mereka bereaksi terhadap kelangkaan dan kepadatan populasi dengan mengurangi dorongan reproduksi"
    "Jika wabah manusia benar-benar senormal kelihatannya, maka kurva keruntuhan seharusnya mencerminkan kurva pertumbuhan populasi. Ini berarti bahwa sebagian besar keruntuhan tidak akan memakan waktu lebih dari seratus tahun, dan pada tahun 2150 biosfer seharusnya kembali dengan aman ke populasi Homo sapiens sebelum wabah – sekitar 0,5 hingga 1 miliar."
    "Tirani memang selalu ada; tetapi tanpa sarana transportasi dan komunikasi modern, Stalin dan Mao tidak mungkin membangun gulag mereka. Kejahatan terburuk umat manusia hanya dimungkinkan oleh teknologi modern."
    "Pemahaman humanis tentang adanya jurang pemisah antara diri kita dan hewan lain merupakan penyimpangan."
    "Massa umat manusia diatur bukan oleh sensasi moral yang terputus-putus, apalagi oleh kepentingan pribadi, melainkan oleh kebutuhan sesaat. Tampaknya ditakdirkan untuk menghancurkan keseimbangan kehidupan di Bumi – dan dengan demikian menjadi agen kehancurannya sendiri. Adakah yang lebih sia-sia daripada menyerahkan Bumi kepada spesies yang luar biasa merusak ini? Bukanlah menjadi pengelola planet yang bijaksana yang diimpikan para pencinta Bumi, melainkan masa ketika manusia tak lagi berarti."
    "Fundamentalis agama memandang kekuatan sains sebagai sumber utama kekecewaan modern. Sains telah menggantikan agama sebagai sumber utama otoritas, tetapi dengan mengorbankan kehidupan manusia yang bersifat kebetulan dan tidak berarti."
    "Sains mendorong kita untuk percaya bahwa, tidak seperti hewan lain, kita dapat memahami dunia alami, dan dengan demikian mengendalikannya sesuai keinginan kita. Namun, pada kenyataannya, sains menunjukkan pandangan tentang segala sesuatu yang sangat tidak nyaman bagi pikiran manusia. Dunia sebagaimana dilihat oleh fisikawan seperti Erwin Schrödinger dan Werner Heisenberg bukanlah kosmos yang teratur. Ia adalah kekacauan setengah yang hanya dapat dipahami sebagian oleh manusia."
    "Sains telah digunakan untuk mendukung anggapan bahwa manusia tidak seperti hewan lain dalam hal kemampuan memahami dunia. Faktanya, nilai tertingginya mungkin terletak pada bukti bahwa dunia yang diprogram untuk dipahami manusia adalah khayalan belaka."
    "Manusia tak bisa hidup tanpa ilusi. Bagi pria dan wanita masa kini, keyakinan irasional akan kemajuan mungkin menjadi satu-satunya penawar nihilisme. Tanpa harapan bahwa masa depan akan lebih baik daripada masa lalu, mereka tak akan mampu bertahan. Dalam hal ini, kita mungkin membutuhkan Pascal zaman akhir."
    "Kehidupan adalah sebuah kebetulan yang tidak dapat disimpulkan dari sifat segala sesuatu, tetapi setelah muncul, ia berevolusi melalui seleksi alam berupa mutasi acak. Spesies manusia, seperti spesies lainnya, hanyalah sebuah lemparan keberuntungan dalam lotere kosmik."
    "'Masyarakat liberal di Barat masih berbasa-basi, dan menyajikan sebagai dasar moralitas, campuran menjijikkan antara religiusitas Yahudi-Kristen, progresisme saintifik, kepercayaan pada hak-hak 'alami' manusia, dan pragmatisme utilitarian.' Manusia harus mengesampingkan kesalahan-kesalahan ini dan menerima bahwa keberadaannya sepenuhnya kebetulan. Ia 'harus akhirnya terbangun dari mimpi seribu tahunnya dan menemukan kesendiriannya yang total, keterasingannya yang fundamental. Ia harus menyadari bahwa, seperti seorang gipsi, ia hidup di perbatasan dunia yang asing; dunia yang tuli terhadap musiknya dan acuh tak acuh terhadap harapannya sebagaimana dunia yang acuh tak acuh terhadap penderitaan dan kejahatannya.'"
    "Dalam ritual Tiongkok kuno, anjing jerami digunakan sebagai persembahan kepada para dewa. Selama ritual tersebut, mereka diperlakukan dengan sangat hormat. Ketika ritual itu berakhir dan mereka tidak lagi dibutuhkan, mereka diinjak-injak dan dibuang ke samping: 'Langit dan bumi itu kejam, dan memperlakukan makhluk yang tak terhitung jumlahnya sebagai anjing jerami.' Jika manusia mengganggu keseimbangan Bumi, mereka akan diinjak-injak dan dibuang ke samping."
    "Hewan lain lahir, mencari pasangan, mencari makan, lalu mati. Itu saja. Namun kita manusia – kita pikir – berbeda. Kita adalah manusia, yang tindakannya merupakan hasil dari pilihan mereka. Hewan lain menjalani hidup mereka tanpa disadari, tetapi kita sadar. Citra diri kita terbentuk dari keyakinan yang mengakar bahwa kesadaran, jati diri, dan kehendak bebaslah yang mendefinisikan kita sebagai manusia, dan mengangkat kita di atas semua makhluk lainnya."
    "Bagi umat Kristen, manusia diciptakan oleh Tuhan dan memiliki kehendak bebas, sementara bagi kaum humanis, manusia adalah makhluk yang menentukan nasibnya sendiri."
    "Schopenhauer menjawab bahwa pengalaman kita yang sebenarnya bukanlah memilih cara hidup kita secara bebas, melainkan didorong oleh kebutuhan jasmani kita – oleh rasa takut, lapar, dan, yang terpenting, seks."
    "Ketika kita berada dalam cengkeraman cinta seksual, kita berkata pada diri sendiri bahwa kita akan bahagia setelah cinta itu terpuaskan; tetapi ini hanyalah fatamorgana. Gairah seksual memungkinkan spesies untuk bereproduksi; ia tidak peduli dengan kesejahteraan individu atau otonomi pribadi."
    "Mencari makna dalam sejarah ibarat mencari pola di awan. Nietzsche tahu ini; tetapi ia tak bisa menerimanya. Ia terjebak dalam lingkaran kapur harapan-harapan Kristen. Sebagai orang yang beriman sampai akhir, ia tak pernah menyerah pada keyakinan absurd bahwa sesuatu dapat diciptakan dari manusia. Ia menciptakan sosok Übermensch  yang konyol untuk memberi sejarah makna yang sebelumnya tak ada. Ia berharap dengan demikian umat manusia akan terbangun dari tidur panjangnya. Seperti yang sudah bisa diramalkan, ia justru menambah mimpi buruk pada mimpi mereka yang membingungkan."
    "Dalam seni, dan terutama dalam musik, kita melupakan kepentingan dan perjuangan praktis yang bersama-sama membentuk 'kehendak'. Dengan melakukan itu, kita melupakan diri kita sendiri."
    "Para filsuf, mulai dari Plato hingga Hegel, telah menafsirkan dunia seolah-olah merupakan cerminan pemikiran manusia. Para filsuf selanjutnya seperti Heidegger dan Wittgenstein melangkah lebih jauh dan mengklaim bahwa dunia adalah konstruksi pemikiran manusia."
    "Para filsuf selalu berusaha menunjukkan bahwa kita tidak seperti hewan lain, yang mengendus-endus jalan mereka dengan ragu di dunia. Namun, setelah semua karya Plato dan Spinoza, Descartes, dan Bertrand Russell, kita tidak punya alasan lebih besar daripada hewan lain untuk percaya bahwa matahari akan terbit besok."
    "Warisan Plato bagi pemikiran Eropa adalah tiga huruf kapital – Baik, Indah, dan Benar. Perang telah terjadi, tirani telah terbentuk, budaya telah dirusak, dan manusia telah dibasmi, demi abstraksi-abstraksi ini. Eropa berutang banyak sejarah pembunuhannya pada kesalahan berpikir yang ditimbulkan oleh alfabet."
    "Jika para humanis dapat dipercaya, Bumi—dengan kekayaan ekosistem dan bentuk kehidupannya yang luar biasa—tidak memiliki nilai hingga manusia hadir."
    "Kucing, anjing, dan kuda menunjukkan kesadaran akan lingkungan mereka; mereka mengalami diri mereka sendiri bertindak atau gagal bertindak; mereka memiliki pikiran dan sensasi. Seperti yang telah ditunjukkan oleh para primatologis, kerabat evolusi terdekat kita di antara kera memiliki banyak kapasitas mental yang biasa kita anggap hanya milik kita sendiri. Terlepas dari tradisi kuno yang menyatakan sebaliknya, tidak ada yang unik bagi manusia dalam hal kesadaran."
    "Kita tidak dapat memilih untuk menjadi seperti apa kita dilahirkan. Dalam hal itu, kita tidak dapat bertanggung jawab atas apa yang kita lakukan."
    "Saat kita hendak bertindak, kita tak bisa memprediksi apa yang akan kita lakukan. Namun, ketika kita menengok ke belakang, kita mungkin melihat keputusan kita sebagai langkah di jalan yang telah kita tempuh. Kita terkadang melihat pikiran kita sebagai peristiwa yang terjadi pada kita, dan terkadang sebagai tindakan kita. Perasaan bebas kita muncul melalui peralihan antara dua sudut pandang ini. Kehendak bebas adalah tipuan perspektif."
  )



# ===== RUN COWSAY ON STARTUP =====
cowsay "${messages[$RANDOM % ${#messages[@]}]}"
echo " "

