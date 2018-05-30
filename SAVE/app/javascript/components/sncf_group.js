const API = 'https://www.voyages-train-groupes.sncf.fr/ws/services/RechercherPropositionsGroupe/RechercherPropositionsGroupe';
const dataPost = {"souhaits":{"typeRecherche":"ALLER","origine":{"codeRR":"FRBOJ","nom":"Bordeaux","codesOuiBus":["29","92"]},"destination":{"codeRR":"FRPAR","nom":"Paris (Toutes gares intramuros)","codesOuiBus":["1","51","52","68","111","192"]},"journeeEntiere":true,"dateHeureDepart":1528927200000,"trajetDirect":true,"ouibusSelected":true,"passagers":{"bambins":0,"enfants":0,"jeunes":0,"adultes":10}},"ongletSeulEtat":false,"ongletSeulPosition":3,"semaineSuivante":false,"semainePrecedente":false,"correlationID":"be9d7831-4463-409e-9124-49896ade4110","langue":"FR","idAgence":"MBGVSC","codeMarche":"FR","idVendor":null};

function sncf_group() {
  document.addEventListener("DOMContentLoaded", function() {
    fetch(API, {
      crossOrigin: true,
      method: 'POST',
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(dataPost)
    })
  });
}

export { sncf_group };
