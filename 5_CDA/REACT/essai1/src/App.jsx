import { useState } from "react";







function App(props) {

  const [texte, setTexte] = useState("");

  const handleChange = (evt) => {
    setTexte(evt.target.value)
  };

  const handleClick = (evt) => {
    this.props.onClick(texte)
  };
  

  return (
    <div>
        <h3>Form: </h3>
        <input type="text" value={texte} onChange={handleChange} />
        <button onClick={handleClick}>Ajouter</button>
    </div>

  );
}

export {App}



