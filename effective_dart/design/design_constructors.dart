/*
Constructors
Dart yapıcıları, sınıfla aynı ada ve isteğe bağlı olarak ek bir tanımlayıcıya 
sahip bir işlev bildirerek oluşturulur. İkincisi, adlandırılmış kurucular 
olarak adlandırılır.

const Sınıf destekliyorsa, yapıcınızı yapmayı DÜŞÜNÜN .

Tüm alanların son olduğu bir sınıfınız varsa ve yapıcı bunları başlatmaktan 
başka bir şey yapmıyorsa, bu yapıcıyı yapabilirsiniz const. Bu, kullanıcıların 
sabitlerin gerekli olduğu yerlerde (diğer daha büyük sabitler, anahtar 
durumları, varsayılan parametre değerleri vb.) sınıfınızın örneklerini 
oluşturmasına olanak tanır.

Açıkça yapmazsanız const, bunu yapamazlar.

Ancak, constbir kurucunun genel API'nizde bir taahhüt olduğunu unutmayın. Daha 
sonra yapıcıyı non- olarak değiştirirseniz const, onu sabit ifadelerde çağıran 
kullanıcıları bozar. Bunu taahhüt etmek istemiyorsan, yapma const. Uygulamada, 
constyapıcılar en çok basit, değişmez değer benzeri türler için kullanışlıdır.

*/
