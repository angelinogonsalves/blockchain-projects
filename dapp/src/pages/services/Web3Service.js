import Web3 from "web3";
import ABI from "/ABI.json";

const CONTRACT_ADDRESS = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266";

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

    // salva informação da carteira no local
    localStorage.setItem("wallet", accounts[0]);

    // retorna a primeira conta que ele deu permissão
    return accounts[0];

}

function getContract() {
    // instancia novo web3
    const web3 = new Web3(window.ethereum);
    // instacia o from
    const from = localStorage.getItem("wallet");
    // retorna o contrato
    return new web3.eth.Contract(ABI, CONTRACT_ADDRESS, { from });
}

export async function addCampaign(campaign) {
    // instancia o contrato
    const contract = getContract();
    // cria uma nova campanha
    return contract.addCampaign(
        campaign.title,
        campaign.description,
        campaign.videoUrl,
        campaign.imageUrl
    ).send();
}
