#!/bin/bash
echo -e "\033[0;37m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo " #####   ####        ####        ####  ####    ######    ##########  ####    ####  ###########   ####  ####";
echo " ######  ####       ######       #### ####    ########   ##########  ####    ####  ####   ####   #### ####";
echo " ####### ####      ###  ###      ########    ####  ####     ####     ####    ####  ####   ####   ########";   
echo " #### #######     ##########     ########   ####    ####    ####     ####    ####  ###########   ########";
echo " ####  ######    ############    #### ####   ####  ####     ####     ####    ####  ####  ####    #### ####";  
echo " ####   #####   ####      ####   ####  ####   ########      ####     ############  ####   ####   ####  ####";
echo " ####    ####  ####        ####  ####   ####    ####        ####     ############  ####    ####  ####   ####";
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo -e '\e[36mTwitter :\e[39m' https://twitter.com/NakoTurk
echo -e '\e[36mGithub  :\e[39m' https://github.com/okannako
echo -e '\e[36mYoutube :\e[39m' https://www.youtube.com/@CryptoChainNakoTurk
echo -e "\e[0m"
sleep 5

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Gerekli Atamaları Yapın.. \e[0m"  && sleep 2

read -p "Alchemy Rpc Girin: " ALCHEMYRPC
read -s -p "Cüzdan Private Key Girin: " PRIVKEY
echo
while true; do
  read -s -p "Cüzdan Private Key Girin: " PRIVKEY
  echo
  if [[ -z "$PRIVKEY" ]]; then
    echo -e "\e[1m\e[31mHata: Private key boş olamaz. Lütfen tekrar girin.\e[0m"
  else
    break
  fi
done

ENV_FILE="$HOME/.boundless_env"
cat <<EOF > "$ENV_FILE"
export ALCHEMYRPC="$ALCHEMYRPC"
export PRIVKEY="$PRIVKEY"
EOF

grep -qxF "source $ENV_FILE" ~/.bashrc || echo "source $ENV_FILE" >> ~/.bashrc
source "$ENV_FILE"

echo -e "\e[1m\e[32m Güncellemeler ve Bütün Gereksinimler Yükleniyor. Bitene kadar Bekleyin.. \e[0m"  && sleep 2

sudo apt update && sudo apt install -y make gcc pkg-config libssl-dev ocl-icd-opencl-dev nano tmux ocl-icd-libopencl1 libleveldb-dev protobuf-compiler libopencl-clang-dev libgomp1 curl git tar wget build-essential jq && sudo apt install wget -y && cd $HOME
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

git clone https://github.com/boundless-xyz/boundless
cd boundless

curl -L https://risczero.com/install | bash
source ~/.bashrc
rzup install

cargo install --git https://github.com/risc0/risc0 bento-client --bin bento_cli
export PATH="$HOME/.cargo/bin:$PATH"
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
cargo install --locked boundless-cli

echo -e "\e[1m\e[32m Env Dosyası Oluşturuluyor. \e[0m"  && sleep 2

cat <<EOF >> .env.base
# Base contract addresses
export VERIFIER_ADDRESS=0x0b144e07a0826182b6b59788c34b32bfa86fb711
export BOUNDLESS_MARKET_ADDRESS=0x26759dbB201aFbA361Bec78E097Aa3942B0b4AB8
export SET_VERIFIER_ADDRESS=0x8C5a8b5cC272Fe2b74D18843CF9C3aCBc952a760

# Public order stream URL
export ORDER_STREAM_URL="https://base-mainnet.beboundless.xyz"
export ETH_RPC_URL="\$ALCHEMYRPC"
export PRIVATE_KEY="\$PRIVKEY"
EOF

source .env.base

echo -e "\e[1m\e[32m Yükleme işlemleri tamamlandı. Kılavuz üzerindeki diğer adımlara geçebilirsiniz. \e[0m"  && sleep 2
