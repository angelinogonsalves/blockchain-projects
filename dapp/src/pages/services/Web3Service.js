import Web3 from "web3";

const CONTRACT_ADDRESS = "";

export async function doLogin() {
    
    // valida se existe a metamask
    if (!window.ethereum) {
        throw new Error("No MetaMask found!");
    }

    // instancia a carteira metamask
    const web3 = new Web3(window.ethereum);

    // seta lista de contas dentro da metamask
    const accounts = await web3.eth.requestAccounts();

    // verifica se o usuário possui contas ou permitiu a conexão
    if (!accounts || !accounts.length) {
        throw new Error("Wallet not found/allowed");
    }

    // retorna a primeira conta que ele deu permissão
    return accounts[0];

}
