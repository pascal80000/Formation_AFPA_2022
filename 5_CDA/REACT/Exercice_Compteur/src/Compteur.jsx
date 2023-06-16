import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import './Compteur.css'

function App2() {

    // Fixe la valeur de départ (ici à zéro)
  const [count, setCount] = useState(0)

  return (
    <>

      <h1>Compteur</h1>
        <div className="card">

    {/* Bouton incrément: */}
            
            <button onClick={() => setCount((count) => count + 1)}>
            Comptage: {count}
            </button>

    {/* Bouton reset Compteur */}
            
            <button onClick={() => setCount((count) => 0)}>
            Recommence 
            </button>

        </div>
    
    </>
  )
}

export default App2
