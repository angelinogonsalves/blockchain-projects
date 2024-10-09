import Footer from "@/components/Footer";
import Link from "next/link";
import Head from "next/head";
import { useState } from "react";

export default function Create(){
    
    const [campaign, setCampaign] = useState({});
    const [message, setMessage] = useState("");

    function onInputChange(evt) {
        setCampaign(preState => ({...preState, [evt.target.id]: evt.target.value}));
    }

    function btnSaveClick() {
        alert(JSON.stringify(campaign));
    }

    return (
        <>
            <Head>
                <title>Donate Crypto | Create Campaign</title>
                <meta charSet='utf-8' />
                <meta name="description" content="Generate by create next app" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </Head>
            <div className="container">
                <h1 className="display-5 fw-bold text-body-enphasis lh-1 mb-3">Donate Crypto</h1>
                <p className="">Preencha os campos para incluir sua campanha na plataforma</p>
                <hr className="mb-4" />
                <div className="col-6">
                    <div className="form-floating mb-3">
                        <input type="text" id="title" className="form-control" value={campaign.title} onChange={onInputChange} />
                        <label for="title">Título</label>
                    </div>
                    <div className="form-floating mb-3">
                        <input type="text" id="description" className="form-control" value={campaign.description} onChange={onInputChange} />
                        <label for="description">Descrição</label>
                    </div>
                    <div className="form-floating mb-3">
                        <input type="text" id="imagemUrl" className="form-control" value={campaign.imagemUrl} onChange={onInputChange} />
                        <label for="imagemUrl">Imagem</label>
                    </div>
                    <div className="form-floating mb-3">
                        <input type="text" id="videoUrl" className="form-control" value={campaign.videoUrl} onChange={onInputChange} />
                        <label for="videoUrl">Vídeo</label>
                    </div>
                </div>
                <div className="col-6 mb-3">
                    <input type="button" className="btn btn-primary col-12 p-3" value="Save Campaign" onClick={btnSaveClick} />
                </div>
                <div className="col-6 mb-3">
                    <Link href="/" className="btn btn-secondary col-12 p-3">Voltar</Link>
                </div>
                <Footer />
            </div>
        </>
    )
}