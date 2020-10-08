import React, { useEffect, useState } from 'react';
import './App.css';
import web3 from './web3';
import lottery from './lottery';

function App() {
  const [manager, setManager] = useState('');
  const [players, setPlayers] = useState([]);
  const [balance, setBalance] = useState('');
  const [value, setValue] = useState('');
  const [message, setMessage] = useState('');

  useEffect(() => {
    async function fetchData() {
      const managerResult = await lottery.methods.manager().call();
      setManager(managerResult);

      const playersResult = await lottery.methods.getPlayers().call();
      setPlayers(playersResult);

      const balanceResult = await web3.eth.getBalance(lottery.options.address);
      setBalance(balanceResult);
    }
    fetchData();
  }, []);

  const onClick = async (e) => {
    const accounts = await web3.eth.getAccounts();

    setMessage('Waiting on transaction success...');

    await lottery.methods.pickWinner().send({
      from: accounts[0],
    });

    setMessage('A winner has been picked!');
  };

  const onSubmit = async (e) => {
    e.preventDefault();

    const accounts = await web3.eth.getAccounts();

    setMessage('Waiting on transaction success...');

    await lottery.methods.enter().send({
      from: accounts[0],
      value: web3.utils.toWei(value, 'ether'),
    });

    setMessage('You have been entered!');
  };

  return (
    <div className='App'>
      <h2>Lotter Contract</h2>
      <p>This contract is managed by: {manager}</p>
      <p>
        There are currently {players.length} people entered, competing to win{' '}
        {web3.utils.fromWei(balance, 'ether')} ether
      </p>
      <hr />
      <form onSubmit={onSubmit}>
        <h4>Want to try your luck?</h4>
        <div>
          <label>Amount of ether to enter</label>
          <input value={value} onChange={(e) => setValue(e.target.value)} />
        </div>
        <button>Enter</button>
      </form>
      <hr />
      <h4>Ready to pic a winner?</h4>
      <button onClick={onClick}>Pick a winner!</button>
      <hr />
      <h4>{message}</h4>
    </div>
  );
}

export default App;
