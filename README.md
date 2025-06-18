<p align="center">
  <a href="">
    <img alt="Hero" src="https://github.com/user-attachments/assets/2721bb1e-2d1e-4f7a-931d-2c6a8fbb612b" width="75%" />
  </a>
</p>

## Ön Bilgi
- Boundless, RISC Zero tarafından geliştirilen, evrensel ZK (Zero-Knowledge) kanıt tabanlı hesaplama altyapısıdır. Amacı, her zincirde doğrulanabilir (verifiable) hesaplama yapmayı mümkün hale getirmek.
- Biz aşağıdaki yaptığımız işlemlerde sadece Dev ve Prove rolü alacağz. Bu bir NODE çalıştırma işlemi değildir.

## İhtiyacımız Olanlar
- Node kurmayacağımız için düşük özellikte bir sistemde işlemleri yapabilirsiniz. Mesela 1 CPU olan bir makinada denerseniz işlemler çok uzun sürebilir ama yine de yapar.
- Bu işlem Base Mainnet üzerinde olacak ve cüzdanda 2-3 dolarlık bir Eth ve 10 USDC olmalı. Hata olmaması adına ben 10.1 yaptım. Cüzdanınız normalde kullandığınız bir cüzdan olmasın, test işlemi ne olacağı belli olmaz, sıfır bir EVM cüzdanı açın.
- Discord ve Github hesabı olmalı ancak bunlar en az 6 aydan eski olması gerekiyor.
- [Alchemy](https://www.alchemy.com/) üzerinden ücretsiz bir şekilde alacağınız Base Mainnet Rpc gerekiyor.
- Son olarak bu onaylamaları yapacağımız cüzdanı [Guild](https://guild.xyz/boundless-xyz)'de bağlamalıyız.

## Kurulum
1️⃣Öncelikle aşağıdaki kodları satır satır çalıştırarak kuruluma başlıyoruz. Bütün güncellemeleri kendisi yapacak ancak yukarıda belirttiğim sizin kendinize göre almanız gereken 2 değeri girmenizi isteyecek RPC ve Cüzdan Private Key, bunları girdikten sonra yükleme devam edecek. Bittikten sonra diğer adımlara geçebilirsiniz.

```
apt install tmux
tmux new-session -t boundless
wget -q -O register.sh https://raw.githubusercontent.com/okannako/boundlessrole.md/refs/heads/main/register.sh && chmod +x register.sh && sudo /bin/bash register.sh
```
1️⃣Prover Rolü için aşağıdaki kodu girin.

```
boundless \
  --rpc-url "$ALCHEMYRPC" \
  --private-key "$PRIVKEY" \
  --boundless-market-address 0x26759dbB201aFbA361Bec78E097Aa3942B0b4AB8 \
  --set-verifier-address 0x8C5a8b5cC272Fe2b74D18843CF9C3aCBc952a760 \
  --verifier-router-address 0x0b144e07a0826182b6b59788c34b32bfa86fb711 \
  --order-stream-url "https://base-mainnet.beboundless.xyz" \
  account deposit-stake 10
```
 - Eğer işlem başarılı olursa çıktısı aşağıdaki gibi olur.

## Ek Kodlar
- İsim vererek tmux ekranı açmak: ````tmux new-session -t boundless````
- Tmux ekranında çıkmak: Önce ````ctrl+b```` sonra ````d```` bas
- Tmux ekranına tekrar giriş yapmak: ````tmux attach -t boundless````
- Tmux ekranlarını listelemek: ````tmux ls````
