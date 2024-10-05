// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

struct Campaign {
    address author;
    string title;
    string description;
    string videoUrl;
    string imageUrl;
    uint256 balance;
    bool active;
}

contract DonateCrypto {

    // valor da taxa em wei
    uint256 public fee = 100;

    // chave para nova campanha
    uint256 public nexId = 0;

    // id => campanha
    mapping(uint256 => Campaign) public campaigns;

    // info: calldata somente leitura e memory permite mudar o valor
    // info: public é porque qualquer um pode chamar essa função

    // adiciona nova campanha
    function addCampaign(
        string calldata title,
        string calldata description,
        string calldata videoUrl,
        string calldata imageUrl
    ) public {
        // criar variável temporária para a campanha
        Campaign memory newCampaign;
        // seta as variáveis passadas como parametros
        newCampaign.title = title;
        newCampaign.description = description;
        newCampaign.videoUrl = videoUrl;
        newCampaign.imageUrl = imageUrl;
        // torna a campanha ativa
        newCampaign.active = true;
        // define o autor quem chamou a função, quem criou a campanha
        newCampaign.author = msg.sender;

        // incrementa a chave da campnha
        nexId++;
        // salva a campanha na listagem de campanhas
        campaigns[nexId] = newCampaign;
    }

    // info: payable usado para passar valores para pagamentos

    // faz pagamento para a campanha
    function donate(uint256 id) public payable {
        // validar se o valor é positivo
        require(msg.value > 0, "You must send a donation value > 0");
        // validar se a campanha está ativa
        require(campaigns[id].active == true, "Cannot donate to this campaign");

        // acrescenta o valor ao saldo da campanha
        campaigns[id].balance += msg.value;
    }

    // faz saque da campanha
    function withdraw(uint256 id) public {
        // traz para a memória a campanha
        Campaign memory campaign = campaigns[id];
        // valida se quem chamou é o autor da campanha
        require(campaign.author == msg.sender, "You do not have permission");
        // valida se a campanha esta ativa
        require(campaign.active == true, "This campaign is closed");
        // valida se a campanha tem mais saldo que a taxa
        require(campaign.balance > fee, "This campaign does not have enough balance");

        // seta o endereço do autor para um endereço pagável
        address payable recipient = payable(campaign.author);
        // chamada para transferir valores
        recipient.call{value: campaign.balance - fee}("");
        
        // fecha a campanha
        campaigns[id].active = false;
    }

}