# fazendo conexão web3 e blockchain

# atualiza
sudo apt update
# bibliotecas
sudo apt install -y git gcc g++ make cmake pkg-config libssl-dev
# rust -- 1
curl — proto ‘=https’ — tlsv1.2 -sSf https://sh.rustup.rs | sh
# foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# até que está instalado o ambiente foundry

# iniciar ambiente
forge init --force

# compilar 
forge build

# test
forge test

# anvil
anvil

# até aqui projeto rodando
