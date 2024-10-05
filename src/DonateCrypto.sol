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


}