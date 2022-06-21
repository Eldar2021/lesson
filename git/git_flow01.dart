/*
Gitflow kullanımı ve branch yönetimi
Git Nedir?

Git için kısaca versiyon kontrol sistemi diyebiliriz. Git denilince akla 
github gelmemelidir. Git ücretsiz ve en çok kullanılan versiyon kontrol 
sistemidir.

Versiyon kontrol sistemleri, yazılım geliştirme süreçlerinde karmaşıklığı 
en aza indirmek için kullanılan bir yöntemdir.

Git Flow ise, branch yönetimini kolaylaştıran bir git eklentisidir.

Git Flow kurulumu

Kurulumu yapmadan önce bilgisayarınızda brew kurulu olmalıdır. 
Eğer kurulu değil ise link üzerinden indirebilirsiniz.
https://brew.sh/index_tr

Eğer brew kurulu ise brew install git-flow demeniz yeterli olacaktır.

Projeye Ekleme ve kullanma

git flow init 

Yukarıda ki komut yardımı ile projemize git flow ekleme işlemini 
gerçekleştirmeden önce branch yapısı hakkında konuşalım.

Yukarıda ki komut yardımı ile projemize git flow ekleme işlemini 
gerçekleştirmeden önce branch yapısı hakkında konuşalım.

Git Flow ve branch yapısı
https://medium.com/software-development-turkey/git-flow-kullan%C4%B1m%C4%B1-ve-branch-y%C3%B6netimi-3a66a6106ddc

Unutmamız gereken nokta, resimde ki isimler ile yeni bir branch yapısı 
oluşturulur ve hazırlanacak özellikler klasör yapısı şeklinde saklanır. 
Şimdi gelelim bura da oluşturulan branch’lerin anlamlarına.

Master: Şu anda client tarafında kullanılan sürüm olarak düşünebiliriz.

Hotfix: Release branch’inde olabilecek hataların çözümü için, resimden de 
anladığınız gibi master’a, yani aktif sisteme atılan bugfix’ler için 
oluşturulmuştur.

Release: Canlıya alınmadan önce geliştirmeleri, testleri ve herşeyi tamamlanan 
kullanıcılara açılmayı bekleyen özelliklerin tutulduğu branch 
olarak düşünebiliriz.

Develop: Developer tarafında geliştirmeleri tamamlanan özelliklerin 
tutulduğu branch olarak düşünülmelidir. Geliştirmesi tamamlanan özellikler 
Release branch’i ile birleştirilir.

Feature: Yeni bir özellik için oluşturulan bu branch işlemin tamamlanmasından 
sonra Develop branch’i ile birleştirilir.

git flow init

Yukarı da ki komut ile oluşturulurken yukarı da ki her adımı yeniden 
isimlendirebiliriz. Default olarak kullanmak ve hızlı şekilde sormadan 
geçmesini sağlamak için ise -d parametresi eklenebilir.

Git Flow ile çalışırken kullanılan beli başlı komutlar

Aşağıda ki komu yardımı ile yeni bir özellik ile geliştirmeye başlayabiliriz

git flow feature
git flow feature start <name> [<base>]
git flow feature finish <name>

Feature geliştirme yapıcağımız branch olarak düşünülebilir. Bura daki 
feature yerine yukarı da ki resimde ismi geçen herhangi bir branch adı gelebilir.

Örnek

git flow hotfix start hotfix_branch_1

yukarı da ki komut ile hotfix_branch_1 adında yeni bir branch oluşturduk. 
gerekli kodlamaları yaptıktan aşağıda ki komut ile branch’in 
tamamlandığını belirtelim.

git flow hotfix finish hotfix_branch_1

Yukarı daki komut ile branch tamamlanarak mastera merge edilme işlemi yapıldı.

Eğer git flow kullanmadan bu iki işlemi yapmış olsaydık aşağıda ki adımları 
takip etmiş olurduk.

git checkout master
git checkout -b hotfix_branch_1

ilk adımda ki oluşturma işlemi yapılmış oldu.

git checkout master 
git merge hotfix_branch_1 
git checkout develop 
git merge hotfix_branch_1 
git branch -D hotfix_branch_1

İkinci adımda ki merge işlemi yapılmış oldu. Fark ettiğiniz gibi git flow 
kullanımında sadece git adımlarını kısaltıp belirli bir branch 
yapısı hazırladık.

Böylece git flow kullanarak git branch yönetimi işlemlerini oldukça 
sadeleştirmiş ve karmaşık yapısından kurtarmış olduk.

Konuyla ilgili önerileriniz ve sorularınız varsa yorumlarınızı bekliyorum. 
Okuduğunuz için teşekkür ederim..
*/
