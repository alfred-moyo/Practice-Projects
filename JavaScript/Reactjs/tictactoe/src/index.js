import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

function Square(props) {
    return (
        <button className="square" onClick={() => props.onClick()}>
            {props.value}
        </button>
    );
}
