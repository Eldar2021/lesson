/*
Operator Precedence
Operatör Önceliği
In the following lesson, you will be introduced to which operators in 
Dart hold precedence over others.

Giriş #
Operatör önceliği, kodun/ifadenin farklı bölümlerinin hangi sırayla 
değerlendirilmesi gerektiğini belirler. Örneğin, 1 + 1 * 5 , 'den daha yüksek 
önceliğe sahip olduğu için bize 10 yerine 6 verir . 10 isteseydik ifadeyi 'den 
daha yüksek önceliğe sahip olarak (1 + 1) * 5 olarak yazabilirdik .*+()*

Öncelik Tablosu #
Aşağıda, operatör önceliği en üstte olacak ve aşağı indikçe alçalacak şekilde 
önceliği bulacaksınız. Her operatör, onu takip eden satırlardaki operatörlerden 
daha yüksek önceliğe sahiptir.

Tanım	                              Şebeke

tekli son ek	                      ., ?., ++, --, [``],()
tekli önek	                        -, !, ˜, ++, --,await
Çarpımsal	                          *, /, ˜/,%
Katkı                              	+,-
Vardiya	                            <<, >>,>>>
bit düzeyinde VE	                  &
Bitsel XOR	                        ˆ
Bit düzeyinde VEYA	                |
ilişkisel                         	<, >, <=, >=, as, is_is!
eşitlik	                            ==,!=
mantıksal VE	                      &&
Mantıksal Veya	                    ||
If-null	                            ??
koşullu	                            ? :
Çağlayan	                          ..
Atama	                              =, *=, /=, +=, -=, &=, ˆ=vb.


Listede aşina olmadığınız bazı operatörler olabilir, ama sorun değil; bunlar 
ileriki bölümlerde tartışılacaktır. Bu listenin amacı, gerektiğinde geri 
dönebileceğiniz kapsamlı bir operatör öncelik sırası sağlamaktır.

Ve bu notta, operatörler hakkındaki tartışmamız sona eriyor. Bir sonraki derste, 
operatör önceliği bilginizi kullanmanız istenecektir.
*/
